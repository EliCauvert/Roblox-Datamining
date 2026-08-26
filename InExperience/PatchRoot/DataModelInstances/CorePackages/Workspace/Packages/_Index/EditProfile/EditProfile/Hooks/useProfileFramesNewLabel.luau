local editProfile = script:FindFirstAncestor("EditProfile")
local reactModule = require(editProfile.Parent.React)
local getAppStorageServiceModule = require(editProfile.Common.getAppStorageService)

return function()
	-- upvalues: getAppStorageServiceModule (ref), reactModule (ref)
	local var1 = getAppStorageServiceModule()
	local var2, var3 = reactModule.useState(function()
		-- upvalues: var1 (ref)
		local ok, status = pcall(function()
			-- upvalues: var1 (copy)
			return var1:GetItem("ProfileFramesNewLabelSeen")
		end)
		
		return ok and status ~= "true"
	end)
	
	return var2, reactModule.useCallback(function()
		-- upvalues: var3 (ref), var1 (ref)
		var3(false)
		pcall(function()
			-- upvalues: var1 (copy)
			var1:SetItem("ProfileFramesNewLabelSeen", "true")
			var1:Flush()
		end)
	end, { var1 })
end