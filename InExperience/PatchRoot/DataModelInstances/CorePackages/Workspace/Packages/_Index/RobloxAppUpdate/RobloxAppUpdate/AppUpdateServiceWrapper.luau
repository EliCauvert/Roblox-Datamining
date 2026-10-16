local PromiseModule = require(script:FindFirstAncestor("RobloxAppUpdate").Parent.Promise)
local AppUpdateServiceWrapperModule = {}
AppUpdateServiceWrapperModule.__index = AppUpdateServiceWrapperModule

function AppUpdateServiceWrapperModule.new(_appUpdate) --[[ Line: 9 ]]
	-- upvalues: AppUpdateServiceWrapperModule (copy)
	local config = { _appUpdate = _appUpdate }
	setmetatable(config, AppUpdateServiceWrapperModule)
	
	return config
end

function AppUpdateServiceWrapperModule.checkForUpdate(p1) --[[ Line: 18 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback: (any) -> (), _) --[[ Line: 19 ]]
		-- upvalues: p1 (copy)
		local Success, Result = pcall(function() --[[ Line: 20 ]]
			-- upvalues: p1 (upval), Callback (copy)
			p1._appUpdate:CheckForUpdate(function(AppUpdateStatus) --[[ Line: 21 ]]
				-- upvalues: Callback (upval)
				Callback({ appUpdateStatus = AppUpdateStatus })
			end)
		end)
		
		if not Success then
			Callback({ errorMessage = Result })
		end
	end)
end

function AppUpdateServiceWrapperModule:performManagedUpdate() --[[ Line: 36 ]]
	self._appUpdate:PerformManagedUpdate()
end

function AppUpdateServiceWrapperModule:canPerformBinaryUpdate() --[[ Line: 40 ]]
	return self._appUpdate:CanPerformBinaryUpdate()
end

return AppUpdateServiceWrapperModule