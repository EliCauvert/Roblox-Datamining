local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local useMakeupFtuxModule = require(script.Parent.useMakeupFtux)
local avatarScreen = require(parent.AvatarExperienceNavigation).Enums.AvatarScreen
local AXMakeupReleaseFtuxPromptDelayMS = game:DefineFastInt("AXMakeupReleaseFtuxPromptDelayMS", 500)

return function(p0, p1, p2) --[[ line: 15 | named "useCatalogPageMakeupReleaseFtuxHook" ]]
	-- upvalues: useMakeupFtuxModule (ref), reactModule (ref), avatarScreen (ref), AXMakeupReleaseFtuxPromptDelayMS (ref)
	local var3 = useMakeupFtuxModule()
	local name = p0 and (p0.opaque and p0.opaque.name)
	local routeName = p1.state.routeName
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: var3 (ref), name (ref), avatarScreen (copy), routeName (ref), AXMakeupReleaseFtuxPromptDelayMS (copy), p1 (ref), p2 (ref)
		local var5 = if var3.shouldShowMakeupReleasePrompt() and name == avatarScreen.Catalog and routeName == name then task.delay(AXMakeupReleaseFtuxPromptDelayMS / 1000, function() --[[ line: 32 ]]
			-- upvalues: p1 (copy), avatarScreen (copy), var3 (copy), p2 (copy)
			p1.navigate(avatarScreen.MakeupReleaseFtuxPrompt, {
				onView = function() --[[ line: 34 ]]
					-- upvalues: var3 (copy), p2 (copy)
					var3.setShownMakeupReleasePrompt()
					p2()
				end,
				onDismiss = function() --[[ line: 38 ]]
					-- upvalues: var3 (copy)
					var3.setShownMakeupReleasePrompt()
				end
			})
		end) else nil
		
		return function() --[[ line: 45 ]]
			-- upvalues: var5 (write)
			if var5 then
				task.cancel(var5)
			end
		end
	end, {
		var3,
		p1,
		name,
		routeName,
		p2
	})
end