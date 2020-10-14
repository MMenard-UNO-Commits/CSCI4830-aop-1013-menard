
public aspect TraceAspectMenard {
	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	
	pointcut methodToTrace(): classToTrace() && execution(String getName());
	
	before(): methodToTrace() {
		String sig = thisJoinPointStaticPart.getSignature() + " ";
		String line = thisJoinPointStaticPart.getSourceLocation().getLine() + " ";
		System.out.println("[BGN]");
		System.out.println("Signature --> " + sig);
		System.out.println("Line Number --> " + line);
		System.out.println("[BGN]");
	}
	
	after(): methodToTrace() {
		String sig = thisJoinPointStaticPart.getSignature() + " ";
		System.out.println("[END]");
		System.out.println("Signature --> " + sig);
		System.out.println("[END]");
	}
}
