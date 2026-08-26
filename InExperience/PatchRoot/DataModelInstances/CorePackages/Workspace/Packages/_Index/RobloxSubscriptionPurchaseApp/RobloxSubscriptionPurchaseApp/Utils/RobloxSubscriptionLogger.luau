local logger = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Loggers).Logger
local httpService = game:GetService("HttpService")

return {
	debug = function(p1)
		-- upvalues: logger (ref), httpService (ref)
		logger:debug(httpService:JSONEncode(p1))
	end,
	info = function(p1)
		-- upvalues: logger (ref), httpService (ref)
		logger:info(httpService:JSONEncode(p1))
	end,
	warn = function(p1)
		-- upvalues: logger (ref), httpService (ref)
		logger:warn(httpService:JSONEncode(p1))
	end,
	error = function(p1)
		-- upvalues: logger (ref), httpService (ref)
		logger:error(httpService:JSONEncode(p1))
	end
}