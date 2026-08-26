local parent = script:FindFirstAncestor("AuthCommon").Parent
local httpService = game:GetService("HttpService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local promiseModule = require(parent.Promise)

return function(p1, p2, p3)
	-- upvalues: urlBuilder (ref), httpService (ref), promiseModule (ref)
	return if type(p2) == "string" and type(p3) == "string" then p1(urlBuilder.fromString("apis:auth-token-service/v1/login/status")(), "POST", {
		postBody = httpService:JSONEncode({ code = p2, privateKey = p3 })
	}) elseif type(p2) == "string" then promiseModule.reject("invalid private key") else promiseModule.reject("invalid login code")
end