local EditProfile = script:FindFirstAncestor("EditProfile")
local ReactModule = require(EditProfile.Parent.React)
local GetAppStorageServiceModule = require(EditProfile.Common.getAppStorageService)

return function()
	-- upvalues: GetAppStorageServiceModule (copy), ReactModule (copy)
	local AppStorageServiceModule = GetAppStorageServiceModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean
		-- upvalues: AppStorageServiceModule (copy)
		local Success, Result = pcall(function()
			-- upvalues: AppStorageServiceModule (upval)
			return AppStorageServiceModule:GetItem("ProfileFramesNewLabelSeen")
		end)
		
		return Success and Result ~= "true"
	end)
	
	return UseStateResult, (ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), AppStorageServiceModule (copy)
		UseStateResult2(false)
		pcall(function()
			-- upvalues: AppStorageServiceModule (upval)
			AppStorageServiceModule:SetItem("ProfileFramesNewLabelSeen", "true")
			AppStorageServiceModule:Flush()
		end)
	end, { AppStorageServiceModule }))
end