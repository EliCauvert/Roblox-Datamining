local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Promise)
local ParseSubscriptionErrorModule = require(Parent.Utils.parseSubscriptionError)

return function(p1, p2, p3)
	-- upvalues: PromiseModule (copy), ParseSubscriptionErrorModule (copy)
	return p1.performSubscriptionPurchase(p2, p3):catch(function(Err)
		-- upvalues: PromiseModule (upval), ParseSubscriptionErrorModule (upval)
		return PromiseModule.reject(ParseSubscriptionErrorModule(Err))
	end)
end