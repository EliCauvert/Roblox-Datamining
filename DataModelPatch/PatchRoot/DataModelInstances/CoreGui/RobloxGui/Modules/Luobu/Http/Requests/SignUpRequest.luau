local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.Http)
local Url = require(CorePackages.Workspace.Packages.Http).Url

return function(Callback, p1, Input)
	-- upvalues: Url (copy), HttpService (copy)
	return Callback(string.format("%s/v1/%s/signupwithoutpassword?apiKey=%s", Url.AUTH_URL, p1, "d631f3d9-fce0-4711-8cf4-6f9a9756638b"), "POST", { postBody = HttpService:JSONEncode(Input) })
end