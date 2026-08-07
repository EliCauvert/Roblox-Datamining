local promiseModule = require(script.Parent.Parent.Promise)

return function(p0) --[[ line: 4 | named "getPremiumUpsellPrecheck" ]]
	-- upvalues: promiseModule (ref)
	return p0.getPremiumUpsellPrecheck():andThen(function(_) --[[ line: 7 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(true)
	end):catch(function(_) --[[ line: 10 ]]
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(false)
	end)
end