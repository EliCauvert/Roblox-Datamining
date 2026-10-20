local Parent = script:FindFirstAncestor("AppChat").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local Logger = require(Parent.Loggers).Logger
local AppChat = Logger.new(Logger, "AppChat")

return require(Parent.RoduxNetworking).config({
	keyPath = "ChatAppReducer.networkStatus",
	killRequestWithFilteredIds = true,
	networkImpl = HttpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: AppChat (copy), HttpRequestModule (copy)
			AppChat:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: AppChat (copy)
			AppChat:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", p2.requestMethod, p2.url, p1.StatusCode))
		end,
		maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("AppChatRoduxNetworkingHttpRetryCount", 4) else nil
	})
})