local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local virtualEventsModule = require(parent.VirtualEvents)
local eventsListCarousel = virtualEventsModule.EventsListCarousel
local enumsModule = require(profilePlatform.Common.Enums)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local cryoModule = require(parent.Cryo)
local _ = require(parent.Signals)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local launchGame = require(profilePlatform.Parent.GameLaunch).LaunchGame
local useNavigation = require(profilePlatform.Parent.Navigation).useNavigation
local _ = require(profilePlatform.Parent.GraphQLServer)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appGame = require(parent.RoactServiceTags).AppGame
local reactModule = require(parent.React)
local horizontalPageMargin = require(parent.UIBlox).App.Container.HorizontalPageMargin
local createGroupEventsStoreModule = require(profilePlatform.Stores.createGroupEventsStore)
local useSignalState = require(parent.SignalsReact).useSignalState
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagLuaAppSduiEventDetailsEnabled = require(parent.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled
local navigateToEventDetails = require(parent.VirtualEvents).navigateToEventDetails
local useApolloClient = require(parent.ApolloClient).useApolloClient
local roactNavigationModule = require(parent.RoactNavigation)
local eventsSkeletonModule = require(profilePlatform.Components.Events.EventsSkeleton)
local fFlagEnableCommunityProfileLoadingSkeletonsModule = require(profilePlatform.Flags.FFlagEnableCommunityProfileLoadingSkeletons)

return function(p0)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), useProfileWrapperContextModule (ref), useRoactService (ref), appGame (ref), useNavigation (ref), useApolloClient (ref), useProfileAnalyticsContextModule (ref), reactModule (ref), createGroupEventsStoreModule (ref), useSignalState (ref), eventNamesModule (ref), virtualEventsModule (ref), cryoModule (ref), fFlagLuaAppSduiEventDetailsEnabled (ref), navigateToEventDetails (ref), appPage (ref), launchGame (ref), fFlagEnableCommunityProfileLoadingSkeletonsModule (ref), horizontalPageMargin (ref), roactNavigationModule (ref), eventsSkeletonModule (ref), eventsListCarousel (ref)
	local var13 = useProfileJsonComponentModule(enumsModule.Components.Events)
	local var14 = tonumber(useProfileWrapperContextModule().profileId)
	local var15 = useRoactService(appGame)
	local var16 = useNavigation()
	local var17 = useApolloClient()
	local var18 = useProfileAnalyticsContextModule()
	local var19 = reactModule.useMemo(function()
		-- upvalues: createGroupEventsStoreModule (copy), var14 (ref)
		return createGroupEventsStoreModule(var14)
	end, { var14 })
	local var20 = useSignalState(var19.getEvents)
	local var21 = reactModule.useMemo(function()
		-- upvalues: var20 (ref), var13 (ref)
		local t = {}
		
		if var20 == nil then
			return t
		end
		local t_1 = {}
		
		for i, v in ipairs(var20) do
			t_1[v.id] = v
		end
		for i, v_1 in ipairs(if var13 then var13.events else {}) do
			local id = t_1[v_1.id]
			
			if id ~= nil then
				table.insert(t, id)
			end
		end
		return t
	end, { var20, var13 })
	
	return reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p0.layoutOrder
	}, {
		NavEvents = reactModule.createElement(roactNavigationModule.NavigationEvents, {
			onDidFocus = function()
				-- upvalues: var19 (ref)
				var19.refetch()
			end
		}),
		EventsCarousel = if fFlagEnableCommunityProfileLoadingSkeletonsModule and (if fFlagEnableCommunityProfileLoadingSkeletonsModule then useSignalState(var19.isLoading) else false) then reactModule.createElement(eventsSkeletonModule, { numSkeletons = #var13.events }) else reactModule.createElement(eventsListCarousel, {
			peekViewFormat = true,
			referralSource = "communityPeekView",
			virtualEvents = var21,
			onTileActivated = reactModule.useCallback(function(p1)
				-- upvalues: var18 (ref), eventNamesModule (copy), fFlagLuaAppSduiEventDetailsEnabled (copy), navigateToEventDetails (copy), var16 (ref), appPage (copy)
				var18.fireAnalyticsEvent(eventNamesModule.EventOpened, { virtualEventId = p1.id })
				
				if fFlagLuaAppSduiEventDetailsEnabled then
					navigateToEventDetails(var16, p1.id, tostring(p1.universeId))
					
					return
				end
				var16.navigate(appPage.EventDetails, {
					extraProps = { currentTime = DateTime.now(), virtualEventId = p1.id }
				})
			end, { var16 }),
			onRsvpChanged = reactModule.useCallback(function(p2, p3)
				-- upvalues: var18 (ref), eventNamesModule (copy), virtualEventsModule (copy), var19 (ref), var17 (ref), cryoModule (copy)
				var18.fireAnalyticsEvent(eventNamesModule.EventRSVP, { virtualEventId = p2.id, status = p3 })
				virtualEventsModule.fireVirtualEventRSVP({
					channel = "communityPeekView",
					virtualEventId = p2.id,
					universeId = tostring(p2.universeId),
					status = p3
				})
				var19.updateRsvpStatus(p2, p3)
				var17.cache:modify({
					id = "VirtualEvent:" .. p2.id,
					fields = {
						userRsvpStatus = function(_, _, _)
							-- upvalues: p3 (ref)
							return p3
						end,
						rsvpCounters = function(_, p4, _)
							-- upvalues: p3 (ref), cryoModule (copy)
							return cryoModule.Dictionary.join(p4, { going = p4.going + (if p3 == "going" then 1 else -1) })
						end
					}
				})
			end, { var19 }),
			onJoinEvent = reactModule.useCallback(function(p5)
				-- upvalues: var18 (ref), eventNamesModule (copy), virtualEventsModule (copy), launchGame (copy), var15 (ref)
				var18.fireAnalyticsEvent(eventNamesModule.EventJoined, { virtualEventId = p5.id })
				virtualEventsModule.fireVirtualEventJoined({
					channel = "communityPeekView",
					virtualEventId = p5.id,
					universeId = tostring(p5.universeId)
				})
				launchGame(p5.placeId, nil, { eventId = p5.id }, var15)
			end, {}),
			onEventImpression = reactModule.useCallback(function(p6)
				-- upvalues: virtualEventsModule (copy)
				virtualEventsModule.fireVirtualEventImpression({
					channel = "communityPeekView",
					virtualEventId = p6.id,
					universeId = p6.universeId
				})
			end, {}),
			universeId = if #var21 > 0 then tonumber(var21[1].universeId) or 0 else 0
		})
	})
end