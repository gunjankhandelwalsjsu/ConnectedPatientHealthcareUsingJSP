package com.journaldev.mongodb.util;
import java.util.Map;
import java.util.HashMap;
 
import com.twilio.sdk.resource.instance.Account;
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Message;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
 
public class SmsSender {
 
	
	 
	 public static void sendSMS(List<NameValuePair> parameter) throws TwilioRestException { 
		TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN); 
	 
		 // Build the parameters 
		 List<NameValuePair> params = new ArrayList<NameValuePair>(); 
		 params.add(new BasicNameValuePair("To", "+14086146313")); 
		 params.add(new BasicNameValuePair("From", "+16509341358")); 
		 params.add(new BasicNameValuePair("Body", "hii"));   
	 
		 MessageFactory messageFactory = client.getAccount().getMessageFactory(); 
		 Message message = messageFactory.create(parameter); 
		 System.out.println(message.getSid()); 
	 } 
}