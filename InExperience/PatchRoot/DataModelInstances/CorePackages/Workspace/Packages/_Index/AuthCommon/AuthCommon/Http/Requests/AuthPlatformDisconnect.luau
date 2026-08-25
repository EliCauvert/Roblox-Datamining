local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local _ = require(parent.Http)
local getSingleSignOnUrlsModule = require(authCommon.Utils.getSingleSignOnUrls)
local consoleAuthRequestWrapper = require(parent.Http).Utils.ConsoleAuthRequestWrapper
local promiseModule = require(parent.Promise)

return function(p0)
	-- upvalues: getSingleSignOnUrlsModule (ref), consoleAuthRequestWrapper (ref), promiseModule (ref)
	local disconnect = getSingleSignOnUrlsModule().disconnect
	
	return if disconnect then consoleAuthRequestWrapper(p0, disconnect(), "POST", { postBody = "", maxRetryCount = 0 }) else promiseModule.reject({})
end