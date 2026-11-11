local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local SessionService = game:GetService("SessionService")
local GuiService = game:GetService("GuiService")
local Modules = script:FindFirstAncestor("Modules")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local IsSubjectToDesktopPoliciesFunction = require(CorePackages.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local UrlBuilder = require(CorePackages.Packages.UrlBuilder).UrlBuilder
local OpenGameDetailsModule = require(Modules.LuaApp.Thunks.OpenGameDetails)
local AppPageModule = require(Modules.LuaApp.AppPage)
local Default = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local SetGamePlaySessionFunction = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SetGamePlaySession
local VirtualEventsModule = require(CorePackages.Workspace.Packages.VirtualEvents)
local TransitionAnimationModule = require(Modules.LuaApp.Enum.TransitionAnimation)
local LaunchGameOnMountModule = require(script.Parent.LaunchGameOnMount)
local UseQueryFunction = require(CorePackages.Packages.ApolloClient).useQuery
local UseUserExperimentFunction = RoactAppExperimentModule.useUserExperiment
local UseIXPServiceFunction = RoactAppExperimentModule.useIXPService
local GetFFlagRemoveVirtualEventsExperimentFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFFlagRemoveVirtualEventsExperiment
local GetFFlagLuaAppEnableVirtualEventPlaceIdFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId
local FFlagLuaAppSduiEventDetailsLogExposure = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEventDetailsLogExposure
local FStringLuaAppSduiEventDetailsIxpLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringLuaAppSduiEventDetailsIxpLayer
local config = { referralSource = "link" }

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), ReactModule (copy), GuiService (copy), UseQueryFunction (copy), VirtualEventsModule (copy), GetFFlagLuaAppEnableVirtualEventPlaceIdFunction (copy), UseLocalizationFunction (copy), UseIXPServiceFunction (copy), GetFFlagRemoveVirtualEventsExperimentFunction (copy), UseUserExperimentFunction (copy), OpenGameDetailsModule (copy), Default (copy), UrlBuilder (copy), IsSubjectToDesktopPoliciesFunction (copy), AppPageModule (copy), SetGamePlaySessionFunction (copy), SessionService (copy), SessionType (copy), FFlagLuaAppSduiEventDetailsLogExposure (copy), IXPService (copy), FStringLuaAppSduiEventDetailsIxpLayer (copy), TransitionAnimationModule (copy), LaunchGameOnMountModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(true)
	local SafeZoneOffsets = GuiService:GetSafeZoneOffsets()
	local UseQueryResult = UseQueryFunction(VirtualEventsModule.requests.GET_VIRTUAL_EVENT, {
		variables = { virtualEventId = JoinResult.virtualEventId }
	})
	local VirtualEvent = if UseQueryResult.data then UseQueryResult.data.virtualEvent else nil
	local Text = if VirtualEvent and VirtualEvent.universeId then tostring(VirtualEvent.universeId) else nil
	local Text1 = if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() and VirtualEvent and VirtualEvent.placeId then tostring(VirtualEvent.placeId) else nil
	local Playing = if VirtualEvent then VirtualEvent.experienceDetails.playing else 0
	local UseLocalizationResult = UseLocalizationFunction({ hostTitle = "Feature.GameDetails.Label.Developer" })
	local UseIXPServiceResult = UseIXPServiceFunction()
	local UseUserExperimentResult = if GetFFlagRemoveVirtualEventsExperimentFunction() then nil else UseUserExperimentFunction({ "Ecosystems.EventsOnExperienceDetailsPage" }, function(p2)
		local EcosystemsEventsOnExperienceDetailsPage = p2["Ecosystems.EventsOnExperienceDetailsPage"]
		
		return if EcosystemsEventsOnExperienceDetailsPage then EcosystemsEventsOnExperienceDetailsPage.virtualEventsMVPEnabled else nil
	end, false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Text (copy), UseDispatchResult (copy), OpenGameDetailsModule (upval)
		if Text then
			UseDispatchResult(OpenGameDetailsModule(Text))
		end
	end, { Text })
	local UseResult2 = ReactModule.useCallback(function(Url)
		-- upvalues: Default (upval)
		if Default then
			Default:shareUrl({ context = "eventDetailsPage", url = Url })
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function(VirtualEventLink)
		-- upvalues: Text (copy), VirtualEventsModule (upval), JoinResult (copy), Playing (copy)
		if Text then
			VirtualEventsModule.fireVirtualEventLinkCopied({
				virtualEventId = JoinResult.virtualEventId,
				virtualEventLink = VirtualEventLink,
				universeId = Text,
				attendanceCount = Playing
			})
		end
	end, { JoinResult.virtualEventId, Text, Playing })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: Text (copy), VirtualEventsModule (upval), JoinResult (copy), Playing (copy), UrlBuilder (upval), IsSubjectToDesktopPoliciesFunction (upval), UseNavigationResult (copy), AppPageModule (upval), UseResult3 (copy), Default (upval), UseResult2 (copy)
		if Text then
			VirtualEventsModule.fireShareVirtualEventIconClicked({
				channel = "eventDetailsPage",
				virtualEventId = JoinResult.virtualEventId,
				universeId = Text,
				attendanceCount = Playing
			})
			local AppsflyerResult = UrlBuilder.virtualevents.appsflyer({ eventId = JoinResult.virtualEventId })
			
			if IsSubjectToDesktopPoliciesFunction() then
				UseNavigationResult.navigate(AppPageModule.ShareVirtualEventModal, {
					extraProps = {
						virtualEventId = JoinResult.virtualEventId,
						onCopy = function()
							-- upvalues: UseResult3 (upval), AppsflyerResult (copy), Default (upval)
							UseResult3(AppsflyerResult)
							
							if Default then
								Default:shareUrl({ context = "eventDetailsPage", url = AppsflyerResult })
							end
						end
					}
				})
				
				return
			end
			UseResult2(AppsflyerResult)
		end
	end, { JoinResult.virtualEventId, Text, Playing })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(true)
	end, {})
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: SetGamePlaySessionFunction (upval), SessionService (upval), SessionType (upval), VirtualEventsModule (upval), VirtualEvent (copy), Playing (copy)
		SetGamePlaySessionFunction(SessionService, SessionType.StructuralIdentifier.GamePlayFromEventDetails, true)
		VirtualEventsModule.fireVirtualEventJoined({
			channel = "eventDetailsPage",
			virtualEventId = VirtualEvent.id,
			universeId = tostring(VirtualEvent.universeId),
			attendanceCount = Playing
		})
	end, { VirtualEvent, Playing })
	local UseResult7 = ReactModule.useCallback(function(Status, p2)
		-- upvalues: VirtualEventsModule (upval), VirtualEvent (copy), Playing (copy), GetFFlagRemoveVirtualEventsExperimentFunction (upval), UseNavigationResult (copy), AppPageModule (upval), UseIXPServiceResult (copy), UseUserExperimentResult (copy)
		VirtualEventsModule.fireVirtualEventRSVP({
			channel = "eventDetailsPage",
			virtualEventId = VirtualEvent.id,
			universeId = tostring(VirtualEvent.universeId),
			status = Status,
			attendanceCount = Playing
		})
		
		if p2 then
			if GetFFlagRemoveVirtualEventsExperimentFunction() then
				UseNavigationResult.navigate(AppPageModule.EventNotificationsModal, {
					extraProps = {
						channel = "eventDetailsPage",
						virtualEvent = VirtualEvent
					}
				})
				
				return
			end
			UseIXPServiceResult:LogUserLayerExposure("Ecosystems.EventsOnExperienceDetailsPage")
			
			if UseUserExperimentResult then
				UseNavigationResult.navigate(AppPageModule.EventNotificationsModal, {
					extraProps = {
						channel = "eventDetailsPage",
						virtualEvent = VirtualEvent
					}
				})
			end
		end
	end, {
		VirtualEvent,
		UseNavigationResult,
		Playing,
		UseUserExperimentResult,
		UseIXPServiceResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), VirtualEvent (copy), VirtualEventsModule (upval), JoinResult (copy)
		if UseRefResult.current and VirtualEvent then
			VirtualEventsModule.fireEventDetailsPageVisit({
				virtualEventId = VirtualEvent.id,
				universeId = tostring(VirtualEvent.universeId),
				channel = JoinResult.referralSource
			})
			UseRefResult.current = false
		end
	end, { VirtualEvent })
	ReactModule.useEffect(function()
		-- upvalues: JoinResult (copy), FFlagLuaAppSduiEventDetailsLogExposure (upval), IXPService (upval), FStringLuaAppSduiEventDetailsIxpLayer (upval)
		if JoinResult.virtualEventId and FFlagLuaAppSduiEventDetailsLogExposure then
			IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppSduiEventDetailsIxpLayer)
		end
	end, { JoinResult.virtualEventId })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		GameLauncher = if UseStateResult and Text then ReactModule.createElement(LaunchGameOnMountModule, {
			launchSource = "eventDetailsPage",
			universeId = Text,
			placeId = if GetFFlagLuaAppEnableVirtualEventPlaceIdFunction() then Text1 else nil,
			referralSource = JoinResult.referralSource,
			onGameLaunching = UseResult6,
			experienceJoinData = { eventId = JoinResult.virtualEventId }
		}) else nil,
		Wrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			SelectionGroup = true,
			Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, SafeZoneOffsets.top),
			Position = UDim2.fromOffset(0, SafeZoneOffsets.top),
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop
		}, {
			EventDetailsPageLoader = ReactModule.createElement(VirtualEventsModule.EventDetailsPageLoader, {
				virtualEventId = JoinResult.virtualEventId,
				currentTime = DateTime.now(),
				onClose = UseResult,
				onShare = UseResult4,
				onRsvpChanged = UseResult7,
				onJoinEvent = UseResult5,
				onExperienceTileActivated = UseResult1,
				onHostActivated = ReactModule.useCallback(function(p2)
					-- upvalues: UseNavigationResult (copy), AppPageModule (upval), UrlBuilder (upval), UseLocalizationResult (copy), TransitionAnimationModule (upval)
					UseNavigationResult.navigate(AppPageModule.GenericWebPage, {
						detail = UrlBuilder.game.info.creator({
							creatorType = if p2.hostType == "group" then "Group" else "User",
							creatorId = p2.hostId
						}),
						extraProps = {
							title = UseLocalizationResult.hostTitle,
							transitionAnimation = TransitionAnimationModule.SlideInFromRight
						}
					})
				end, { UseNavigationResult, UseLocalizationResult })
			})
		})
	})
end