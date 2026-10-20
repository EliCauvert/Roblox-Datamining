local HttpStatusCode = {
	BAD_REQUEST = 400,
	UNAUTHORIZED = 401,
	FORBIDDEN = 403,
	NOT_FOUND = 404,
	INTERNAL_SERVER_ERROR = 500,
	BAD_GATEWAY = 502,
	SERVICE_UNAVAILABLE = 503
}
local ErrorType = {
	TIMEOUT = "timeout",
	AUTHENTICATION = "authentication",
	PERMISSION = "permission",
	VALIDATION = "validation",
	SERVER_ERROR = "server_error",
	NETWORK = "network",
	UNKNOWN = "unknown"
}
local config = {
	[ErrorType.TIMEOUT] = "Request timed out. Please try again.",
	[ErrorType.AUTHENTICATION] = "Authentication failed. Please log in again.",
	[ErrorType.PERMISSION] = "You don't have permission to update this profile.",
	[ErrorType.VALIDATION] = "Invalid request. Please check your input.",
	[ErrorType.SERVER_ERROR] = "Server error. Please try again later.",
	[ErrorType.NETWORK] = "Network error. Please check your connection and try again.",
	[ErrorType.UNKNOWN] = "An unexpected error occurred. Please try again."
}
local config1 = {
	SAVE_BACKGROUND = "Failed to save background",
	LOAD_BACKGROUND = "Failed to load background",
	UPDATE_PROFILE = "Failed to update profile"
}

local function getErrorType(Text: string)
	-- upvalues: ErrorType (copy), HttpStatusCode (copy)
	if typeof(Text) == "table" then
		if Text.message and string.find(string.lower(Text.message), "timeout") then
			return ErrorType.TIMEOUT
		end
		local StatusCode = Text.StatusCode or Text.statusCode
		
		if StatusCode then
			if StatusCode == HttpStatusCode.UNAUTHORIZED then
				return ErrorType.AUTHENTICATION
			elseif StatusCode == HttpStatusCode.FORBIDDEN then
				return ErrorType.PERMISSION
			elseif StatusCode == HttpStatusCode.BAD_REQUEST then
				return ErrorType.VALIDATION
			elseif HttpStatusCode.INTERNAL_SERVER_ERROR <= StatusCode then
				return ErrorType.SERVER_ERROR
			end
		end
	elseif typeof(Text) == "string" then
		if string.find(string.lower(Text), "timeout") then
			return ErrorType.TIMEOUT
		elseif string.find(string.lower(Text), "network") or string.find(string.lower(Text), "connection") then
			return ErrorType.NETWORK
		end
	end
	return ErrorType.UNKNOWN
end

return {
	HttpStatusCode = HttpStatusCode,
	ErrorType = ErrorType,
	ERROR_MESSAGES = config,
	DEFAULT_ERROR_MESSAGES = config1,
	getErrorType = getErrorType,
	getErrorMessage = function(p1, p2)
		-- upvalues: getErrorType (copy), config (copy), config1 (copy)
		local Entry = config[getErrorType(p1)]
		
		return if p2 and config1[p2] then Entry or config1[p2] else Entry or config1.SAVE_BACKGROUND
	end
}