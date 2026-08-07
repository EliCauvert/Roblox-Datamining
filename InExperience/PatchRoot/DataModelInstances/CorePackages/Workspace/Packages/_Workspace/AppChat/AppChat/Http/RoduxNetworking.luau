local parent = script:FindFirstAncestor("AppChat").Parent
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local httpRequestModule = require(parent.HttpRequest)
local appChat = require(parent.Loggers).Logger:new("AppChat")

return require(parent.RoduxNetworking).config({
	keyPath = "ChatAppReducer.networkStatus",
	killRequestWithFilteredIds = true,
	networkImpl = httpRequestModule.config({
		requestFunction = function(p0, p1, p2) --[[ line: 14 ]]
			-- upvalues: appChat (ref), httpRequestModule (ref)
			appChat:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4) --[[ line: 18 ]]
			-- upvalues: appChat (ref)
			appChat:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", p4.requestMethod, p4.url, p3.StatusCode))
		end,
		maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("AppChatRoduxNetworkingHttpRetryCount", 4) else nil
	})
})