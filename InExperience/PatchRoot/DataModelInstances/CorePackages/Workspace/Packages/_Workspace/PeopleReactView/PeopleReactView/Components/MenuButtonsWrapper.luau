local menuButtons = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("Components"):WaitForChild("MenuButtons")
local parent = script:FindFirstAncestor("PeopleReactView").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local peopleServiceModule = require(parent.PeopleService)
local view = foundationModule.View
local useSignalState = require(parent.SignalsReact).useSignalState
local menuButtonsModule = require(menuButtons:WaitForChild("MenuButtons"))

return function()
	-- upvalues: reactModule (ref), peopleServiceModule (ref), useSignalState (ref), view (ref), menuButtonsModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("SettingsHubService")
	end, {})
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		local var3 = var1.hubRef()
		
		return if var3 then var3:GetExperienceControlStore() else nil
	end, {})
	
	return if var2 and useSignalState(var1.showMenuButtonsContainer) then reactModule.createElement(view, { LayoutOrder = -1, tag = "size-full-1000" }, {
		MenuButtonsContainer = reactModule.createElement(menuButtonsModule, {
			onLeaveGame = var2.onLeaveGame,
			onRespawn = var2.onRespawn,
			onResume = var2.onResume,
			setAddMenuKeyBindings = function() end,
			setRemoveMenuKeyBindings = function() end,
			getVisibility = function()
				return true
			end,
			getCanRespawn = var2.getCanRespawn
		})
	}) else nil
end