package mul.camp.seven.tool;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/* mail import 방법
 * 구성중인 프로젝트 우클릭 > properties > Java Build Path > 라이브러리 > classpath 클릭 > add JARs 클릭>
 * webapp/lib 또는 webapp/WEB-INF/lib폴더 안에 javax.mail.jar 추가 >
 * pom.xml에 mail 의존성 추가
 */
import javax.mail.*;
import javax.mail.internet.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

@Configuration
public class Mailer {
	private static final Logger LOG = LoggerFactory.getLogger(Mailer.class);

	@Bean("email_check")
	public Mailer create() {
		return this;
	}

	String user = "mo1ew@naver.com";	// 송신자 이메일
	String password = "qazqaz11!";	// 송신자 이메일 비밀번호

	public int SendMail(String email, String title, String content) {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date time = new Date();

		String time1 = format1.format(time);

		LOG.info("Mailer - email : " + email);
		LOG.info("Mailer - time : " + time1);

		String host = "smtp.naver.com"; // smtp.사이트 주소

		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", 587);

		try {
			Session session = Session.getDefaultInstance(props, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
			});
			MimeMessage message = new MimeMessage(session);
			message.setHeader("Content-Type", "text/plain; charset=UTF-8");
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
			message.setSubject(MimeUtility.encodeText(title, "UTF-8", "B")); // 메일 제목
			message.setContent(content, "text/html; charset=UTF-8"); // 메일 내용

			Transport.send(message);
			System.out.println("Success Message Send");
		} catch (Exception e) {
			LOG.info(e.getMessage());
			return 0;
		}
		LOG.info("signupSendMail - send mail success");
		return 1;	
	}
}