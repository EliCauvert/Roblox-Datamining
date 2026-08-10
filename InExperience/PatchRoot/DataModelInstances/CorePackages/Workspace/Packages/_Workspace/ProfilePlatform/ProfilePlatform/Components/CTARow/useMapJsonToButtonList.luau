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
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local var16 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)

local function profileMenuItemFromResolvedAction(p0, p1, p2) --[[ line: 53 ]]
	local var21 = p1.onActivated[p2]
	
	if var21 then
		return {
			id = p0,
			displayValue = { icon = p1.icon, text = p1.text },
			onActivated = var21,
			isDisabled = p1.isDisabled
		}
	end
	warn("profileMenuItemFromResolvedAction: action not available for profile type", p0, p2)
	
	return nil
end

local function contextualMenuItemsFromJsonActions(p3, p4, p5) --[[ line: 71 ]]
	-- upvalues: profileMenuItemFromResolvedAction (ref)
	local t = {}
	
	for i, v in ipairs(p3 or {}) do
		local t_1 = { items = {} }
		
		for i_1, v_1 in ipairs(if type(v) == "table" then v else { v }) do
			local var24 = p4[v_1]
			
			if var24 then
				local var25 = profileMenuItemFromResolvedAction(v_1, var24, p5)
				
				if var25 then
					table.insert(t_1.items, var25)
				end
			end
		end
		if #t_1.items > 0 then
			table.insert(t, t_1)
		end
	end
	return t
end

local function _(p6) --[[ line: 99 | named "hasJoinExperience" ]]
	-- upvalues: enumsModule (ref)
	for i, v in p6 do
		if v.type == enumsModule.ProfileActions.JoinExperience then
			return true
		end
	end
	return false
end

return function(p7) --[[ line: 108 | named "useMapJsonToButtonList" ]]
	-- upvalues: useDispatch (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useProfileActionsModule (ref), useProfileWrapperContextModule (ref), fFlagAddCTAButtonAnalyticsModule (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useSelector (ref), networkingPresenceModule (ref), networkStatus (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), reactModule (ref), var16 (ref), useEffectOnce (ref), contextualMenuItemsFromJsonActions (ref), fFlagEnableProfilePlatformDisabledActions (ref), fFlagEnableCommunityVerificationModalModule (ref), fFlagPortEnableCommunityVerificationModalModule (ref), iconName (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateDown (ref), fFlagEnableProfilePlatformDisabledReasonTextModule (ref), buttonVariant (ref), profileMenuItemFromResolvedAction (ref), eventNamesModule (ref)
	local var26 = useDispatch()
	local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
	local var28 = useProfileActionsModule(enumsModule.ButtonSurface.Actions)
	local profileType = useProfileWrapperContextModule().profileType
	local var29 = if fFlagAddCTAButtonAnalyticsModule then useProfileAnalyticsContextModule() else nil
	local var30 = if fFlagProfilePlatformPresenceStoreMigrationModule then nil else useSelector(function(p8) --[[ line: 118 ]]
		-- upvalues: networkingPresenceModule (copy), p7 (ref), networkStatus (copy)
		return networkingPresenceModule.GetPresencesFromUserIds.getStatus(p8, p7) == networkStatus.NotStarted
	end)
	
	if fFlagProfilePlatformAddCurrentlyPlayingModule then
		reactModule.useEffect(function() --[[ line: 123 ]]
			-- upvalues: actions (ref), enumsModule (copy), fFlagProfilePlatformPresenceStoreMigrationModule (copy), var16 (copy), p7 (ref), var26 (ref), networkingPresenceModule (copy)
			if actions.buttons then
				local var34
				for i, v in actions.buttons do
					if v.type == enumsModule.ProfileActions.JoinExperience then
						var34 = true
						if var34 then
							if fFlagProfilePlatformPresenceStoreMigrationModule then
								var16.RefreshPresenceByUserId(p7)
								
								return
							end
							var26(networkingPresenceModule.GetPresencesFromUserIds.API({ p7 }))
						end
					end
				end
				var34 = false
			end
		end, { actions.buttons, var26, p7 })
	else
		local var31 = useEffectOnce
		
		local var32 = function() --[[ line: 134 ]]
			-- upvalues: fFlagProfilePlatformPresenceStoreMigrationModule (copy), var16 (copy), p7 (ref), var26 (ref), networkingPresenceModule (copy)
			if fFlagProfilePlatformPresenceStoreMigrationModule then
				var16.RefreshPresenceByUserId(p7)
				
				return
			end
			var26(networkingPresenceModule.GetPresencesFromUserIds.API({ p7 }))
		end
		
		local var33 = false
		
		if actions.buttons ~= nil then
			for i, v in actions.buttons do
				if v.type == enumsModule.ProfileActions.JoinExperience then
					var33 = true
					var33 = var33 and (if fFlagProfilePlatformPresenceStoreMigrationModule then true else var30)
				end
			end
			var33 = false
		end
		var31(var32, var33)
	end
	return reactModule.useMemo(function() --[[ line: 147 ]]
		-- upvalues: actions (ref), var28 (ref), contextualMenuItemsFromJsonActions (copy), profileType (ref), fFlagEnableProfilePlatformDisabledActions (copy), fFlagEnableCommunityVerificationModalModule (copy), enumsModule (copy), fFlagPortEnableCommunityVerificationModalModule (copy), iconName (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var26 (ref), navigateDown (copy), fFlagEnableProfilePlatformDisabledReasonTextModule (copy), buttonVariant (copy), profileMenuItemFromResolvedAction (copy), fFlagAddCTAButtonAnalyticsModule (copy), var29 (ref), eventNamesModule (copy)
		local t = {}
		
		for i, v in ipairs(actions.buttons or {}) do
			local type = var28[v.type]
			
			if not type then
				warn("useMapJsonToButtonList: unrecognized action type", v.type)
				continue
			end
			local cloned = table.clone(type)
			local var38 = contextualMenuItemsFromJsonActions(v.subActions, var28, profileType)
			
			if fFlagEnableProfilePlatformDisabledActions and v.disabledReason then
				if fFlagEnableCommunityVerificationModalModule and v.type == enumsModule.ProfileActions.JoinCommunity and (v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelLow or v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelMedium or v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelHigh) then
					cloned.icon = if fFlagEnableCommunityVerificationModalModule and fFlagPortEnableCommunityVerificationModalModule then iconName.LockClosed else nil
					cloned.onActivated = {
						[profileType] = function() --[[ line: 175 ]]
							-- upvalues: enumsModule (copy), v (ref), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var26 (copy), navigateDown (copy)
							local t = {
								name = enumsModule.Screens.CommunityVerificationModal,
								extraProps = { disabledReason = v.disabledReason }
							}
							
							return if fFlagSignalsNavP3Dispatch then var4.down(var4.fromLegacyPage(t)) else var26(navigateDown(t))
						end
					}
				else
					cloned.isDisabled = true
					cloned.disabledReason = if fFlagEnableProfilePlatformDisabledReasonTextModule then v.disabledReason else nil
				end
			end
			local _ = nil
			local var39 = if #t == 0 and not cloned.isDisabled then cloned.variant or buttonVariant.Emphasis else buttonVariant.Standard
			local var40 = profileMenuItemFromResolvedAction(v.type, cloned, profileType)
			
			if var40 then
				table.insert(t, {
					contextualMenuItems = var38,
					menuItem = var40,
					buttonStyle = var39,
					isLoading = cloned.isLoading,
					disabledReason = cloned.disabledReason
				})
			end
		end
		local var36 = contextualMenuItemsFromJsonActions(actions.contextual, var28, profileType)
		
		if #var36 > 0 then
			table.insert(t, {
				menuItem = {
					id = enumsModule.ProfileActions.ContextualOverflow,
					displayValue = { icon = iconName.ThreeDotsHorizontal },
					onActivated = if fFlagAddCTAButtonAnalyticsModule then function() --[[ line: 226 ]]
						-- upvalues: var29 (copy), eventNamesModule (copy)
						var29.fireAnalyticsEvent(eventNamesModule.ContextualMenuButton)
					end else function() --[[ line: 229 ]] end
				},
				contextualMenuItems = var36,
				buttonStyle = buttonVariant.Standard
			})
		end
		return t
	end, {
		actions.buttons, actions.contextual, var28, var26, profileType, var29
	})
end