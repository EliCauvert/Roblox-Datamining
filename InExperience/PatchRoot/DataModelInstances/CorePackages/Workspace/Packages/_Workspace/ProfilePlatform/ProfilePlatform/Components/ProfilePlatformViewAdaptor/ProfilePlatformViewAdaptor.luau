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
local var23 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local var24 = if fFlagProfilePlatformPresenceStoreMigrationModule then require(parent.DataHydration).Presence.PresenceStore.get() else nil
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local var25 = if fFlagEnableSplitPane then require(parent.SplitPane).SplitPaneStore else nil
local useSignalState = require(parent.SignalsReact).useSignalState
local t = { skipFetch = true }

return function(_)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileScrollContextModule (ref), useScreenSize (ref), useTopBarHeight (ref), fFlagEnableMobileGameJoinCard (ref), reactModule (ref), useSelector (ref), useProfileFormFactorModule (ref), enumsModule (ref), fFlagEnableSplitPane (ref), useSignalState (ref), var25 (ref), profilePlatformPageModule (ref), profileTopBarModule (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), fFlagProfilePlatformPresenceStoreMigrationModule (ref), useEffectOnMount (ref), var24 (ref), var23 (ref), t (ref), convertPresenceEnumModule (ref), presenceModule (ref), useDispatch (ref), networkingPresenceModule (ref), useShouldShowContextualInformationModule (ref), useProfilePeekViewHeightModule (ref), getPeekViewOpenHeightByProfileTypeModule (ref), profileFullViewModule (ref), profileModalViewModule (ref), profilePeekViewModule (ref)
	local var27 = useProfileWrapperContextModule()
	local var28 = useProfileScrollContextModule()
	local profileType = var27.profileType
	local previousView = var27.navigateTo.previousView
	local var29 = useScreenSize()
	local var30 = useTopBarHeight()
	local var31 = if fFlagEnableMobileGameJoinCard then var27.mountAsFullView or false else false
	local var32 = reactModule.useCallback(function()
		-- upvalues: previousView (ref)
		previousView(false)
	end, { previousView })
	local var33 = reactModule.useCallback(function()
		-- upvalues: previousView (ref)
		previousView(true)
	end, { previousView })
	local var34 = useSelector(function(p0)
		return p0.GlobalGuiInset
	end)
	local var35 = useProfileFormFactorModule()
	local var36 = var35.formFactor == enumsModule.ProfileFormFactor.Wide
	local var37 = if fFlagEnableSplitPane then useSignalState(var25.getStore().getIsSplitEnabled) else false
	local var38 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), profilePlatformPageModule (copy)
		return reactModule.createElement(profilePlatformPageModule, {})
	end, {})
	local var37_1 = fFlagEnableSplitPane and var37
	local var40 = reactModule.useCallback(function()
		-- upvalues: reactModule (copy), profileTopBarModule (copy), var32 (ref), fFlagEnableSplitPane (copy), var37_1 (ref)
		return reactModule.createElement(profileTopBarModule, {
			transparentBackground = true,
			backgroundTransparency = nil,
			navigateBack = var32,
			hideNavigationButton = if fFlagEnableSplitPane then var37_1 else nil
		})
	end, if fFlagEnableSplitPane then { var32, var37_1 } else {})
	local var41 = getSafeAreaSize(var29, var34)
	local var42 = if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var36) else math.min(var41.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
	local var43 = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local var47
		local profileId = var27.profileId
		local _ = nil
		
		if fFlagProfilePlatformPresenceStoreMigrationModule then
			local var46
			useEffectOnMount(function()
				-- upvalues: var24 (copy), profileId (ref)
				var24.RefreshPresenceByUserId(tostring(profileId))
			end)
			local var44 = var23(profileId, t)
			local var45 = if var44 then var44.userPresenceType else presenceModule.Enums.PresenceType.Offline
			
			if var44 and var44.universeId ~= "" then
				var46 = tonumber(var44.universeId)
				
				if not var46 then
					var46 = nil
				end
				var47 = convertPresenceEnumModule(var45, var46)
			end
		else
			local var48 = useDispatch()
			useEffectOnMount(function()
				-- upvalues: var48 (ref), networkingPresenceModule (copy), profileId (ref)
				var48(networkingPresenceModule.GetPresencesFromUserIds.API({ profileId })):catch(function(_) end)
			end)
			local var49 = useSelector(function(p1)
				-- upvalues: presenceModule (copy), profileId (ref)
				return presenceModule.Selectors.getUserPresenceByUserId(p1, profileId) or {
					lastLocation = "",
					userPresenceType = presenceModule.Enums.PresenceType.Offline
				}
			end)
			var47 = convertPresenceEnumModule(var49.userPresenceType, var49.universeId)
		end
		var43 = useProfilePeekViewHeightModule(var42, useShouldShowContextualInformationModule(var47))
	end
	local _ = nil
	local _ = nil
	local var50 = if fFlagProfilePlatformNewProfileHeader and profileType == enumsModule.ProfileTypes.User then var43 else getPeekViewOpenHeightByProfileTypeModule(profileType)
	
	return if var35.isFullView then reactModule.createElement(profileFullViewModule, { renderContent = var38, navigateBack = var32 }) elseif var36 then reactModule.createElement(profileModalViewModule, {
		renderContent = var38,
		renderTopBar = var40,
		topBarHeight = var30,
		viewWidth = var42,
		fillPane = var37,
		navigateBack = var32
	}) else reactModule.createElement(profilePeekViewModule, {
		bottomDockedContainerHeight = 0,
		onViewStateChanged = nil,
		briefViewContentHeight = if var41.Y.Offset - var30 < var50 then UDim.new(1, 0) else UDim.new(0, var50),
		contentSlot = var38(),
		fullViewContentHeight = UDim.new(1, 0),
		mountAsFullView = var31,
		onClosed = var33,
		topBarHeight = var30,
		topBarSlot = var40(),
		viewWidth = UDim.new(0, var41.X.Offset),
		transitionPercentCallback = function(p2)
			-- upvalues: var28 (ref)
			var28.setPeekViewOpenPercent(p2)
		end,
		profileType = if fFlagProfilePlatformNewProfileHeader then profileType else nil
	})
end