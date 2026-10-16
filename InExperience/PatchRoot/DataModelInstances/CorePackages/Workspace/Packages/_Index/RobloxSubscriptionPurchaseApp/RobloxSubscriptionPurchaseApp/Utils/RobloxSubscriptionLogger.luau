local Logger = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Loggers).Logger
local HttpService = game:GetService("HttpService")

return {
	debug = function(Input) --[[ Line: 8 ]]
		-- upvalues: Logger (copy), HttpService (copy)
		Logger:debug(HttpService:JSONEncode(Input))
	end,
	info = function(Input) --[[ Line: 11 ]]
		-- upvalues: Logger (copy), HttpService (copy)
		Logger:info(HttpService:JSONEncode(Input))
	end,
	warn = function(Input) --[[ Line: 14 ]]
		-- upvalues: Logger (copy), HttpService (copy)
		Logger:warn(HttpService:JSONEncode(Input))
	end,
	error = function(Input) --[[ Line: 17 ]]
		-- upvalues: Logger (copy), HttpService (copy)
		Logger:error(HttpService:JSONEncode(Input))
	end
}