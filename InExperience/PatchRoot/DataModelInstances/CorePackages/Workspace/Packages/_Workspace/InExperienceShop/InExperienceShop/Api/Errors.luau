local PromiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return {
	networkError = function(Message, Cause) --[[ Line: 22 ]]
		return { kind = "Network", message = Message, cause = Cause }
	end,
	parseError = function(Message, Cause) --[[ Line: 31 ]]
		return { kind = "Parse", message = Message, cause = Cause }
	end,
	schemaError = function(Message, Cause) --[[ Line: 39 ]]
		return { kind = "Schema", message = Message, cause = Cause }
	end,
	engineError = function(Message, Cause) --[[ Line: 43 ]]
		return { kind = "Engine", message = Message, cause = Cause }
	end,
	badRequestError = function(Message, Cause) --[[ Line: 50 ]]
		return { kind = "BadRequest", message = Message, cause = Cause }
	end,
	rejectNetwork = function(Message, Cause) --[[ Line: 57 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Network", message = Message, cause = Cause })
	end,
	rejectParse = function(Message, Cause) --[[ Line: 61 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Parse", message = Message, cause = Cause })
	end,
	rejectSchema = function(Message, Cause) --[[ Line: 65 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Schema", message = Message, cause = Cause })
	end,
	rejectEngine = function(Message, Cause) --[[ Line: 69 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "Engine", message = Message, cause = Cause })
	end,
	rejectBadRequest = function(Message, Cause) --[[ Line: 73 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.reject({ kind = "BadRequest", message = Message, cause = Cause })
	end
}