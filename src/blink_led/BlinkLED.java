package blink_led;

public class BlinkLED {
	public boolean led;
	
	public void run() {
		while(true) {
			led = true;
			for(int i = 0; i < 5000000; i++);
			led = false;
			for(int i = 0; i < 5000000; i++);
		}
	}

}
