local runService = game:GetService("RunService")
local IXPService = game:GetService("IXPService")
game:DefineFastFlag("IXPServiceWrapperWaitRefactor", false)

local _ = function()
	return game:GetFastFlag("IXPServiceWrapperWaitRefactor")
end

return {
	InitializeAsync = function(p0, p1, p2)
		-- upvalues: runService (ref), IXPService (ref)
		local ok, status = pcall(function()
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
	end
}