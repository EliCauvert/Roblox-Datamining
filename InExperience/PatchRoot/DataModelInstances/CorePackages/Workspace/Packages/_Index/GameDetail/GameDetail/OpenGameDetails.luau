local gameDetail = script:FindFirstAncestor("GameDetail")
local setGameDetailsPeekViewStateModule = require(gameDetail.PeekView.SetGameDetailsPeekViewState)
local useGameDetailsPeekViewModule = require(gameDetail.PeekView.UseGameDetailsPeekView)
local parent = gameDetail.Parent
local cryoModule = require(parent.Cryo)
local appPage = require(parent.RobloxAppEnums).AppPage
local formFactor = require(parent.FormFactor).Enums.FormFactor
local peekViewState = require(parent.PeekView).PeekViewState
local navigationRoduxModule = require(parent.NavigationRodux)
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local selectors = navigationRoduxModule.Selectors
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSignalsNavP2NavigationPrimitives = sharedFlagsModule.FFlagSignalsNavP2NavigationPrimitives
local fFlagSignalsNavP3fGameDetails = sharedFlagsModule.FFlagSignalsNavP3fGameDetails
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local fFlagUseNavigationSelectors = sharedFlagsModule.FFlagUseNavigationSelectors
local fFlagLuaAppSduiEdpEnabled = sharedFlagsModule.FFlagLuaAppSduiEdpEnabled
local fFlagSduiEdpPrefetchPlayability = sharedFlagsModule.FFlagSduiEdpPrefetchPlayability
local fFlagFixSduiEdpTtiPeekCategory = sharedFlagsModule.FFlagFixSduiEdpTtiPeekCategory
local fFlagFixSduiEdpTtiColdStart = sharedFlagsModule.FFlagFixSduiEdpTtiColdStart
local robloxAppNavigationModule = require(parent.RobloxAppNavigation)
local var1 = if fFlagSignalsNavP3Dispatch then robloxAppNavigationModule.NavigationCommands else nil
local var2 = if fFlagSignalsNavP3fGameDetails then robloxAppNavigationModule.AppNavigationRegistry else nil
local sduiSurfaceLoadTimeTracker = require(parent.SduiSharedUtilities).SduiSurfaceLoadTimeTracker
local deviceType = require(parent.RobloxAppEnums).DeviceType
local fetchGamePlayButtonData = require(parent.GamePlayButton).FetchGamePlayButtonData
local displayModule = require(parent.Display)
local responsiveModule = require(parent.Responsive)
local fetchExperienceDetailsPageModule = require(script.Parent.ExperienceDetailsPage.fetchExperienceDetailsPage)
local getExperienceDetailsPageKeyModule = require(script.Parent.ExperienceDetailsPage.getExperienceDetailsPageKey)
local gameDetailTelemetryModule = require(parent.GameDetailTelemetry)
local EDPTTIManager = gameDetailTelemetryModule.EDPTTIManager
local fFlagEDPTTITrackingEnabled = gameDetailTelemetryModule.FFlagEDPTTITrackingEnabled
local EDPTTIConstants = gameDetailTelemetryModule.EDPTTIConstants

return function(p1, p2, p3, p4)
	-- upvalues: fFlagSignalsNavP3fGameDetails (ref), var2 (ref), fFlagUseNavigationSelectors (ref), selectors (ref), fFlagEDPTTITrackingEnabled (ref), fFlagFixSduiEdpTtiColdStart (ref), fFlagLuaAppSduiEdpEnabled (ref), EDPTTIManager (ref), EDPTTIConstants (ref), fFlagFixSduiEdpTtiPeekCategory (ref), displayModule (ref), responsiveModule (ref), deviceType (ref), sduiSurfaceLoadTimeTracker (ref), getExperienceDetailsPageKeyModule (ref), cryoModule (ref), fFlagSduiEdpPrefetchPlayability (ref), fetchGamePlayButtonData (ref), fetchExperienceDetailsPageModule (ref), formFactor (ref), useGameDetailsPeekViewModule (ref), appPage (ref), peekViewState (ref), setGameDetailsPeekViewStateModule (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), fFlagSignalsNavP2NavigationPrimitives (ref), navigateDown (ref)
	return function(p5)
		-- upvalues: fFlagSignalsNavP3fGameDetails (copy), var2 (copy), fFlagUseNavigationSelectors (copy), selectors (copy), fFlagEDPTTITrackingEnabled (copy), fFlagFixSduiEdpTtiColdStart (copy), fFlagLuaAppSduiEdpEnabled (copy), EDPTTIManager (copy), EDPTTIConstants (copy), fFlagFixSduiEdpTtiPeekCategory (copy), displayModule (copy), responsiveModule (copy), deviceType (copy), sduiSurfaceLoadTimeTracker (copy), getExperienceDetailsPageKeyModule (copy), p1 (ref), p3 (write), cryoModule (copy), fFlagSduiEdpPrefetchPlayability (copy), p4 (ref), fetchGamePlayButtonData (copy), fetchExperienceDetailsPageModule (copy), formFactor (copy), useGameDetailsPeekViewModule (copy), appPage (copy), peekViewState (copy), setGameDetailsPeekViewStateModule (copy), p2 (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), fFlagSignalsNavP2NavigationPrimitives (copy), navigateDown (copy)
		local state = p5:getState()
		local formFactor_1 = state.FormFactor
		local viewState = state.GameDetailsPeekView.viewState
		
		if fFlagSignalsNavP3fGameDetails then
			if var2.get().getIsNavigating() then return end
		elseif fFlagUseNavigationSelectors then
			if selectors.selectNavigationLocked(state) then return end
		elseif state.Navigation.lockNavigationActions then return end
		if fFlagEDPTTITrackingEnabled and (not fFlagFixSduiEdpTtiColdStart or not fFlagLuaAppSduiEdpEnabled) then
			EDPTTIManager.startTracking(EDPTTIConstants.EDP_ENTRY_PATH.GAME_DETAIL_OPEN_GAME_DETAILS)
		end
		if fFlagLuaAppSduiEdpEnabled then
			local var3 = sduiSurfaceLoadTimeTracker.createLoadTimerWithSurfaceLoadTime(getExperienceDetailsPageKeyModule(tostring(p1)), {
				manualSurfaceReady = true,
				eventName = EDPTTIConstants.EDP_TTI_EVENT_NAME,
				metadata = {
					page = EDPTTIConstants.EDP_ENTRY_PATH.GAME_DETAIL_OPEN_GAME_DETAILS,
					category = if fFlagFixSduiEdpTtiPeekCategory then if responsiveModule.getIsCompactTouch(displayModule.GetDisplayStore(false).getViewportSize(false), responsiveModule.GetInputModeStore(false).getPreferredInputType(false)) then EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW else EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE elseif state.DeviceType == deviceType.Phone then EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_PEEK_VIEW else EDPTTIConstants.EDP_IMPLEMENTATION.SDUI_FULL_PAGE
				}
			})
			p3 = cryoModule.Dictionary.join(p3 or {}, { pageTimer = var3 })
			
			if fFlagSduiEdpPrefetchPlayability and p4 ~= nil then
				p5:dispatch(fetchGamePlayButtonData.Fetch(p4, tostring(p1)))
			end
			fetchExperienceDetailsPageModule(tostring(p1), var3)
		end
		local t
		local _ = nil
		
		if formFactor_1 == formFactor.COMPACT and useGameDetailsPeekViewModule() then
			t = {
				name = appPage.GameDetail,
				detail = tostring(p1),
				extraProps = p3
			}
			
			if viewState == peekViewState.Full or viewState == peekViewState.Extended or p3 and p3.mountAsFullView then
				t = cryoModule.Dictionary.join(t, {
					extraProps = cryoModule.Dictionary.join(t.extraProps or {}, { mountAsFullView = true })
				})
			else
				p5:dispatch(setGameDetailsPeekViewStateModule(peekViewState.Closed))
				p2.clearAppScreens({ appPage.GameDetail })
			end
		else
			t = {
				name = appPage.ExperienceDetail,
				detail = tostring(p1),
				extraProps = p3
			}
		end
		if fFlagSignalsNavP3Dispatch then
			var1.down(var1.fromLegacyPage(t), fFlagSignalsNavP2NavigationPrimitives or nil)
			
			return
		end
		p5:dispatch(navigateDown(t, fFlagSignalsNavP2NavigationPrimitives or nil))
	end
end