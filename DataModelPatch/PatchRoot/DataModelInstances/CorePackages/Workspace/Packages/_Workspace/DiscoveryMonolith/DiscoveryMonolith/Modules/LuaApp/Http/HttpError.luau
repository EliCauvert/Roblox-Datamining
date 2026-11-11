local HttpErrorModule = {}
HttpErrorModule.__index = HttpErrorModule
HttpErrorModule.Kind = {
	Unknown = "Unknown",
	RequestFailure = "Request Failed",
	RequireExternalRetry = "Require External Retry",
	LuaTimeout = "Lua Timeout",
	InvalidJson = "Invalid Json"
}

function HttpErrorModule.new(TargetUrl, Kind, Message, StatusCode)
	-- upvalues: HttpErrorModule (copy)
	assert(type(TargetUrl) == "string", "Expected targetUrl to be a string")
	assert(type(Kind) == "string", "Expected errKind to be a string")
	assert(type(Message) == "string", "Expected errMessage to be a string")
	local config = { targetUrl = TargetUrl, kind = Kind, message = Message }
	
	if StatusCode then
		assert(type(StatusCode) == "number", "Expected statusCode to be a number")
		config.StatusCode = StatusCode
	end
	setmetatable(config, HttpErrorModule)
	
	return config
end

function HttpErrorModule:__tostring(): string
	local Joined = table.concat({
		"HttpError :",
		string.format("\tTarget Url - %s", self.targetUrl),
		string.format("\tKind - %s", self.kind),
		string.format("\tMessage - %s", self.message)
	}, "\n")
	
	if self.StatusCode then
		Joined = table.concat({
			Joined,
			string.format("\tStatus Code - %s", self.StatusCode)
		}, "\n")
	end
	return Joined
end

return HttpErrorModule