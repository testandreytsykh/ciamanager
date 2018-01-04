/**
 * Created by new on 21.08.2017.
 */

public with sharing class A {
	private Integer numb{get; set;}
	public A(Integer numb){
		this.numb=numb;
	}

	public void increment(){
		numb++;
	}
}