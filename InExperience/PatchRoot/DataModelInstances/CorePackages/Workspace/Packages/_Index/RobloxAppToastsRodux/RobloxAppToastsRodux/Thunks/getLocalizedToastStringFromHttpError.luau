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

return function(p1, p2)
	-- upvalues: t (ref)
	return if p1 == Enum.HttpError.DnsResolve or p1 == Enum.HttpError.ConnectFail or (p1 == Enum.HttpError.NetFail or p1 == Enum.HttpError.SslConnectFail) then "Feature.Toast.NetworkingError.UnableToConnect" elseif p1 == Enum.HttpError.TimedOut then "Feature.Toast.NetworkingError.Timeout" elseif p1 == Enum.HttpError.Aborted then nil elseif p1 == Enum.HttpError.OK and p2 ~= nil and t[p2] ~= nil then t[p2] else "Feature.Toast.NetworkingError.SomethingIsWrong"
end