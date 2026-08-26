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

return function(p1)
	-- upvalues: useQuery (ref), requestsModule (ref), getRetrievalStatusFromApolloQueryModule (ref), useLocalization (ref), fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule (ref), useUserExperiment (ref), appUserLayers (ref), reactModule (ref), loadingStateContainer (ref), retrievalStatus (ref), cryoModule (ref), foundationModule (ref), appStyleProvider (ref), eventDetailsVerticalPageModule (ref), eventDetailsPageModule (ref), fFlagLuaAppFixEventNotFoundErrorStateExitModule (ref), eventNotFoundModalModule (ref), emptyState (ref)
	local var1 = useQuery(requestsModule.GET_VIRTUAL_EVENT, { variables = { virtualEventId = p1.virtualEventId } })
	local var2 = getRetrievalStatusFromApolloQueryModule(var1)
	local var3 = useLocalization({ notFound = "Feature.VirtualEvents.EventNotFound" })
	
	if p1.mockNetworkStatus then
		var2 = p1.mockNetworkStatus
	end
	local var4 = nil
	local var5 = nil
	
	if fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule then
		local var6, var7 = useUserExperiment({ appUserLayers.CreatorSuccessVirtualEvents }, function(p2)
			-- upvalues: appUserLayers (copy)
			local creatorSuccessVirtualEvents = p2[appUserLayers.CreatorSuccessVirtualEvents] or {}
			
			return creatorSuccessVirtualEvents.EnableEventDetailsNewModal, creatorSuccessVirtualEvents.NotifyMeUseEmphasisVariant
		end, true)
		var4 = var6
		var5 = var7
	end
	return reactModule.createElement(loadingStateContainer, {
		dataStatus = retrievalStatus.fromRawValue(var2),
		renderOnLoaded = function()
			-- upvalues: cryoModule (copy), p1 (ref), var1 (ref), fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule (copy), var5 (write), var4 (write), reactModule (copy), foundationModule (copy), appStyleProvider (copy), eventDetailsVerticalPageModule (copy), eventDetailsPageModule (copy)
			local var8 = cryoModule.Dictionary.join(p1, {
				virtualEvent = var1.data.virtualEvent,
				virtualEventId = cryoModule.None,
				notifyMeUseEmphasisVariant = if fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule then var5 else false
			})
			
			return if if fFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule then var4 else false then reactModule.createElement(reactModule.Fragment, nil, {
				FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
					AppStyleProvider = reactModule.createElement(appStyleProvider, { style = { themeName = "dark" } }, {
						EventDetailsPage = reactModule.createElement(eventDetailsVerticalPageModule, var8)
					})
				})
			}) else reactModule.createElement(reactModule.Fragment, nil, {
				EventDetailsPage = reactModule.createElement(eventDetailsPageModule, var8)
			})
		end,
		renderOnFailed = function()
			-- upvalues: fFlagLuaAppFixEventNotFoundErrorStateExitModule (copy), reactModule (copy), eventNotFoundModalModule (copy), p1 (ref), emptyState (copy), var3 (ref)
			return if fFlagLuaAppFixEventNotFoundErrorStateExitModule then reactModule.createElement(eventNotFoundModalModule, { onClose = p1.onClose }) else reactModule.createElement(reactModule.Fragment, nil, {
				EventNotFound = reactModule.createElement(emptyState, { text = var3.notFound })
			})
		end
	})
end