local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local useMakeupFtuxModule = require(script.Parent.useMakeupFtux)
local AXMakeupLayeringTooltipShowDelayMS = game:DefineFastInt("AXMakeupLayeringTooltipShowDelayMS", 500)
local AXMakeupLayeringTooltipDismissTimeoutSeconds = game:DefineFastInt("AXMakeupLayeringTooltipDismissTimeoutSeconds", 5)

return function(p1)
	-- upvalues: useMakeupFtuxModule (ref), reactModule (ref), AXMakeupLayeringTooltipShowDelayMS (ref), AXMakeupLayeringTooltipDismissTimeoutSeconds (ref)
	local var1 = useMakeupFtuxModule()
	local var2, var3 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref), var3 (ref), AXMakeupLayeringTooltipShowDelayMS (copy)
		if p1 and var1.shouldShowMakeupLayeringTooltip() then
			local delayedThread = task.delay(AXMakeupLayeringTooltipShowDelayMS / 1000, function()
				-- upvalues: var3 (copy), var1 (copy)
				var3(true)
				var1.markMakeupLayeringTooltipSeen()
			end)
			
			return function()
				-- upvalues: delayedThread (ref)
				if delayedThread then
					task.cancel(delayedThread)
				end
			end
		end
		var3(false)
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), AXMakeupLayeringTooltipDismissTimeoutSeconds (copy), var3 (ref)
		if var2 then
			local delayedThread = task.delay(AXMakeupLayeringTooltipDismissTimeoutSeconds, function()
				-- upvalues: var3 (copy)
				var3(false)
			end)
			
			return function()
				-- upvalues: delayedThread (ref)
				if delayedThread then
					task.cancel(delayedThread)
				end
			end
		end
	end, { var2 })
	
	return {
		showTooltip = var2,
		dismissTooltip = reactModule.useCallback(function()
			-- upvalues: var3 (ref)
			var3(false)
		end, {})
	}
end