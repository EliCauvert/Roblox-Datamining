local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local _ = require(profilePlatform.Components.CTARow.Types)
local foundationModule = require(parent.Foundation)
local iconName = foundationModule.Enums.IconName
local buttonVariant = foundationModule.Enums.ButtonVariant
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffectOnce = roactUtilsModule.Hooks.useEffectOnce
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var4 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local networkingPresenceModule = require(profilePlatform.Networking.NetworkingPresence)
local networkStatus = require(profilePlatform.Networking.myRoduxNetworking).Enum.NetworkStatus
local useProfileActionsModule = require(profilePlatform.Hooks.useProfileActions)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local enumsModule = require(profilePlatform.Common.Enums)
local fFlagEnableProfilePlatformDisabledActions = require(parent.SharedFlags).FFlagEnableProfilePlatformDisabledActions
local fFlagEnableCommunityVerificationModalModule = require(profilePlatform.Flags.FFlagEnableCommunityVerificationModal)
local fFlagPortEnableCommunityVerificationModalModule = require(profilePlatform.Flags.FFlagPortEnableCommunityVerificationModal)
local fFlagEnableProfilePlatformDisabledReasonTextModule = require(profilePlatform.Flags.FFlagEnableProfilePlatformDisabledReasonText)
local fFlagProfilePlatformAddCurrentlyPlayingModule = require(profilePlatform.Flags.FFlagProfilePlatformAddCurrentlyPlaying)
local fFlagAddCTAButtonAnalyticsModule = require(profilePlatform.Flags.FFlagAddCTAButtonAnalytics)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)

local function profileMenuItemFromResolvedAction(p0, p1, p2) --[[ line: 47 ]]
	local var19 = p1.onActivated[p2]
	
	if var19 then
		return {
			id = p0,
			displayValue = { icon = p1.icon, text = p1.text },
			onActivated = var19,
			isDisabled = p1.isDisabled
		}
	end
	warn("profileMenuItemFromResolvedAction: action not available for profile type", p0, p2)
	
	return nil
end

local function contextualMenuItemsFromJsonActions(p3, p4, p5) --[[ line: 65 ]]
	-- upvalues: profileMenuItemFromResolvedAction (ref)
	local t = {}
	
	for i, v in ipairs(p3 or {}) do
		local t_1 = { items = {} }
		
		for i_1, v_1 in ipairs(if type(v) == "table" then v else { v }) do
			local var22 = p4[v_1]
			
			if var22 then
				local var23 = profileMenuItemFromResolvedAction(v_1, var22, p5)
				
				if var23 then
					table.insert(t_1.items, var23)
				end
			end
		end
		if #t_1.items > 0 then
			table.insert(t, t_1)
		end
	end
	return t
end

local function _(p6) --[[ line: 93 | named "hasJoinExperience" ]]
	-- upvalues: enumsModule (ref)
	for i, v in p6 do
		if v.type == enumsModule.ProfileActions.JoinExperience then
			return true
		end
	end
	return false
end

return function(p7) --[[ line: 102 | named "useMapJsonToButtonList" ]]
	-- upvalues: useDispatch (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useProfileActionsModule (ref), useProfileWrapperContextModule (ref), fFlagAddCTAButtonAnalyticsModule (ref), useProfileAnalyticsContextModule (ref), useSelector (ref), networkingPresenceModule (ref), networkStatus (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), reactModule (ref), useEffectOnce (ref), contextualMenuItemsFromJsonActions (ref), fFlagEnableProfilePlatformDisabledActions (ref), fFlagEnableCommunityVerificationModalModule (ref), fFlagPortEnableCommunityVerificationModalModule (ref), iconName (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateDown (ref), fFlagEnableProfilePlatformDisabledReasonTextModule (ref), buttonVariant (ref), profileMenuItemFromResolvedAction (ref), eventNamesModule (ref)
	local var24 = useDispatch()
	local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
	local var26 = useProfileActionsModule(enumsModule.ButtonSurface.Actions)
	local profileType = useProfileWrapperContextModule().profileType
	local var27 = if fFlagAddCTAButtonAnalyticsModule then useProfileAnalyticsContextModule() else nil
	local var28 = useSelector(function(p8) --[[ line: 110 ]]
		-- upvalues: networkingPresenceModule (copy), p7 (ref), networkStatus (copy)
		return networkingPresenceModule.GetPresencesFromUserIds.getStatus(p8, p7) == networkStatus.NotStarted
	end)
	
	if fFlagProfilePlatformAddCurrentlyPlayingModule then
		reactModule.useEffect(function() --[[ line: 115 ]]
			-- upvalues: actions (ref), enumsModule (copy), var24 (ref), networkingPresenceModule (copy), p7 (ref)
			if actions.buttons then
				local var32
				for i, v in actions.buttons do
					if v.type == enumsModule.ProfileActions.JoinExperience then
						var32 = true
						if var32 then
							var24(networkingPresenceModule.GetPresencesFromUserIds.API({ p7 }))
						end
					end
				end
				var32 = false
			end
		end, { actions.buttons, var24, p7 })
	else
		local var29 = useEffectOnce
		
		local var30 = function() --[[ line: 121 ]]
			-- upvalues: var24 (ref), networkingPresenceModule (copy), p7 (ref)
			var24(networkingPresenceModule.GetPresencesFromUserIds.API({ p7 }))
		end
		
		local var28_1 = false
		
		if actions.buttons ~= nil then
			for i, v in actions.buttons do
				if v.type == enumsModule.ProfileActions.JoinExperience then
					var28_1 = true
					var28_1 = var28_1 and var28
				end
			end
			var28_1 = false
		end
		var29(var30, var28_1)
	end
	return reactModule.useMemo(function() --[[ line: 126 ]]
		-- upvalues: actions (ref), var26 (ref), contextualMenuItemsFromJsonActions (copy), profileType (ref), fFlagEnableProfilePlatformDisabledActions (copy), fFlagEnableCommunityVerificationModalModule (copy), enumsModule (copy), fFlagPortEnableCommunityVerificationModalModule (copy), iconName (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var24 (ref), navigateDown (copy), fFlagEnableProfilePlatformDisabledReasonTextModule (copy), buttonVariant (copy), profileMenuItemFromResolvedAction (copy), fFlagAddCTAButtonAnalyticsModule (copy), var27 (ref), eventNamesModule (copy)
		local t = {}
		
		for i, v in ipairs(actions.buttons or {}) do
			local type = var26[v.type]
			
			if not type then
				warn("useMapJsonToButtonList: unrecognized action type", v.type)
				continue
			end
			local cloned = table.clone(type)
			local var36 = contextualMenuItemsFromJsonActions(v.subActions, var26, profileType)
			
			if fFlagEnableProfilePlatformDisabledActions and v.disabledReason then
				if fFlagEnableCommunityVerificationModalModule and v.type == enumsModule.ProfileActions.JoinCommunity and (v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelLow or v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelMedium or v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelHigh) then
					cloned.icon = if fFlagEnableCommunityVerificationModalModule and fFlagPortEnableCommunityVerificationModalModule then iconName.LockClosed else nil
					cloned.onActivated = {
						[profileType] = function() --[[ line: 154 ]]
							-- upvalues: enumsModule (copy), v (ref), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var24 (copy), navigateDown (copy)
							local t = {
								name = enumsModule.Screens.CommunityVerificationModal,
								extraProps = { disabledReason = v.disabledReason }
							}
							
							return if fFlagSignalsNavP3Dispatch then var4.down(var4.fromLegacyPage(t)) else var24(navigateDown(t))
						end
					}
				else
					cloned.isDisabled = true
					cloned.disabledReason = if fFlagEnableProfilePlatformDisabledReasonTextModule then v.disabledReason else nil
				end
			end
			local _ = nil
			local var37 = if #t == 0 and not cloned.isDisabled then cloned.variant or buttonVariant.Emphasis else buttonVariant.Standard
			local var38 = profileMenuItemFromResolvedAction(v.type, cloned, profileType)
			
			if var38 then
				table.insert(t, {
					contextualMenuItems = var36,
					menuItem = var38,
					buttonStyle = var37,
					isLoading = cloned.isLoading,
					disabledReason = cloned.disabledReason
				})
			end
		end
		local var34 = contextualMenuItemsFromJsonActions(actions.contextual, var26, profileType)
		
		if #var34 > 0 then
			table.insert(t, {
				menuItem = {
					id = enumsModule.ProfileActions.ContextualOverflow,
					displayValue = { icon = iconName.ThreeDotsHorizontal },
					onActivated = if fFlagAddCTAButtonAnalyticsModule then function() --[[ line: 205 ]]
						-- upvalues: var27 (copy), eventNamesModule (copy)
						var27.fireAnalyticsEvent(eventNamesModule.ContextualMenuButton)
					end else function() --[[ line: 208 ]] end
				},
				contextualMenuItems = var34,
				buttonStyle = buttonVariant.Standard
			})
		end
		return t
	end, {
		actions.buttons, actions.contextual, var26, var24, profileType, var27
	})
end