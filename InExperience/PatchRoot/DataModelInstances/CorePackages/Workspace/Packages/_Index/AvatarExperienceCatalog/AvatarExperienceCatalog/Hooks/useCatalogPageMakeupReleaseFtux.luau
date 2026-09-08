local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local useMakeupFtuxModule = require(script.Parent.useMakeupFtux)
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local AXMakeupReleaseFtuxPromptDelayMS = game:DefineFastInt("AXMakeupReleaseFtuxPromptDelayMS", 500)

return function(p1, p2, p3)
	-- upvalues: useMakeupFtuxModule (ref), reactModule (ref), avatarScreen (ref), AXMakeupReleaseFtuxPromptDelayMS (ref)
	local var1 = useMakeupFtuxModule()
	local name = p1 and (p1.opaque and p1.opaque.name)
	local routeName = p2.state.routeName
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), name (ref), avatarScreen (copy), routeName (ref), AXMakeupReleaseFtuxPromptDelayMS (copy), p2 (ref), p3 (ref)
		local var2 = if var1.shouldShowMakeupReleasePrompt() and name == avatarScreen.Catalog and routeName == name then task.delay(AXMakeupReleaseFtuxPromptDelayMS / 1000, function()
			-- upvalues: p2 (copy), avatarScreen (copy), var1 (copy), p3 (copy)
			p2.navigate(avatarScreen.MakeupReleaseFtuxPrompt, {
				onView = function()
					-- upvalues: var1 (copy), p3 (copy)
					var1.setShownMakeupReleasePrompt()
					p3()
				end,
				onDismiss = function()
					-- upvalues: var1 (copy)
					var1.setShownMakeupReleasePrompt()
				end
			})
		end) else nil
		
		return function()
			-- upvalues: var2 (write)
			if var2 then
				task.cancel(var2)
			end
		end
	end, {
		var1,
		p2,
		name,
		routeName,
		p3
	})
end