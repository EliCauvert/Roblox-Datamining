local _ = game:GetService("HttpService")
local Url = require(game:GetService("CorePackages").Workspace.Packages.Http).Url

return function(Callback, p1)
	-- upvalues: Url (copy)
	return Callback(string.format("%s/v1/%s/metadata?appType=PlayerApplication", Url.AUTH_URL, p1), "GET", { headers = { Referer = "https://roblox.cn/" } })
end