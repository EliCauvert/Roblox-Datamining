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
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local var15 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)

local function profileMenuItemFromResolvedAction(p0, p1, p2)
	local var20 = p1.onActivated[p2]
	
	if var20 then
		return {
			id = p0,
			displayValue = { icon = p1.icon, text = p1.text },
			onActivated = var20,
			isDisabled = p1.isDisabled
		}
	end
	warn("profileMenuItemFromResolvedAction: action not available for profile type", p0, p2)
	
	return nil
end

local function contextualMenuItemsFromJsonActions(p3, p4, p5)
	-- upvalues: profileMenuItemFromResolvedAction (ref)
	local t = {}
	
	for i, v in ipairs(p3 or {}) do
		local t_1 = { items = {} }
		
		for i_1, v_1 in ipairs(if type(v) == "table" then v else { v }) do
			local var23 = p4[v_1]
			
			if var23 then
				local var24 = profileMenuItemFromResolvedAction(v_1, var23, p5)
				
				if var24 then
					table.insert(t_1.items, var24)
				end
			end
		end
		if #t_1.items > 0 then
			table.insert(t, t_1)
		end
	end
	return t
end

local function _(p6)
	-- upvalues: enumsModule (ref)
	for i, v in p6 do
		if v.type == enumsModule.ProfileActions.JoinExperience then
			return true
		end
	end
	return false
end

return function(p7)
	-- upvalues: useDispatch (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useProfileActionsModule (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useSelector (ref), networkingPresenceModule (ref), networkStatus (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), reactModule (ref), var15 (ref), useEffectOnce (ref), contextualMenuItemsFromJsonActions (ref), fFlagEnableProfilePlatformDisabledActions (ref), fFlagEnableCommunityVerificationModalModule (ref), fFlagPortEnableCommunityVerificationModalModule (ref), iconName (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateDown (ref), fFlagEnableProfilePlatformDisabledReasonTextModule (ref), buttonVariant (ref), profileMenuItemFromResolvedAction (ref), eventNamesModule (ref)
	local var25 = useDispatch()
	local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
	local var27 = useProfileActionsModule(enumsModule.ButtonSurface.Actions)
	local profileType = useProfileWrapperContextModule().profileType
	local var28 = useProfileAnalyticsContextModule()
	local var29 = if fFlagProfilePlatformPresenceStoreMigrationModule then nil else useSelector(function(p8)
		-- upvalues: networkingPresenceModule (copy), p7 (ref), networkStatus (copy)
		return networkingPresenceModule.GetPresencesFromUserIds.getStatus(p8, p7) == networkStatus.NotStarted
	end)
	
	if fFlagProfilePlatformAddCurrentlyPlayingModule then
		reactModule.useEffect(function()
			-- upvalues: actions (ref), enumsModule (copy), fFlagProfilePlatformPresenceStoreMigrationModule (copy), var15 (copy), p7 (ref), var25 (ref), networkingPresenceModule (copy)
			if actions.buttons then
				local var33
				for i, v in actions.buttons do
					if v.type == enumsModule.ProfileActions.JoinExperience then
						var33 = true
						if var33 then
							if fFlagProfilePlatformPresenceStoreMigrationModule then
								var15.RefreshPresenceByUserId(p7)
								
								return
							end
							var25(networkingPresenceModule.GetPresencesFromUserIds.API({ p7 }))
						end
					end
				end
				var33 = false
			end
		end, { actions.buttons, var25, p7 })
	else
		local var30 = useEffectOnce
		
		local var31 = function()
			-- upvalues: fFlagProfilePlatformPresenceStoreMigrationModule (copy), var15 (copy), p7 (ref), var25 (ref), networkingPresenceModule (copy)
			if fFlagProfilePlatformPresenceStoreMigrationModule then
				var15.RefreshPresenceByUserId(p7)
				
				return
			end
			var25(networkingPresenceModule.GetPresencesFromUserIds.API({ p7 }))
		end
		
		local var32 = false
		
		if actions.buttons ~= nil then
			for i, v in actions.buttons do
				if v.type == enumsModule.ProfileActions.JoinExperience then
					var32 = true
					var32 = var32 and (if fFlagProfilePlatformPresenceStoreMigrationModule then true else var29)
				end
			end
			var32 = false
		end
		var30(var31, var32)
	end
	return reactModule.useMemo(function()
		-- upvalues: actions (ref), var27 (ref), contextualMenuItemsFromJsonActions (copy), profileType (ref), fFlagEnableProfilePlatformDisabledActions (copy), fFlagEnableCommunityVerificationModalModule (copy), enumsModule (copy), fFlagPortEnableCommunityVerificationModalModule (copy), iconName (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var25 (ref), navigateDown (copy), fFlagEnableProfilePlatformDisabledReasonTextModule (copy), buttonVariant (copy), profileMenuItemFromResolvedAction (copy), var28 (ref), eventNamesModule (copy)
		local t = {}
		
		for i, v in ipairs(actions.buttons or {}) do
			local type = var27[v.type]
			
			if not type then
				warn("useMapJsonToButtonList: unrecognized action type", v.type)
				continue
			end
			local cloned = table.clone(type)
			local var37 = contextualMenuItemsFromJsonActions(v.subActions, var27, profileType)
			
			if fFlagEnableProfilePlatformDisabledActions and v.disabledReason then
				if fFlagEnableCommunityVerificationModalModule and v.type == enumsModule.ProfileActions.JoinCommunity and (v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelLow or v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelMedium or v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelHigh) then
					cloned.icon = if fFlagEnableCommunityVerificationModalModule and fFlagPortEnableCommunityVerificationModalModule then iconName.LockClosed else nil
					cloned.onActivated = {
						[profileType] = function()
							-- upvalues: enumsModule (copy), v (ref), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var25 (copy), navigateDown (copy)
							local t = {
								name = enumsModule.Screens.CommunityVerificationModal,
								extraProps = { disabledReason = v.disabledReason }
							}
							
							return if fFlagSignalsNavP3Dispatch then var4.down(var4.fromLegacyPage(t)) else var25(navigateDown(t))
						end
					}
				else
					cloned.isDisabled = true
					cloned.disabledReason = if fFlagEnableProfilePlatformDisabledReasonTextModule then v.disabledReason else nil
				end
			end
			local _ = nil
			local var38 = if #t == 0 and not cloned.isDisabled then cloned.variant or buttonVariant.Emphasis else buttonVariant.Standard
			local var39 = profileMenuItemFromResolvedAction(v.type, cloned, profileType)
			
			if var39 then
				table.insert(t, {
					contextualMenuItems = var37,
					menuItem = var39,
					buttonStyle = var38,
					isLoading = cloned.isLoading,
					disabledReason = cloned.disabledReason
				})
			end
		end
		local var35 = contextualMenuItemsFromJsonActions(actions.contextual, var27, profileType)
		
		if #var35 > 0 then
			table.insert(t, {
				menuItem = {
					id = enumsModule.ProfileActions.ContextualOverflow,
					displayValue = { icon = iconName.ThreeDotsHorizontal },
					onActivated = function()
						-- upvalues: var28 (copy), eventNamesModule (copy)
						var28.fireAnalyticsEvent(eventNamesModule.ContextualMenuButton)
					end
				},
				contextualMenuItems = var35,
				buttonStyle = buttonVariant.Standard
			})
		end
		return t
	end, {
		actions.buttons, actions.contextual, var27, var25, profileType, var28
	})
end