package type;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;



public class CheckCode {
	private final int width = 100;		// 定义图片的width
	private final int height = 30;		// 定义图片的height
	private final int codeCount = 4;	// 定义图片上显示验证码的个数
	//	private final int codeX = 15;		//字体x间距设置,间距坐标
	private final int fontHeight = 18;	//字体高度
	//	private final int codeY = 16;		//y坐标	
	private final int lineInfect = 0;
	private final float yawpRate = 0.01f;	//噪点生成在图中的覆盖范围5%
	private final int fontColor = 200; 	//字体颜色范围,越小颜色越深(0-255)
	private final char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };


	public static void main(String args[])
	{
//		CheckCode cc=new CheckCode();
//		Map<String,Object> yzm=cc.generateCodeAndPic();
//		req.getSession().setAttribute("checkcode",((StringBuffer)yzm.get("code")).toString());
//		ImageIO.write((BufferedImage)yzm.get("codePic"), "jpg", resp.getOutputStream());
	}
	
	public Map<String,Object> m1;
	/**
	 * 生成一个map集合
	 * code为生成的验证码
	 * codePic为生成的验证码BufferedImage对象
	 * @return
	 */

	public Map<String,Object> generateCodeAndPic() {
		// 定义图像buffer
		BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		// Graphics2D gd = buffImg.createGraphics();
		// Graphics2D gd = (Graphics2D) buffImg.getGraphics();
		Graphics gd = buffImg.getGraphics();
		// 创建一个随机数生成器类
		Random random = new Random();
		// 将图像填充为白色
		gd.setColor(Color.WHITE);
		gd.fillRect(0, 0, width, height);


		// randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
		StringBuffer randomCode = new StringBuffer();
		int red = 0, green = 0, blue = 0;
		// 创建字体，字体的大小应该根据图片的高度来定。
		Font font = new Font("Fixedsys", Font.BOLD, fontHeight);
		// 设置字体。
		gd.setFont(font);
		// 随机产生codeCount数字的验证码。
		for (int i = 0; i < codeCount; i++) {
			// 得到随机产生的验证码数字。
			String code = String.valueOf(codeSequence[random.nextInt(36)]);
			// 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
			red = random.nextInt(fontColor);
			green = random.nextInt(fontColor);
			blue = random.nextInt(fontColor);

			// 用随机产生的颜色将验证码绘制到图像中。
			gd.setColor(new Color(red, green, blue));
			//旋转文字
			Random rand = new Random();
			// 随机生成字符旋转角度(-30~30度)
			int degree = rand.nextInt(60);
			if (degree > 30)
				degree = 30 - degree;
			Graphics2D g2=(Graphics2D) gd.create();
			g2.translate(width/codeCount*(i)+5+rand.nextInt(5),height/2+5+rand.nextInt(5));
			g2.rotate( degree* Math.PI / 180);
			g2.drawString(code, 0, 0);
			// 将产生的四个随机数组合在一起。
			randomCode.append(code);
		}
		//-------------------------------------------------
		//扭曲图片
		//扭曲X
//		int period = random.nextInt(2);
//		int fc=200,bc=250;
//		boolean borderGap = false;
//		int frames = 1;
//		int phase = random.nextInt(2);
//		Color color;
//
//		for (int i = 0; i < height; i++) {
//			double d = (double) (period >> 1) * Math.sin((double) i / (double) period + (6.2831853071795862D * (double) phase) / (double) frames);
//			gd.copyArea(0, i, width, 1, (int) d, 0);
//			if (borderGap) {
//				int r = fc + random.nextInt(bc - fc);
//				int g = fc + random.nextInt(bc - fc);
//				int b = fc + random.nextInt(bc - fc);
//				color=new Color(r, g, b);
//				gd.setColor(color);
//				gd.drawLine((int) d, i, 0, i);
//				gd.drawLine((int) d + width, i, width, i);
//			}
//		}
//		//扭曲Y
//		period = random.nextInt(10) + 5; // 50;
//		borderGap = false;
//		frames = 20;
//		phase = 3;
//		for (int i = 0; i < width; i++) {
//			double d = (double) (period >> 1) * Math.sin((double) i / (double) period + (6.2831853071795862D * (double) phase) / (double) frames);
//			gd.copyArea(i, 0, 1, height, 0, (int) d);
//			if (borderGap) {
//				int r = fc + random.nextInt(bc - fc);
//				int g = fc + random.nextInt(bc - fc);
//				int b = fc + random.nextInt(bc - fc);
//				color=new Color(r, g, b);
//				gd.setColor(color);
//				gd.drawLine(i, (int) d, i, 0);
//				gd.drawLine(i, (int) d + height, i, height);
//			}
//
//		}
		//-------------------------------------------------

		// 画边框。
		gd.setColor(Color.BLACK);
		gd.drawRect(0, 0, width - 1, height - 1);
		//-------------------------------------------------
		// 随机产生30条干扰线，使图象中的认证码不易被其它程序探测到。
		gd.setColor(Color.BLACK);
		for (int i = 0; i < lineInfect; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int xl = random.nextInt(12);
			int yl = random.nextInt(12);
			gd.drawLine(x, y, x + xl, y + yl);
		}
		//-------------------------------------------------
		//生成噪点

		int area = (int) (yawpRate * width * height);

		for (int i= 0; i < area; i++) {
			int x = random.nextInt(width);
			int y = random.nextInt(height);
			int[] rgb =  new int[3];
			for (int j = 0; j < 3; j++) {
				rgb[j] = random.nextInt(255);
			}
			int color1 = 0;
			for (int c : rgb) {
				color1 = color1 << 8;
				color1 = color1 | c;
			}
			buffImg.setRGB(x, y, color1);
		}
		Map<String,Object> map  =new HashMap<String,Object>();
		//存放验证码
		map.put("code", randomCode);
		//存放生成的验证码BufferedImage对象
		map.put("codePic", buffImg);
		return map;
	}



}
