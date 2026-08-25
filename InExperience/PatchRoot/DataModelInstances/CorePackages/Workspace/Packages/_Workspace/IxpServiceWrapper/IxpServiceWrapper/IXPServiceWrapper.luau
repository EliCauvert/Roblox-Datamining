local runService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")

return {
	InitializeAsync = function(_, p0, p1)
		-- upvalues: runService (ref), IXPService (ref)
		local ok, status = pcall(function()
			-- upvalues: runService (copy), IXPService (copy), p1 (ref), p0 (ref)
			if runService:IsStudio() then
				IXPService:ClearUserLayers()
			end
			IXPService:RegisterUserLayers(p1)
			IXPService:InitializeUserLayers(p0)
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
	GetLayerData = function(_, p2)
		-- upvalues: IXPService (ref)
		local ok, status = pcall(function()
			-- upvalues: IXPService (copy), p2 (ref)
			return IXPService:GetUserLayerVariables(p2)
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
	LogUserLayerExposure = function(_, p4)
		-- upvalues: IXPService (ref)
		pcall(function()
			-- upvalues: IXPService (copy), p4 (ref)
			IXPService:LogUserLayerExposure(p4)
		end)
	end,
	LogBrowserTrackerLayerExposure = function(_, p5)
		-- upvalues: IXPService (ref)
		pcall(function()
			-- upvalues: IXPService (copy), p5 (ref)
			IXPService:LogBrowserTrackerLayerExposure(p5)
		end)
	end,
	LogFlagLinkedUserLayerExposure = function(_, p6)
		-- upvalues: IXPService (ref)
		if game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			pcall(function()
				-- upvalues: IXPService (copy), p6 (ref)
				IXPService:LogFlagLinkedUserLayerExposure(p6)
			end)
		end
	end
}