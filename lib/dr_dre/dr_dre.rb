module DrDre
	
	def redirect_to(*params)
		log_if_dre
		super(params)
	end

	def render(*params)
		log_if_dre
		super(params)
	end
	
	private
	
	def log_if_dre
		@dr_dre_call_log ||= []
		@dr_dre_call_log << caller[1] 
		log_dre if @dr_dre_call_log.length > 1
	end

	def log_dre
		logger.info("\ndr_dre: your application has called render or redirect_to more than once!")
		logger.info( @dr_dre_call_log.map{|c| "Called from: #{c}"}.join("\n")	)
	end
		
end

