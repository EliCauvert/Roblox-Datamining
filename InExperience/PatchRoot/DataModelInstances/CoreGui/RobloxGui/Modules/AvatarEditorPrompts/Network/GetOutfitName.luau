local url = require(game:GetService("CorePackages").Workspace.Packages.Http).Url
local var1 = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)(game:GetService("HttpRbxApiService"))

return function(p1)
	-- upvalues: url (ref), var1 (ref)
	return var1(string.format("%s/v3/outfits/%s/details", url.AVATAR_URL, tostring(p1)), "GET"):andThen(function(p2)
		return p2.responseBody.name
	end)
end