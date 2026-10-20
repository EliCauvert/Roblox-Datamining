local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local HttpRequestModule = require(Parent.HttpRequest)
local RODUXKEY = require(UserList.Common.Constants).RODUX_KEY
local NewResult = require(Parent.Lumberyak).Logger.new(nil, RODUXKEY):new(RODUXKEY .. " Networking")

return (require(Parent.RoduxNetworking).config({
	keyPath = RODUXKEY .. ".NetworkStatus",
	networkImpl = HttpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: NewResult (copy), HttpRequestModule (copy)
			NewResult:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: NewResult (copy)
			NewResult:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s ]", p2.requestMethod, p2.url, p1.StatusCode))
		end
	})
}))