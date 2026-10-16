local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local UseMakeupFtuxModule = require(script.Parent.useMakeupFtux)
local AXMakeupLayeringTooltipShowDelayMS = game:DefineFastInt("AXMakeupLayeringTooltipShowDelayMS", 500)
local AXMakeupLayeringTooltipDismissTimeoutSeconds = game:DefineFastInt("AXMakeupLayeringTooltipDismissTimeoutSeconds", 5)

return function(p1) --[[ Line: 11 | Named "useMakeupLayeringTooltip" ]]
	-- upvalues: UseMakeupFtuxModule (copy), ReactModule (copy), AXMakeupLayeringTooltipShowDelayMS (copy), AXMakeupLayeringTooltipDismissTimeoutSeconds (copy)
	local UseMakeupFtuxModuleResult = UseMakeupFtuxModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 15 ]]
		-- upvalues: p1 (copy), UseMakeupFtuxModuleResult (copy), UseStateResult2 (copy), AXMakeupLayeringTooltipShowDelayMS (upval)
		if not p1 or not UseMakeupFtuxModuleResult.shouldShowMakeupLayeringTooltip() then
			UseStateResult2(false)
			
			return
		end
		local DelayedThread = task.delay(AXMakeupLayeringTooltipShowDelayMS / 1000, function() --[[ Line: 21 ]]
			-- upvalues: UseStateResult2 (upval), UseMakeupFtuxModuleResult (upval)
			UseStateResult2(true)
			UseMakeupFtuxModuleResult.markMakeupLayeringTooltipSeen()
		end)
		
		return function() --[[ Line: 26 ]]
			-- upvalues: DelayedThread (copy)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end, { p1 })
	ReactModule.useEffect(function() --[[ Line: 33 ]]
		-- upvalues: UseStateResult (copy), AXMakeupLayeringTooltipDismissTimeoutSeconds (upval), UseStateResult2 (copy)
		if not UseStateResult then return end
		local DelayedThread = task.delay(AXMakeupLayeringTooltipDismissTimeoutSeconds, function() --[[ Line: 38 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		
		return function() --[[ Line: 42 ]]
			-- upvalues: DelayedThread (copy)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end, { UseStateResult })
	
	return {
		showTooltip = UseStateResult,
		dismissTooltip = ReactModule.useCallback(function() --[[ Line: 49 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end, {})
	}
end