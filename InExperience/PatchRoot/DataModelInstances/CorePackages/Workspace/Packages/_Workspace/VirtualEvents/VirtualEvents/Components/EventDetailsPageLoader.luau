local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local AppUserLayers = require(VirtualEvents.Parent.ExperimentLayers).AppUserLayers
local CryoModule = require(VirtualEvents.Parent.Cryo)
local ReactModule = require(VirtualEvents.Parent.React)
local UseUserExperimentFunction = require(VirtualEvents.Parent.RoactAppExperiment).useUserExperiment
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local FoundationModule = require(VirtualEvents.Parent.Foundation)
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local EventDetailsPageModule = require(VirtualEvents.Components.EventDetailsPage)
local EventDetailsVerticalPageModule = require(VirtualEvents.Components.EventDetailsVerticalPage)
local EventNotFoundModalModule = require(VirtualEvents.Components.EventNotFoundModal)
local RequestsModule = require(VirtualEvents.requests)
local GetRetrievalStatusFromApolloQueryModule = require(VirtualEvents.Common.getRetrievalStatusFromApolloQuery)
local UseQueryFunction = require(VirtualEvents.Parent.ApolloClient).useQuery
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local FFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule = require(VirtualEvents.Flags.FFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperiment)
local FFlagLuaAppFixEventNotFoundErrorStateExitModule = require(VirtualEvents.Flags.FFlagLuaAppFixEventNotFoundErrorStateExit)

return function(p1) --[[ Line: 33 | Named "EventDetailsPageLoader" ]]
	-- upvalues: UseQueryFunction (copy), RequestsModule (copy), GetRetrievalStatusFromApolloQueryModule (copy), UseLocalizationFunction (copy), FFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), ReactModule (copy), LoadingStateContainer (copy), RetrievalStatus (copy), CryoModule (copy), FoundationModule (copy), AppStyleProvider (copy), EventDetailsVerticalPageModule (copy), EventDetailsPageModule (copy), FFlagLuaAppFixEventNotFoundErrorStateExitModule (copy), EventNotFoundModalModule (copy), EmptyState (copy)
	local UseQueryResult = UseQueryFunction(RequestsModule.GET_VIRTUAL_EVENT, { variables = { virtualEventId = p1.virtualEventId } })
	local RetrievalStatusFromApolloQueryModule = GetRetrievalStatusFromApolloQueryModule(UseQueryResult)
	local UseLocalizationResult = UseLocalizationFunction({ notFound = "Feature.VirtualEvents.EventNotFound" })
	
	if p1.mockNetworkStatus then
		RetrievalStatusFromApolloQueryModule = p1.mockNetworkStatus
	end
	local v1 = nil
	local v2 = nil
	
	if FFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule then
		v1, v21 = UseUserExperimentFunction({ AppUserLayers.CreatorSuccessVirtualEvents }, function(p2) --[[ Line: 54 ]]
			-- upvalues: AppUserLayers (upval)
			local v3 = p2[AppUserLayers.CreatorSuccessVirtualEvents] or {}
			
			return v3.EnableEventDetailsNewModal, v3.NotifyMeUseEmphasisVariant
		end, true)
	end
	return ReactModule.createElement(LoadingStateContainer, {
		dataStatus = RetrievalStatus.fromRawValue(RetrievalStatusFromApolloQueryModule),
		renderOnLoaded = function() --[[ Line: 64 ]]
			-- upvalues: CryoModule (upval), p1 (copy), UseQueryResult (copy), FFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule (upval), v2 (ref), v1 (ref), ReactModule (upval), FoundationModule (upval), AppStyleProvider (upval), EventDetailsVerticalPageModule (upval), EventDetailsPageModule (upval)
			local JoinResult = CryoModule.Dictionary.join(p1, {
				virtualEvent = UseQueryResult.data.virtualEvent,
				virtualEventId = CryoModule.None,
				notifyMeUseEmphasisVariant = if FFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule then v2 else false
			})
			
			return if if FFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperimentModule then v1 else false then ReactModule.createElement(ReactModule.Fragment, nil, {
				FoundationProvider = ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
					AppStyleProvider = ReactModule.createElement(AppStyleProvider, { style = { themeName = "dark" } }, {
						EventDetailsPage = ReactModule.createElement(EventDetailsVerticalPageModule, JoinResult)
					})
				})
			}) else ReactModule.createElement(ReactModule.Fragment, nil, {
				EventDetailsPage = ReactModule.createElement(EventDetailsPageModule, JoinResult)
			})
		end,
		renderOnFailed = function() --[[ Line: 98 ]]
			-- upvalues: FFlagLuaAppFixEventNotFoundErrorStateExitModule (upval), ReactModule (upval), EventNotFoundModalModule (upval), p1 (copy), EmptyState (upval), UseLocalizationResult (copy)
			return if FFlagLuaAppFixEventNotFoundErrorStateExitModule then ReactModule.createElement(EventNotFoundModalModule, { onClose = p1.onClose }) else ReactModule.createElement(ReactModule.Fragment, nil, {
				EventNotFound = ReactModule.createElement(EmptyState, { text = UseLocalizationResult.notFound })
			})
		end
	})
end