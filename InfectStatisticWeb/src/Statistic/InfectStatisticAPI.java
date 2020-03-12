package Statistic;

public interface InfectStatisticAPI {
	
	public void getFileList(String log);
	public void readFileByLines(String fileName,Lib lib);
	public void opData(String data,Lib lib);
	public int Find(Lib lib,String[] strarray,int y);
	public void Flow(Lib lib,String[] strarray);
	public void CureOrDead(Lib lib,String[] strarray);
	public void SureOrIncreaseOrMove(Lib lib,String[] strarray);
	public void addYesterday();
	public void whatIn(int x,String province);
	public int findDate(String date);
	public Lib[] getLib();

}
