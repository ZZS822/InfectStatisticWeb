package Statistic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Statistic.InfectStatistic;
import Statistic.Lib;
import Statistic.Province;

/**
 * Servlet implementation class DataServlet
 */
@WebServlet("/DataServlet")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		InfectStatistic is=new InfectStatistic();
	    is.getFileList("E:\\MyJavaCode\\InfectStatisticWeb\\WebContent\\log");
	    Lib[] Datas=is.getLib();
	    
	    String provincename=request.getParameter("province");
	    String date=request.getParameter("year")+"-"
	    +request.getParameter("month")+"-"+
	    		request.getParameter("day");
	    Lib Data=is.getLibByDate(date);
	    Province province=Data.getProvince(provincename);
	    
	    String [] months=new String[Datas.length];
	    String [] days=new String[Datas.length];
	    int []nowIp=new int[Datas.length];
	    int []Cure=new int[Datas.length];
	    int []Dead=new int[Datas.length];
	    
	    for(int i=0;i<Datas.length;i++)
	    {
	    	String []temp=Datas[i].getDate().split("-");
	    	months[i]=temp[1];
	    	days[i]=temp[2];
	    	nowIp[i]=Datas[i].getProvince(provincename).getIp();
	    	Cure[i]=Datas[i].getProvince(provincename).getCure();
	    	Dead[i]=Datas[i].getProvince(provincename).getDead();
	    }
	    
	    request.setAttribute("months", months);
	    request.setAttribute("days", days);
	    request.setAttribute("nowIp", nowIp);
	    request.setAttribute("Cure", Cure);
	    request.setAttribute("Dead", Dead);
	    
	    request.setAttribute("date", date);
	    request.setAttribute("province", province);
	    request.getRequestDispatcher("province.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
