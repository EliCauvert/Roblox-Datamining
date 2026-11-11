local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoduxModule = require(Modules.Common.Rodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local TutilsModule = require(CorePackages.Packages.tutils)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local ApplySetNavigationLockedModule = require(Modules.LuaApp.Actions.ApplySetNavigationLocked)
local SetBackNavigationDisabledModule = require(Modules.LuaApp.Actions.SetBackNavigationDisabled)
local ApplyRoactNavigationHistoryModule = require(Modules.LuaApp.Actions.ApplyRoactNavigationHistory)
local FlagSettingsModule = require(Modules.LuaApp.FlagSettings)
local ConstantsModule = require(Modules.LuaApp.Constants)
local GetCurrentRouteStateFunction = require(CorePackages.Workspace.Packages.Navigation).getCurrentRouteState
local GetFFlagLuaAppRefactorSelectRouteFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppRefactorSelectRoute
local NavigationRoduxModule = require(CorePackages.Workspace.Packages.NavigationRodux)
local GetLegacyPageFromRoactNavigationRouteFunction = NavigationRoduxModule.Utils.getLegacyPageFromRoactNavigationRoute
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagAppIaHomeSubTab = SharedFlagsModule.FFlagAppIaHomeSubTab
local FFlagUseBackDisableSignalStore = SharedFlagsModule.FFlagUseBackDisableSignalStore
local FFlagRoduxSignalsNavigationMigration = SharedFlagsModule.FFlagRoduxSignalsNavigationMigration
local FFlagSignalsNavP2NavigationPrimitives = SharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives
local AppNavigationModule = if FFlagRoduxSignalsNavigationMigration then require(Modules.LuaApp.Navigation.AppNavigation) else nil
local LegacyNavigationStoreModule = if FFlagRoduxSignalsNavigationMigration then require(Modules.LuaApp.Navigation.LegacyNavigationStore) else nil

if SharedFlagsModule.FFlagSignalsNavP3Final then
	local self = setmetatable({}, {
		__index = function(_, p1)
			error(string.format("state.Navigation.%s was read while FFlagSignalsNavP3Final is on. Read navigation state from GetLegacyNavigationStore / AppNavigation signals instead.\n%s", tostring(p1), debug.traceback()))
		end,
		__newindex = function(_, p1)
			error(string.format("state.Navigation.%s was written while FFlagSignalsNavP3Final is on.\n%s", tostring(p1), debug.traceback()))
		end
	})
	local config = {
		[ApplySetNavigationLockedModule.name] = true,
		[ApplyRoactNavigationHistoryModule.name] = true
	}
	
	return function(_, p1)
		-- upvalues: config (copy), self (copy)
		if p1 ~= nil and config[p1.type] then
			error(string.format("%s was dispatched while FFlagSignalsNavP3Final is on. Navigation lock/history is owned by the Signals navigation object now; remove this dispatch.\n%s", tostring(p1.type), debug.traceback()))
		end
		return self
	end
else
	local function _()
		-- upvalues: FlagSettingsModule (copy)
		return {
			routeName = FlagSettingsModule.GetDefaultAppPage(),
			key = FlagSettingsModule.GetDefaultAppPage()
		}
	end
	
	local function getDefaultRouteState()
		-- upvalues: FlagSettingsModule (copy)
		return {
			routeName = FlagSettingsModule.GetDefaultAppPage(),
			key = FlagSettingsModule.GetDefaultAppPage(),
			name = FlagSettingsModule.GetDefaultAppPage(),
			rnKey = FlagSettingsModule.GetDefaultAppPage()
		}
	end
	
	local _ = function()
		-- upvalues: getDefaultRouteState (copy)
		return { (getDefaultRouteState()) }
	end
	
	local Reducer = RoduxModule.createReducer({
		lockNavigationActions = false,
		backNavigationDisableCounter = 0,
		history = if FFlagRoduxSignalsNavigationMigration then nil else { { (getDefaultRouteState()) } },
		currentRoute = if FFlagRoduxSignalsNavigationMigration then nil else getDefaultRouteState(),
		roactNavigationState = if FFlagRoduxSignalsNavigationMigration then nil elseif GetFFlagLuaAppRefactorSelectRouteFunction() then {
			routeName = FlagSettingsModule.GetDefaultAppPage(),
			key = FlagSettingsModule.GetDefaultAppPage()
		} else nil
	}, {
		[ApplyRoactNavigationHistoryModule.name] = if FFlagSignalsNavP2NavigationPrimitives then nil else function(p1, p2)
			-- upvalues: FFlagRoduxSignalsNavigationMigration (copy), CryoModule (copy), MutedErrorModule (copy), TutilsModule (copy), ConstantsModule (copy), FFlagAppIaHomeSubTab (copy), NavigationRoduxModule (copy), GetFFlagLuaAppRefactorSelectRouteFunction (copy), GetLegacyPageFromRoactNavigationRouteFunction (copy), getDefaultRouteState (copy), GetCurrentRouteStateFunction (copy)
			if FFlagRoduxSignalsNavigationMigration then
				return CryoModule.Dictionary.join(p1, {
					lockNavigationActions = p2.navigationState.isTransitioning or false
				})
			end
			local NavigationState = p2.navigationState
			
			if not NavigationState or not NavigationState.routes or not NavigationState.index then
				local JoinResult = if p1.lockNavigationActions then CryoModule.Dictionary.join(p1, { lockNavigationActions = false }) else p1
				MutedErrorModule("Roact Navigation state is not complete in action: " .. TutilsModule.toString(p2))
				
				return JoinResult
			end
			local History = {}
			
			for i = 1, NavigationState.index do
				local Route = NavigationState.routes[i]
				
				if Route.routeName == ConstantsModule.TempRnSwitchNavigatorName then
					Route = Route.routes[Route.index]
				end
				if FFlagAppIaHomeSubTab and Route.routeName == NavigationRoduxModule.Constants.HomeContainerName then
					Route = Route.routes[Route.index]
				end
				table.insert(History, CryoModule.List.join(History[i - 1] or {}, {
					if GetFFlagLuaAppRefactorSelectRouteFunction() then GetLegacyPageFromRoactNavigationRouteFunction(Route) else CryoModule.Dictionary.join(Route.params or {}, { name = Route.routeName, rnKey = Route.key })
				}))
			end
			if #History == 0 then
				MutedErrorModule("RN computed history is empty for action: " .. TutilsModule.toString(p2))
				History = { { (getDefaultRouteState()) } }
			end
			local CurrentRouteState = GetCurrentRouteStateFunction({ state = p2.navigationState }) or getDefaultRouteState()
			
			if not GetFFlagLuaAppRefactorSelectRouteFunction() then
				CurrentRouteState.name = CurrentRouteState.routeName
				CurrentRouteState.rnKey = CurrentRouteState.key
			end
			return CryoModule.Dictionary.join(p1, {
				currentRoute = CurrentRouteState,
				history = History,
				lockNavigationActions = NavigationState.isTransitioning or false,
				roactNavigationState = table.clone(p2.navigationState)
			})
		end,
		[ApplySetNavigationLockedModule.name] = if FFlagSignalsNavP2NavigationPrimitives then nil else function(p3, p4)
			-- upvalues: CryoModule (copy)
			return if p3.lockNavigationActions == p4.locked then p3 else CryoModule.Dictionary.join(p3, { lockNavigationActions = p4.locked or false })
		end,
		[SetBackNavigationDisabledModule.name] = if FFlagUseBackDisableSignalStore then nil else function(p3, p4)
			-- upvalues: CryoModule (copy)
			return CryoModule.Dictionary.join(p3, {
				backNavigationDisableCounter = p4.disabled and p3.backNavigationDisableCounter + 1 or math.max(p3.backNavigationDisableCounter - 1, 0)
			})
		end
	})
	
	local function NavigationReducerWrapper(p3, p4, p5)
		-- upvalues: CryoModule (copy), Reducer (copy), LegacyNavigationStoreModule (copy), AppNavigationModule (copy), FFlagSignalsNavP2NavigationPrimitives (copy)
		return CryoModule.Dictionary.join(Reducer(p3, p4), {
			history = LegacyNavigationStoreModule.getHistory(p5),
			currentRoute = LegacyNavigationStoreModule.getCurrentRoute(p5),
			roactNavigationState = AppNavigationModule.getState(p5),
			lockNavigationActions = if FFlagSignalsNavP2NavigationPrimitives then AppNavigationModule.getIsNavigating(p5) else nil
		})
	end
	
	return if FFlagRoduxSignalsNavigationMigration then NavigationReducerWrapper else Reducer
end