package kr.ac.skuniv.springmvc.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.skuniv.springmvc.dto.Cafe;
import kr.ac.skuniv.springmvc.dto.Favorites;
import kr.ac.skuniv.springmvc.dto.Food;
import kr.ac.skuniv.springmvc.dto.History;
import kr.ac.skuniv.springmvc.service.CafeService;
import kr.ac.skuniv.springmvc.service.FavoritesService;
import kr.ac.skuniv.springmvc.service.FoodService;
import kr.ac.skuniv.springmvc.service.HistoryService;

@Controller
public class HelloController {
	
	public static StringBuilder sb;
	@Autowired
	FoodService foodservice;
	@Autowired
	CafeService cafeservice;
	@Autowired
	HistoryService historyservice;

	@Autowired
	FavoritesService favoritesservice;

	HttpSession session;
	
	
	static String getString(String input, String data) // API에서 필요한 문자 자르기.
    {
        String[] dataSplit = data.split("{" + input + "}");
        String[] dataSplit2 = dataSplit[1].split("\"" + input + "\"");
        return dataSplit2[0];
    }
	
	@RequestMapping("/")
	public String first() {
		return "firstPage";
	}
	
	@RequestMapping("/hello")
	public String hello(HttpServletRequest request, Model model) {
		String id = "";
		session = request.getSession();
		id = (String) session.getAttribute("login");
		if (id == null || id.equals("")) {
			return "redirect:/";
		}
		List<History> historyList = historyservice.getHistory(id);
		model.addAttribute("historyList", historyList);
	
		return "hello";

	}

	@RequestMapping("/resultpage")
	public String resultpage(HttpServletRequest request, Model model) {
		session = request.getSession();
		String id = "";
		id = (String) session.getAttribute("login");
		if (id == null || id.equals("")) {
			return "redirect:/";
		}

		String location = request.getParameter("location");
		String search = request.getParameter("search");
		model.addAttribute("location", location);
		model.addAttribute("search", search);

		List<Food> foodList = foodservice.getResult(location, search);
		model.addAttribute("foodList", foodList);
		model.addAttribute("listSize", foodList.size());

		List<History> historyList = historyservice.getHistory(id);
		model.addAttribute("historyList", historyList);

		foodservice.getResultCount(location, "한식");
		foodservice.getResultCount(location, "일식");
		foodservice.getResultCount(location, "중국식");
		foodservice.getResultCount(location, "경양식");
		foodservice.getEtcCount(location);

		List<Integer> foodresultcount = new ArrayList<>();

		foodresultcount.add(foodservice.getResultCount(location, "한식"));
		foodresultcount.add(foodservice.getResultCount(location, "일식"));
		foodresultcount.add(foodservice.getResultCount(location, "중국식"));
		foodresultcount.add(foodservice.getResultCount(location, "경양식"));
		foodresultcount.add(foodservice.getEtcCount(location));

		model.addAttribute("foodresultcount", foodresultcount);

		if (foodList.size() == 0 || search.equals("") || search.equals(null))
			return "noresultpage";

		return "resultpage";
	}

	@RequestMapping("/cafesearch")
	public String cafesearch(HttpServletRequest request, Model model) {
		session = request.getSession();
		String id = "";
		id = (String) session.getAttribute("login");
		if (id == null || id.equals("")) {
			return "redirect:/";
		}
		List<History> historyList = historyservice.getHistory(id);
		model.addAttribute("historyList", historyList);

		return "cafesearch";
	}

	@RequestMapping("/caferesult")
	public String caferesultpage(HttpServletRequest request, Model model) {
		session = request.getSession();
		String id = "";
		id = (String) session.getAttribute("login");
		if (id == null || id.equals("")) {
			return "redirect:/";
		}

		String location = request.getParameter("location");
		List<Cafe> cafeList = cafeservice.getCafeResult(location);
		model.addAttribute("location", location);
		model.addAttribute("cafeList", cafeList);
		model.addAttribute("listSize", cafeList.size());

		List<History> historyList = historyservice.getHistory(id);
		model.addAttribute("historyList", historyList);

		if (cafeList.size() == 0 || location.equals("") || location.equals(null))
			return "noresultpage";

		return "caferesultpage";
	}

	@RequestMapping("/detail")
	public String detail(HttpServletRequest request, Model model) {
		session = request.getSession();
		String id = "";
		id = (String) session.getAttribute("login");
		if (id == null || id.equals("")) {
			return "redirect:/";
		}

		String location = request.getParameter("location");
		String search = request.getParameter("search");
		model.addAttribute("location", location);
		model.addAttribute("search", search);
		List<Food> foodList = foodservice.getResult(location, search);
		model.addAttribute("foodList", foodList);

		historyservice.insertResult(id, search, location);

		List<History> historyList = historyservice.getHistory(id);
		model.addAttribute("historyList", historyList);
		
		
		String clientId = "R28udTBrjufTAHE6Y_Av";	//애플리케이션 클라이언트 아이디값";
        String clientSecret = "qRCFJQSqEj";			//애플리케이션 클라이언트 시크릿값";
        int display = 10;							// 리뷰 갯수
        try {
            String text = URLEncoder.encode(location, "UTF-8");
            String text2 = URLEncoder.encode(search, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+text2+"&display=" + display + "&"; 
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            
            sb = new StringBuilder();
            String line;

            while ((line = br.readLine()) != null) {
            	String line2 = line.replace("<b>", "");
            	String line3 = line2.replace("</b>", "");
            	sb.append(line3+"\n");
            }
          
            br.close();
            con.disconnect();
            
            String data = sb.toString();

            String[] array;
            array = data.split("\"");
            String[] title = new String[display];
            String[] description = new String[display];
            
            int k = 0;
            List<String> titleList = new ArrayList<>();
            List<String> descriptionList = new ArrayList<>();
            
            for (int i = 0; i < array.length; i++) {
                if (array[i].equals("title")) {
                    title[k] = array[i + 2];
                    titleList.add(title[k]);
            }
                if (array[i].equals("description")) {
                    description[k] = array[i + 2];
                    descriptionList.add(description[k]);
                }
            }
            model.addAttribute("titleList", titleList);
            model.addAttribute("descriptionList", descriptionList);
            
            if(titleList.size()==0)
            	return "noresultpage";
            
        } catch (Exception e) {
            System.out.println(e);
        }
		return "detailpage";
	}

	@RequestMapping("/favorite")
	public String favorites(HttpServletRequest request, Model model) {
		session = request.getSession();
		String id = "";
		id = (String) session.getAttribute("login");
		if (id == null || id.equals("")) {
			return "redirect:/";
		}

		model.addAttribute("id", id);

		List<Favorites> favoritesList = favoritesservice.getFavorites(id);
		model.addAttribute("favoritesList", favoritesList);

		List<History> historyList = historyservice.getHistory(id);
		model.addAttribute("historyList", historyList);

		return "favoritespage";
	}

	@RequestMapping("/addfavorites")
	public void addfavorites(HttpServletRequest request, Model model, HttpServletResponse response) throws Exception {
		session = request.getSession();
		String id = "";
		id = (String) session.getAttribute("login");
		response.setContentType("text/html; charset=utf-8"); 
		PrintWriter script = response.getWriter();
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		favoritesservice.insertFavorites(id, name, address);

		script.println("<script>");
		script.println("alert('즐겨찾기에 추가되었습니다.')");
		script.println("history.back()");
		script.println("</script>");

	}

	@RequestMapping("/chart")
	public String chart(HttpServletRequest request, Model model) {

		session = request.getSession();
		String id = "";
		id = (String) session.getAttribute("login");
		if (id == null || id.equals("")) {
			return "redirect:/";
		}

		List<String> address = new ArrayList<>();
		List<Integer> addresscount = new ArrayList<>();
		List<String> rankinglist = new ArrayList<>();
		
		address.add("강남구");
		address.add("강동구");
		address.add("강북구");
		address.add("강서구");
		address.add("관악구");
		address.add("광진구");
		address.add("구로구");
		address.add("금천구");
		address.add("노원구");
		address.add("도봉구");
		address.add("동대문구");
		address.add("동작구");
		address.add("마포구");
		address.add("서대문구");
		address.add("서초구");
		address.add("성동구");
		address.add("성북구");
		address.add("송파구");
		address.add("양천구");
		address.add("영등포구");
		address.add("용산구");
		address.add("은평구");
		address.add("종로구");
		address.add("중구");
		address.add("중랑구");

		for (int i = 0; i < 25; i++) {
			addresscount.add(historyservice.getChartData(address.get(i).toString()));
		}
		
		
		
		
		model.addAttribute("addresscount", addresscount);
		
		rankinglist= historyservice.getRanking();
		model.addAttribute("rankinglist", rankinglist);
		
		return "chart";
	}

}
