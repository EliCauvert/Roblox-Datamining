local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local apolloClientModule = require(virtualEvents.Parent.ApolloClient)
local appUserLayers = require(virtualEvents.Parent.ExperimentLayers).AppUserLayers
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local useUserExperiment = require(virtualEvents.Parent.RoactAppExperiment).useUserExperiment
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local foundationModule = require(virtualEvents.Parent.Foundation)
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local eventDetailsPageModule = require(virtualEvents.Components.EventDetailsPage)
local eventDetailsVerticalPageModule = require(virtualEvents.Components.EventDetailsVerticalPage)
local eventNotFoundModalModule = require(virtualEvents.Components.EventNotFoundModal)
local requestsModule = require(virtualEvents.requests)
local getRetrievalStatusFromApolloQueryModule = require(virtualEvents.Common.getRetrievalStatusFromApolloQuery)
local useQuery = apolloClientModule.useQuery
local loadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local retrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local emptyState = UIBloxModule.App.Indicator.EmptyState
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule = require(virtualEvents.Flags.FFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperiment)
local fFlagLuaAppFixEventNotFoundErrorStateExitModule = require(virtualEvents.Flags.FFlagLuaAppFixEventNotFoundErrorStateExit)

return function(p0) --[[ line: 33 | named "EventDetailsPageLoader" ]]
	-- upvalues: useQuery (ref), requestsModule (ref), getRetrievalStatusFromApolloQueryModule (ref), useLocalization (ref), fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule (ref), useUserExperiment (ref), appUserLayers (ref), reactModule (ref), loadingStateContainer (ref), retrievalStatus (ref), cryoModule (ref), foundationModule (ref), appStyleProvider (ref), eventDetailsVerticalPageModule (ref), eventDetailsPageModule (ref), fFlagLuaAppFixEventNotFoundErrorStateExitModule (ref), eventNotFoundModalModule (ref), emptyState (ref)
	local var13 = useQuery(requestsModule.GET_VIRTUAL_EVENT, { variables = { virtualEventId = p0.virtualEventId } })
	local var14 = getRetrievalStatusFromApolloQueryModule(var13)
	local var15 = useLocalization({ notFound = "Feature.VirtualEvents.EventNotFound" })
	
	if p0.mockNetworkStatus then
		var14 = p0.mockNetworkStatus
	end
	local var16 = nil
	local var17 = nil
	
	if fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule then
		local var18, var19 = useUserExperiment({ appUserLayers.CreatorSuccessVirtualEvents }, function(p1) --[[ line: 54 ]]
			-- upvalues: appUserLayers (copy)
			local creatorSuccessVirtualEvents = p1[appUserLayers.CreatorSuccessVirtualEvents] or {}
			
			return creatorSuccessVirtualEvents.EnableEventDetailsNewModal, creatorSuccessVirtualEvents.NotifyMeUseEmphasisVariant
		end, true)
		var16 = var18
		var17 = var19
	end
	return reactModule.createElement(loadingStateContainer, {
		dataStatus = retrievalStatus.fromRawValue(var14),
		renderOnLoaded = function() --[[ line: 64 ]]
			-- upvalues: cryoModule (copy), p0 (ref), var13 (ref), fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule (copy), var17 (write), var16 (write), reactModule (copy), foundationModule (copy), appStyleProvider (copy), eventDetailsVerticalPageModule (copy), eventDetailsPageModule (copy)
			local var21 = cryoModule.Dictionary.join(p0, {
				virtualEvent = var13.data.virtualEvent,
				virtualEventId = cryoModule.None,
				notifyMeUseEmphasisVariant = if fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule then var17 else false
			})
			
			return if if fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule then var16 else false then reactModule.createElement(reactModule.Fragment, nil, {
				FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
					AppStyleProvider = reactModule.createElement(appStyleProvider, { style = { themeName = "dark" } }, {
						EventDetailsPage = reactModule.createElement(eventDetailsVerticalPageModule, var21)
					})
				})
			}) else reactModule.createElement(reactModule.Fragment, nil, {
				EventDetailsPage = reactModule.createElement(eventDetailsPageModule, var21)
			})
		end,
		renderOnFailed = function() --[[ line: 98 ]]
			-- upvalues: fFlagLuaAppFixEventNotFoundErrorStateExitModule (copy), reactModule (copy), eventNotFoundModalModule (copy), p0 (ref), emptyState (copy), var15 (ref)
			return if fFlagLuaAppFixEventNotFoundErrorStateExitModule then reactModule.createElement(eventNotFoundModalModule, { onClose = p0.onClose }) else reactModule.createElement(reactModule.Fragment, nil, {
				EventNotFound = reactModule.createElement(emptyState, { text = var15.notFound })
			})
		end
	})
end