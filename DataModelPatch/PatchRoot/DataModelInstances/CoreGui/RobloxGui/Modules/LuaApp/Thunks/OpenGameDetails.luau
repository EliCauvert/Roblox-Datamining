local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local NavigateDownFunction = require(CorePackages.Workspace.Packages.NavigationRodux).Thunks.NavigateDown
local GameDetailModule = require(CorePackages.Workspace.Packages.GameDetail)
local SetGameDetailsPeekViewStateFunction = GameDetailModule.PeekView.SetGameDetailsPeekViewState
local UseGameDetailsPeekViewFunction = GameDetailModule.PeekView.UseGameDetailsPeekView
local GameDetailTelemetryModule = require(CorePackages.Workspace.Packages.GameDetailTelemetry)
local FFlagEDPTTITrackingEnabled = GameDetailTelemetryModule.FFlagEDPTTITrackingEnabled
local EDPTTIConstants = GameDetailTelemetryModule.EDPTTIConstants
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagLuaAppSduiEdpEnabled = SharedFlagsModule.FFlagLuaAppSduiEdpEnabled
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local StartNewPeekViewHistoryModule = require(Modules.LuaApp.Util.startNewPeekViewHistory)
local EDPTTIManager = GameDetailTelemetryModule.EDPTTIManager

local function _(p1, p2)
	-- upvalues: StartNewPeekViewHistoryModule (copy), SetGameDetailsPeekViewStateFunction (copy), PeekViewState (copy), ResetNavigationHistoryModule (copy)
	local StartNewPeekViewHistoryModuleResult = StartNewPeekViewHistoryModule(p1, p2)
	local NewRoute = StartNewPeekViewHistoryModuleResult.newRoute
	local NewHistory = StartNewPeekViewHistoryModuleResult.newHistory
	p1:dispatch(SetGameDetailsPeekViewStateFunction(PeekViewState.Closed))
	p1:dispatch(ResetNavigationHistoryModule(NewRoute, NewHistory))
end

local function openFullGameDetailsPeekView(p1, p2)
	-- upvalues: CryoModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local JoinResult = CryoModule.Dictionary.join(p2, {
		extraProps = CryoModule.Dictionary.join(p2.extraProps or {}, { mountAsFullView = true })
	})
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(JoinResult))
		
		return
	else
		p1:dispatch(NavigateDownFunction(JoinResult))
	end
end

local function openExperienceDetailsPage(p1, p2)
	-- upvalues: CryoModule (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy)
	local JoinResult = CryoModule.Dictionary.join(p2, { name = AppPage.ExperienceDetail })
	
	if FFlagSignalsNavP3Dispatch then
		NavigationCommands.down(NavigationCommands.fromLegacyPage(JoinResult))
		
		return
	else
		p1:dispatch(NavigateDownFunction(JoinResult))
	end
end

return function(p1, ExtraProps)
	-- upvalues: FFlagEDPTTITrackingEnabled (copy), EDPTTIManager (copy), EDPTTIConstants (copy), FFlagLuaAppSduiEdpEnabled (copy), CorePackages (copy), CryoModule (copy), AppPage (copy), FormFactor (copy), UseGameDetailsPeekViewFunction (copy), PeekViewState (copy), openFullGameDetailsPeekView (copy), StartNewPeekViewHistoryModule (copy), SetGameDetailsPeekViewStateFunction (copy), ResetNavigationHistoryModule (copy), openExperienceDetailsPage (copy)
	return function(p2)
		-- upvalues: FFlagEDPTTITrackingEnabled (upval), EDPTTIManager (upval), EDPTTIConstants (upval), FFlagLuaAppSduiEdpEnabled (upval), CorePackages (upval), p1 (copy), ExtraProps (ref), CryoModule (upval), AppPage (upval), FormFactor (upval), UseGameDetailsPeekViewFunction (upval), PeekViewState (upval), openFullGameDetailsPeekView (upval), StartNewPeekViewHistoryModule (upval), SetGameDetailsPeekViewStateFunction (upval), ResetNavigationHistoryModule (upval), openExperienceDetailsPage (upval)
		local State = p2:getState()
		local FormFactor1 = State.FormFactor
		local ViewState = State.GameDetailsPeekView.viewState
		
		if FFlagEDPTTITrackingEnabled then
			EDPTTIManager.startTracking(EDPTTIConstants.EDP_ENTRY_PATH.GAME_DETAIL_OPEN_GAME_DETAILS)
		end
		if FFlagLuaAppSduiEdpEnabled then
			local GameDetailModule = require(CorePackages.Workspace.Packages.GameDetail)
			local LoadTimerWithSurfaceLoadTime = require(CorePackages.Workspace.Packages.SduiSharedUtilities).SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(GameDetailModule.getExperienceDetailsPageKey((tostring(p1))), {
				manualSurfaceReady = true,
				eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
				metadata = {
					page = EDPTTIConstants.EDP_ENTRY_PATH.MONOLITH_OPEN_GAME_DETAILS,
					category = if State.DeviceType == require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceType.Phone then EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW else EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
				}
			})
			ExtraProps = CryoModule.Dictionary.join(ExtraProps or {}, { pageTimer = LoadTimerWithSurfaceLoadTime })
			GameDetailModule.fetchExperienceDetailsPage(tostring(p1), LoadTimerWithSurfaceLoadTime)
		end
		local config = {
			name = AppPage.GameDetail,
			detail = tostring(p1),
			extraProps = ExtraProps
		}
		
		if FormFactor1 ~= FormFactor.COMPACT or not UseGameDetailsPeekViewFunction() then
			openExperienceDetailsPage(p2, config)
			
			return
		end
		if ViewState == PeekViewState.Full or ViewState == PeekViewState.Extended or ExtraProps and ExtraProps.mountAsFullView then
			openFullGameDetailsPeekView(p2, config)
			
			return
		else
			local StartNewPeekViewHistoryModuleResult = StartNewPeekViewHistoryModule(p2, config)
			local NewRoute = StartNewPeekViewHistoryModuleResult.newRoute
			local NewHistory = StartNewPeekViewHistoryModuleResult.newHistory
			p2:dispatch(SetGameDetailsPeekViewStateFunction(PeekViewState.Closed))
			p2:dispatch(ResetNavigationHistoryModule(NewRoute, NewHistory))
		end
	end
end