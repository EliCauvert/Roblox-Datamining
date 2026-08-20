local reactModule = require(script:FindFirstAncestor("AvatarExperienceCatalog").Parent.React)
local useMakeupFtuxModule = require(script.Parent.useMakeupFtux)
local AXMakeupLayeringTooltipShowDelayMS = game:DefineFastInt("AXMakeupLayeringTooltipShowDelayMS", 500)
local AXMakeupLayeringTooltipDismissTimeoutSeconds = game:DefineFastInt("AXMakeupLayeringTooltipDismissTimeoutSeconds", 5)

return function(p0) --[[ line: 11 | named "useMakeupLayeringTooltip" ]]
	-- upvalues: useMakeupFtuxModule (ref), reactModule (ref), AXMakeupLayeringTooltipShowDelayMS (ref), AXMakeupLayeringTooltipDismissTimeoutSeconds (ref)
	local var4 = useMakeupFtuxModule()
	local var5, var6 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 15 ]]
		-- upvalues: p0 (ref), var4 (ref), var6 (ref), AXMakeupLayeringTooltipShowDelayMS (copy)
		if p0 and var4.shouldShowMakeupLayeringTooltip() then
			local delayedThread = task.delay(AXMakeupLayeringTooltipShowDelayMS / 1000, function() --[[ line: 21 ]]
				-- upvalues: var6 (copy), var4 (copy)
				var6(true)
				var4.markMakeupLayeringTooltipSeen()
			end)
			
			return function() --[[ line: 26 ]]
				-- upvalues: delayedThread (ref)
				if delayedThread then
					task.cancel(delayedThread)
				end
			end
		end
		var6(false)
	end, { p0 })
	reactModule.useEffect(function() --[[ line: 33 ]]
		-- upvalues: var5 (ref), AXMakeupLayeringTooltipDismissTimeoutSeconds (copy), var6 (ref)
		if var5 then
			local delayedThread = task.delay(AXMakeupLayeringTooltipDismissTimeoutSeconds, function() --[[ line: 38 ]]
				-- upvalues: var6 (copy)
				var6(false)
			end)
			
			return function() --[[ line: 42 ]]
				-- upvalues: delayedThread (ref)
				if delayedThread then
					task.cancel(delayedThread)
				end
			end
		end
	end, { var5 })
	
	return {
		showTooltip = var5,
		dismissTooltip = reactModule.useCallback(function() --[[ line: 49 ]]
			-- upvalues: var6 (ref)
			var6(false)
		end, {})
	}
end