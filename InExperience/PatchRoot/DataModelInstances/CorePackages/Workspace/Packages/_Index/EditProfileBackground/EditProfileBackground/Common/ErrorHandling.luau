local t = {
	BAD_REQUEST = 400,
	UNAUTHORIZED = 401,
	FORBIDDEN = 403,
	NOT_FOUND = 404,
	INTERNAL_SERVER_ERROR = 500,
	BAD_GATEWAY = 502,
	SERVICE_UNAVAILABLE = 503
}
local t_1 = {
	TIMEOUT = "timeout",
	AUTHENTICATION = "authentication",
	PERMISSION = "permission",
	VALIDATION = "validation",
	SERVER_ERROR = "server_error",
	NETWORK = "network",
	UNKNOWN = "unknown"
}
local t_2 = {
	[t_1.TIMEOUT] = "Request timed out. Please try again.",
	[t_1.AUTHENTICATION] = "Authentication failed. Please log in again.",
	[t_1.PERMISSION] = "You don't have permission to update this profile.",
	[t_1.VALIDATION] = "Invalid request. Please check your input.",
	[t_1.SERVER_ERROR] = "Server error. Please try again later.",
	[t_1.NETWORK] = "Network error. Please check your connection and try again.",
	[t_1.UNKNOWN] = "An unexpected error occurred. Please try again."
}
local t_3 = {
	SAVE_BACKGROUND = "Failed to save background",
	LOAD_BACKGROUND = "Failed to load background",
	UPDATE_PROFILE = "Failed to update profile"
}

local function getErrorType(p0) --[[ line: 37 ]]
	-- upvalues: t_1 (ref), t (ref)
	if typeof(p0) == "table" then
		if p0.message and string.find(string.lower(p0.message), "timeout") then
			return t_1.TIMEOUT
		end
		local statusCode = p0.StatusCode or p0.statusCode
		
		if statusCode then
			if statusCode == t.UNAUTHORIZED then
				return t_1.AUTHENTICATION
			elseif statusCode == t.FORBIDDEN then
				return t_1.PERMISSION
			elseif statusCode == t.BAD_REQUEST then
				return t_1.VALIDATION
			elseif t.INTERNAL_SERVER_ERROR <= statusCode then
				return t_1.SERVER_ERROR
			end
		end
	elseif typeof(p0) == "string" then
		return if string.find(string.lower(p0), "timeout") then t_1.TIMEOUT elseif string.find(string.lower(p0), "network") or string.find(string.lower(p0), "connection") then t_1.NETWORK else t_1.UNKNOWN
	end
end

return {
	HttpStatusCode = t,
	ErrorType = t_1,
	ERROR_MESSAGES = t_2,
	DEFAULT_ERROR_MESSAGES = t_3,
	getErrorType = getErrorType,
	getErrorMessage = function(p1, p2) --[[ line: 66 ]]
		-- upvalues: getErrorType (ref), t_2 (ref), t_3 (ref)
		local var6 = t_2[getErrorType(p1)]
		
		return if p2 and t_3[p2] then var6 or t_3[p2] else var6 or t_3.SAVE_BACKGROUND
	end
}