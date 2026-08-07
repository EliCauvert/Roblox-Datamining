local runService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")
game:DefineFastFlag("IXPServiceWrapperWaitRefactor", false)

local _ = function() --[[ line: 17 ]]
	return game:GetFastFlag("IXPServiceWrapperWaitRefactor")
end

return {
	InitializeAsync = function(p0, p1, p2) --[[ line: 35 ]]
		-- upvalues: runService (ref), IXPService (ref)
		local ok, status = pcall(function() --[[ line: 36 ]]
			-- upvalues: runService (copy), IXPService (copy), p2 (ref), p1 (ref), p0 (ref)
			if runService:IsStudio() then
				IXPService:ClearUserLayers()
			end
			IXPService:RegisterUserLayers(p2)
			IXPService:InitializeUserLayers(p1)
			
			if game:GetFastFlag("IXPServiceWrapperWaitRefactor") then
				return p0:WaitForInitialization()
			end
			local userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
			while userLayerLoadingStatus == Enum.IXPLoadingStatus.None or userLayerLoadingStatus == Enum.IXPLoadingStatus.Pending do
				IXPService.OnUserLayerLoadingStatusChanged:Wait()
				userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
			end
			return userLayerLoadingStatus
		end)
		
		return ok, status
	end,
	WaitForInitialization = function(_) --[[ line: 64 ]]
		-- upvalues: IXPService (ref)
		local userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		while userLayerLoadingStatus == Enum.IXPLoadingStatus.None or userLayerLoadingStatus == Enum.IXPLoadingStatus.Pending do
			IXPService.OnUserLayerLoadingStatusChanged:Wait()
			userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		end
		return userLayerLoadingStatus
	end,
	GetLayerData = function(_, p3) --[[ line: 82 ]]
		-- upvalues: IXPService (ref)
		local ok, status = pcall(function() --[[ line: 83 ]]
			-- upvalues: IXPService (copy), p3 (ref)
			return IXPService:GetUserLayerVariables(p3)
		end)
		
		return if ok then status else nil
	end,
	LogUserLayerExposure = function(_, p4) --[[ line: 95 ]]
		-- upvalues: IXPService (ref)
		pcall(function() --[[ line: 96 ]]
			-- upvalues: IXPService (copy), p4 (ref)
			IXPService:LogUserLayerExposure(p4)
		end)
	end,
	LogBrowserTrackerLayerExposure = function(_, p5) --[[ line: 106 ]]
		-- upvalues: IXPService (ref)
		pcall(function() --[[ line: 107 ]]
			-- upvalues: IXPService (copy), p5 (ref)
			IXPService:LogBrowserTrackerLayerExposure(p5)
		end)
	end
}