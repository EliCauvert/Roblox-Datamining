local RunService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")

return {
	InitializeAsync = function(_, UserId, UserLayers)
		-- upvalues: RunService (copy), IXPService (copy)
		local Success, Result = pcall(function()
			-- upvalues: RunService (upval), IXPService (upval), UserLayers (copy), UserId (copy)
			if RunService:IsStudio() then
				IXPService:ClearUserLayers()
			end
			IXPService:RegisterUserLayers(UserLayers)
			IXPService:InitializeUserLayers(UserId)
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
	GetBTIDLayerData = function(_, LayerName)
		-- upvalues: IXPService (copy)
		local Success, Result = pcall(function()
			-- upvalues: IXPService (upval), LayerName (copy)
			return IXPService:GetBrowserTrackerLayerVariables(LayerName)
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
	end,
	LogFlagLinkedUserLayerExposure = function(_, LayerName)
		-- upvalues: IXPService (copy)
		if game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			pcall(function()
				-- upvalues: IXPService (upval), LayerName (copy)
				IXPService:LogFlagLinkedUserLayerExposure(LayerName)
			end)
		end
	end
}