local logger = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Loggers).Logger
local httpService = game:GetService("HttpService")

return {
	debug = function(p0) --[[ line: 8 ]]
		-- upvalues: logger (ref), httpService (ref)
		logger:debug(httpService:JSONEncode(p0))
	end,
	info = function(p1) --[[ line: 11 ]]
		-- upvalues: logger (ref), httpService (ref)
		logger:info(httpService:JSONEncode(p1))
	end,
	warn = function(p2) --[[ line: 14 ]]
		-- upvalues: logger (ref), httpService (ref)
		logger:warn(httpService:JSONEncode(p2))
	end,
	error = function(p3) --[[ line: 17 ]]
		-- upvalues: logger (ref), httpService (ref)
		logger:error(httpService:JSONEncode(p3))
	end
}