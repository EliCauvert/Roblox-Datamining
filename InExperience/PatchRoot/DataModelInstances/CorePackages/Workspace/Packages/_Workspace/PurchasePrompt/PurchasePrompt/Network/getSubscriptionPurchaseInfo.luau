local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Promise)
local ParseSubscriptionErrorModule = require(Parent.Utils.parseSubscriptionError)

return function(p1, p2) --[[ Line: 5 | Named "getSubscriptionPurchaseInfo" ]]
	-- upvalues: PromiseModule (copy), ParseSubscriptionErrorModule (copy)
	return p1.getSubscriptionPurchaseInfo(p2):catch(function(Err) --[[ Line: 6 ]]
		-- upvalues: PromiseModule (upval), ParseSubscriptionErrorModule (upval)
		return PromiseModule.reject(ParseSubscriptionErrorModule(Err))
	end)
end