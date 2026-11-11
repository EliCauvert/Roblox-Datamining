local CorePackages = game:GetService("CorePackages")
local AppPageModule = require(script:FindFirstAncestor("Modules").LuaApp.AppPage)
local ApolloClientModule = require(CorePackages.Packages.ApolloClient)
local CryoModule = require(CorePackages.Packages.Cryo)
local DataHydrationModule = require(CorePackages.Workspace.Packages.DataHydration)
local _ = require(CorePackages.Workspace.Packages.GraphQLServer)
local LaunchGameOnMountModule = require(script.Parent.LaunchGameOnMount)
local NavigationModule = require(CorePackages.Workspace.Packages.Navigation)
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local UseNavigationFunction = NavigationModule.useNavigation
local UseNavigationFocusFunction = NavigationModule.useNavigationFocus
local VirtualEventsModule = require(CorePackages.Workspace.Packages.VirtualEvents)
local EventsListCarousel = VirtualEventsModule.EventsListCarousel
local UseQueryFunction = ApolloClientModule.useQuery
local UseMutationFunction = ApolloClientModule.useMutation
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagLuaAppEnableVirtualEventPlaceIdFunction = SharedFlagsModule.GetFFlagLuaAppEnableVirtualEventPlaceId
local FFlagLuaAppSduiEventDetailsEnabled = SharedFlagsModule.FFlagLuaAppSduiEventDetailsEnabled
local config = { pollInterval = 300000 }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseNavigationFunction (copy), ReactModule (copy), UseQueryFunction (copy), VirtualEventsModule (copy), UseMutationFunction (copy), FFlagLuaAppSduiEventDetailsEnabled (copy), DataHydrationModule (copy), AppPageModule (copy), CorePackages (copy), UseNavigationFocusFunction (copy), SignalsModule (copy), LaunchGameOnMountModule (copy), GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (copy), EventsListCarousel (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseNavigationResult = UseNavigationFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseQueryResult = UseQueryFunction(VirtualEventsModule.requests.GET_EVENTS_FOR_EXPERIENCE, {
		variables = {
			universeId = JoinResult.universeId,
			options = {
				fromUtc = ReactModule.useMemo(function()
					return DateTime.now()
				end, {}):ToIsoDate()
			}
		},
		pollInterval = JoinResult.pollInterval
	})
	local UseMutationResult = UseMutationFunction(VirtualEventsModule.requests.UPDATE_RSVP_STATUS, {
		update = function(_, p2, p3)
			-- upvalues: CryoModule (upval)
			local VirtualEvent = p3.data.virtualEventRsvp.virtualEvent
			p2:modify({
				id = p2:identify(VirtualEvent),
				fields = {
					rsvpCounters = function(_, p4)
						-- upvalues: VirtualEvent (copy), CryoModule (upval)
						return CryoModule.Dictionary.join(p4, {
							going = p4.going + (if VirtualEvent.userRsvpStatus == "going" then 1 else -1)
						})
					end
				}
			})
		end
	})
	local UseResult = ReactModule.useCallback(function(VirtualEvent, RsvpStatus)
		-- upvalues: VirtualEventsModule (upval), JoinResult (copy), UseMutationResult (copy), FFlagLuaAppSduiEventDetailsEnabled (upval), DataHydrationModule (upval), UseNavigationResult (copy), AppPageModule (upval)
		VirtualEventsModule.fireVirtualEventRSVP({
			virtualEventId = VirtualEvent.id,
			universeId = tostring(VirtualEvent.universeId),
			channel = JoinResult.referralSource,
			status = RsvpStatus,
			attendanceCount = if VirtualEvent and VirtualEvent.experienceDetails then VirtualEvent.experienceDetails.playing else 0
		})
		UseMutationResult[1]({
			variables = {
				virtualEventId = VirtualEvent.id,
				rsvpStatus = RsvpStatus
			}
		}):andThen(function(Result)
			-- upvalues: FFlagLuaAppSduiEventDetailsEnabled (upval), VirtualEvent (copy), DataHydrationModule (upval), RsvpStatus (copy), UseNavigationResult (upval), AppPageModule (upval), JoinResult (upval)
			if FFlagLuaAppSduiEventDetailsEnabled and VirtualEvent then
				local ExperienceEventInfoStore = DataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false)
				local ExperienceEventInfo = ExperienceEventInfoStore.getExperienceEventInfo(VirtualEvent.id)
				local DataResult = ExperienceEventInfo and ExperienceEventInfo.data(false)
				
				if DataResult ~= nil then
					local IsGoing = RsvpStatus == "going"
					local RsvpCount = DataResult.rsvpCount
					ExperienceEventInfoStore.updateExperienceEventInfo(VirtualEvent.id, {
						id = VirtualEvent.id,
						userRsvp = IsGoing,
						rsvpCount = if RsvpCount == nil then nil else RsvpCount + (if IsGoing then 1 else -1)
					})
				end
			end
			if Result.data.virtualEventRsvp.shouldSeeNotificationsUpsellModal then
				UseNavigationResult.navigate(AppPageModule.EventNotificationsModal, {
					extraProps = {
						virtualEvent = VirtualEvent,
						channel = JoinResult.referralSource
					}
				})
			end
		end)
	end, { JoinResult.referralSource })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: FFlagLuaAppSduiEventDetailsEnabled (upval), CorePackages (upval), UseNavigationResult (copy), AppPageModule (upval), JoinResult (copy)
		if FFlagLuaAppSduiEventDetailsEnabled then
			require(CorePackages.Workspace.Packages.VirtualEvents).navigateToEventDetails(UseNavigationResult, p2.id, (tostring(p2.universeId)))
			
			return
		else
			UseNavigationResult.navigate(AppPageModule.EventDetails, {
				extraProps = {
					currentTime = DateTime.now(),
					virtualEventId = p2.id,
					referralSource = JoinResult.referralSource
				}
			})
		end
	end, { UseNavigationResult })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: VirtualEventsModule (upval), JoinResult (copy)
		VirtualEventsModule.fireVirtualEventImpression({
			virtualEventId = p2.id,
			universeId = p2.universeId,
			channel = JoinResult.referralSource
		})
	end, { JoinResult.referralSource })
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: VirtualEventsModule (upval), UseStateResult (copy), JoinResult (copy)
		VirtualEventsModule.fireVirtualEventJoined({
			virtualEventId = UseStateResult.id,
			universeId = tostring(UseStateResult.universeId),
			channel = JoinResult.referralSource,
			attendanceCount = if UseStateResult and UseStateResult.experienceDetails then UseStateResult.experienceDetails.playing else 0
		})
	end, { UseStateResult })
	local v1: boolean? = nil
	
	if FFlagLuaAppSduiEventDetailsEnabled then
		v1 = not UseNavigationFocusFunction()
		local UseRefResult = ReactModule.useRef(UseQueryResult.refetch)
		UseRefResult.current = UseQueryResult.refetch
		ReactModule.useEffect(function()
			-- upvalues: UseQueryResult (copy), DataHydrationModule (upval), SignalsModule (upval), UseRefResult (copy)
			local VirtualEvents = UseQueryResult.data and (UseQueryResult.data.virtualEventsByUniverseId and UseQueryResult.data.virtualEventsByUniverseId.virtualEvents)
			
			if not VirtualEvents then return end
			local ExperienceEventInfoStore = DataHydrationModule.ExperienceEvents.getExperienceEventInfoStore(false)
			local Effect = SignalsModule.createEffect(function(p2)
				-- upvalues: VirtualEvents (copy), ExperienceEventInfoStore (copy), UseRefResult (upval)
				for _, virtualEvent in VirtualEvents do
					local DataResult = ExperienceEventInfoStore.getExperienceEventInfo(virtualEvent.id).data(p2)
					
					if DataResult ~= nil and DataResult.userRsvp == true ~= (virtualEvent.userRsvpStatus == "going") then
						local Current = UseRefResult.current
						
						if Current then
							task.defer(Current)
						end
						break
					end
				end
			end)
			
			return function()
				-- upvalues: Effect (copy)
				Effect()
			end
		end, { UseQueryResult.data, JoinResult.universeId })
	end
	return if UseQueryResult.data then ReactModule.createElement(ReactModule.Fragment, nil, {
		GameLauncher = if UseStateResult then ReactModule.createElement(LaunchGameOnMountModule, {
			universeId = tostring(UseStateResult.universeId),
			placeId = if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() and UseStateResult.placeId then tostring(UseStateResult.placeId) else nil,
			launchSource = JoinResult.referralSource,
			referralSource = JoinResult.referralSource,
			onGameLaunching = UseResult4,
			experienceJoinData = { eventId = UseStateResult.id }
		}) else nil,
		EventsCarousel = ReactModule.createElement(EventsListCarousel, {
			layoutOrder = JoinResult.layoutOrder,
			virtualEvents = UseQueryResult.data.virtualEventsByUniverseId.virtualEvents,
			onTileActivated = UseResult1,
			onRsvpChanged = UseResult,
			onJoinEvent = UseResult3,
			onEventImpression = UseResult2,
			defaultThumbnail = JoinResult.defaultThumbnail,
			peekViewFormat = JoinResult.peekViewFormat,
			referralSource = JoinResult.referralSource,
			universeId = JoinResult.universeId,
			suppressRsvpReminderToastBecauseEventDetailsFocused = if FFlagLuaAppSduiEventDetailsEnabled then v1 else nil
		})
	}) else nil
end