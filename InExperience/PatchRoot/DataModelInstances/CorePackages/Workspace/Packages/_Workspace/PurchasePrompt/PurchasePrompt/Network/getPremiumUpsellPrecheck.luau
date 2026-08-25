local promiseModule = require(script.Parent.Parent.Promise)

return function(p0)
	-- upvalues: promiseModule (ref)
	return p0.getPremiumUpsellPrecheck():andThen(function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(true)
	end):catch(function(_)
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve(false)
	end)
end