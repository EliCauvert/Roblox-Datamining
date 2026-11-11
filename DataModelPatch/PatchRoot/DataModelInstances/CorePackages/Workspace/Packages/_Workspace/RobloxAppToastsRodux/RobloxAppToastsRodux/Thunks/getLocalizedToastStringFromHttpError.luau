local StatusCodes = require(script:FindFirstAncestor("RobloxAppToastsRodux").Parent.Http).StatusCodes
local config = {
	[StatusCodes.BAD_REQUEST] = "Feature.Toast.NetworkingError.SomethingIsWrong",
	[StatusCodes.UNAUTHORIZED] = "Feature.Toast.NetworkingError.Unauthorized",
	[StatusCodes.FORBIDDEN] = "Feature.Toast.NetworkingError.Forbidden",
	[StatusCodes.NOT_FOUND] = "Feature.Toast.NetworkingError.NotFound",
	[StatusCodes.REQUEST_TIMEOUT] = "Feature.Toast.NetworkingError.Timeout",
	[StatusCodes.TOO_MANY_REQUESTS] = "Feature.Toast.NetworkingError.TooManyRequests",
	[StatusCodes.INTERNAL_SERVER_ERROR] = "Feature.Toast.NetworkingError.SomethingIsWrong",
	[StatusCodes.NOT_IMPLEMENTED] = "Feature.Toast.NetworkingError.SomethingIsWrong",
	[StatusCodes.BAD_GATEWAY] = "Feature.Toast.NetworkingError.SomethingIsWrong",
	[StatusCodes.SERVICE_UNAVAILABLE] = "Feature.Toast.NetworkingError.ServiceUnavailable",
	[StatusCodes.GATEWAY_TIMEOUT] = "Feature.Toast.NetworkingError.Timeout"
}

return function(HttpError, p1)
	-- upvalues: config (copy)
	return if HttpError == Enum.HttpError.DnsResolve or HttpError == Enum.HttpError.ConnectFail or HttpError == Enum.HttpError.NetFail or HttpError == Enum.HttpError.SslConnectFail then "Feature.Toast.NetworkingError.UnableToConnect" elseif HttpError == Enum.HttpError.TimedOut then "Feature.Toast.NetworkingError.Timeout" elseif HttpError == Enum.HttpError.Aborted then nil elseif HttpError == Enum.HttpError.OK and p1 ~= nil and config[p1] ~= nil then config[p1] else "Feature.Toast.NetworkingError.SomethingIsWrong"
end