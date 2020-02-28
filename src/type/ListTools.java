package type;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class ListTools {


	//subList�����ı�ԭ���飬���Ǹı�����ֵ��ı�ԭ���顣endֵ(subList)�ǿ�����
	//��һά���鵱��ѭ�����飬��ȥָ�����ִ���β��ʼ��ͷ������from��endԪ�أ�
	/*
	 * 	typeֵ
	 * 	1����ɾ��ĩβԪ��
	 * 	2��������ɾ��ĩβԪ��
	 * 
	 */
	public <T> List<T> reList(List<T> objList,int from,int end,int type)
	{
		if(from<0||from>end||end>objList.size()-1)
			return null;
		List<T> objListResult=new ArrayList<T>();
		List<T> objListTemp=new ArrayList<T>(objList);
		List<T> objListTemp_1=new ArrayList<T>(objList);
		if(objList.size()==1)
			return objListTemp;
		if(type!=1)
			objListTemp.remove(objListTemp.size()-1);
		objListResult.addAll(objListTemp.subList(end, objListTemp.size()));
		objListResult.addAll(objListTemp_1.subList(0, from+1));
		return objListResult;
	}
	
	//ɾ�������е��ظ�Ԫ��
	public <T> void minList(List<T> objList)
	{
		Iterator<T> it = objList.iterator();
		Map<T,Integer> a=new HashMap<T,Integer>();
		while(it.hasNext())
		{
		    T x = it.next();
		    if(a.get(x)==null)
		    {
		        a.put(x, 1);
		    }
		    else
		    {
		    	it.remove();
		    }
		}
	}
	//���List�е�n��xԪ�ص�λ��,���û�е�n��xԪ�ص�λ���򷵻�-1
	public <T> int getListIndexBy(List<T> objList,T x,int n)
	{
		if(!objList.contains(x))
			return -1;
		Map<T,Integer> map=new HashMap<T,Integer>();
		int num=objList.size();
		for(int i=0;i<num;i++)
		{
			if(objList.get(i).equals(x))
			{
				if(map.get(x)==null)
					map.put(x, 1);
				else
				{
					map.put(x, map.get(x)+1);
				}
				if(map.get(x)==n)
					return i;
			}
		}
		return -1;
	}
	
	
	
	//����˫��������ͳ�Ƴ���Ӧ�����������Ĵ�С
	public <T> List<Integer> getListListSize(List<List<T>> objlistlist)
	{
		List<Integer> listsize=new ArrayList<Integer>();
		for(int i=0;i<objlistlist.size();i++)
		{
			listsize.add(objlistlist.get(i).size());
		}
		return listsize;
	}
	
	//���������ǰ�����������
	public <T> void sortFromList(List<T> list,List<Integer> array,boolean isMaxToMin)
	{
		int temp;
		T tTemp;
		int size =array.size();
		for(int i=1; i<size; i++) {
			for(int j=0; j<size-i; j++) {
				int jarray=array.get(j);
				int j1array=array.get(j+1);
				T jlist=list.get(j);
				T j1list=list.get(j+1);
				if(isMaxToMin)
				{
					if(jarray < j1array) {
						temp = array.get (j);
						array.set(j, j1array) ;
						array.set(j+1,temp);		
						tTemp=jlist;
						list.set(j,j1list);
						list.set(j+1,tTemp);
					}
				}
				else
				{
					if(jarray > j1array) {
						temp = jarray;
						array.set(j, j1array) ;
						array.set(j+1,temp);
						tTemp=jlist;
						list.set(j, j1list);
						list.set(j+1, tTemp);

					}

				}
			}
		}
	}
	
	//��T����ת��ΪT����
	public <T> List<T> TNlistToTList(T []tlist)
	{
		List<T> list = java.util.Arrays.asList(tlist);
		return list;
	}

	
	//��Object����ת��ΪString����
	public <T> List<T> ObjectListToTList(List<Object> objList,T it)
	{
		List<T> tList=new ArrayList<T>();
		for(int i=0;i<objList.size();i++)
		{
			tList.add((T)objList.get(i));
		}
		return tList;
	}
	
	//���Map�е�ֵ��������С��n��λ��
	public List<Integer> getMtoM(List<Integer> listinteger,int count,boolean isMaxToMin)
	{
		List<Integer> numlist=new ArrayList<Integer>();
		List<Integer> clist=new ArrayList<Integer>();
		int g_size=listinteger.size();
		if(g_size==0||count<=0)
			return numlist;
		if(isMaxToMin)
		{
			for(int j=0;j<count;j++)
			{
				Integer point=null;
				int g_m=Integer.MIN_VALUE;
				for(int i=0;i<g_size;i++)
				{
					if(clist.contains(i))
						continue;
					int number=listinteger.get(i);
					if(number>g_m)
					{
						point=i;
						g_m=number;
					}
				}
				clist.add(point);
				numlist.add(g_m);
				
			}
		}
		else
		{
			for(int j=0;j<count;j++)
			{
				Integer point=null;
				int g_m=Integer.MAX_VALUE;
				for(int i=0;i<g_size;i++)
				{
					if(clist.contains(i))
						continue;
					int number=listinteger.get(i);
					if(number<g_m)
					{
						point=i;
						g_m=number;
					}
				}
				clist.add(point);
				numlist.add(g_m);
				
			}
		}
		return clist;
	}
	
	//���Map�еļ�ֵList
	public <T> List<T> getMapTList(Map<T,Integer> maplist)
	{
		List<T> tList=new ArrayList<T>();
		Set<T> s = maplist.keySet();//��ȡKEY����
		for (T t : s) 
		{
			tList.add(t);
		}
		return tList;
	}
	
	//���Map�е�ֵList
	public <T> List<Integer> getMapValueList(Map<T,Integer> maplist)
	{
		List<Integer> numList=new ArrayList<Integer>();
		Set<T> s = maplist.keySet();//��ȡKEY����
		for (T str : s) 
		{
			numList.add(maplist.get(str));
		}
		return numList;
	}

}
