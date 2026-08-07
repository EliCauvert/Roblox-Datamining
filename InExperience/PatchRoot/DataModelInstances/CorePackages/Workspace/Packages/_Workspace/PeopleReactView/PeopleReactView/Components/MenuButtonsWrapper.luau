local menuButtons = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("Components"):WaitForChild("MenuButtons")
local parent = script:FindFirstAncestor("PeopleReactView").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)
local view = foundationModule.View
local useSignalState = require(parent.SignalsReact).useSignalState
local menuButtonsModule = require(menuButtons:WaitForChild("MenuButtons"))

return function() --[[ line: 27 ]]
	-- upvalues: reactModule (ref), peopleServiceModule (ref), useSignalState (ref), view (ref), menuButtonsModule (ref)
	local var5 = reactModule.useMemo(function() --[[ line: 28 ]]
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("SettingsHubService")
	end, {})
	local var6 = reactModule.useMemo(function() --[[ line: 34 ]]
		-- upvalues: var5 (ref)
		local var7 = var5.hubRef()
		
		return if var7 then var7:GetExperienceControlStore() else nil
	end, {})
	
	return if var6 and useSignalState(var5.showMenuButtonsContainer) then reactModule.createElement(view, { LayoutOrder = -1, tag = "size-full-1000" }, {
		MenuButtonsContainer = reactModule.createElement(menuButtonsModule, {
			onLeaveGame = var6.onLeaveGame,
			onRespawn = var6.onRespawn,
			onResume = var6.onResume,
			setAddMenuKeyBindings = function() --[[ line: 54 ]] end,
			setRemoveMenuKeyBindings = function() --[[ line: 55 ]] end,
			getVisibility = function() --[[ line: 56 ]]
				return true
			end,
			getCanRespawn = var6.getCanRespawn
		})
	}) else nil
end