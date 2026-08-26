local parent = script:FindFirstAncestor("SquadsCore").Parent
local httpRequestModule = require(parent.HttpRequest)
local squadsCore = require(parent.Loggers).Logger:new("SquadsCore")

return require(parent.RoduxNetworking).config({
	keyPath = "Squad.NetworkStatus",
	networkImpl = httpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: squadsCore (ref), httpRequestModule (ref)
			squadsCore:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: squadsCore (ref)
			squadsCore:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("SquadHttpRetryCount", 3)
	})
})