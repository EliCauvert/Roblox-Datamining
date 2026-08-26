local parent = script.Parent.Parent
local promiseModule = require(parent.Promise)
local parseSubscriptionErrorModule = require(parent.Utils.parseSubscriptionError)

return function(p1, p2, p3)
	-- upvalues: promiseModule (ref), parseSubscriptionErrorModule (ref)
	return p1.performSubscriptionPurchase(p2, p3):catch(function(p4)
		-- upvalues: promiseModule (copy), parseSubscriptionErrorModule (copy)
		return promiseModule.reject(parseSubscriptionErrorModule(p4))
	end)
end