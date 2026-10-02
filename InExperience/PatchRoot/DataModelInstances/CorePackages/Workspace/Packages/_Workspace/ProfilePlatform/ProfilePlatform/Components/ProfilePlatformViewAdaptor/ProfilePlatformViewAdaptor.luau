local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local inputUiModule = require(parent.InputUi)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local useScreenSize = robloxAppHooksModule.useScreenSize
local useTopBarHeight = robloxAppHooksModule.useTopBarHeight
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local profileTopBarModule = require(profilePlatform.Components.ProfileTopBar)
local useProfileFormFactorModule = require(profilePlatform.Hooks.useProfileFormFactor)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileScrollContextModule = require(profilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local useProfileCardWidthModule = require(profilePlatform.Hooks.useProfileCardWidth)
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local getPeekViewOpenHeightByProfileTypeModule = require(profilePlatform.Utils.getPeekViewOpenHeightByProfileType)
local getSafeAreaSize = inputUiModule.getSafeAreaSize
local useProfilePeekViewHeightModule = require(profilePlatform.Hooks.useProfilePeekViewHeight)
local useShouldShowContextualInformationModule = require(profilePlatform.Hooks.useShouldShowContextualInformation)
local constantsModule = require(profilePlatform.Common.Constants)
local presenceModule = require(profilePlatform.Rodux.Presence)
local networkingPresenceModule = require(profilePlatform.Networking.NetworkingPresence)
local convertPresenceEnumModule = require(profilePlatform.Utils.convertPresenceEnum)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffectOnMount = roactUtilsModule.Hooks.useEffectOnMount
local enumsModule = require(profilePlatform.Common.Enums)
local profileModalViewModule = require(script.Parent.ProfileModalView)
local profileFullViewModule = require(script.Parent.ProfileFullView)
local profilePlatformPageModule = require(profilePlatform.Components.ProfilePlatformPage)
local profilePeekViewModule = require(script.Parent.ProfilePeekView)
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local fFlagSwitchProfileWidthHookToSocialCommon = require(parent.SharedFlags).FFlagSwitchProfileWidthHookToSocialCommon
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagProfilePlatformPresenceStoreMigrationModule = require(profilePlatform.Flags.FFlagProfilePlatformPresenceStoreMigration)
local var1 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var2 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local var3 = if fFlagEnableSplitPane then require(parent.SplitPane) else nil
local useSignalState = require(parent.SignalsReact).useSignalState
local t = { skipFetch = true }

return function(_)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileScrollContextModule (ref), useScreenSize (ref), useTopBarHeight (ref), fFlagEnableMobileGameJoinCard (ref), reactModule (ref), useSelector (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagEnableSplitPane (ref), var3 (ref), useSignalState (ref), profilePlatformPageModule (ref), profileTopBarModule (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useEffectOnMount (ref), var2 (ref), var1 (ref), t (ref), convertPresenceEnumModule (ref), presenceModule (ref), useDispatch (ref), networkingPresenceModule (ref), useShouldShowContextualInformationModule (ref), useProfilePeekViewHeightModule (ref), getPeekViewOpenHeightByProfileTypeModule (ref), profileFullViewModule (ref), profileModalViewModule (ref), profilePeekViewModule (ref)
	local var4 = useProfileWrapperContextModule()
	local var5 = useProfileScrollContextModule()
	local profileType = var4.profileType
	local previousView = var4.navigateTo.previousView
	local var6 = useScreenSize()
	local var7 = useTopBarHeight()
	local var8 = if fFlagEnableMobileGameJoinCard then var4.mountAsFullView or false else false
	local var9 = reactModule.useCallback(function()
		-- upvalues: previousView (ref)
		previousView(false)
	end, { previousView })
	local var10 = reactModule.useCallback(function()
		-- upvalues: previousView (ref)
		previousView(true)
	end, { previousView })
	local var11 = useSelector(function(p1)
		return p1.GlobalGuiInset
	end)
	local var12 = useProfileFormFactorModule()
	local var13 = var12.formFactor == enumsModule.ProfileFormFactor.Wide
	local var14 = false
	
	if fFlagEnableSplitPane then
		local var15 = useSignalState(var3.SplitPaneStore.getStore().getSupportPaneModeIfActive)
		var14 = var15 ~= nil and var3.SplitPaneVariant.getProfileSplitPaneEligibility(var15) ~= nil
	end
	local var16 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), profilePlatformPageModule (copy)
		return reactModule.createElement(profilePlatformPageModule, {})
	end, {})
	local var17 = fFlagEnableSplitPane and var14
	local var18 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), profileTopBarModule (copy), var9 (ref), fFlagEnableSplitPane (copy), var17 (ref)
		return reactModule.createElement(profileTopBarModule, {
			transparentBackground = true,
			backgroundTransparency = nil,
			navigateBack = var9,
			hideNavigationButton = if fFlagEnableSplitPane then var17 else nil
		})
	end, if fFlagEnableSplitPane then { var9, var17 } else {})
	local var19 = getSafeAreaSize(var6, var11)
	local var20 = if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var13) else math.min(var19.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
	local var21 = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var22
		local profileId = var4.profileId
		local _ = nil
		
		if fFlagProfilePlatformPresenceStoreMigrationModule then
			local var23
			useEffectOnMount(function()
				-- upvalues: var2 (copy), profileId (ref)
				var2.RefreshPresenceByUserId(tostring(profileId))
			end)
			local var24 = var1(profileId, t)
			local var25 = if var24 then var24.userPresenceType else presenceModule.Enums.PresenceType.Offline
			
			if var24 and var24.universeId ~= "" then
				var23 = tonumber(var24.universeId)
				
				if not var23 then
					var23 = nil
				end
				var22 = convertPresenceEnumModule(var25, var23)
			end
		else
			local var26 = useDispatch()
			useEffectOnMount(function()
				-- upvalues: var26 (ref), networkingPresenceModule (copy), profileId (ref)
				var26(networkingPresenceModule.GetPresencesFromUserIds.API({ profileId })):catch(function(_) end)
			end)
			local var27 = useSelector(function(p1)
				-- upvalues: presenceModule (copy), profileId (ref)
				return presenceModule.Selectors.getUserPresenceByUserId(p1, profileId) or {
					lastLocation = "",
					userPresenceType = presenceModule.Enums.PresenceType.Offline
				}
			end)
			var22 = convertPresenceEnumModule(var27.userPresenceType, var27.universeId)
		end
		var21 = useProfilePeekViewHeightModule(var20, useShouldShowContextualInformationModule(var22))
	end
	local _ = nil
	local _ = nil
	local var28 = if fFlagProfilePlatformNewProfileHeader and profileType == enumsModule.ProfileTypes.User then var21 else getPeekViewOpenHeightByProfileTypeModule(profileType)
	
	return if var12.isFullView then reactModule.createElement(profileFullViewModule, { renderContent = var16, navigateBack = var9 }) elseif var13 then reactModule.createElement(profileModalViewModule, {
		renderContent = var16,
		renderTopBar = var18,
		topBarHeight = var7,
		viewWidth = var20,
		fillPane = var14,
		navigateBack = var9
	}) else reactModule.createElement(profilePeekViewModule, {
		bottomDockedContainerHeight = 0,
		onViewStateChanged = nil,
		briefViewContentHeight = if var19.Y.Offset - var7 < var28 then UDim.new(1, 0) else UDim.new(0, var28),
		contentSlot = var16(),
		fullViewContentHeight = UDim.new(1, 0),
		mountAsFullView = var8,
		onClosed = var10,
		topBarHeight = var7,
		topBarSlot = var18(),
		viewWidth = UDim.new(0, var19.X.Offset),
		transitionPercentCallback = function(p1)
			-- upvalues: var5 (ref)
			var5.setPeekViewOpenPercent(p1)
		end,
		profileType = if fFlagProfilePlatformNewProfileHeader then profileType else nil
	})
end