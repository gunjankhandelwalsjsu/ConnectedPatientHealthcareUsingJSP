package com.journaldev.mongodb.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailNotification {

    Properties emailProperties;
    Session mailSession;
    MimeMessage emailMessage;

    public void mail(String[] toEmails,String emailSubject,String emailBody) throws AddressException,
            MessagingException {
    	/*  String[] toEmails = {"govindha8@gmail.com"};
          String emailSubject = "Java Email";
          String emailBody = "This is an email sent by JavaMail api.";
*/
        EmailNotification javaEmail = new EmailNotification();

        javaEmail.setMailServerProperties();
        javaEmail.createEmailMessage(toEmails, emailSubject, emailBody);
        javaEmail.sendEmail();
    }

    public void setMailServerProperties() {

        String emailPort = "587";//gmail's smtp port

        emailProperties = System.getProperties();
        emailProperties.put("mail.smtp.port", emailPort);
        emailProperties.put("mail.smtp.auth", "true");
        emailProperties.setProperty("mail.smtp.ssl.trust", "smtp server");
        emailProperties.put("mail.smtp.starttls.enable", "true");
        emailProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

    }

    public void createEmailMessage( String[] toEmails,String emailSubject,String emailBody) throws AddressException,
            MessagingException {
      
        mailSession = Session.getDefaultInstance(emailProperties, null);
        emailMessage = new MimeMessage(mailSession);

        for (int i = 0; i < toEmails.length; i++) {
            emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
        }

        emailMessage.setSubject(emailSubject);
        emailMessage.setContent(emailBody, "text/html");//for a html email
        //emailMessage.setText(emailBody);// for a text email

    }

    public void sendEmail() throws AddressException, MessagingException {

        String emailHost = "smtp.gmail.com";
        String fromUser = "305gunjan";//just the id alone without @gmail.com
        String fromUserEmailPassword = "G*2unjan";
        
        Transport transport = mailSession.getTransport("smtps");

        transport.connect(emailHost,587, fromUser, fromUserEmailPassword);
        transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
        transport.close();
        System.out.println("Email sent successfully.");
    }
}