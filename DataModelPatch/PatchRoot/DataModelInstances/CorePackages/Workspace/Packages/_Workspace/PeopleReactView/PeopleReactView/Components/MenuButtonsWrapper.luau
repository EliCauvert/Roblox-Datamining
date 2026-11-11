local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local ReactModule = require(Parent.React)
local PeopleServiceModule = require(Parent.PeopleService)
local View = require(Parent.Foundation).View
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local MenuButtonsModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules"):WaitForChild("Settings"):WaitForChild("Components"):WaitForChild("MenuButtons"):WaitForChild("MenuButtons"))

return function()
	-- upvalues: ReactModule (copy), PeopleServiceModule (copy), UseSignalStateFunction (copy), View (copy), MenuButtonsModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("SettingsHubService")
	end, {})
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.showMenuButtonsContainer)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy)
		local HubRefResult = UseMemoResult.hubRef()
		
		return if HubRefResult then HubRefResult:GetExperienceControlStore() else nil
	end, {})
	
	return if UseMemoResult1 and UseSignalStateResult then ReactModule.createElement(View, { LayoutOrder = -1, tag = "size-full-1000" }, {
		MenuButtonsContainer = ReactModule.createElement(MenuButtonsModule, {
			onLeaveGame = UseMemoResult1.onLeaveGame,
			onRespawn = UseMemoResult1.onRespawn,
			onResume = UseMemoResult1.onResume,
			setAddMenuKeyBindings = function() end,
			setRemoveMenuKeyBindings = function() end,
			getVisibility = function(): boolean
				return true
			end,
			getCanRespawn = UseMemoResult1.getCanRespawn
		})
	}) else nil
end