local parent = script.Parent.Parent
local promiseModule = require(parent.Promise)
local parseSubscriptionErrorModule = require(parent.Utils.parseSubscriptionError)

return function(p0, p1, p2) --[[ line: 5 | named "performSubscriptionPurchase" ]]
	-- upvalues: promiseModule (ref), parseSubscriptionErrorModule (ref)
	return p0.performSubscriptionPurchase(p1, p2):catch(function(p3) --[[ line: 6 ]]
		-- upvalues: promiseModule (copy), parseSubscriptionErrorModule (copy)
		return promiseModule.reject(parseSubscriptionErrorModule(p3))
	end)
end