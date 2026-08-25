local promiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return {
	networkError = function(p0, p1)
		return { kind = "Network", message = p0, cause = p1 }
	end,
	parseError = function(p2, p3)
		return { kind = "Parse", message = p2, cause = p3 }
	end,
	schemaError = function(p4, p5)
		return { kind = "Schema", message = p4, cause = p5 }
	end,
	engineError = function(p6, p7)
		return { kind = "Engine", message = p6, cause = p7 }
	end,
	rejectNetwork = function(p8, p9)
		-- upvalues: promiseModule (ref)
		return promiseModule.reject({ kind = "Network", message = p8, cause = p9 })
	end,
	rejectParse = function(p10, p11)
		-- upvalues: promiseModule (ref)
		return promiseModule.reject({ kind = "Parse", message = p10, cause = p11 })
	end,
	rejectSchema = function(p12, p13)
		-- upvalues: promiseModule (ref)
		return promiseModule.reject({ kind = "Schema", message = p12, cause = p13 })
	end,
	rejectEngine = function(p14, p15)
		-- upvalues: promiseModule (ref)
		return promiseModule.reject({ kind = "Engine", message = p14, cause = p15 })
	end
}