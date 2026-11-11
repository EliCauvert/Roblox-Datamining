local PromiseModule = require(script:FindFirstAncestor("RobloxAppUpdate").Parent.Promise)
local AppUpdateServiceWrapperModule = {}
AppUpdateServiceWrapperModule.__index = AppUpdateServiceWrapperModule

function AppUpdateServiceWrapperModule.new(_appUpdate)
	-- upvalues: AppUpdateServiceWrapperModule (copy)
	local config = { _appUpdate = _appUpdate }
	setmetatable(config, AppUpdateServiceWrapperModule)
	
	return config
end

function AppUpdateServiceWrapperModule.checkForUpdate(p1)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _)
		-- upvalues: p1 (copy)
		local Success, Result = pcall(function()
			-- upvalues: p1 (upval), Callback (copy)
			p1._appUpdate:CheckForUpdate(function(AppUpdateStatus)
				-- upvalues: Callback (upval)
				Callback({ appUpdateStatus = AppUpdateStatus })
			end)
		end)
		
		if not Success then
			Callback({ errorMessage = Result })
		end
	end)
end

function AppUpdateServiceWrapperModule:performManagedUpdate()
	self._appUpdate:PerformManagedUpdate()
end

function AppUpdateServiceWrapperModule:canPerformBinaryUpdate()
	return self._appUpdate:CanPerformBinaryUpdate()
end

return AppUpdateServiceWrapperModule