local Parent = script:FindFirstAncestor("SquadsCore").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local Logger = require(Parent.Loggers).Logger
local SquadsCore = Logger.new(Logger, "SquadsCore")

return require(Parent.RoduxNetworking).config({
	keyPath = "Squad.NetworkStatus",
	networkImpl = HttpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 15 ]]
			-- upvalues: SquadsCore (copy), HttpRequestModule (copy)
			SquadsCore:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2) --[[ Line: 19 ]]
			-- upvalues: SquadsCore (copy)
			SquadsCore:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("SquadHttpRetryCount", 3)
	})
})