local GetCanSendAndCanCustomizeInvitesFunction = require(game:GetService("CorePackages").Workspace.Packages.GameInvite).GetCanSendAndCanCustomizeInvites
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpRequestModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)

return function(p1, p2)
	-- upvalues: HttpRequestModule (copy), HttpRbxApiService (copy), GetCanSendAndCanCustomizeInvitesFunction (copy)
	local v1, v2 = GetCanSendAndCanCustomizeInvitesFunction(HttpRequestModule(HttpRbxApiService), p1, p2):await()
	
	if v1 and v2 and v2.responseBody then
		return v2.responseBody.canPrompt, v2.responseBody.canCustomize
	else
		return false, false
	end
end