/**
 * Created by new on 09.08.2017.
 */

public with sharing class StringArrayTest {
	public static List<String> generateStringArray(Integer n){
		List<String> lists = new List<String>();

		for(Integer i = 0; i<n;i++){
			lists.add('Test '+i);
			System.debug(lists[i]);
		}

		return lists;
	}
}