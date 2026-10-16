local RunService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")
game:DefineFastFlag("IXPServiceWrapperWaitRefactor", false)

local function _() --[[ Line: 17 ]]
	return game:GetFastFlag("IXPServiceWrapperWaitRefactor")
end

return {
	InitializeAsync = function(p1, UserId, UserLayers) --[[ Line: 35 ]]
		-- upvalues: RunService (copy), IXPService (copy)
		local Success, Result = pcall(function() --[[ Line: 36 ]]
			-- upvalues: RunService (upval), IXPService (upval), UserLayers (copy), UserId (copy), p1 (copy)
			if RunService:IsStudio() then
				IXPService:ClearUserLayers()
			end
			IXPService:RegisterUserLayers(UserLayers)
			IXPService:InitializeUserLayers(UserId)
			
			if game:GetFastFlag("IXPServiceWrapperWaitRefactor") then
				return p1:WaitForInitialization()
			end
			local UserLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
			while UserLayerLoadingStatus == Enum.IXPLoadingStatus.None or UserLayerLoadingStatus == Enum.IXPLoadingStatus.Pending do
				IXPService.OnUserLayerLoadingStatusChanged:Wait()
				UserLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
			end
			return UserLayerLoadingStatus
		end)
		
		return Success, Result
	end,
	WaitForInitialization = function(_) --[[ Line: 64 ]]
		-- upvalues: IXPService (copy)
		local UserLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		while UserLayerLoadingStatus == Enum.IXPLoadingStatus.None or UserLayerLoadingStatus == Enum.IXPLoadingStatus.Pending do
			IXPService.OnUserLayerLoadingStatusChanged:Wait()
			UserLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		end
		return UserLayerLoadingStatus
	end,
	GetLayerData = function(_, LayerName) --[[ Line: 82 ]]
		-- upvalues: IXPService (copy)
		local Success, Result = pcall(function() --[[ Line: 83 ]]
			-- upvalues: IXPService (upval), LayerName (copy)
			return IXPService:GetUserLayerVariables(LayerName)
		end)
		
		return Success and Result or nil
	end,
	LogUserLayerExposure = function(_, LayerName) --[[ Line: 95 ]]
		-- upvalues: IXPService (copy)
		pcall(function() --[[ Line: 96 ]]
			-- upvalues: IXPService (upval), LayerName (copy)
			IXPService:LogUserLayerExposure(LayerName)
		end)
	end,
	LogBrowserTrackerLayerExposure = function(_, LayerName) --[[ Line: 106 ]]
		-- upvalues: IXPService (copy)
		pcall(function() --[[ Line: 107 ]]
			-- upvalues: IXPService (upval), LayerName (copy)
			IXPService:LogBrowserTrackerLayerExposure(LayerName)
		end)
	end
}