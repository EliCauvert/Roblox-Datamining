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
local var3 = if fFlagEnableSplitPane then require(parent.SplitPane).SplitPaneStore else nil
local useSignalState = require(parent.SignalsReact).useSignalState
local t = { skipFetch = true }

return function(_)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileScrollContextModule (ref), useScreenSize (ref), useTopBarHeight (ref), fFlagEnableMobileGameJoinCard (ref), reactModule (ref), useSelector (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagEnableSplitPane (ref), useSignalState (ref), var3 (ref), profilePlatformPageModule (ref), profileTopBarModule (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useEffectOnMount (ref), var2 (ref), var1 (ref), t (ref), convertPresenceEnumModule (ref), presenceModule (ref), useDispatch (ref), networkingPresenceModule (ref), useShouldShowContextualInformationModule (ref), useProfilePeekViewHeightModule (ref), getPeekViewOpenHeightByProfileTypeModule (ref), profileFullViewModule (ref), profileModalViewModule (ref), profilePeekViewModule (ref)
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
	local var14 = if fFlagEnableSplitPane then useSignalState(var3.getStore().getIsSplitEnabled) else false
	local var15 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), profilePlatformPageModule (copy)
		return reactModule.createElement(profilePlatformPageModule, {})
	end, {})
	local var16 = fFlagEnableSplitPane and var14
	local var17 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), profileTopBarModule (copy), var9 (ref), fFlagEnableSplitPane (copy), var16 (ref)
		return reactModule.createElement(profileTopBarModule, {
			transparentBackground = true,
			backgroundTransparency = nil,
			navigateBack = var9,
			hideNavigationButton = if fFlagEnableSplitPane then var16 else nil
		})
	end, if fFlagEnableSplitPane then { var9, var16 } else {})
	local var18 = getSafeAreaSize(var6, var11)
	local var19 = if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var13) else math.min(var18.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
	local var20 = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var21
		local profileId = var4.profileId
		local _ = nil
		
		if fFlagProfilePlatformPresenceStoreMigrationModule then
			local var22
			useEffectOnMount(function()
				-- upvalues: var2 (copy), profileId (ref)
				var2.RefreshPresenceByUserId(tostring(profileId))
			end)
			local var23 = var1(profileId, t)
			local var24 = if var23 then var23.userPresenceType else presenceModule.Enums.PresenceType.Offline
			
			if var23 and var23.universeId ~= "" then
				var22 = tonumber(var23.universeId)
				
				if not var22 then
					var22 = nil
				end
				var21 = convertPresenceEnumModule(var24, var22)
			end
		else
			local var25 = useDispatch()
			useEffectOnMount(function()
				-- upvalues: var25 (ref), networkingPresenceModule (copy), profileId (ref)
				var25(networkingPresenceModule.GetPresencesFromUserIds.API({ profileId })):catch(function(_) end)
			end)
			local var26 = useSelector(function(p1)
				-- upvalues: presenceModule (copy), profileId (ref)
				return presenceModule.Selectors.getUserPresenceByUserId(p1, profileId) or {
					lastLocation = "",
					userPresenceType = presenceModule.Enums.PresenceType.Offline
				}
			end)
			var21 = convertPresenceEnumModule(var26.userPresenceType, var26.universeId)
		end
		var20 = useProfilePeekViewHeightModule(var19, useShouldShowContextualInformationModule(var21))
	end
	local _ = nil
	local _ = nil
	local var27 = if fFlagProfilePlatformNewProfileHeader and profileType == enumsModule.ProfileTypes.User then var20 else getPeekViewOpenHeightByProfileTypeModule(profileType)
	
	return if var12.isFullView then reactModule.createElement(profileFullViewModule, { renderContent = var15, navigateBack = var9 }) elseif var13 then reactModule.createElement(profileModalViewModule, {
		renderContent = var15,
		renderTopBar = var17,
		topBarHeight = var7,
		viewWidth = var19,
		fillPane = var14,
		navigateBack = var9
	}) else reactModule.createElement(profilePeekViewModule, {
		bottomDockedContainerHeight = 0,
		onViewStateChanged = nil,
		briefViewContentHeight = if var18.Y.Offset - var7 < var27 then UDim.new(1, 0) else UDim.new(0, var27),
		contentSlot = var15(),
		fullViewContentHeight = UDim.new(1, 0),
		mountAsFullView = var8,
		onClosed = var10,
		topBarHeight = var7,
		topBarSlot = var17(),
		viewWidth = UDim.new(0, var18.X.Offset),
		transitionPercentCallback = function(p1)
			-- upvalues: var5 (ref)
			var5.setPeekViewOpenPercent(p1)
		end,
		profileType = if fFlagProfilePlatformNewProfileHeader then profileType else nil
	})
end