local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local UseMakeupFtuxModule = require(script.Parent.useMakeupFtux)
local AvatarScreen = require(Parent.AvatarExperienceNavigation).Enums.AvatarScreen
local AXMakeupReleaseFtuxPromptDelayMS = game:DefineFastInt("AXMakeupReleaseFtuxPromptDelayMS", 500)

return function(p1, p2, Callback)
	-- upvalues: UseMakeupFtuxModule (copy), ReactModule (copy), AvatarScreen (copy), AXMakeupReleaseFtuxPromptDelayMS (copy)
	local UseMakeupFtuxModuleResult = UseMakeupFtuxModule()
	local Name = p1 and (p1.opaque and p1.opaque.name)
	local RouteName = p2.state.routeName
	ReactModule.useEffect(function()
		-- upvalues: UseMakeupFtuxModuleResult (copy), Name (copy), AvatarScreen (upval), RouteName (copy), AXMakeupReleaseFtuxPromptDelayMS (upval), p2 (copy), Callback (copy)
		local DelayedThread = if UseMakeupFtuxModuleResult.shouldShowMakeupReleasePrompt() and Name == AvatarScreen.Catalog and RouteName == Name then task.delay(AXMakeupReleaseFtuxPromptDelayMS / 1000, function()
			-- upvalues: p2 (upval), AvatarScreen (upval), UseMakeupFtuxModuleResult (upval), Callback (upval)
			p2.navigate(AvatarScreen.MakeupReleaseFtuxPrompt, {
				onView = function()
					-- upvalues: UseMakeupFtuxModuleResult (upval), Callback (upval)
					UseMakeupFtuxModuleResult.setShownMakeupReleasePrompt()
					Callback()
				end,
				onDismiss = function()
					-- upvalues: UseMakeupFtuxModuleResult (upval)
					UseMakeupFtuxModuleResult.setShownMakeupReleasePrompt()
				end
			})
		end) else nil
		
		return function()
			-- upvalues: DelayedThread (ref)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end, {
		UseMakeupFtuxModuleResult,
		p2,
		Name,
		RouteName,
		Callback
	})
end