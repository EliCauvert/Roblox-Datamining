local PromiseModule = require(script.Parent.Parent.Promise)

return function(p1) --[[ Line: 4 | Named "getPremiumUpsellPrecheck" ]]
	-- upvalues: PromiseModule (copy)
	return p1.getPremiumUpsellPrecheck():andThen(function(_) --[[ Line: 7 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(true)
	end):catch(function(_) --[[ Line: 10 ]]
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(false)
	end)
end