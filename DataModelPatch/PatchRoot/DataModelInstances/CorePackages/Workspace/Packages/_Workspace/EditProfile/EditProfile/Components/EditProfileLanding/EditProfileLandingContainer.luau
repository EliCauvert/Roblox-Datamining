local EditProfile = script:FindFirstAncestor("EditProfile")
local IXPService = game:GetService("IXPService")
local Parent = EditProfile.Parent
local EditProfileLandingModule = require(EditProfile.Components.EditProfileLanding.EditProfileLanding)
local ReactModule = require(Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local GetResult = require(Parent.UserProfiles).Stores.UserProfileStore.get()
local EditProfileStoreModule = require(EditProfile.Stores.EditProfileStore)
local ProfileRefreshSignal = require(Parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local EnumsModule = require(EditProfile.Common.Enums)
local ConstantsModule = require(EditProfile.Common.Constants)
local UseLocalRobuxBalanceFunction = require(Parent.RobloxAppHooks).useLocalRobuxBalance
local UseRealNamesInDisplayNamesEnabledModule = require(EditProfile.Hooks.useRealNamesInDisplayNamesEnabled)
local FocusNavigatorWrapperModule = require(EditProfile.Utils.FocusNavigatorWrapper)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local DataHydrationTypes = require(Parent.DataHydration).DataHydrationTypes
local Signal = require(Parent.Signals).createSignal("")
local AnalyticsServiceV2Module = require(EditProfile.Analytics.AnalyticsServiceV2)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FFlagEditProfileNavigateToProfilePictureEditorModule = require(EditProfile.Flags.FFlagEditProfileNavigateToProfilePictureEditor)
local FFlagEditProfilePPEStartOnEmotesPageModule = require(EditProfile.Flags.FFlagEditProfilePPEStartOnEmotesPage)
local NavigationEvents = require(Parent.RoactNavigation).NavigationEvents
local EditProfileIXPLayer = game:DefineFastString("EditProfileIXPLayer", "Social.EditProfilePage")

return function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), UseRealNamesInDisplayNamesEnabledModule (copy), ProfileRefreshSignal (copy), ReactModule (copy), FocusNavigationUtilsModule (copy), ReactFocusNavigationModule (copy), UseEffectFunction (copy), FFlagAXEnableProfileTab (copy), AnalyticsServiceV2Module (copy), EnumsModule (copy), ConstantsModule (copy), UseLocalRobuxBalanceFunction (copy), FFlagEditProfileNavigateToProfilePictureEditorModule (copy), FFlagEditProfilePPEStartOnEmotesPageModule (copy), GetResult (copy), UseSignalStateFunction (copy), Signal (copy), EditProfileStoreModule (copy), DataHydrationTypes (copy), FocusNavigatorWrapperModule (copy), NavigationEvents (copy), IXPService (copy), EditProfileIXPLayer (copy), EditProfileLandingModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseRealNamesInDisplayNamesEnabledModuleResult = UseRealNamesInDisplayNamesEnabledModule()
	
	local function OnClose()
		-- upvalues: ProfileRefreshSignal (upval), p1 (copy)
		ProfileRefreshSignal.notifyProfileRefresh()
		p1.navigation.pop()
	end
	
	local UseRefResult = ReactModule.useRef(nil)
	local Currents = {}
	local UseAutoFocusResult = FocusNavigationUtilsModule.useAutoFocus(Currents, 0.1)
	local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
	UseEffectFunction(function()
		-- upvalues: Currents (copy), UseRefResult (copy), UseContextResult (copy), UseAutoFocusResult (copy)
		Currents[1] = UseRefResult.current
		local UseAutoFocusResultResult = if UseContextResult and UseContextResult.focusedGuiObject:getValue() ~= nil and UseAutoFocusResult then UseAutoFocusResult() else nil
		
		return function()
			-- upvalues: UseAutoFocusResultResult (ref)
			if UseAutoFocusResultResult then
				UseAutoFocusResultResult.cancel()
			end
		end
	end, { UseAutoFocusResult })
	local IsFullBleedParam: boolean = FFlagAXEnableProfileTab and p1.navigation.getParam("fullBleed") == true
	
	local function DisplayName()
		-- upvalues: AnalyticsServiceV2Module (upval), p1 (copy), EnumsModule (upval), IsFullBleedParam (copy)
		AnalyticsServiceV2Module.sendDisplayNameModalOpened()
		p1.navigation.navigate(EnumsModule.Screens.EditProfileSubScreen, {
			screen = EnumsModule.Screens.EditDisplayName,
			fullBleed = IsFullBleedParam
		})
	end
	
	local function showToast(Text)
		-- upvalues: p1 (copy), EnumsModule (upval)
		p1.navigation.goBack()
		p1.navigation.navigate(EnumsModule.Screens.EditProfileToast, { text = Text })
	end
	
	local Param = p1.navigation.getParam(ConstantsModule.EditUserNameWebView)
	
	local function NavigateDownToPurchaseRobux()
		-- upvalues: p1 (copy), EnumsModule (upval)
		p1.navigation.navigate(EnumsModule.Screens.UsernameInsufficientFundsModal)
	end
	
	local UseLocalRobuxBalanceResult = UseLocalRobuxBalanceFunction()
	
	local function Username()
		-- upvalues: UseLocalRobuxBalanceResult (copy), ConstantsModule (upval), Param (copy), showToast (copy), p1 (copy), EnumsModule (upval), NavigateDownToPurchaseRobux (copy), AnalyticsServiceV2Module (upval)
		if ConstantsModule.ChangeUsernamePrice <= UseLocalRobuxBalanceResult then
			Param(showToast)
		else
			p1.navigation.navigate(EnumsModule.Screens.UsernameInsufficientFundsModal, {
				robux = ConstantsModule.ChangeUsernamePrice - UseLocalRobuxBalanceResult,
				navigateDownToPurchaseRobux = NavigateDownToPurchaseRobux
			})
		end
		AnalyticsServiceV2Module.sendEditUsernameOpened()
	end
	
	local function Bio()
		-- upvalues: p1 (copy), EnumsModule (upval), IsFullBleedParam (copy)
		p1.navigation.navigate(EnumsModule.Screens.EditProfileSubScreen, {
			screen = EnumsModule.Screens.EditBio,
			fullBleed = IsFullBleedParam
		})
	end
	
	local function Avatar()
		-- upvalues: AnalyticsServiceV2Module (upval), FFlagEditProfileNavigateToProfilePictureEditorModule (upval), FFlagEditProfilePPEStartOnEmotesPageModule (upval), p1 (copy), EnumsModule (upval)
		AnalyticsServiceV2Module.sendOpenAvatarMarketplace()
		
		if not FFlagEditProfileNavigateToProfilePictureEditorModule then
			p1.navigation.navigate(EnumsModule.Screens.AvatarCatalog)
			
			return
		end
		if FFlagEditProfilePPEStartOnEmotesPageModule then
			p1.navigation.navigate(EnumsModule.Screens.ProfilePictureEditorEmotes)
			
			return
		else
			p1.navigation.navigate(EnumsModule.Screens.ProfilePictureEditorCamera)
		end
	end
	
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetResult (upval), UseLocalUserIdResult (copy)
		return GetResult.fetchNamesByUserIds({ (tostring(UseLocalUserIdResult)) })
	end, { UseLocalUserIdResult })
	UseEffectFunction(function()
		-- upvalues: AnalyticsServiceV2Module (upval)
		AnalyticsServiceV2Module.sendEditProfileOpened()
	end, {})
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult)
	local Entry = UseSignalStateResult and (UseSignalStateResult.data and UseSignalStateResult.data[1])
	local Description = EditProfileStoreModule.getDescription(UseLocalUserIdResult)
	
	return FocusNavigatorWrapperModule({ onClose = OnClose }, {
		EditProfileLandingExposureLogger = ReactModule.createElement(NavigationEvents, {
			onDidFocus = function()
				-- upvalues: IXPService (upval), EditProfileIXPLayer (upval)
				IXPService:LogUserLayerExposure(EditProfileIXPLayer)
			end
		}),
		EditProfileLandingModule({
			userId = UseLocalUserIdResult,
			fullBleed = IsFullBleedParam,
			onClose = OnClose,
			username = UseSignalStateFunction(if Entry then Entry.names.getUsername else Signal) or "",
			displayName = UseSignalStateFunction(if Entry then Entry.names.getDisplayName else Signal) or "",
			areNamesLoading = not UseSignalStateResult or UseSignalStateResult.status ~= "success",
			bioText = UseSignalStateFunction(Description.data) or "",
			isBioLoading = UseSignalStateFunction(Description.status) == DataHydrationTypes.DataStatus.NotReady,
			isPolicyEnabled = UseRealNamesInDisplayNamesEnabledModuleResult,
			settingButtonOnActivated = {
				displayName = DisplayName,
				username = Username,
				bio = Bio,
				avatar = Avatar
			},
			firstItemRef = UseRefResult
		})
	})
end