local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local httpRequest = require(parent.LuaSocialLibrariesDeps).httpRequest
local RODUX_KEY = require(profilePlatform.Common.Constants).RODUX_KEY
local var1 = require(parent.Lumberyak).Logger.new(nil, RODUX_KEY):new(RODUX_KEY .. " Networking")

return httpRequest.config({
	requestFunction = function(p0, p1, p2) --[[ line: 13 ]]
		-- upvalues: var1 (ref), httpRequest (ref)
		var1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
		
		return httpRequest.requestFunctions.RequestInternal(p0, p1, p2)
	end,
	postRequestFunction = function(p3, p4) --[[ line: 17 ]]
		-- upvalues: var1 (ref)
		var1:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p4.requestMethod, p4.url, p3.StatusCode, p3.Body))
	end,
	maxRetryCount = game:DefineFastInt("ProfilePlatformHttpRetryCount", 3)
})