local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(ProfilePlatform.Components.CTARow.Types)
local FoundationModule = require(Parent.Foundation)
local IconName = FoundationModule.Enums.IconName
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local NetworkingPresenceModule = require(ProfilePlatform.Networking.NetworkingPresence)
local NetworkStatus = require(ProfilePlatform.Networking.myRoduxNetworking).Enum.NetworkStatus
local UseProfileActionsModule = require(ProfilePlatform.Hooks.useProfileActions)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local FFlagEnableProfilePlatformDisabledActions = require(Parent.SharedFlags).FFlagEnableProfilePlatformDisabledActions
local FFlagEnableCommunityVerificationModalModule = require(ProfilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local FFlagPortEnableCommunityVerificationModalModule = require(ProfilePlatform.Flags.FFlagPortEnableCommunityVerificationModal)
local FFlagEnableProfilePlatformDisabledReasonTextModule = require(ProfilePlatform.Flags.FFlagEnableProfilePlatformDisabledReasonText)
local FFlagProfilePlatformAddCurrentlyPlayingModule = require(ProfilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local FFlagAddCTAButtonAnalyticsModule = require(ProfilePlatform.Flags.FFlagAddCTAButtonAnalytics)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)

local function profileMenuItemFromResolvedAction(Id, p1, ProfileType)
	local OnActivatedEntry = p1.onActivated[ProfileType]
	
	if OnActivatedEntry then
		return {
			id = Id,
			displayValue = { icon = p1.icon, text = p1.text },
			onActivated = OnActivatedEntry,
			isDisabled = p1.isDisabled
		}
	else
		warn("profileMenuItemFromResolvedAction: action not available for profile type", Id, ProfileType)
		
		return nil
	end
end

local function contextualMenuItemsFromJsonActions(Contextual, p1, ProfileType)
	-- upvalues: profileMenuItemFromResolvedAction (copy)
	local List = {}
	local Iterator = ipairs
	local Contextual1 = Contextual or {}
	for _, value in Iterator(Contextual1) do
		local config = { items = {} }
		local List1 = if type(value) == "table" then value else { value }
		for _, value1 in ipairs(List1) do
			local v1 = p1[value1]
			
			if v1 then
				local ProfileMenuItemFromResolvedActionResult = profileMenuItemFromResolvedAction(value1, v1, ProfileType)
				
				if ProfileMenuItemFromResolvedActionResult then
					table.insert(config.items, ProfileMenuItemFromResolvedActionResult)
				end
			end
		end
		if #config.items > 0 then
			table.insert(List, config)
		end
	end
	return List
end

local function _(List): boolean
	-- upvalues: EnumsModule (copy)
	for _, value in List do
		if value.type == EnumsModule.ProfileActions.JoinExperience then
			return true
		end
	end
	return false
end

return function(p2)
	-- upvalues: UseDispatchFunction (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), UseProfileActionsModule (copy), UseProfileWrapperContextModule (copy), FFlagAddCTAButtonAnalyticsModule (copy), UseProfileAnalyticsContextModule (copy), UseSelectorFunction (copy), NetworkingPresenceModule (copy), NetworkStatus (copy), FFlagProfilePlatformAddCurrentlyPlayingModule (copy), ReactModule (copy), UseEffectOnceFunction (copy), contextualMenuItemsFromJsonActions (copy), FFlagEnableProfilePlatformDisabledActions (copy), FFlagEnableCommunityVerificationModalModule (copy), FFlagPortEnableCommunityVerificationModalModule (copy), IconName (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), FFlagEnableProfilePlatformDisabledReasonTextModule (copy), ButtonVariant (copy), profileMenuItemFromResolvedAction (copy), EventNamesModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.Actions) or {}
	local UseProfileActionsModuleResult = UseProfileActionsModule(EnumsModule.ButtonSurface.Actions)
	local ProfileType = UseProfileWrapperContextModule().profileType
	local UseProfileAnalyticsContextModuleResult = if FFlagAddCTAButtonAnalyticsModule then UseProfileAnalyticsContextModule() else nil
	local UseSelectorResult = UseSelectorFunction(function(p3): boolean
		-- upvalues: NetworkingPresenceModule (upval), p2 (copy), NetworkStatus (upval)
		return NetworkingPresenceModule.GetPresencesFromUserIds.getStatus(p3, p2) == NetworkStatus.NotStarted
	end)
	
	if FFlagProfilePlatformAddCurrentlyPlayingModule then
		ReactModule.useEffect(function()
			-- upvalues: UseProfileJsonComponentModuleResult (copy), EnumsModule (upval), UseDispatchResult (copy), NetworkingPresenceModule (upval), p2 (copy)
			if UseProfileJsonComponentModuleResult.buttons then
				local Flag = false
				
				for _, button in UseProfileJsonComponentModuleResult.buttons do
					if button.type == EnumsModule.ProfileActions.JoinExperience then
						Flag = true
						break
					end
				end
				if Flag then
					UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API({ p2 }))
				end
			end
		end, {
			UseProfileJsonComponentModuleResult.buttons,
			UseDispatchResult,
			p2
		})
	else
		local function v41()
			-- upvalues: UseDispatchResult (copy), NetworkingPresenceModule (upval), p2 (copy)
			UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API({ p2 }))
		end
		
		local Flag = false
		
		if UseProfileJsonComponentModuleResult.buttons ~= nil then
			Flag = false
			
			for _, button in UseProfileJsonComponentModuleResult.buttons do
				if button.type == EnumsModule.ProfileActions.JoinExperience then
					Flag = true
					break
				end
			end
			if Flag then
				Flag = UseSelectorResult
			end
		end
		UseEffectOnceFunction(v41, Flag)
	end
	return (ReactModule.useMemo(function()
		-- upvalues: UseProfileJsonComponentModuleResult (copy), UseProfileActionsModuleResult (copy), contextualMenuItemsFromJsonActions (upval), ProfileType (copy), FFlagEnableProfilePlatformDisabledActions (upval), FFlagEnableCommunityVerificationModalModule (upval), EnumsModule (upval), FFlagPortEnableCommunityVerificationModalModule (upval), IconName (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownFunction (upval), FFlagEnableProfilePlatformDisabledReasonTextModule (upval), ButtonVariant (upval), profileMenuItemFromResolvedAction (upval), FFlagAddCTAButtonAnalyticsModule (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval)
		local List = {}
		local Iterator = ipairs
		local Buttons = UseProfileJsonComponentModuleResult.buttons or {}
		for _, value in Iterator(Buttons) do
			local UseProfileActionsModuleResultEntry = UseProfileActionsModuleResult[value.type]
			
			if not UseProfileActionsModuleResultEntry then
				warn("useMapJsonToButtonList: unrecognized action type", value.type)
				continue
			end
			local Copy = table.clone(UseProfileActionsModuleResultEntry)
			local ContextualMenuItemsFromJsonActionsResult = contextualMenuItemsFromJsonActions(value.subActions, UseProfileActionsModuleResult, ProfileType)
			
			if FFlagEnableProfilePlatformDisabledActions and value.disabledReason then
				if FFlagEnableCommunityVerificationModalModule and value.type == EnumsModule.ProfileActions.JoinCommunity and (value.disabledReason == EnumsModule.DisabledReasons.InsufficientVerificationLevelLow or value.disabledReason == EnumsModule.DisabledReasons.InsufficientVerificationLevelMedium or value.disabledReason == EnumsModule.DisabledReasons.InsufficientVerificationLevelHigh) then
					Copy.icon = if FFlagEnableCommunityVerificationModalModule and FFlagPortEnableCommunityVerificationModalModule then IconName.LockClosed else nil
					Copy.onActivated = {
						[ProfileType] = function()
							-- upvalues: EnumsModule (upval), value (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval)
							local config = {
								name = EnumsModule.Screens.CommunityVerificationModal,
								extraProps = { disabledReason = value.disabledReason }
							}
							
							return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config)) else UseDispatchResult(NavigateDownFunction(config))
						end
					}
				else
					Copy.isDisabled = true
					Copy.disabledReason = if FFlagEnableProfilePlatformDisabledReasonTextModule then value.disabledReason else nil
				end
			end
			local Variant = if #List == 0 and not Copy.isDisabled then Copy.variant or ButtonVariant.Emphasis else ButtonVariant.Standard
			local ProfileMenuItemFromResolvedActionResult = profileMenuItemFromResolvedAction(value.type, Copy, ProfileType)
			
			if ProfileMenuItemFromResolvedActionResult then
				table.insert(List, {
					contextualMenuItems = ContextualMenuItemsFromJsonActionsResult,
					menuItem = ProfileMenuItemFromResolvedActionResult,
					buttonStyle = Variant,
					isLoading = Copy.isLoading,
					disabledReason = Copy.disabledReason
				})
			end
		end
		local ContextualMenuItemsFromJsonActionsResult = contextualMenuItemsFromJsonActions(UseProfileJsonComponentModuleResult.contextual, UseProfileActionsModuleResult, ProfileType)
		
		if #ContextualMenuItemsFromJsonActionsResult > 0 then
			table.insert(List, {
				menuItem = {
					id = EnumsModule.ProfileActions.ContextualOverflow,
					displayValue = { icon = IconName.ThreeDotsHorizontal },
					onActivated = if FFlagAddCTAButtonAnalyticsModule then function()
						-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval)
						UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ContextualMenuButton)
					end else function() end
				},
				contextualMenuItems = ContextualMenuItemsFromJsonActionsResult,
				buttonStyle = ButtonVariant.Standard
			})
		end
		return List
	end, {
		UseProfileJsonComponentModuleResult.buttons,
		UseProfileJsonComponentModuleResult.contextual, UseProfileActionsModuleResult,
		UseDispatchResult, ProfileType, UseProfileAnalyticsContextModuleResult
	}))
end