local parent = script:FindFirstAncestor("AppChat").Parent
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local httpRequestModule = require(parent.HttpRequest)
local appChat = require(parent.Loggers).Logger:new("AppChat")

return require(parent.RoduxNetworking).config({
	keyPath = "ChatAppReducer.networkStatus",
	killRequestWithFilteredIds = true,
	networkImpl = httpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: appChat (ref), httpRequestModule (ref)
			appChat:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: appChat (ref)
			appChat:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", p2.requestMethod, p2.url, p1.StatusCode))
		end,
		maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("AppChatRoduxNetworkingHttpRetryCount", 4) else nil
	})
})