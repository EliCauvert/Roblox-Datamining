local runService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")

return {
	InitializeAsync = function(_, p0, p1) --[[ line: 30 ]]
		-- upvalues: runService (ref), IXPService (ref)
		local ok, status = pcall(function() --[[ line: 31 ]]
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
	WaitForInitialization = function(_) --[[ line: 55 ]]
		-- upvalues: IXPService (ref)
		local userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		while userLayerLoadingStatus == Enum.IXPLoadingStatus.None or userLayerLoadingStatus == Enum.IXPLoadingStatus.Pending do
			IXPService.OnUserLayerLoadingStatusChanged:Wait()
			userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		end
		return userLayerLoadingStatus
	end,
	GetLayerData = function(_, p2) --[[ line: 73 ]]
		-- upvalues: IXPService (ref)
		local ok, status = pcall(function() --[[ line: 74 ]]
			-- upvalues: IXPService (copy), p2 (ref)
			return IXPService:GetUserLayerVariables(p2)
		end)
		
		return if ok then status else nil
	end,
	GetBTIDLayerData = function(_, p3) --[[ line: 89 ]]
		-- upvalues: IXPService (ref)
		local ok, status = pcall(function() --[[ line: 90 ]]
			-- upvalues: IXPService (copy), p3 (ref)
			return IXPService:GetBrowserTrackerLayerVariables(p3)
		end)
		
		return if ok then status else nil
	end,
	LogUserLayerExposure = function(_, p4) --[[ line: 102 ]]
		-- upvalues: IXPService (ref)
		pcall(function() --[[ line: 103 ]]
			-- upvalues: IXPService (copy), p4 (ref)
			IXPService:LogUserLayerExposure(p4)
		end)
	end,
	LogBrowserTrackerLayerExposure = function(_, p5) --[[ line: 113 ]]
		-- upvalues: IXPService (ref)
		pcall(function() --[[ line: 114 ]]
			-- upvalues: IXPService (copy), p5 (ref)
			IXPService:LogBrowserTrackerLayerExposure(p5)
		end)
	end,
	LogFlagLinkedUserLayerExposure = function(_, p6) --[[ line: 124 ]]
		-- upvalues: IXPService (ref)
		if game:GetEngineFeature("EnableLogFlagLinkedUserLayerExposure") then
			pcall(function() --[[ line: 126 ]]
				-- upvalues: IXPService (copy), p6 (ref)
				IXPService:LogFlagLinkedUserLayerExposure(p6)
			end)
		end
	end
}