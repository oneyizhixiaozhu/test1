package type;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * CourseService
 * 服务层
 * @author HDQ
 *
 */
public class ClassService {

	ClassDao cDao = new ClassDao();
	StringHandle sh=new StringHandle();
	
	
	/**
	 * 通用更新
	 * @return
	 */
	public boolean executeUpdate(String sql,Object... args)
	{
		return cDao.executeUpdate(sql, args);
	}
	
	
	/**
	 * 通用查询
	 * @return
	 */
	public ResultSet executeQuery(String sql)
	{
		return cDao.executeQuery(sql);
	}
	
	/**
	 * 添加
	 * @param Class
	 * @return
	 */
	public boolean add(String table,String strList[],String strList1[]) {
		boolean f = cDao.add(table,strList,strList1);
		return f;
	}
	
	
	/**
	 * 添加T
	 * @param Class
	 * @return
	 */
	public <T> boolean add(String table,T obj) {
		boolean f = cDao.add(table,obj);
		return f;
	}
	
	
	/**
	 * 删除
	 */
	public boolean del(String table,String qian,String hou) {
		return cDao.delete(table,qian,hou);
	}
	
	/**
	 * 修改
	 * @return 
	 */
	public boolean update(String table,String []strlist,String []strlist1,String qian,String hou) {
		return cDao.update(table,strlist,strlist1,qian,hou);
	}
	
	
	/**
	 * 修改多key
	 * @return 
	 */
	public boolean update(String table,String []strlist,String []strlist1,String qian[],String hou[]) {
		return cDao.update(table,strlist,strlist1,qian,hou);
	}
	
	/**
	 * 修改T多key
	 * @return 
	 */
	public <T> boolean update(String table,T obj,String qian[],String hou[]) {
		return cDao.update(table,obj,qian,hou);
	}
	
	/**
	 * 修改T
	 * @return 
	 */
	public <T> boolean update(String table,T obj,String qian,String hou) {
		return cDao.update(table,obj,qian,hou);
	}
	
	//判断表是否存在
	public boolean isExistTable(String tablename)
	{
		return cDao.isExistTable(tablename);
	}
	
	
	
	
	/**
	 * 单列表信息获取
	 * @return
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public <T> List<T> getInfoAllList(String table,String rowInfo,Class<T> clazz)
	{
		return cDao.getInfoAllList(table,rowInfo,clazz);
	}
	
	/**
	 * 单列表信息获取
	 * @return
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public List<String> getInfoAllList(String table,String rowInfo)
	{
		return cDao.getInfoAllList(table,rowInfo);
	}
	
	/**
	 * 键对值信息获取
	 * @return
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public <T> Map<T,Object> getInfoMapList(String table,String key,String value,Class<T> clazz)
	{
		return cDao.getInfoMapList(table, key, value, clazz);
	}
	
	/**
	 * 删除表格
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public boolean deleteTable(String table)
	{
		return cDao.deleteTable(table);
	}
	
	/**
	 * 查找
	 * @return 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public <T> List<T> search(String table, String []strList, String []strList1,Class<T> clazz){
		return cDao.search(table,strList,strList1,clazz);
	}
	
	/**
	 * 查找
	 * @return 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public  List<List<String>> search(String table, String []strList, String []strList1){
		return cDao.search(table,strList,strList1);
	}
	
	
	/**
	 * 精确查找
	 * @return 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public <T> List<T> searchBy(String table, String []strList, String []strList1,Class<T> clazz) {
		return cDao.searchBy(table,strList,strList1,clazz);
	}
	
	/**
	 * 精确查找
	 * @return 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public List<List<String>> searchBy(String table, String []strList, String []strList1) {
		return cDao.searchBy(table,strList,strList1);
	}
	
	/**
	 * 由时间查找
	 * @return 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public <T> List<T> searchByTime(String table, String []strList, String []strList1,String biaoshi,String qian,String hou,Class<T> clazz) {
		return cDao.searchByTime(table, strList, strList1, biaoshi, qian, hou, clazz);
	}
	
	
	/**
	 * 由时间查找
	 * @return 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public  List<List<String>> searchByTime(String table, String []strList, String []strList1,String biaoshi,String qian,String hou) {
		return cDao.searchByTime(table, strList, strList1, biaoshi, qian, hou);
	}
	
	/**
	 * 全部数据
	 * @return 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws ClassNotFoundException 
	 */
	public List<List<String>> list(String table) {
		List<List<String>> result=new ArrayList<List<String>>();
		List<List<String>> resultEx=new ArrayList<List<String>>();
		List<String> column=cDao.getTableColumn(table);
		int size2=0;
		for(int i=0;i<column.size();i++)
		{
			//System.out.println(cDao.getInfoAllList(table, column.get(i)));
			List<String> ls=cDao.getInfoAllList(table, column.get(i));
			result.add(ls);
			size2=ls.size();
		}
		for(int j=0;j<size2;j++)
		{
			List<String> ok=sh.StringListListInitSingleList(result, j);
			//System.out.println(ok);
			if(ok.size()>0)
				resultEx.add(ok);
		}
		return resultEx;
	}
	
	/**
	 * 全部数据
	 * @return 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws ClassNotFoundException 
	 */
	public <T> List<T> list(String table,String []strList,Class<T> clazz) {
		return cDao.list(table,strList,clazz);
	}
	
	/**
	 * 全部数据
	 * @return 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws ClassNotFoundException 
	 */
	public <T> List<T> list(String table,Class<T> clazz) {
		return cDao.list(table,clazz);
	}
	
	//得到数据库中所有表
	public List<String> getTableName(String database)
	{
		return cDao.getTableName(database);
	}
	
	//得到数据库中所有列名
	public List<String> getTableColumn(String table)
	{
		return cDao.getTableColumn(table);
	}
	
	/**
	 * 创建数据库表单
	 * @return 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public boolean createTable(String table,String []info,String []type,Integer []size)
	{
		return cDao.createTable(table, info, type, size);
	}
	
	
}
