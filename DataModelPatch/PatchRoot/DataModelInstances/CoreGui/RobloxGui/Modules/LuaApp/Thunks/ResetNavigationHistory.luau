local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetNavigationLockedModule = require(Modules.LuaApp.Thunks.SetNavigationLocked)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RNAdapterThunkModule = require(Modules.LuaApp.Thunks.RNAdapterThunk)
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local ConstantsModule = require(Modules.LuaApp.Constants)
local _ = require(CorePackages.Workspace.Packages.NavigationRodux)
local FFlagSignalsNavP2NavigationPrimitives = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP2NavigationPrimitives
local NavigationCommands = if FFlagSignalsNavP2NavigationPrimitives then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

local function getDefaultRoute()
	-- upvalues: FlagSettingsModule (copy)
	return {
		{
			name = FlagSettingsModule.GetDefaultAppPage(),
			rnKey = FlagSettingsModule.GetDefaultAppPage()
		}
	}
end

local _, v1 = require(Modules.LuaApp.Components.AppNav.GetIABottomBarItems)()

return function(p1, p2)
	-- upvalues: FFlagSignalsNavP2NavigationPrimitives (copy), getDefaultRoute (copy), NavigationCommands (copy), v1 (copy), RoactNavigationModule (copy), ConstantsModule (copy), RNAdapterThunkModule (copy), CryoModule (copy), SetNavigationLockedModule (copy)
	return if FFlagSignalsNavP2NavigationPrimitives then function()
		-- upvalues: p1 (copy), p2 (copy), getDefaultRoute (upval), NavigationCommands (upval), v1 (upval), RoactNavigationModule (upval), ConstantsModule (upval)
		local v2 = if p2 ~= nil then p2[#p2] else p1
		
		if v2 == nil or #v2 == 0 then
			v2 = getDefaultRoute()
		end
		assert(v2, "not nil")
		local FromLegacyPageResults = {}
		
		for _, value in v2 do
			table.insert(FromLegacyPageResults, NavigationCommands.fromLegacyPage(value))
		end
		NavigationCommands.resetStack(FromLegacyPageResults, {
			wrapAction = function(Action, p3)
				-- upvalues: v1 (upval), RoactNavigationModule (upval), ConstantsModule (upval)
				return if v1[p3.routeName] == nil then nil else RoactNavigationModule.Actions.navigate({
					routeName = ConstantsModule.TempRnSwitchNavigatorName,
					action = Action,
					key = ConstantsModule.TempRnSwitchNavigatorName
				})
			end
		}, true)
	end else RNAdapterThunkModule.new("ResetNavigationHistory", function(p3, Callback: (any) -> ())
		-- upvalues: p1 (copy), p2 (copy), getDefaultRoute (upval), RoactNavigationModule (upval), CryoModule (upval), v1 (upval), ConstantsModule (upval), SetNavigationLockedModule (upval)
		local v3 = if p2 ~= nil then p2[#p2] else p1
		
		if v3 == nil or #v3 == 0 then
			v3 = getDefaultRoute()
		end
		assert(v3, "not nil")
		local List = {}
		
		for _, value in ipairs(v3) do
			local NavigateResult = RoactNavigationModule.Actions.navigate({
				routeName = value.name,
				params = CryoModule.Dictionary.join(value, { name = CryoModule.None, rnKey = CryoModule.None }),
				key = value.rnKey
			})
			
			if v1[value.name] == nil then
				table.insert(List, NavigateResult)
			else
				table.insert(List, RoactNavigationModule.Actions.navigate({
					routeName = ConstantsModule.TempRnSwitchNavigatorName,
					action = NavigateResult,
					key = ConstantsModule.TempRnSwitchNavigatorName
				}))
			end
		end
		p3:dispatch(SetNavigationLockedModule(true))
		Callback(RoactNavigationModule.StackActions.reset({ index = #List, actions = List }))
	end)
end