local GameDetail = script:FindFirstAncestor("GameDetail")
local SetGameDetailsPeekViewStateModule = require(GameDetail.PeekView.SetGameDetailsPeekViewState)
local UseGameDetailsPeekViewModule = require(GameDetail.PeekView.UseGameDetailsPeekView)
local Parent = GameDetail.Parent
local CryoModule = require(Parent.Cryo)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local PeekViewState = require(Parent.PeekView).PeekViewState
local NavigationRoduxModule = require(Parent.NavigationRodux)
local NavigateDownFunction = NavigationRoduxModule.Thunks.NavigateDown
local Selectors = NavigationRoduxModule.Selectors
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSignalsNavP2NavigationPrimitives = SharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives
local FFlagSignalsNavP3fGameDetails = SharedFlagsModule.FFlagSignalsNavP3fGameDetails
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagLuaAppSduiEdpEnabled = SharedFlagsModule.FFlagLuaAppSduiEdpEnabled
local FFlagFixSduiEdpTtiPeekCategory = SharedFlagsModule.FFlagFixSduiEdpTtiPeekCategory
local FFlagFixSduiEdpTtiColdStart = SharedFlagsModule.FFlagFixSduiEdpTtiColdStart
local FFlagEDPTTIParityDefinitions = SharedFlagsModule.FFlagEDPTTIParityDefinitions
local RobloxAppNavigationModule = require(Parent.RobloxAppNavigation)
local NavigationCommands = if FFlagSignalsNavP3Dispatch then RobloxAppNavigationModule.NavigationCommands else nil
local AppNavigationRegistry = if FFlagSignalsNavP3fGameDetails then RobloxAppNavigationModule.AppNavigationRegistry else nil
local SduiSurfaceLoadTimeTracker = require(Parent.SduiSharedUtilities).SduiSurfaceLoadTimeTracker
local DeviceType = require(Parent.RobloxAppEnums).DeviceType
local FetchGamePlayButtonData = require(Parent.GamePlayButton).FetchGamePlayButtonData
local DisplayModule = require(Parent.Display)
local ResponsiveModule = require(Parent.Responsive)
local FetchExperienceDetailsPageModule = require(script.Parent.ExperienceDetailsPage.fetchExperienceDetailsPage)
local GetExperienceDetailsPageKeyModule = require(script.Parent.ExperienceDetailsPage.getExperienceDetailsPageKey)
local CreateExperienceDetailsPageTimerModule = require(script.Parent.ExperienceDetailsPage.createExperienceDetailsPageTimer)
local GameDetailTelemetryModule = require(Parent.GameDetailTelemetry)
local EDPTTIManager = GameDetailTelemetryModule.EDPTTIManager
local FFlagEDPTTITrackingEnabled = GameDetailTelemetryModule.FFlagEDPTTITrackingEnabled
local EDPTTIConstants = GameDetailTelemetryModule.EDPTTIConstants

return function(p1, p2, ExtraProps, p3) --[[ Line: 49 ]]
	-- upvalues: FFlagSignalsNavP3fGameDetails (copy), AppNavigationRegistry (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), FFlagEDPTTITrackingEnabled (copy), FFlagFixSduiEdpTtiColdStart (copy), FFlagLuaAppSduiEdpEnabled (copy), FFlagEDPTTIParityDefinitions (copy), EDPTTIManager (copy), EDPTTIConstants (copy), FFlagFixSduiEdpTtiPeekCategory (copy), DisplayModule (copy), ResponsiveModule (copy), DeviceType (copy), CreateExperienceDetailsPageTimerModule (copy), GetExperienceDetailsPageKeyModule (copy), SduiSurfaceLoadTimeTracker (copy), CryoModule (copy), FetchGamePlayButtonData (copy), FetchExperienceDetailsPageModule (copy), FormFactor (copy), UseGameDetailsPeekViewModule (copy), AppPage (copy), PeekViewState (copy), SetGameDetailsPeekViewStateModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), FFlagSignalsNavP2NavigationPrimitives (copy), NavigateDownFunction (copy)
	return function(p4) --[[ Line: 50 ]]
		-- upvalues: FFlagSignalsNavP3fGameDetails (upval), AppNavigationRegistry (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), FFlagEDPTTITrackingEnabled (upval), FFlagFixSduiEdpTtiColdStart (upval), FFlagLuaAppSduiEdpEnabled (upval), FFlagEDPTTIParityDefinitions (upval), EDPTTIManager (upval), EDPTTIConstants (upval), FFlagFixSduiEdpTtiPeekCategory (upval), DisplayModule (upval), ResponsiveModule (upval), DeviceType (upval), CreateExperienceDetailsPageTimerModule (upval), GetExperienceDetailsPageKeyModule (upval), p1 (copy), SduiSurfaceLoadTimeTracker (upval), ExtraProps (ref), CryoModule (upval), p3 (copy), FetchGamePlayButtonData (upval), FetchExperienceDetailsPageModule (upval), FormFactor (upval), UseGameDetailsPeekViewModule (upval), AppPage (upval), PeekViewState (upval), SetGameDetailsPeekViewStateModule (upval), p2 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), FFlagSignalsNavP2NavigationPrimitives (upval), NavigateDownFunction (upval)
		local State = p4:getState()
		local FormFactor1 = State.FormFactor
		local ViewState = State.GameDetailsPeekView.viewState
		
		if FFlagSignalsNavP3fGameDetails then
			if AppNavigationRegistry.get().getIsNavigating() then return end
		elseif FFlagUseNavigationSelectors then
			if Selectors.selectNavigationLocked(State) then return end
		elseif State.Navigation.lockNavigationActions then return end
		if FFlagEDPTTITrackingEnabled and (not FFlagFixSduiEdpTtiColdStart or not FFlagLuaAppSduiEdpEnabled) then
			if FFlagEDPTTIParityDefinitions then
				EDPTTIManager.restartTracking(EDPTTIConstants.EDP_ENTRY_PATH.GAME_DETAIL_OPEN_GAME_DETAILS)
			else
				EDPTTIManager.startTracking(EDPTTIConstants.EDP_ENTRY_PATH.GAME_DETAIL_OPEN_GAME_DETAILS)
			end
		end
		if FFlagLuaAppSduiEdpEnabled then
			local SDUIPEEKVIEW = if FFlagFixSduiEdpTtiPeekCategory then if ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(false).getViewportSize(false), (ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false))) then EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW else EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE elseif State.DeviceType == DeviceType.Phone then EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW else EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
			local ExperienceDetailsPageTimerModule = if FFlagEDPTTIParityDefinitions then CreateExperienceDetailsPageTimerModule(GetExperienceDetailsPageKeyModule((tostring(p1))), {
				page = EDPTTIConstants.EDP_ENTRY_PATH.GAME_DETAIL_OPEN_GAME_DETAILS,
				category = SDUIPEEKVIEW
			}) else SduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(GetExperienceDetailsPageKeyModule((tostring(p1))), {
				manualSurfaceReady = true,
				eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
				metadata = {
					page = EDPTTIConstants.EDP_ENTRY_PATH.GAME_DETAIL_OPEN_GAME_DETAILS,
					category = SDUIPEEKVIEW
				}
			})
			ExtraProps = CryoModule.Dictionary.join(ExtraProps or {}, { pageTimer = ExperienceDetailsPageTimerModule })
			
			if p3 ~= nil then
				p4:dispatch(FetchGamePlayButtonData.Fetch(p3, (tostring(p1))))
			end
			FetchExperienceDetailsPageModule(tostring(p1), ExperienceDetailsPageTimerModule)
		end
		local JoinResult = nil
		if FormFactor1 == FormFactor.COMPACT and UseGameDetailsPeekViewModule() then
			JoinResult = {
				name = AppPage.GameDetail,
				detail = tostring(p1),
				extraProps = ExtraProps
			}
			
			if ViewState == PeekViewState.Full or ViewState == PeekViewState.Extended or ExtraProps and ExtraProps.mountAsFullView then
				JoinResult = CryoModule.Dictionary.join(JoinResult, {
					extraProps = CryoModule.Dictionary.join(JoinResult.extraProps or {}, { mountAsFullView = true })
				})
			else
				p4:dispatch(SetGameDetailsPeekViewStateModule(PeekViewState.Closed))
				p2.clearAppScreens({ AppPage.GameDetail })
			end
		else
			JoinResult = {
				name = AppPage.ExperienceDetail,
				detail = tostring(p1),
				extraProps = ExtraProps
			}
		end
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(JoinResult), FFlagSignalsNavP2NavigationPrimitives or nil)
			
			return
		else
			p4:dispatch(NavigateDownFunction(JoinResult, FFlagSignalsNavP2NavigationPrimitives or nil))
		end
	end
end