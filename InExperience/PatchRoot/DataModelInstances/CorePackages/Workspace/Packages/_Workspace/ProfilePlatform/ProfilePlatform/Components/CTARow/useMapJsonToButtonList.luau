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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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
local var2 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)

local function profileMenuItemFromResolvedAction(p1, p2, p3)
	local var3 = p2.onActivated[p3]
	
	if var3 then
		return {
			id = p1,
			displayValue = { icon = p2.icon, text = p2.text },
			onActivated = var3,
			isDisabled = p2.isDisabled
		}
	end
	warn("profileMenuItemFromResolvedAction: action not available for profile type", p1, p3)
	
	return nil
end

local function contextualMenuItemsFromJsonActions(p1, p2, p3)
	-- upvalues: profileMenuItemFromResolvedAction (ref)
	local t = {}
	
	for i, v in ipairs(p1 or {}) do
		local t_1 = { items = {} }
		
		for i_1, v_1 in ipairs(if type(v) == "table" then v else { v }) do
			local var3 = p2[v_1]
			
			if var3 then
				local var4 = profileMenuItemFromResolvedAction(v_1, var3, p3)
				
				if var4 then
					table.insert(t_1.items, var4)
				end
			end
		end
		if #t_1.items > 0 then
			table.insert(t, t_1)
		end
	end
	return t
end

local function _(p4)
	-- upvalues: enumsModule (ref)
	for i, v in p4 do
		if v.type == enumsModule.ProfileActions.JoinExperience then
			return true
		end
	end
	return false
end

return function(p5)
	-- upvalues: useDispatch (ref), useProfileJsonComponentModule (ref), enumsModule (ref), useProfileActionsModule (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useSelector (ref), networkingPresenceModule (ref), networkStatus (ref), fFlagProfilePlatformAddCurrentlyPlayingModule (ref), reactModule (ref), var2 (ref), useEffectOnce (ref), contextualMenuItemsFromJsonActions (ref), fFlagEnableProfilePlatformDisabledActions (ref), fFlagEnableCommunityVerificationModalModule (ref), fFlagPortEnableCommunityVerificationModalModule (ref), iconName (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), fFlagEnableProfilePlatformDisabledReasonTextModule (ref), buttonVariant (ref), profileMenuItemFromResolvedAction (ref), eventNamesModule (ref)
	local var5 = useDispatch()
	local actions = useProfileJsonComponentModule(enumsModule.Components.Actions) or {}
	local var6 = useProfileActionsModule(enumsModule.ButtonSurface.Actions)
	local profileType = useProfileWrapperContextModule().profileType
	local var7 = useProfileAnalyticsContextModule()
	local var8 = if fFlagProfilePlatformPresenceStoreMigrationModule then nil else useSelector(function(p6)
		-- upvalues: networkingPresenceModule (copy), p5 (ref), networkStatus (copy)
		return networkingPresenceModule.GetPresencesFromUserIds.getStatus(p6, p5) == networkStatus.NotStarted
	end)
	
	if fFlagProfilePlatformAddCurrentlyPlayingModule then
		reactModule.useEffect(function()
			-- upvalues: actions (ref), enumsModule (copy), fFlagProfilePlatformPresenceStoreMigrationModule (copy), var2 (copy), p5 (ref), var5 (ref), networkingPresenceModule (copy)
			if actions.buttons then
				local var9
				for i, v in actions.buttons do
					if v.type == enumsModule.ProfileActions.JoinExperience then
						var9 = true
						if var9 then
							if fFlagProfilePlatformPresenceStoreMigrationModule then
								var2.RefreshPresenceByUserId(p5)
								
								return
							end
							var5(networkingPresenceModule.GetPresencesFromUserIds.API({ p5 }))
						end
					end
				end
				var9 = false
			end
		end, { actions.buttons, var5, p5 })
	else
		local var10 = useEffectOnce
		
		local var11 = function()
			-- upvalues: fFlagProfilePlatformPresenceStoreMigrationModule (copy), var2 (copy), p5 (ref), var5 (ref), networkingPresenceModule (copy)
			if fFlagProfilePlatformPresenceStoreMigrationModule then
				var2.RefreshPresenceByUserId(p5)
				
				return
			end
			var5(networkingPresenceModule.GetPresencesFromUserIds.API({ p5 }))
		end
		
		local var12 = false
		
		if actions.buttons ~= nil then
			for i, v in actions.buttons do
				if v.type == enumsModule.ProfileActions.JoinExperience then
					var12 = true
					var12 = var12 and (if fFlagProfilePlatformPresenceStoreMigrationModule then true else var8)
				end
			end
			var12 = false
		end
		var10(var11, var12)
	end
	return reactModule.useMemo(function()
		-- upvalues: actions (ref), var6 (ref), contextualMenuItemsFromJsonActions (copy), profileType (ref), fFlagEnableProfilePlatformDisabledActions (copy), fFlagEnableCommunityVerificationModalModule (copy), enumsModule (copy), fFlagPortEnableCommunityVerificationModalModule (copy), iconName (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var5 (ref), navigateDown (copy), fFlagEnableProfilePlatformDisabledReasonTextModule (copy), buttonVariant (copy), profileMenuItemFromResolvedAction (copy), var7 (ref), eventNamesModule (copy)
		local t = {}
		
		for i, v in ipairs(actions.buttons or {}) do
			local type = var6[v.type]
			
			if not type then
				warn("useMapJsonToButtonList: unrecognized action type", v.type)
				continue
			end
			local cloned = table.clone(type)
			local var13 = contextualMenuItemsFromJsonActions(v.subActions, var6, profileType)
			
			if fFlagEnableProfilePlatformDisabledActions and v.disabledReason then
				if fFlagEnableCommunityVerificationModalModule and v.type == enumsModule.ProfileActions.JoinCommunity and (v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelLow or v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelMedium or v.disabledReason == enumsModule.DisabledReasons.InsufficientVerificationLevelHigh) then
					cloned.icon = if fFlagEnableCommunityVerificationModalModule and fFlagPortEnableCommunityVerificationModalModule then iconName.LockClosed else nil
					cloned.onActivated = {
						[profileType] = function()
							-- upvalues: enumsModule (copy), v (ref), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var5 (copy), navigateDown (copy)
							local t = {
								name = enumsModule.Screens.CommunityVerificationModal,
								extraProps = { disabledReason = v.disabledReason }
							}
							
							return if fFlagSignalsNavP3Dispatch then var1.down(var1.fromLegacyPage(t)) else var5(navigateDown(t))
						end
					}
				else
					cloned.isDisabled = true
					cloned.disabledReason = if fFlagEnableProfilePlatformDisabledReasonTextModule then v.disabledReason else nil
				end
			end
			local _ = nil
			local var14 = if #t == 0 and not cloned.isDisabled then cloned.variant or buttonVariant.Emphasis else buttonVariant.Standard
			local var15 = profileMenuItemFromResolvedAction(v.type, cloned, profileType)
			
			if var15 then
				table.insert(t, {
					contextualMenuItems = var13,
					menuItem = var15,
					buttonStyle = var14,
					isLoading = cloned.isLoading,
					disabledReason = cloned.disabledReason
				})
			end
		end
		local var16 = contextualMenuItemsFromJsonActions(actions.contextual, var6, profileType)
		
		if #var16 > 0 then
			table.insert(t, {
				menuItem = {
					id = enumsModule.ProfileActions.ContextualOverflow,
					displayValue = { icon = iconName.ThreeDotsHorizontal },
					onActivated = function()
						-- upvalues: var7 (copy), eventNamesModule (copy)
						var7.fireAnalyticsEvent(eventNamesModule.ContextualMenuButton)
					end
				},
				contextualMenuItems = var16,
				buttonStyle = buttonVariant.Standard
			})
		end
		return t
	end, {
		actions.buttons, actions.contextual, var6, var5, profileType, var7
	})
end