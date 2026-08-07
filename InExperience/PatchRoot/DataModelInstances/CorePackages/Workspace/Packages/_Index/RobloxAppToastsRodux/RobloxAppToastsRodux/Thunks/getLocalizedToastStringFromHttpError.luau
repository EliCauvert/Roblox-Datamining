local statusCodes = require(script:FindFirstAncestor("RobloxAppToastsRodux").Parent.Http).StatusCodes
local t = {
	[statusCodes.BAD_REQUEST] = "Feature.Toast.NetworkingError.SomethingIsWrong",
	[statusCodes.UNAUTHORIZED] = "Feature.Toast.NetworkingError.Unauthorized",
	[statusCodes.FORBIDDEN] = "Feature.Toast.NetworkingError.Forbidden",
	[statusCodes.NOT_FOUND] = "Feature.Toast.NetworkingError.NotFound",
	[statusCodes.REQUEST_TIMEOUT] = "Feature.Toast.NetworkingError.Timeout",
	[statusCodes.TOO_MANY_REQUESTS] = "Feature.Toast.NetworkingError.TooManyRequests",
	[statusCodes.INTERNAL_SERVER_ERROR] = "Feature.Toast.NetworkingError.SomethingIsWrong",
	[statusCodes.NOT_IMPLEMENTED] = "Feature.Toast.NetworkingError.SomethingIsWrong",
	[statusCodes.BAD_GATEWAY] = "Feature.Toast.NetworkingError.SomethingIsWrong",
	[statusCodes.SERVICE_UNAVAILABLE] = "Feature.Toast.NetworkingError.ServiceUnavailable",
	[statusCodes.GATEWAY_TIMEOUT] = "Feature.Toast.NetworkingError.Timeout"
}

return function(p0, p1) --[[ line: 30 | named "getLocalizedToastStringFromHttpError" ]]
	-- upvalues: t (ref)
	return if p0 == Enum.HttpError.DnsResolve or p0 == Enum.HttpError.ConnectFail or (p0 == Enum.HttpError.NetFail or p0 == Enum.HttpError.SslConnectFail) then "Feature.Toast.NetworkingError.UnableToConnect" elseif p0 == Enum.HttpError.TimedOut then "Feature.Toast.NetworkingError.Timeout" elseif p0 == Enum.HttpError.Aborted then nil elseif p0 == Enum.HttpError.OK and p1 ~= nil and t[p1] ~= nil then t[p1] else "Feature.Toast.NetworkingError.SomethingIsWrong"
end