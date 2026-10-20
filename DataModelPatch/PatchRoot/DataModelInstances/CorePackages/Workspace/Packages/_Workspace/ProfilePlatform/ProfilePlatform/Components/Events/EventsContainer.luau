local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local VirtualEventsModule = require(Parent.VirtualEvents)
local EventsListCarousel = VirtualEventsModule.EventsListCarousel
local EnumsModule = require(ProfilePlatform.Common.Enums)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.Signals)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local LaunchGameFunction = require(ProfilePlatform.Parent.GameLaunch).LaunchGame
local UseNavigationFunction = require(ProfilePlatform.Parent.Navigation).useNavigation
local _ = require(ProfilePlatform.Parent.GraphQLServer)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppGame = require(Parent.RoactServiceTags).AppGame
local ReactModule = require(Parent.React)
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin
local CreateGroupEventsStoreModule = require(ProfilePlatform.Stores.createGroupEventsStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local AppPage = require(Parent.RobloxAppEnums).AppPage
local FFlagLuaAppSduiEventDetailsEnabled = require(Parent.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled
local NavigateToEventDetailsFunction = require(Parent.VirtualEvents).navigateToEventDetails
local UseApolloClientFunction = require(Parent.ApolloClient).useApolloClient
local RoactNavigationModule = require(Parent.RoactNavigation)
local EventsSkeletonModule = require(ProfilePlatform.Components.Events.EventsSkeleton)
local FFlagEnableCommunityProfileLoadingSkeletonsModule = require(ProfilePlatform.Flags.FFlagEnableCommunityProfileLoadingSkeletons)

return function(p1)
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), UseProfileWrapperContextModule (copy), UseRoactServiceFunction (copy), AppGame (copy), UseNavigationFunction (copy), UseApolloClientFunction (copy), UseProfileAnalyticsContextModule (copy), ReactModule (copy), CreateGroupEventsStoreModule (copy), UseSignalStateFunction (copy), EventNamesModule (copy), VirtualEventsModule (copy), CryoModule (copy), FFlagLuaAppSduiEventDetailsEnabled (copy), NavigateToEventDetailsFunction (copy), AppPage (copy), LaunchGameFunction (copy), FFlagEnableCommunityProfileLoadingSkeletonsModule (copy), HorizontalPageMargin (copy), RoactNavigationModule (copy), EventsSkeletonModule (copy), EventsListCarousel (copy)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.Events)
	local Number: number? = tonumber(UseProfileWrapperContextModule().profileId)
	local UseRoactServiceResult = UseRoactServiceFunction(AppGame)
	local UseNavigationResult = UseNavigationFunction()
	local UseApolloClientResult = UseApolloClientFunction()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CreateGroupEventsStoreModule (upval), Number (copy)
		return CreateGroupEventsStoreModule(Number)
	end, { Number })
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.getEvents)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSignalStateResult (copy), UseProfileJsonComponentModuleResult (copy)
		local List = {}
		
		if UseSignalStateResult == nil then
			return List
		end
		local t = {}
		
		for _, value in ipairs(UseSignalStateResult) do
			t[value.id] = value
		end
		local Iterator = ipairs
		local Events = if UseProfileJsonComponentModuleResult then UseProfileJsonComponentModuleResult.events else {}
		for _, value1 in Iterator(Events) do
			local Entry = t[value1.id]
			
			if Entry ~= nil then
				table.insert(List, Entry)
			end
		end
		return List
	end, {
		UseSignalStateResult,
		UseProfileJsonComponentModuleResult
	})
	local Number1: number = #UseMemoResult1 > 0 and tonumber(UseMemoResult1[1].universeId) or 0
	local UseResult = ReactModule.useCallback(function(p2, Status)
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), VirtualEventsModule (upval), UseMemoResult (copy), UseApolloClientResult (copy), CryoModule (upval)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.EventRSVP, { virtualEventId = p2.id, status = Status })
		VirtualEventsModule.fireVirtualEventRSVP({
			channel = "communityPeekView",
			virtualEventId = p2.id,
			universeId = tostring(p2.universeId),
			status = Status
		})
		UseMemoResult.updateRsvpStatus(p2, Status)
		UseApolloClientResult.cache:modify({
			id = "VirtualEvent:" .. p2.id,
			fields = {
				userRsvpStatus = function(_, _, _)
					-- upvalues: Status (copy)
					return Status
				end,
				rsvpCounters = function(_, p3, _)
					-- upvalues: Status (copy), CryoModule (upval)
					return CryoModule.Dictionary.join(p3, { going = p3.going + (if Status == "going" then 1 else -1) })
				end
			}
		})
	end, { UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), FFlagLuaAppSduiEventDetailsEnabled (upval), NavigateToEventDetailsFunction (upval), UseNavigationResult (copy), AppPage (upval)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.EventOpened, { virtualEventId = p2.id })
		
		if FFlagLuaAppSduiEventDetailsEnabled then
			NavigateToEventDetailsFunction(UseNavigationResult, p2.id, (tostring(p2.universeId)))
			
			return
		else
			UseNavigationResult.navigate(AppPage.EventDetails, {
				extraProps = { currentTime = DateTime.now(), virtualEventId = p2.id }
			})
		end
	end, { UseNavigationResult })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), VirtualEventsModule (upval), LaunchGameFunction (upval), UseRoactServiceResult (copy)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.EventJoined, { virtualEventId = p2.id })
		VirtualEventsModule.fireVirtualEventJoined({
			channel = "communityPeekView",
			virtualEventId = p2.id,
			universeId = tostring(p2.universeId)
		})
		LaunchGameFunction(p2.placeId, nil, { eventId = p2.id }, UseRoactServiceResult)
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: VirtualEventsModule (upval)
		VirtualEventsModule.fireVirtualEventImpression({
			channel = "communityPeekView",
			virtualEventId = p2.id,
			universeId = p2.universeId
		})
	end, {})
	local UseSignalStateResult1 = if FFlagEnableCommunityProfileLoadingSkeletonsModule then UseSignalStateFunction(UseMemoResult.isLoading) else false
	
	return ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		NavEvents = ReactModule.createElement(RoactNavigationModule.NavigationEvents, {
			onDidFocus = function()
				-- upvalues: UseMemoResult (copy)
				UseMemoResult.refetch()
			end
		}),
		EventsCarousel = if FFlagEnableCommunityProfileLoadingSkeletonsModule and UseSignalStateResult1 then ReactModule.createElement(EventsSkeletonModule, {
			numSkeletons = #UseProfileJsonComponentModuleResult.events
		}) else ReactModule.createElement(EventsListCarousel, {
			peekViewFormat = true,
			referralSource = "communityPeekView",
			virtualEvents = UseMemoResult1,
			onTileActivated = UseResult1,
			onRsvpChanged = UseResult,
			onJoinEvent = UseResult2,
			onEventImpression = UseResult3,
			universeId = Number1
		})
	})
end