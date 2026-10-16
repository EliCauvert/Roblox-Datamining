local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local HttpRequest = require(Parent.LuaSocialLibrariesDeps).httpRequest
local RODUXKEY = require(ProfilePlatform.Common.Constants).RODUX_KEY
local NewResult = require(Parent.Lumberyak).Logger.new(nil, RODUXKEY):new(RODUXKEY .. " Networking")

return (HttpRequest.config({
	requestFunction = function(p1, p2, p3) --[[ Line: 13 ]]
		-- upvalues: NewResult (copy), HttpRequest (copy)
		NewResult:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
		
		return HttpRequest.requestFunctions.RequestInternal(p1, p2, p3)
	end,
	postRequestFunction = function(p1, p2) --[[ Line: 17 ]]
		-- upvalues: NewResult (copy)
		NewResult:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
	end,
	maxRetryCount = game:DefineFastInt("ProfilePlatformHttpRetryCount", 3)
}))