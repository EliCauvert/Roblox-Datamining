local url = require(game:GetService("CorePackages").Workspace.Packages.Http).Url
local var0 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)(game:GetService("HttpRbxApiService"))

return function(p0)
	-- upvalues: url (ref), var0 (ref)
	return var0(string.format("%s/v3/outfits/%s/details", url.AVATAR_URL, tostring(p0)), "GET"):andThen(function(p1)
		return p1.responseBody.name
	end)
end