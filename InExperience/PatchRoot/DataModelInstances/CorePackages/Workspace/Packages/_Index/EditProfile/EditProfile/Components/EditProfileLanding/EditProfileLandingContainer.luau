local EditProfile = script:FindFirstAncestor("EditProfile")
local IXPService = game:GetService("IXPService")
local Parent = EditProfile.Parent
local EditProfileLandingModule = require(EditProfile.Components.EditProfileLanding.EditProfileLanding)
local EditProfileLandingV2Module = require(EditProfile.Components.EditProfileLanding.EditProfileLandingV2)
local FFlagEditProfileLandingV2EnabledModule = require(EditProfile.Flags.FFlagEditProfileLandingV2Enabled)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
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
local FFlagEditProfilePPEStartOnEmotesPageModule = require(EditProfile.Flags.FFlagEditProfilePPEStartOnEmotesPage)
local FFlagEditProfileUsernameServerPriceModule = require(EditProfile.Flags.FFlagEditProfileUsernameServerPrice)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local DataHydrationTypes = require(Parent.DataHydration).DataHydrationTypes
local Signal = require(Parent.Signals).createSignal("")
local AnalyticsServiceV2Module = require(EditProfile.Analytics.AnalyticsServiceV2)
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagAXPPEReturnToEntrySurface = require(Parent.SharedFlags).FFlagAXPPEReturnToEntrySurface
local FFlagEditProfileImageV2Enabled = require(Parent.SharedFlags).FFlagEditProfileImageV2Enabled
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local RoactNavigationModule = require(Parent.RoactNavigation)
local NavigationEvents = RoactNavigationModule.NavigationEvents
local EditProfileIXPLayer = game:DefineFastString("EditProfileIXPLayer", "Social.EditProfilePage")

local function _(p1) --[[ Line: 59 | Named "getHostRoute" ]]
	local DangerouslyGetParentResult = p1._dangerouslyGetParent()
	local State = DangerouslyGetParentResult and DangerouslyGetParentResult.state
	
	return if State and State.routeName then State else nil
end

local function getCoveredPage(Navigation, p1) --[[ Line: 66 ]]
	local Navigation1 = Navigation
	local DangerouslyGetParentResult = Navigation1._dangerouslyGetParent()
	while DangerouslyGetParentResult do
		Navigation1 = DangerouslyGetParentResult
		DangerouslyGetParentResult = if Navigation1._dangerouslyGetParent then Navigation1._dangerouslyGetParent() else nil
	end
	local Routes = Navigation1.state.routes
	
	if not Routes then
		return nil, nil
	end
	for i, route in Routes do
		if route.routeName == p1.routeName and i > 1 then
			local Route = Routes[i - 1]
			local Route1 = if Route.routes and Route.index then Route.routes[Route.index] else Route
			
			return Route1.routeName, Route1.params
		end
	end
	return nil, nil
end

local function openEditProfileImageFromProfilePlatform(Navigation, p2) --[[ Line: 94 ]]
	-- upvalues: FFlagAXEnableProfileTab (copy), EnumsModule (copy)
	local t = {}
	
	if p2 and p2.mode then
		t.mode = p2.mode
	end
	if FFlagAXEnableProfileTab and Navigation.getParam and Navigation.getParam("fullBleed") == true then
		t.fullBleed = true
	end
	if next(t) == nil then
		Navigation.navigate(EnumsModule.Screens.EditProfileImageProfilePlatform)
		
		return
	else
		Navigation.navigate(EnumsModule.Screens.EditProfileImageProfilePlatform, t)
	end
end

return function(p2) --[[ Line: 114 | Named "EditProfileLandingContainer" ]]
	-- upvalues: UseLocalUserIdFunction (copy), UseRealNamesInDisplayNamesEnabledModule (copy), ProfileRefreshSignal (copy), ReactModule (copy), FocusNavigationUtilsModule (copy), ReactFocusNavigationModule (copy), UseEffectFunction (copy), FFlagAXEnableProfileTab (copy), AnalyticsServiceV2Module (copy), EnumsModule (copy), ConstantsModule (copy), UseLocalRobuxBalanceFunction (copy), FFlagEditProfileUsernameServerPriceModule (copy), EditProfileStoreModule (copy), UseSignalStateFunction (copy), FFlagEditProfileImageV2Enabled (copy), openEditProfileImageFromProfilePlatform (copy), FFlagAXPPEReturnToEntrySurface (copy), FFlagEditProfilePPEStartOnEmotesPageModule (copy), getCoveredPage (copy), RoactNavigationModule (copy), GetResult (copy), Signal (copy), DataHydrationTypes (copy), FocusNavigatorWrapperModule (copy), NavigationEvents (copy), IXPService (copy), EditProfileIXPLayer (copy), FFlagEditProfileLandingV2EnabledModule (copy), EditProfileLandingV2Module (copy), CryoModule (copy), EditProfileLandingModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseRealNamesInDisplayNamesEnabledModuleResult = UseRealNamesInDisplayNamesEnabledModule()
	
	local function OnClose() --[[ Line: 117 ]]
		-- upvalues: ProfileRefreshSignal (upval), p2 (copy)
		ProfileRefreshSignal.notifyProfileRefresh()
		p2.navigation.pop()
	end
	
	local UseRefResult = ReactModule.useRef(nil)
	local Currents = {}
	local UseAutoFocusResult = FocusNavigationUtilsModule.useAutoFocus(Currents, 0.1)
	local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
	UseEffectFunction(function() --[[ Line: 127 ]]
		-- upvalues: Currents (copy), UseRefResult (copy), UseContextResult (copy), UseAutoFocusResult (copy)
		Currents[1] = UseRefResult.current
		local UseAutoFocusResultResult = if UseContextResult and UseContextResult.focusedGuiObject:getValue() ~= nil and UseAutoFocusResult then UseAutoFocusResult() else nil
		
		return function() --[[ Line: 133 ]]
			-- upvalues: UseAutoFocusResultResult (ref)
			if UseAutoFocusResultResult then
				UseAutoFocusResultResult.cancel()
			end
		end
	end, { UseAutoFocusResult })
	local IsFullBleedParam: boolean = FFlagAXEnableProfileTab and p2.navigation.getParam("fullBleed") == true
	
	local function DisplayName() --[[ Line: 145 ]]
		-- upvalues: AnalyticsServiceV2Module (upval), p2 (copy), EnumsModule (upval), IsFullBleedParam (copy)
		AnalyticsServiceV2Module.sendDisplayNameModalOpened()
		p2.navigation.navigate(EnumsModule.Screens.EditProfileSubScreen, {
			screen = EnumsModule.Screens.EditDisplayName,
			fullBleed = IsFullBleedParam
		})
	end
	
	local function showToast(Text) --[[ Line: 153 ]]
		-- upvalues: p2 (copy), EnumsModule (upval)
		p2.navigation.goBack()
		p2.navigation.navigate(EnumsModule.Screens.EditProfileToast, { text = Text })
	end
	
	local Param = p2.navigation.getParam(ConstantsModule.EditUserNameWebView)
	
	local function NavigateDownToPurchaseRobux() --[[ Line: 160 ]]
		-- upvalues: p2 (copy), EnumsModule (upval)
		p2.navigation.navigate(EnumsModule.Screens.UsernameInsufficientFundsModal)
	end
	
	local UseLocalRobuxBalanceResult = UseLocalRobuxBalanceFunction()
	local UseSignalStateResult = if FFlagEditProfileUsernameServerPriceModule then UseSignalStateFunction(EditProfileStoreModule.getUsernameChangePrice((tostring(UseLocalUserIdResult))).data) else nil
	
	local function Username() --[[ Line: 171 ]]
		-- upvalues: FFlagEditProfileUsernameServerPriceModule (upval), UseSignalStateResult (ref), ConstantsModule (upval), UseLocalRobuxBalanceResult (copy), Param (copy), showToast (copy), p2 (copy), EnumsModule (upval), NavigateDownToPurchaseRobux (copy), AnalyticsServiceV2Module (upval)
		local PriceInRobux = if FFlagEditProfileUsernameServerPriceModule then UseSignalStateResult and UseSignalStateResult.priceInRobux else ConstantsModule.ChangeUsernamePrice
		
		if FFlagEditProfileUsernameServerPriceModule and (UseSignalStateResult ~= nil and UseSignalStateResult.isFreeUsernameChange) or PriceInRobux == nil or PriceInRobux <= UseLocalRobuxBalanceResult then
			Param(showToast)
		else
			p2.navigation.navigate(EnumsModule.Screens.UsernameInsufficientFundsModal, {
				robux = PriceInRobux - UseLocalRobuxBalanceResult,
				navigateDownToPurchaseRobux = NavigateDownToPurchaseRobux
			})
		end
		AnalyticsServiceV2Module.sendEditUsernameOpened()
	end
	
	local function Bio() --[[ Line: 197 ]]
		-- upvalues: p2 (copy), EnumsModule (upval), IsFullBleedParam (copy)
		p2.navigation.navigate(EnumsModule.Screens.EditProfileSubScreen, {
			screen = EnumsModule.Screens.EditBio,
			fullBleed = IsFullBleedParam
		})
	end
	
	local function Avatar() --[[ Line: 204 ]]
		-- upvalues: AnalyticsServiceV2Module (upval), FFlagEditProfileImageV2Enabled (upval), openEditProfileImageFromProfilePlatform (upval), p2 (copy), FFlagAXPPEReturnToEntrySurface (upval), FFlagEditProfilePPEStartOnEmotesPageModule (upval), EnumsModule (upval), getCoveredPage (upval), RoactNavigationModule (upval)
		AnalyticsServiceV2Module.sendOpenAvatarMarketplace()
		
		if FFlagEditProfileImageV2Enabled then
			openEditProfileImageFromProfilePlatform(p2.navigation)
			
			return
		end
		if FFlagAXPPEReturnToEntrySurface then
			local ProfilePictureEditorEmotes = if FFlagEditProfilePPEStartOnEmotesPageModule then EnumsModule.Screens.ProfilePictureEditorEmotes else EnumsModule.Screens.ProfilePictureEditorCamera
			local DangerouslyGetParentResult = p2.navigation._dangerouslyGetParent()
			local State = DangerouslyGetParentResult and DangerouslyGetParentResult.state
			local State1 = if State and State.routeName then State else nil
			
			if State1 then
				local CoveredPage, CoveredPage2 = getCoveredPage(p2.navigation, State1)
				p2.navigation.navigate(ProfilePictureEditorEmotes, {
					entryOrigin = {
						screenName = State1.routeName,
						screenParams = State1.params,
						reopenAction = RoactNavigationModule.Actions.navigate({
							routeName = p2.navigation.state.routeName,
							params = p2.navigation.state.params
						}),
						coveredScreenName = CoveredPage,
						coveredScreenParams = CoveredPage2
					}
				})
				
				return
			end
		end
		if FFlagEditProfilePPEStartOnEmotesPageModule then
			p2.navigation.navigate(EnumsModule.Screens.ProfilePictureEditorEmotes)
			
			return
		else
			p2.navigation.navigate(EnumsModule.Screens.ProfilePictureEditorCamera)
		end
	end
	
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 241 ]]
		-- upvalues: GetResult (upval), UseLocalUserIdResult (copy)
		return GetResult.fetchNamesByUserIds({ (tostring(UseLocalUserIdResult)) })
	end, { UseLocalUserIdResult })
	UseEffectFunction(function() --[[ Line: 244 ]]
		-- upvalues: AnalyticsServiceV2Module (upval)
		AnalyticsServiceV2Module.sendEditProfileOpened()
	end, {})
	local UseSignalStateResult1 = UseSignalStateFunction(UseMemoResult)
	local Entry = UseSignalStateResult1 and (UseSignalStateResult1.data and UseSignalStateResult1.data[1])
	local Description = EditProfileStoreModule.getDescription(UseLocalUserIdResult)
	
	local function OnProfileFramesActivated() --[[ Line: 263 ]]
		-- upvalues: openEditProfileImageFromProfilePlatform (upval), p2 (copy), EnumsModule (upval)
		openEditProfileImageFromProfilePlatform(p2.navigation, { mode = EnumsModule.EditProfileImageMode.FramesOnly })
	end
	
	local config = {
		userId = UseLocalUserIdResult,
		fullBleed = IsFullBleedParam,
		onClose = OnClose,
		username = UseSignalStateFunction(if Entry then Entry.names.getUsername else Signal) or "",
		displayName = UseSignalStateFunction(if Entry then Entry.names.getDisplayName else Signal) or "",
		areNamesLoading = not UseSignalStateResult1 or UseSignalStateResult1.status ~= "success",
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
	}
	
	return FocusNavigatorWrapperModule({ onClose = OnClose }, {
		EditProfileLandingExposureLogger = ReactModule.createElement(NavigationEvents, {
			onDidFocus = function() --[[ Line: 295 ]]
				-- upvalues: IXPService (upval), EditProfileIXPLayer (upval)
				IXPService:LogUserLayerExposure(EditProfileIXPLayer)
			end
		}),
		EditProfileLanding = if FFlagEditProfileLandingV2EnabledModule then ReactModule.createElement(EditProfileLandingV2Module, CryoModule.Dictionary.join(config, { onProfileFramesActivated = OnProfileFramesActivated })) else ReactModule.createElement(EditProfileLandingModule, config)
	})
end