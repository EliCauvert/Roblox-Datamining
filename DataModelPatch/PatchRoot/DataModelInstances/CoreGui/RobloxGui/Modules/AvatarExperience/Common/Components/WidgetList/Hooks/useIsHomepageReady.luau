local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Default = require(CorePackages.Workspace.Packages.AppStartup).AppStartupSequence.default
local HomepageReadyFailsafeTimeoutSeconds = game:DefineFastInt("HomepageReadyFailsafeTimeoutSeconds", 20)
local AXPrefetchMarketplaceIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local AXEnablePrefetchMarketplaceFailsafe = game:DefineFastFlag("AXEnablePrefetchMarketplaceFailsafe", false)

return function()
	-- upvalues: ReactModule (copy), Default (copy), AXPrefetchMarketplaceIXP (copy), IxpUtilsModule (copy), AXEnablePrefetchMarketplaceFailsafe (copy), HomepageReadyFailsafeTimeoutSeconds (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Default.isInteractive)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local TestVariable = if AXPrefetchMarketplaceIXP.isEnabled() then IxpUtilsModule.readTestVariable(AXPrefetchMarketplaceIXP.EnabledForUser) else nil
	ReactModule.useEffect(function()
		-- upvalues: TestVariable (copy), UseStateResult2 (copy), Default (upval), UseStateResult (copy)
		if not TestVariable then return end
		UseStateResult2(Default.isInteractive)
		
		if UseStateResult then
			return function() end
		else
			local ChangedConnection = Default.changed:connect(function()
				-- upvalues: UseStateResult2 (upval), Default (upval)
				UseStateResult2(Default.isInteractive)
			end)
			
			return function()
				-- upvalues: ChangedConnection (copy)
				ChangedConnection:disconnect()
			end
		end
	end, { UseStateResult, TestVariable })
	
	if AXEnablePrefetchMarketplaceFailsafe then
		ReactModule.useEffect(function()
			-- upvalues: TestVariable (copy), UseStateResult (copy), HomepageReadyFailsafeTimeoutSeconds (upval), UseStateResult2_1 (copy)
			if not TestVariable then return end
			if UseStateResult then
				return function() end
			else
				local DelayedThread = task.delay(HomepageReadyFailsafeTimeoutSeconds, function()
					-- upvalues: UseStateResult2_1 (upval)
					UseStateResult2_1(true)
				end)
				
				return function()
					-- upvalues: DelayedThread (copy)
					task.cancel(DelayedThread)
				end
			end
		end, { UseStateResult, TestVariable })
	end
	local Flag: boolean = UseStateResult
	
	if not Flag then
		if AXEnablePrefetchMarketplaceFailsafe then
			return UseStateResult1
		end
		Flag = false
	end
	return Flag
end