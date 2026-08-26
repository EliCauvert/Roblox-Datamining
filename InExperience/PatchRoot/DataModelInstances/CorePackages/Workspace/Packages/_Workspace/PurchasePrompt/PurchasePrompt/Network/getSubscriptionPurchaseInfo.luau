local parent = script.Parent.Parent
local promiseModule = require(parent.Promise)
local parseSubscriptionErrorModule = require(parent.Utils.parseSubscriptionError)

return function(p1, p2)
	-- upvalues: promiseModule (ref), parseSubscriptionErrorModule (ref)
	return p1.getSubscriptionPurchaseInfo(p2):catch(function(p3)
		-- upvalues: promiseModule (copy), parseSubscriptionErrorModule (copy)
		return promiseModule.reject(parseSubscriptionErrorModule(p3))
	end)
end