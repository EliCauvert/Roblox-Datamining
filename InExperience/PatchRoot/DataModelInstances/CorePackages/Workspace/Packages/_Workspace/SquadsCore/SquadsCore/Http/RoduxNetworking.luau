local parent = script:FindFirstAncestor("SquadsCore").Parent
local httpRequestModule = require(parent.HttpRequest)
local squadsCore = require(parent.Loggers).Logger:new("SquadsCore")

return require(parent.RoduxNetworking).config({
	keyPath = "Squad.NetworkStatus",
	networkImpl = httpRequestModule.config({
		requestFunction = function(p0, p1, p2) --[[ line: 15 ]]
			-- upvalues: squadsCore (ref), httpRequestModule (ref)
			squadsCore:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4) --[[ line: 19 ]]
			-- upvalues: squadsCore (ref)
			squadsCore:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p4.requestMethod, p4.url, p3.StatusCode, p3.Body))
		end,
		maxRetryCount = game:DefineFastInt("SquadHttpRetryCount", 3)
	})
})