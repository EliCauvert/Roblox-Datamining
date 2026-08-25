local getCanSendAndCanCustomizeInvites = require(game:GetService("CorePackages").Workspace.Packages.GameInvite).GetCanSendAndCanCustomizeInvites
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpRequestModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Common.httpRequest)

return function(p0, p1)
	-- upvalues: httpRequestModule (ref), httpRbxApiService (ref), getCanSendAndCanCustomizeInvites (ref)
	local var2, var3 = getCanSendAndCanCustomizeInvites(httpRequestModule(httpRbxApiService), p0, p1):await()
	
	if var2 and var3 and var3.responseBody then
		return var3.responseBody.canPrompt, var3.responseBody.canCustomize
	end
	return false, false
end