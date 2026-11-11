local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local UseScreenSizeFunction = RobloxAppHooksModule.useScreenSize
local UseTopBarHeightFunction = RobloxAppHooksModule.useTopBarHeight
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local ProfileTopBarModule = require(ProfilePlatform.Components.ProfileTopBar)
local UseProfileFormFactorModule = require(ProfilePlatform.Hooks.useProfileFormFactor)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileScrollContextModule = require(ProfilePlatform.Contexts.ProfileScrollContext.useProfileScrollContext)
local UseProfileCardWidthModule = require(ProfilePlatform.Hooks.useProfileCardWidth)
local UseProfileCardWidthFunction = require(Parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local GetPeekViewOpenHeightByProfileTypeModule = require(ProfilePlatform.Utils.getPeekViewOpenHeightByProfileType)
local GetSafeAreaSizeFunction = require(Parent.InputUi).getSafeAreaSize
local UseProfilePeekViewHeightModule = require(ProfilePlatform.Hooks.useProfilePeekViewHeight)
local UseShouldShowContextualInformationModule = require(ProfilePlatform.Hooks.useShouldShowContextualInformation)
local ConstantsModule = require(ProfilePlatform.Common.Constants)
local PresenceModule = require(ProfilePlatform.Rodux.Presence)
local NetworkingPresenceModule = require(ProfilePlatform.Networking.NetworkingPresence)
local ConvertPresenceEnumModule = require(ProfilePlatform.Utils.convertPresenceEnum)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectOnMountFunction = RoactUtilsModule.Hooks.useEffectOnMount
local EnumsModule = require(ProfilePlatform.Common.Enums)
local ProfileModalViewModule = require(script.Parent.ProfileModalView)
local ProfileFullViewModule = require(script.Parent.ProfileFullView)
local ProfilePlatformPageModule = require(ProfilePlatform.Components.ProfilePlatformPage)
local ProfilePeekViewModule = require(script.Parent.ProfilePeekView)
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FFlagSwitchProfileWidthHookToSocialCommon = require(Parent.SharedFlags).FFlagSwitchProfileWidthHookToSocialCommon
local FFlagEnableMobileGameJoinCard = require(Parent.SharedFlags).FFlagEnableMobileGameJoinCard

return function(_)
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileScrollContextModule (copy), UseScreenSizeFunction (copy), UseTopBarHeightFunction (copy), FFlagEnableMobileGameJoinCard (copy), ReactModule (copy), UseSelectorFunction (copy), UseProfileFormFactorModule (copy), EnumsModule (copy), ProfilePlatformPageModule (copy), ProfileTopBarModule (copy), GetSafeAreaSizeFunction (copy), FFlagProfilePlatformNewProfileHeader (copy), FFlagSwitchProfileWidthHookToSocialCommon (copy), UseProfileCardWidthFunction (copy), UseProfileCardWidthModule (copy), ConstantsModule (copy), UseDispatchFunction (copy), UseEffectOnMountFunction (copy), NetworkingPresenceModule (copy), PresenceModule (copy), ConvertPresenceEnumModule (copy), UseShouldShowContextualInformationModule (copy), UseProfilePeekViewHeightModule (copy), GetPeekViewOpenHeightByProfileTypeModule (copy), ProfileFullViewModule (copy), ProfileModalViewModule (copy), ProfilePeekViewModule (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileScrollContextModuleResult = UseProfileScrollContextModule()
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local PreviousViewFunction = UseProfileWrapperContextModuleResult.navigateTo.previousView
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	local MountAsFullView = FFlagEnableMobileGameJoinCard and UseProfileWrapperContextModuleResult.mountAsFullView or false
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: PreviousViewFunction (copy)
		PreviousViewFunction(false)
	end, { PreviousViewFunction })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: PreviousViewFunction (copy)
		PreviousViewFunction(true)
	end, { PreviousViewFunction })
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.GlobalGuiInset
	end)
	local UseProfileFormFactorModuleResult = UseProfileFormFactorModule()
	local IsFormFactorMatch = UseProfileFormFactorModuleResult.formFactor == EnumsModule.ProfileFormFactor.Wide
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), ProfilePlatformPageModule (upval)
		return ReactModule.createElement(ProfilePlatformPageModule, {})
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), ProfileTopBarModule (upval), UseResult (copy)
		return ReactModule.createElement(ProfileTopBarModule, {
			transparentBackground = true,
			backgroundTransparency = nil,
			navigateBack = UseResult
		})
	end, {})
	local SafeAreaSize = GetSafeAreaSizeFunction(UseScreenSizeResult, UseSelectorResult)
	local UseProfileCardWidthResult = if FFlagProfilePlatformNewProfileHeader then if FFlagSwitchProfileWidthHookToSocialCommon then UseProfileCardWidthFunction() else UseProfileCardWidthModule(IsFormFactorMatch) else math.min(SafeAreaSize.X.Offset, ConstantsModule.MAXIMUM_CONTAINER_WIDTH)
	local v1 = nil
	
	if FFlagProfilePlatformNewProfileHeader then
		local ProfileId = UseProfileWrapperContextModuleResult.profileId
		local UseDispatchResult = UseDispatchFunction()
		UseEffectOnMountFunction(function()
			-- upvalues: UseDispatchResult (copy), NetworkingPresenceModule (upval), ProfileId (copy)
			UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API({ ProfileId })):catch(function(_) end)
		end)
		local UseSelectorResult1 = UseSelectorFunction(function(p1)
			-- upvalues: PresenceModule (upval), ProfileId (copy)
			return PresenceModule.Selectors.getUserPresenceByUserId(p1, ProfileId) or {
				lastLocation = "",
				userPresenceType = PresenceModule.Enums.PresenceType.Offline
			}
		end)
		v1 = UseProfilePeekViewHeightModule(UseProfileCardWidthResult, (UseShouldShowContextualInformationModule((ConvertPresenceEnumModule(UseSelectorResult1.userPresenceType, UseSelectorResult1.universeId)))))
	end
	local PeekViewOpenHeightByProfileTypeModule = if FFlagProfilePlatformNewProfileHeader and ProfileType == EnumsModule.ProfileTypes.User then v1 else GetPeekViewOpenHeightByProfileTypeModule(ProfileType)
	local _UDim: UDim = if PeekViewOpenHeightByProfileTypeModule > SafeAreaSize.Y.Offset - UseTopBarHeightResult then UDim.new(1, 0) else UDim.new(0, PeekViewOpenHeightByProfileTypeModule)
	
	return if UseProfileFormFactorModuleResult.isFullView then ReactModule.createElement(ProfileFullViewModule, { renderContent = UseResult2, navigateBack = UseResult }) elseif IsFormFactorMatch then ReactModule.createElement(ProfileModalViewModule, {
		renderContent = UseResult2,
		renderTopBar = UseResult3,
		topBarHeight = UseTopBarHeightResult,
		viewWidth = UseProfileCardWidthResult,
		navigateBack = UseResult
	}) else ReactModule.createElement(ProfilePeekViewModule, {
		bottomDockedContainerHeight = 0,
		onViewStateChanged = nil,
		briefViewContentHeight = _UDim,
		contentSlot = UseResult2(),
		fullViewContentHeight = UDim.new(1, 0),
		mountAsFullView = MountAsFullView,
		onClosed = UseResult1,
		topBarHeight = UseTopBarHeightResult,
		topBarSlot = UseResult3(),
		viewWidth = UDim.new(0, SafeAreaSize.X.Offset),
		transitionPercentCallback = function(p1)
			-- upvalues: UseProfileScrollContextModuleResult (copy)
			UseProfileScrollContextModuleResult.setPeekViewOpenPercent(p1)
		end,
		profileType = if FFlagProfilePlatformNewProfileHeader then ProfileType else nil
	})
end