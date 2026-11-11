local Logger = require(script:FindFirstAncestor("RobloxSubscriptionPurchaseApp").Parent.Loggers).Logger
local HttpService = game:GetService("HttpService")

return {
	debug = function(Input)
		-- upvalues: Logger (copy), HttpService (copy)
		Logger:debug(HttpService:JSONEncode(Input))
	end,
	info = function(Input)
		-- upvalues: Logger (copy), HttpService (copy)
		Logger:info(HttpService:JSONEncode(Input))
	end,
	warn = function(Input)
		-- upvalues: Logger (copy), HttpService (copy)
		Logger:warn(HttpService:JSONEncode(Input))
	end,
	error = function(Input)
		-- upvalues: Logger (copy), HttpService (copy)
		Logger:error(HttpService:JSONEncode(Input))
	end
}