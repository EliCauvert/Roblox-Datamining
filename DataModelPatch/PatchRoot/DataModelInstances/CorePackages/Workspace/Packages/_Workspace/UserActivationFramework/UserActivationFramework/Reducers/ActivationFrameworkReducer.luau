local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local CryoModule = require(UserActivationFramework.Parent.Cryo)
local ActivationFrameworkContextActionModule = require(UserActivationFramework.Enums.ActivationFrameworkContextAction)
local _ = require(UserActivationFramework.Types)

return function(Tbl, p1)
	-- upvalues: ActivationFrameworkContextActionModule (copy), CryoModule (copy)
	local Copy = table.clone(Tbl)
	
	if p1.type == ActivationFrameworkContextActionModule.SetActivationFrameworkState then
		Copy = CryoModule.Dictionary.join(Copy, p1.data)
		
		return Copy
	end
	if p1.type == ActivationFrameworkContextActionModule.SetSessionId then
		Copy.sessionId = p1.data.sessionId
		
		return Copy
	end
	if p1.type == ActivationFrameworkContextActionModule.SetAvailableActions then
		Copy.availableActions = p1.data.availableActions
		
		return Copy
	end
	if p1.type == ActivationFrameworkContextActionModule.SetOnClose then
		Copy.onClose = p1.data.onClose
		
		return Copy
	end
	if p1.type == ActivationFrameworkContextActionModule.SetIsLoading then
		Copy.isLoading = p1.data.isLoading
		
		return Copy
	end
	if p1.type == ActivationFrameworkContextActionModule.SetMergePayload then
		Copy.payloadTable = CryoModule.Dictionary.join(Copy.payloadTable, p1.data.payloadTable)
		
		return Copy
	end
	if p1.type == ActivationFrameworkContextActionModule.ClearPayload then
		Copy.payloadTable = {}
	end
	return Copy
end