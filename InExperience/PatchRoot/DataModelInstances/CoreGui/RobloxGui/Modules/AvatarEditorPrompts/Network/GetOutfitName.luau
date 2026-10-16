local Url = require(game:GetService("CorePackages").Workspace.Packages.Http).Url
local Callback = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)((game:GetService("HttpRbxApiService")))

return function(p1) --[[ Line: 13 ]]
	-- upvalues: Url (copy), Callback (copy)
	return Callback(string.format("%s/v3/outfits/%s/details", Url.AVATAR_URL, (tostring(p1))), "GET"):andThen(function(Result) --[[ Line: 16 ]]
		return Result.responseBody.name
	end)
end