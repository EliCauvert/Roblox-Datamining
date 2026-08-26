local runService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")
game:DefineFastFlag("IXPServiceWrapperWaitRefactor", false)

local _ = function()
	return game:GetFastFlag("IXPServiceWrapperWaitRefactor")
end

return {
	InitializeAsync = function(p1, p2, p3)
		-- upvalues: runService (ref), IXPService (ref)
		local ok, status = pcall(function()
			-- upvalues: runService (copy), IXPService (copy), p3 (ref), p2 (ref), p1 (ref)
			if runService:IsStudio() then
				IXPService:ClearUserLayers()
			end
			IXPService:RegisterUserLayers(p3)
			IXPService:InitializeUserLayers(p2)
			
			if game:GetFastFlag("IXPServiceWrapperWaitRefactor") then
				return p1:WaitForInitialization()
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
	WaitForInitialization = function(_)
		-- upvalues: IXPService (ref)
		local userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		while userLayerLoadingStatus == Enum.IXPLoadingStatus.None or userLayerLoadingStatus == Enum.IXPLoadingStatus.Pending do
			IXPService.OnUserLayerLoadingStatusChanged:Wait()
			userLayerLoadingStatus = IXPService:GetUserLayerLoadingStatus()
		end
		return userLayerLoadingStatus
	end,
	GetLayerData = function(_, p4)
		-- upvalues: IXPService (ref)
		local ok, status = pcall(function()
			-- upvalues: IXPService (copy), p4 (ref)
			return IXPService:GetUserLayerVariables(p4)
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
	LogBrowserTrackerLayerExposure = function(_, p4)
		-- upvalues: IXPService (ref)
		pcall(function()
			-- upvalues: IXPService (copy), p4 (ref)
			IXPService:LogBrowserTrackerLayerExposure(p4)
		end)
	end
}