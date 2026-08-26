local getCanSendAndCanCustomizeInvites = require(game:GetService("CorePackages").Workspace.Packages.GameInvite).GetCanSendAndCanCustomizeInvites
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpRequestModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)

return function(p1, p2)
	-- upvalues: httpRequestModule (ref), httpRbxApiService (ref), getCanSendAndCanCustomizeInvites (ref)
	local var1, var2 = getCanSendAndCanCustomizeInvites(httpRequestModule(httpRbxApiService), p1, p2):await()
	
	if var1 and var2 and var2.responseBody then
		return var2.responseBody.canPrompt, var2.responseBody.canCustomize
	end
	return false, false
end