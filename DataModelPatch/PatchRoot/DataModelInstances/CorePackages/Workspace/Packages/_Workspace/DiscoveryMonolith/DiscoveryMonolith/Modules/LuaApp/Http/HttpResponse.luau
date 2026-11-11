local HttpResponseModule = {}
HttpResponseModule.__index = HttpResponseModule

function HttpResponseModule.new(RequestUrl, ResponseBody, ResponseTimeMs, ResponseCode)
	-- upvalues: HttpResponseModule (copy)
	assert(type(RequestUrl) == "string", "Expected url to be a string")
	assert(type(ResponseBody) == "string" or type(ResponseBody) == "table", "Expected response to be a string or table")
	assert(type(ResponseTimeMs) == "number", "Expected responseTimeMs to be a number")
	assert(type(ResponseCode) == "number", "Expected statusCode to be a number")
	local config = {
		requestUrl = RequestUrl,
		responseTimeMs = ResponseTimeMs,
		responseCode = ResponseCode,
		responseBody = ResponseBody
	}
	setmetatable(config, HttpResponseModule)
	
	return config
end

function HttpResponseModule:__tostring(): string
	return table.concat({
		"HttpResponse :",
		string.format("\tRequested Url - %s", self.requestUrl),
		string.format("\tCode - %s", (tostring(self.responseCode))),
		string.format("\tBody - %s", (tostring(self.responseBody))),
		string.format("\tTime(ms) - %s", (tostring(self.responseTimeMs)))
	}, "\n")
end

return HttpResponseModule