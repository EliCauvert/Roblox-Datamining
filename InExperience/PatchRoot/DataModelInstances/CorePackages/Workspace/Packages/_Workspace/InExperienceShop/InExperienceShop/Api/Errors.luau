local promiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return {
	networkError = function(p1, p2)
		return { kind = "Network", message = p1, cause = p2 }
	end,
	parseError = function(p1, p2)
		return { kind = "Parse", message = p1, cause = p2 }
	end,
	schemaError = function(p1, p2)
		return { kind = "Schema", message = p1, cause = p2 }
	end,
	engineError = function(p1, p2)
		return { kind = "Engine", message = p1, cause = p2 }
	end,
	rejectNetwork = function(p1, p2)
		-- upvalues: promiseModule (ref)
		return promiseModule.reject({ kind = "Network", message = p1, cause = p2 })
	end,
	rejectParse = function(p1, p2)
		-- upvalues: promiseModule (ref)
		return promiseModule.reject({ kind = "Parse", message = p1, cause = p2 })
	end,
	rejectSchema = function(p1, p2)
		-- upvalues: promiseModule (ref)
		return promiseModule.reject({ kind = "Schema", message = p1, cause = p2 })
	end,
	rejectEngine = function(p1, p2)
		-- upvalues: promiseModule (ref)
		return promiseModule.reject({ kind = "Engine", message = p1, cause = p2 })
	end
}