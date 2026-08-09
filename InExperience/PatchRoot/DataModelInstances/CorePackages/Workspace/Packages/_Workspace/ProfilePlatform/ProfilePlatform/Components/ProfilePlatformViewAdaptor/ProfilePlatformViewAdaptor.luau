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

return function(_) --[[ line: 43 ]]
	-- upvalues: useProfileWrapperContextModule (ref), useProfileScrollContextModule (ref), useScreenSize (ref), useTopBarHeight (ref), fFlagEnableMobileGameJoinCard (ref), reactModule (ref), useSelector (ref), useProfileFormFactorModule (ref), enumsModule (ref), profilePlatformPageModule (ref), profileTopBarModule (ref), getSafeAreaSize (ref), fFlagProfilePlatformNewProfileHeader (ref), fFlagSwitchProfileWidthHookToSocialCommon (ref), useProfileCardWidth (ref), useProfileCardWidthModule (ref), constantsModule (ref), useDispatch (ref), useEffectOnMount (ref), networkingPresenceModule (ref), presenceModule (ref), convertPresenceEnumModule (ref), useShouldShowContextualInformationModule (ref), useProfilePeekViewHeightModule (ref), getPeekViewOpenHeightByProfileTypeModule (ref), profileFullViewModule (ref), profileModalViewModule (ref), profilePeekViewModule (ref)
	local var22 = useProfileWrapperContextModule()
	local var23 = useProfileScrollContextModule()
	local profileType = var22.profileType
	local previousView = var22.navigateTo.previousView
	local var24 = useScreenSize()
	local var25 = useTopBarHeight()
	local var26 = if fFlagEnableMobileGameJoinCard then var22.mountAsFullView or false else false
	local var27 = reactModule.useCallback(function() --[[ line: 54 ]]
		-- upvalues: previousView (ref)
		previousView(false)
	end, { previousView })
	local var28 = reactModule.useCallback(function() --[[ line: 59 ]]
		-- upvalues: previousView (ref)
		previousView(true)
	end, { previousView })
	local var29 = useSelector(function(p0) --[[ line: 64 ]]
		return p0.GlobalGuiInset
	end)
	local var30 = useProfileFormFactorModule()
	local var31 = var30.formFactor == enumsModule.ProfileFormFactor.Wide
	local var32 = reactModule.useCallback(function() --[[ line: 71 ]]
		-- upvalues: reactModule (copy), profilePlatformPageModule (copy)
		return reactModule.createElement(profilePlatformPageModule, {})
	end, {})
	local var33 = reactModule.useCallback(function() --[[ line: 75 ]]
		-- upvalues: reactModule (copy), profileTopBarModule (copy), var27 (ref)
		return reactModule.createElement(profileTopBarModule, {
			transparentBackground = true,
			backgroundTransparency = nil,
			navigateBack = var27
		})
	end, {})
	local var34 = getSafeAreaSize(var24, var29)
	local var35 = if fFlagProfilePlatformNewProfileHeader then if fFlagSwitchProfileWidthHookToSocialCommon then useProfileCardWidth() else useProfileCardWidthModule(var31) else math.min(var34.X.Offset, constantsModule.MAXIMUM_CONTAINER_WIDTH)
	local var36 = nil
	
	if fFlagProfilePlatformNewProfileHeader then
		local profileId = var22.profileId
		local var37 = useDispatch()
		useEffectOnMount(function() --[[ line: 95 ]]
			-- upvalues: var37 (ref), networkingPresenceModule (copy), profileId (ref)
			var37(networkingPresenceModule.GetPresencesFromUserIds.API({ profileId })):catch(function(_) --[[ line: 96 ]] end)
		end)
		local var38 = useSelector(function(p1) --[[ line: 99 ]]
			-- upvalues: presenceModule (copy), profileId (ref)
			return presenceModule.Selectors.getUserPresenceByUserId(p1, profileId) or {
				lastLocation = "",
				userPresenceType = presenceModule.Enums.PresenceType.Offline
			}
		end)
		var36 = useProfilePeekViewHeightModule(var35, useShouldShowContextualInformationModule(convertPresenceEnumModule(var38.userPresenceType, var38.universeId)))
	end
	local _ = nil
	local _ = nil
	local var39 = if fFlagProfilePlatformNewProfileHeader and profileType == enumsModule.ProfileTypes.User then var36 else getPeekViewOpenHeightByProfileTypeModule(profileType)
	
	return if var30.isFullView then reactModule.createElement(profileFullViewModule, { renderContent = var32, navigateBack = var27 }) elseif var31 then reactModule.createElement(profileModalViewModule, {
		renderContent = var32,
		renderTopBar = var33,
		topBarHeight = var25,
		viewWidth = var35,
		navigateBack = var27
	}) else reactModule.createElement(profilePeekViewModule, {
		bottomDockedContainerHeight = 0,
		onViewStateChanged = nil,
		briefViewContentHeight = if var34.Y.Offset - var25 < var39 then UDim.new(1, 0) else UDim.new(0, var39),
		contentSlot = var32(),
		fullViewContentHeight = UDim.new(1, 0),
		mountAsFullView = var26,
		onClosed = var28,
		topBarHeight = var25,
		topBarSlot = var33(),
		viewWidth = UDim.new(0, var34.X.Offset),
		transitionPercentCallback = function(p2) --[[ line: 155 ]]
			-- upvalues: var23 (ref)
			var23.setPeekViewOpenPercent(p2)
		end,
		profileType = if fFlagProfilePlatformNewProfileHeader then profileType else nil
	})
end