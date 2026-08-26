local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local httpRequestModule = require(parent.HttpRequest)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local RODUX_KEY = require(userList.Common.Constants).RODUX_KEY
local var1 = require(parent.Lumberyak).Logger.new(nil, RODUX_KEY):new(RODUX_KEY .. " Networking")

return roduxNetworkingModule.config({
	keyPath = RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: var1 (ref), httpRequestModule (ref)
			var1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: var1 (ref)
			var1:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", p2.requestMethod, p2.url, p1.StatusCode))
		end
	})
})