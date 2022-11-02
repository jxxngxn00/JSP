package guest.service;

import guest.model.Message;
import guest.model.MessageDao;
import guest.model.MessageException;

import java.util.List;

public class ListMessageService {

	//-------------------------------------------------------------------
	private int totalRecCount;		// 전체 레코드 수	
	private int pageTotalCount;		// 전체 페이지 수
	private int countPerPage = 3;	// 한페이지당 레코드 수
	
	private static ListMessageService instance;
	
	public static ListMessageService	getInstance() throws MessageException
	{
		if( instance == null )
		{
			instance = new ListMessageService();
		}
		return instance;
	}
	
	private ListMessageService()
	{
		
	}
	
	public List <Message> getMessageList(String pNum) throws MessageException
	{
		int pageNum = 1;
		if(pNum != null) pageNum = Integer.parseInt(pNum);		
		
		int startRow = countPerPage*pageNum-2;
		int endRow = pageNum * countPerPage;
		
		// 전체 레코드를 검색해 온다면
		List <Message> mList = MessageDao.getInstance().selectList(startRow, endRow);			
		return mList;
	}
	
	public int getTotalPage() throws MessageException{
		//전체 레코드 수
		totalRecCount = MessageDao.getInstance().getTotalCount();
		
		/* 전체레코드 수 안에서 한페이지당 레코드 수의 배수마다 페이지 수 증가*/
		
		pageTotalCount = totalRecCount/countPerPage;
		if(totalRecCount%countPerPage>0) { pageTotalCount++; }
		
		return pageTotalCount; // 페이지 수 리턴
	}
}
