package statistic;

import java.util.*;

public class Lib {
	String date;
	public Vector<Province> provinces;
	
	public Lib(String date)
	{
		this.date=date;
		provinces=new Vector<Province>();
		
		provinces.addElement(new Province("全国"));
		provinces.addElement(new Province("安徽"));
		provinces.addElement(new Province("北京"));
		provinces.addElement(new Province("重庆"));
		provinces.addElement(new Province("福建"));
		
		provinces.addElement(new Province("甘肃"));
		provinces.addElement(new Province("广东"));
		provinces.addElement(new Province("广西"));
		provinces.addElement(new Province("贵州"));
		provinces.addElement(new Province("海南"));
		
		provinces.addElement(new Province("河北"));
		provinces.addElement(new Province("河南"));
		provinces.addElement(new Province("黑龙江"));
		provinces.addElement(new Province("湖北"));
		provinces.addElement(new Province("湖南"));
		
		provinces.addElement(new Province("吉林"));
		provinces.addElement(new Province("江苏"));
		provinces.addElement(new Province("江西"));
		provinces.addElement(new Province("辽宁"));
		provinces.addElement(new Province("内蒙古"));
		
		provinces.addElement(new Province("宁夏"));
		provinces.addElement(new Province("青海"));
		provinces.addElement(new Province("山东"));
		provinces.addElement(new Province("山西"));
		provinces.addElement(new Province("陕西"));
		
		provinces.addElement(new Province("上海"));
		provinces.addElement(new Province("四川"));
		provinces.addElement(new Province("天津"));
		provinces.addElement(new Province("西藏"));
		provinces.addElement(new Province("新疆"));
		
		provinces.addElement(new Province("云南"));
		provinces.addElement(new Province("浙江"));
		
		provinces.addElement(new Province("台湾"));
		provinces.addElement(new Province("香港"));
		provinces.addElement(new Province("澳门"));
	}
	
	public String getDate()
	{
		return date;
	}
	
	public Province getProvince(String provincename)
	{
		for(int i=0;i<this.provinces.size();i++)
		{
			if(this.provinces.get(i).getName().contentEquals(provincename)==true)
				return this.provinces.get(i);
		}
		return null;
	}
}
