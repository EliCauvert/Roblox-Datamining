local PromiseModule = require(script:FindFirstAncestor("InExperienceOffers").Parent.Promise)

return {
	networkError = function(Message, Cause)
		return { kind = "Network", message = Message, cause = Cause }
	end,
	parseError = function(Message, Cause)
		return { kind = "Parse", message = Message, cause = Cause }
	end,
	schemaError = function(Message, Cause)
		return { kind = "Schema", message = Message, cause = Cause }
	end,
	engineError = function(Message, Cause)
		return { kind = "Engine", message = Message, cause = Cause }
	end,
	rejectNetwork = function(Message, Cause)
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Network", message = Message, cause = Cause })
	end,
	rejectParse = function(Message, Cause)
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Parse", message = Message, cause = Cause })
	end,
	rejectSchema = function(Message, Cause)
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Schema", message = Message, cause = Cause })
	end,
	rejectEngine = function(Message, Cause)
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Engine", message = Message, cause = Cause })
	end
}