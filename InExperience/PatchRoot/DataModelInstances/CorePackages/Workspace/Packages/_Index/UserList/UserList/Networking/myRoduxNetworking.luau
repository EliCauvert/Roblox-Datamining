local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local httpRequestModule = require(parent.HttpRequest)
local roduxNetworkingModule = require(parent.RoduxNetworking)
local RODUX_KEY = require(userList.Common.Constants).RODUX_KEY
local var3 = require(parent.Lumberyak).Logger.new(nil, RODUX_KEY):new(RODUX_KEY .. " Networking")

return roduxNetworkingModule.config({
	keyPath = RODUX_KEY .. ".NetworkStatus",
	networkImpl = httpRequestModule.config({
		requestFunction = function(p0, p1, p2) --[[ line: 14 ]]
			-- upvalues: var3 (ref), httpRequestModule (ref)
			var3:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4) --[[ line: 18 ]]
			-- upvalues: var3 (ref)
			var3:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", p4.requestMethod, p4.url, p3.StatusCode))
		end
	})
})