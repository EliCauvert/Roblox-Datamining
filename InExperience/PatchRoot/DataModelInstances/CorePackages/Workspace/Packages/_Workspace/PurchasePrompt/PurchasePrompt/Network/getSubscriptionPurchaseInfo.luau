local parent = script.Parent.Parent
local promiseModule = require(parent.Promise)
local parseSubscriptionErrorModule = require(parent.Utils.parseSubscriptionError)

return function(p0, p1)
	-- upvalues: promiseModule (ref), parseSubscriptionErrorModule (ref)
	return p0.getSubscriptionPurchaseInfo(p1):catch(function(p2)
		-- upvalues: promiseModule (copy), parseSubscriptionErrorModule (copy)
		return promiseModule.reject(parseSubscriptionErrorModule(p2))
	end)
end