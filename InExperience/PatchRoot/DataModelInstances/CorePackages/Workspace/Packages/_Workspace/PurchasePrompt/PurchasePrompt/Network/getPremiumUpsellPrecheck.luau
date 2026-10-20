local PromiseModule = require(script.Parent.Parent.Promise)

return function(p1)
	-- upvalues: PromiseModule (copy)
	return p1.getPremiumUpsellPrecheck():andThen(function(_)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(true)
	end):catch(function(_)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(false)
	end)
end