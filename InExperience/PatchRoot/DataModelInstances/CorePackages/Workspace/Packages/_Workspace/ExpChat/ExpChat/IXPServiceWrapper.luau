local RunService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")
game:DefineFastFlag("IXPServiceWrapperWaitRefactor", false)

local function _()
	return game:GetFastFlag("IXPServiceWrapperWaitRefactor")
end

return {
	InitializeAsync = function(p1, UserId, UserLayers)
		-- upvalues: RunService (copy), IXPService (copy)
		local Success, Result = pcall(function()
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
	WaitForInitialization = function(_)
		-- upvalues: IXPService (copy)
		local UserLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		while UserLayerLoadingStatus == Enum.IXPLoadingStatus.None or UserLayerLoadingStatus == Enum.IXPLoadingStatus.Pending do
			IXPService.OnUserLayerLoadingStatusChanged:Wait()
			UserLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		end
		return UserLayerLoadingStatus
	end,
	GetLayerData = function(_, LayerName)
		-- upvalues: IXPService (copy)
		local Success, Result = pcall(function()
			-- upvalues: IXPService (upval), LayerName (copy)
			return IXPService:GetUserLayerVariables(LayerName)
		end)
		
		return Success and Result or nil
	end,
	LogUserLayerExposure = function(_, LayerName)
		-- upvalues: IXPService (copy)
		pcall(function()
			-- upvalues: IXPService (upval), LayerName (copy)
			IXPService:LogUserLayerExposure(LayerName)
		end)
	end,
	LogBrowserTrackerLayerExposure = function(_, LayerName)
		-- upvalues: IXPService (copy)
		pcall(function()
			-- upvalues: IXPService (upval), LayerName (copy)
			IXPService:LogBrowserTrackerLayerExposure(LayerName)
		end)
	end
}