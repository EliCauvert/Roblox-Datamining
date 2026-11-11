local ContactsToast = script:FindFirstAncestor("ContactsToast")
local Parent = ContactsToast.Parent
local LuaSocialLibrariesDepsModule = require(Parent.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local ContactsToastNetworking = require(Parent.Lumberyak).Logger.new(nil, "ContactsToast"):new("ContactsToast Networking")

return (LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = require(ContactsToast.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = HttpRequest.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: ContactsToastNetworking (copy), HttpRequest (copy)
			ContactsToastNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequest.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: ContactsToastNetworking (copy)
			ContactsToastNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p2.requestMethod, p2.url, p1.StatusCode, p1.Body))
		end,
		maxRetryCount = game:DefineFastInt("ContactsToastHttpRetryCount", 3)
	})
}))