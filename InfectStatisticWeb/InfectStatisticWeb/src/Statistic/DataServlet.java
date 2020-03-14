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
		
		String path = this.getServletContext().getRealPath("/log");
		
		InfectStatistic is=new InfectStatistic();
	    is.getFileList(path);
	    Lib[] Datas=is.getLib();
	    
	    String provincename=request.getParameter("province");
	    String date=request.getParameter("year")+"-"
	    +request.getParameter("month")+"-"+
	    		request.getParameter("day");
	    Lib Data=is.getLibByDate(date);
	    Province province=Data.getProvince(provincename);
	    
	    String [] months=new String[Datas.length];
	    String [] days=new String[Datas.length];
	    int []newIp=new int[Datas.length];
	    int []allIp=new int[Datas.length];
	    int []Cure=new int[Datas.length];
	    int []Dead=new int[Datas.length];
	    
	    int lastnewip=0,lastnewcure=0,lastnewdead=0,lastnewallip=0;
	    if(Datas.length>1)
	    {
	    	Province temp1=Datas[Datas.length-1].getProvince(provincename);
	    	Province temp2=Datas[Datas.length-2].getProvince(provincename);
	    	lastnewip=temp1.getIp()-temp2.getIp();
	    	lastnewcure=temp1.getCure()-temp2.getCure();
	    	lastnewdead=temp1.getDead()-temp2.getDead();
	    	lastnewallip=temp1.getAllIp()-temp2.getAllIp();
	    }
	    
	    for(int i=0;i<Datas.length;i++)
	    {
	    	String []temp=Datas[i].getDate().split("-");
	    	months[i]=temp[1];
	    	days[i]=temp[2];
	    	
	    	allIp[i]=Datas[i].getProvince(provincename).getAllIp();
	    	Cure[i]=Datas[i].getProvince(provincename).getCure();
	    	Dead[i]=Datas[i].getProvince(provincename).getDead();
	    	
	    	if(i==0)
	    	{
	    		newIp[i]=0;
	    	}
	    	else
	    	{
	    		newIp[i]=Datas[i].getProvince(provincename).getIp();
	    		newIp[i]=newIp[i]-Datas[i-1].getProvince(provincename).getIp();
	    	}
	    	
	    }
	    
	    request.setAttribute("months", months);
	    request.setAttribute("days", days);
	    request.setAttribute("newIp", newIp);
	    request.setAttribute("allIp", allIp);
	    request.setAttribute("Cure", Cure);
	    request.setAttribute("Dead", Dead);
	    
	    request.setAttribute("lastnewip", lastnewip);
	    request.setAttribute("lastnewcure", lastnewcure);
	    request.setAttribute("lastnewdead", lastnewdead);
	    request.setAttribute("lastnewallip", lastnewallip);
	    
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
