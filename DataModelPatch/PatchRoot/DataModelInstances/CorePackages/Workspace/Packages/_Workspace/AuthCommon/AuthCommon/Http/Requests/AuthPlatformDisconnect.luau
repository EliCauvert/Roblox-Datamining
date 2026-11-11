local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local _ = require(Parent.Http)
local GetSingleSignOnUrlsModule = require(AuthCommon.Utils.getSingleSignOnUrls)
local ConsoleAuthRequestWrapperFunction = require(Parent.Http).Utils.ConsoleAuthRequestWrapper
local PromiseModule = require(Parent.Promise)

return function(p1)
	-- upvalues: GetSingleSignOnUrlsModule (copy), ConsoleAuthRequestWrapperFunction (copy), PromiseModule (copy)
	local DisconnectFunction = GetSingleSignOnUrlsModule().disconnect
	
	return if DisconnectFunction then ConsoleAuthRequestWrapperFunction(p1, DisconnectFunction(), "POST", { postBody = "", maxRetryCount = 0 }) else PromiseModule.reject({})
end