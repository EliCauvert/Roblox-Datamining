local Parent = script:FindFirstAncestor("AuthCommon").Parent
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local PromiseModule = require(Parent.Promise)

return function(Callback, Code, PrivateKey) --[[ Line: 8 ]]
	-- upvalues: UrlBuilder (copy), HttpService (copy), PromiseModule (copy)
	return if type(Code) == "string" and type(PrivateKey) == "string" then Callback(UrlBuilder.fromString("apis:auth-token-service/v1/login/status")(), "POST", {
		postBody = HttpService:JSONEncode({ code = Code, privateKey = PrivateKey })
	}) elseif type(Code) == "string" then PromiseModule.reject("invalid private key") else PromiseModule.reject("invalid login code")
end