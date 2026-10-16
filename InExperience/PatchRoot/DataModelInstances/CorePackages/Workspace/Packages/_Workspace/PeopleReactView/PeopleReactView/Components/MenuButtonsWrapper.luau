local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local ReactModule = require(Parent.React)
local PeopleServiceModule = require(Parent.PeopleService)
local View = require(Parent.Foundation).View
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local MenuButtonsModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("Components"):WaitForChild("MenuButtons"):WaitForChild("MenuButtons"))

return function() --[[ Line: 27 ]]
	-- upvalues: ReactModule (copy), PeopleServiceModule (copy), UseSignalStateFunction (copy), View (copy), MenuButtonsModule (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 28 ]]
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("SettingsHubService")
	end, {})
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.showMenuButtonsContainer)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 34 ]]
		-- upvalues: UseMemoResult (copy)
		local HubRefResult = UseMemoResult.hubRef()
		
		return if HubRefResult then HubRefResult:GetExperienceControlStore() else nil
	end, {})
	
	return if UseMemoResult1 and UseSignalStateResult then ReactModule.createElement(View, { LayoutOrder = -1, tag = "size-full-1000" }, {
		MenuButtonsContainer = ReactModule.createElement(MenuButtonsModule, {
			onLeaveGame = UseMemoResult1.onLeaveGame,
			onRespawn = UseMemoResult1.onRespawn,
			onResume = UseMemoResult1.onResume,
			setAddMenuKeyBindings = function() --[[ Line: 54 ]] end,
			setRemoveMenuKeyBindings = function() --[[ Line: 55 ]] end,
			getVisibility = function(): boolean --[[ Line: 56 ]]
				return true
			end,
			getCanRespawn = UseMemoResult1.getCanRespawn
		})
	}) else nil
end