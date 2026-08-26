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

return function(p1)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), useProfileWrapperContextModule (ref), useRoactService (ref), appGame (ref), useNavigation (ref), useApolloClient (ref), useProfileAnalyticsContextModule (ref), reactModule (ref), createGroupEventsStoreModule (ref), useSignalState (ref), eventNamesModule (ref), virtualEventsModule (ref), cryoModule (ref), fFlagLuaAppSduiEventDetailsEnabled (ref), navigateToEventDetails (ref), appPage (ref), launchGame (ref), fFlagEnableCommunityProfileLoadingSkeletonsModule (ref), horizontalPageMargin (ref), roactNavigationModule (ref), eventsSkeletonModule (ref), eventsListCarousel (ref)
	local var1 = useProfileJsonComponentModule(enumsModule.Components.Events)
	local var2 = tonumber(useProfileWrapperContextModule().profileId)
	local var3 = useRoactService(appGame)
	local var4 = useNavigation()
	local var5 = useApolloClient()
	local var6 = useProfileAnalyticsContextModule()
	local var7 = reactModule.useMemo(function()
		-- upvalues: createGroupEventsStoreModule (copy), var2 (ref)
		return createGroupEventsStoreModule(var2)
	end, { var2 })
	local var8 = useSignalState(var7.getEvents)
	local var9 = reactModule.useMemo(function()
		-- upvalues: var8 (ref), var1 (ref)
		local t = {}
		
		if var8 == nil then
			return t
		end
		local t_1 = {}
		
		for i, v in ipairs(var8) do
			t_1[v.id] = v
		end
		for i, v_1 in ipairs(if var1 then var1.events else {}) do
			local id = t_1[v_1.id]
			
			if id ~= nil then
				table.insert(t, id)
			end
		end
		return t
	end, { var8, var1 })
	
	return reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		size = UDim2.new(1, 0, 0, 0),
		layoutOrder = p1.layoutOrder
	}, {
		NavEvents = reactModule.createElement(roactNavigationModule.NavigationEvents, {
			onDidFocus = function()
				-- upvalues: var7 (ref)
				var7.refetch()
			end
		}),
		EventsCarousel = if fFlagEnableCommunityProfileLoadingSkeletonsModule and (if fFlagEnableCommunityProfileLoadingSkeletonsModule then useSignalState(var7.isLoading) else false) then reactModule.createElement(eventsSkeletonModule, { numSkeletons = #var1.events }) else reactModule.createElement(eventsListCarousel, {
			peekViewFormat = true,
			referralSource = "communityPeekView",
			virtualEvents = var9,
			onTileActivated = reactModule.useCallback(function(p2)
				-- upvalues: var6 (ref), eventNamesModule (copy), fFlagLuaAppSduiEventDetailsEnabled (copy), navigateToEventDetails (copy), var4 (ref), appPage (copy)
				var6.fireAnalyticsEvent(eventNamesModule.EventOpened, { virtualEventId = p2.id })
				
				if fFlagLuaAppSduiEventDetailsEnabled then
					navigateToEventDetails(var4, p2.id, tostring(p2.universeId))
					
					return
				end
				var4.navigate(appPage.EventDetails, {
					extraProps = { currentTime = DateTime.now(), virtualEventId = p2.id }
				})
			end, { var4 }),
			onRsvpChanged = reactModule.useCallback(function(p2, p3)
				-- upvalues: var6 (ref), eventNamesModule (copy), virtualEventsModule (copy), var7 (ref), var5 (ref), cryoModule (copy)
				var6.fireAnalyticsEvent(eventNamesModule.EventRSVP, { virtualEventId = p2.id, status = p3 })
				virtualEventsModule.fireVirtualEventRSVP({
					channel = "communityPeekView",
					virtualEventId = p2.id,
					universeId = tostring(p2.universeId),
					status = p3
				})
				var7.updateRsvpStatus(p2, p3)
				var5.cache:modify({
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
			end, { var7 }),
			onJoinEvent = reactModule.useCallback(function(p2)
				-- upvalues: var6 (ref), eventNamesModule (copy), virtualEventsModule (copy), launchGame (copy), var3 (ref)
				var6.fireAnalyticsEvent(eventNamesModule.EventJoined, { virtualEventId = p2.id })
				virtualEventsModule.fireVirtualEventJoined({
					channel = "communityPeekView",
					virtualEventId = p2.id,
					universeId = tostring(p2.universeId)
				})
				launchGame(p2.placeId, nil, { eventId = p2.id }, var3)
			end, {}),
			onEventImpression = reactModule.useCallback(function(p2)
				-- upvalues: virtualEventsModule (copy)
				virtualEventsModule.fireVirtualEventImpression({
					channel = "communityPeekView",
					virtualEventId = p2.id,
					universeId = p2.universeId
				})
			end, {}),
			universeId = if #var9 > 0 then tonumber(var9[1].universeId) or 0 else 0
		})
	})
end