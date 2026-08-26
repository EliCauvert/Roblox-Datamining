local runService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")

return {
	InitializeAsync = function(_, p1, p2)
		-- upvalues: runService (ref), IXPService (ref)
		local ok, status = pcall(function()
			-- upvalues: runService (copy), IXPService (copy), p2 (ref), p1 (ref)
			if runService:IsStudio() then
				IXPService:ClearUserLayers()
			end
			IXPService:RegisterUserLayers(p2)
			IXPService:InitializeUserLayers(p1)
			local userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
			while userLayerLoadingStatus == Enum.IXPLoadingStatus.None or userLayerLoadingStatus == Enum.IXPLoadingStatus.Pending do
				IXPService.OnUserLayerLoadingStatusChanged:Wait()
				userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
			end
			return userLayerLoadingStatus
		end)
		
		return ok, status
	end,
	WaitForInitialization = function(_)
		-- upvalues: IXPService (ref)
		local userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		while userLayerLoadingStatus == Enum.IXPLoadingStatus.None or userLayerLoadingStatus == Enum.IXPLoadingStatus.Pending do
			IXPService.OnUserLayerLoadingStatusChanged:Wait()
			userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		end
		return userLayerLoadingStatus
	end,
	GetLayerData = function(_, p3)
		-- upvalues: IXPService (ref)
		local ok, status = pcall(function()
			-- upvalues: IXPService (copy), p3 (ref)
			return IXPService:GetUserLayerVariables(p3)
		end)
		
		return if ok then status else nil
	end,
	GetBTIDLayerData = function(_, p3)
		-- upvalues: IXPService (ref)
		local ok, status = pcall(function()
			-- upvalues: IXPService (copy), p3 (ref)
			return IXPService:GetBrowserTrackerLayerVariables(p3)
		end)
		
		return if ok then status else nil
	end,
	LogUserLayerExposure = function(_, p3)
		-- upvalues: IXPService (ref)
		pcall(function()
			-- upvalues: IXPService (copy), p3 (ref)
			IXPService:LogUserLayerExposure(p3)
		end)
	end,
	LogBrowserTrackerLayerExposure = function(_, p3)
		-- upvalues: IXPService (ref)
		pcall(function()
			-- upvalues: IXPService (copy), p3 (ref)
			IXPService:LogBrowserTrackerLayerExposure(p3)
		end)
	end,
	LogFlagLinkedUserLayerExposure = function(_, p3)
		-- upvalues: IXPService (ref)
		if game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			pcall(function()
				-- upvalues: IXPService (copy), p3 (ref)
				IXPService:LogFlagLinkedUserLayerExposure(p3)
			end)
		end
	end
}