local editProfile = script:FindFirstAncestor("EditProfile")
local IXPService = game:GetService("IXPService")
local parent = editProfile.Parent
local editProfileLandingModule = require(editProfile.Components.EditProfileLanding.EditProfileLanding)
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local var4 = require(parent.UserProfiles).Stores.UserProfileStore.get()
local editProfileStoreModule = require(editProfile.Stores.EditProfileStore)
local profileRefreshSignal = require(parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local enumsModule = require(editProfile.Common.Enums)
local constantsModule = require(editProfile.Common.Constants)
local useLocalRobuxBalance = require(parent.RobloxAppHooks).useLocalRobuxBalance
local useRealNamesInDisplayNamesEnabledModule = require(editProfile.Hooks.useRealNamesInDisplayNamesEnabled)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)
local useSignalState = require(parent.SignalsReact).useSignalState
local dataHydrationTypes = require(parent.DataHydration).DataHydrationTypes
local var10 = require(parent.Signals).createSignal("")
local analyticsServiceV2Module = require(editProfile.Analytics.AnalyticsServiceV2)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local fFlagEditProfileNavigateToProfilePictureEditorModule = require(editProfile.Flags.FFlagEditProfileNavigateToProfilePictureEditor)
local fFlagEditProfilePPEStartOnEmotesPageModule = require(editProfile.Flags.FFlagEditProfilePPEStartOnEmotesPage)
local navigationEvents = require(parent.RoactNavigation).NavigationEvents
local editProfileIXPLayer = game:DefineFastString("EditProfileIXPLayer", "Social.EditProfilePage")

return function(p0) --[[ line: 48 | named "EditProfileLandingContainer" ]]
	-- upvalues: useLocalUserId (ref), useRealNamesInDisplayNamesEnabledModule (ref), profileRefreshSignal (ref), reactModule (ref), focusNavigationUtilsModule (ref), reactFocusNavigationModule (ref), useEffect (ref), fFlagAXEnableProfileTab (ref), analyticsServiceV2Module (ref), enumsModule (ref), constantsModule (ref), useLocalRobuxBalance (ref), fFlagEditProfileNavigateToProfilePictureEditorModule (ref), fFlagEditProfilePPEStartOnEmotesPageModule (ref), var4 (ref), useSignalState (ref), var10 (ref), editProfileStoreModule (ref), dataHydrationTypes (ref), focusNavigatorWrapperModule (ref), navigationEvents (ref), IXPService (ref), editProfileIXPLayer (ref), editProfileLandingModule (ref)
	local var17 = useLocalUserId()
	local var18 = useRealNamesInDisplayNamesEnabledModule()
	
	local var19 = function() --[[ line: 51 ]]
		-- upvalues: profileRefreshSignal (copy), p0 (ref)
		profileRefreshSignal.notifyProfileRefresh()
		p0.navigation.pop()
	end
	
	local var20 = reactModule.useRef(nil)
	local t = {}
	local var22 = focusNavigationUtilsModule.useAutoFocus(t, 0.1)
	local var23 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	useEffect(function() --[[ line: 61 ]]
		-- upvalues: t (ref), var20 (ref), var23 (ref), var22 (ref)
		t[1] = var20.current
		local var38 = if var23 and var23.focusedGuiObject:getValue() ~= nil and var22 then var22() else nil
		
		return function() --[[ line: 67 ]]
			-- upvalues: var38 (write)
			if var38 then
				var38.cancel()
			end
		end
	end, { var22 })
	local var24 = fFlagAXEnableProfileTab and p0.navigation.getParam("fullBleed") == true
	
	local var25 = function() --[[ line: 79 ]]
		-- upvalues: analyticsServiceV2Module (copy), p0 (ref), enumsModule (copy), var24 (ref)
		analyticsServiceV2Module.sendDisplayNameModalOpened()
		p0.navigation.navigate(enumsModule.Screens.EditProfileSubScreen, {
			screen = enumsModule.Screens.EditDisplayName,
			fullBleed = var24
		})
	end
	
	local function showToast(p1) --[[ line: 87 ]]
		-- upvalues: p0 (ref), enumsModule (copy)
		p0.navigation.goBack()
		p0.navigation.navigate(enumsModule.Screens.EditProfileToast, { text = p1 })
	end
	
	local param = p0.navigation.getParam(constantsModule.EditUserNameWebView)
	
	local var28 = function() --[[ line: 94 ]]
		-- upvalues: p0 (ref), enumsModule (copy)
		p0.navigation.navigate(enumsModule.Screens.UsernameInsufficientFundsModal)
	end
	
	local var29 = useLocalRobuxBalance()
	
	local var30 = function() --[[ line: 99 ]]
		-- upvalues: var29 (ref), constantsModule (copy), param (ref), showToast (ref), p0 (ref), enumsModule (copy), var28 (ref), analyticsServiceV2Module (copy)
		if constantsModule.ChangeUsernamePrice <= var29 then
			param(showToast)
		else
			p0.navigation.navigate(enumsModule.Screens.UsernameInsufficientFundsModal, {
				robux = constantsModule.ChangeUsernamePrice - var29,
				navigateDownToPurchaseRobux = var28
			})
		end
		analyticsServiceV2Module.sendEditUsernameOpened()
	end
	
	local var31 = function() --[[ line: 111 ]]
		-- upvalues: p0 (ref), enumsModule (copy), var24 (ref)
		p0.navigation.navigate(enumsModule.Screens.EditProfileSubScreen, { screen = enumsModule.Screens.EditBio, fullBleed = var24 })
	end
	
	local var32 = function() --[[ line: 118 ]]
		-- upvalues: analyticsServiceV2Module (copy), fFlagEditProfileNavigateToProfilePictureEditorModule (copy), fFlagEditProfilePPEStartOnEmotesPageModule (copy), p0 (ref), enumsModule (copy)
		analyticsServiceV2Module.sendOpenAvatarMarketplace()
		
		if not fFlagEditProfileNavigateToProfilePictureEditorModule then
			p0.navigation.navigate(enumsModule.Screens.AvatarCatalog)
			
			return
		elseif fFlagEditProfilePPEStartOnEmotesPageModule then
			p0.navigation.navigate(enumsModule.Screens.ProfilePictureEditorEmotes)
			
			return
		end
		p0.navigation.navigate(enumsModule.Screens.ProfilePictureEditorCamera)
	end
	
	local var33 = reactModule.useMemo(function() --[[ line: 131 ]]
		-- upvalues: var4 (copy), var17 (ref)
		return var4.fetchNamesByUserIds({ tostring(var17) })
	end, { var17 })
	useEffect(function() --[[ line: 134 ]]
		-- upvalues: analyticsServiceV2Module (copy)
		analyticsServiceV2Module.sendEditProfileOpened()
	end, {})
	local var34 = useSignalState(var33)
	local var35 = not var34 or var34.status ~= "success"
	local var36 = var34 and (var34.data and var34.data[1])
	local description = editProfileStoreModule.getDescription(var17)
	
	return focusNavigatorWrapperModule({ onClose = var19 }, {
		EditProfileLandingExposureLogger = reactModule.createElement(navigationEvents, {
			onDidFocus = function() --[[ line: 157 ]]
				-- upvalues: IXPService (copy), editProfileIXPLayer (copy)
				IXPService:LogUserLayerExposure(editProfileIXPLayer)
			end
		}),
		editProfileLandingModule({
			userId = var17,
			fullBleed = var24,
			onClose = var19,
			username = useSignalState(if var36 then var36.names.getUsername else var10) or "",
			displayName = useSignalState(if var36 then var36.names.getDisplayName else var10) or "",
			areNamesLoading = var35,
			bioText = useSignalState(description.data) or "",
			isBioLoading = useSignalState(description.status) == dataHydrationTypes.DataStatus.NotReady,
			isPolicyEnabled = var18,
			settingButtonOnActivated = {
				displayName = var25,
				username = var30,
				bio = var31,
				avatar = var32
			},
			firstItemRef = var20
		})
	})
end