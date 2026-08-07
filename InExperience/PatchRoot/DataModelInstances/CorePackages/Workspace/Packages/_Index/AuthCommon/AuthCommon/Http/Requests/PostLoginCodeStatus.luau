local parent = script:FindFirstAncestor("AuthCommon").Parent
local httpService = game:GetService("HttpService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local promiseModule = require(parent.Promise)

return function(p0, p1, p2) --[[ line: 8 ]]
	-- upvalues: urlBuilder (ref), httpService (ref), promiseModule (ref)
	return if type(p1) == "string" and type(p2) == "string" then p0(urlBuilder.fromString("apis:auth-token-service/v1/login/status")(), "POST", {
		postBody = httpService:JSONEncode({ code = p1, privateKey = p2 })
	}) elseif type(p1) == "string" then promiseModule.reject("invalid private key") else promiseModule.reject("invalid login code")
end