local PromiseModule = require(script:FindFirstAncestor("InExperienceOffers").Parent.Promise)

return {
	networkError = function(Message, Cause) --[[ Line: 21 ]]
		return { kind = "Network", message = Message, cause = Cause }
	end,
	parseError = function(Message, Cause) --[[ Line: 30 ]]
		return { kind = "Parse", message = Message, cause = Cause }
	end,
	schemaError = function(Message, Cause) --[[ Line: 38 ]]
		return { kind = "Schema", message = Message, cause = Cause }
	end,
	engineError = function(Message, Cause) --[[ Line: 42 ]]
		return { kind = "Engine", message = Message, cause = Cause }
	end,
	rejectNetwork = function(Message, Cause) --[[ Line: 49 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Network", message = Message, cause = Cause })
	end,
	rejectParse = function(Message, Cause) --[[ Line: 53 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Parse", message = Message, cause = Cause })
	end,
	rejectSchema = function(Message, Cause) --[[ Line: 57 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Schema", message = Message, cause = Cause })
	end,
	rejectEngine = function(Message, Cause) --[[ Line: 61 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Engine", message = Message, cause = Cause })
	end
}