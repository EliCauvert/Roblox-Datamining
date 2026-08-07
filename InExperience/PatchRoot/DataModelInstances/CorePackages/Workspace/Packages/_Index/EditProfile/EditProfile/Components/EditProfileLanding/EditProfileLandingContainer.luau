local editProfile = script:FindFirstAncestor("EditProfile")
local IXPService = game:GetService("IXPService")
local parent = editProfile.Parent
local editProfileLandingModule = require(editProfile.Components.EditProfileLanding.EditProfileLanding)
local editProfileLandingV2Module = require(editProfile.Components.EditProfileLanding.EditProfileLandingV2)
local fFlagEditProfileLandingV2EnabledModule = require(editProfile.Flags.FFlagEditProfileLandingV2Enabled)
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local _ = require(parent.AvatarExperienceNavigation)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local var6 = require(parent.UserProfiles).Stores.UserProfileStore.get()
local editProfileStoreModule = require(editProfile.Stores.EditProfileStore)
local profileRefreshSignal = require(parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local enumsModule = require(editProfile.Common.Enums)
local constantsModule = require(editProfile.Common.Constants)
local useLocalRobuxBalance = require(parent.RobloxAppHooks).useLocalRobuxBalance
local useRealNamesInDisplayNamesEnabledModule = require(editProfile.Hooks.useRealNamesInDisplayNamesEnabled)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)
local useSignalState = require(parent.SignalsReact).useSignalState
local dataHydrationTypes = require(parent.DataHydration).DataHydrationTypes
local var12 = require(parent.Signals).createSignal("")
local analyticsServiceV2Module = require(editProfile.Analytics.AnalyticsServiceV2)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagAXPPEReturnToEntrySurface = require(parent.SharedFlags).FFlagAXPPEReturnToEntrySurface
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local fFlagEditProfilePPEStartOnEmotesPageModule = require(editProfile.Flags.FFlagEditProfilePPEStartOnEmotesPage)
local roactNavigationModule = require(parent.RoactNavigation)
local navigationEvents = roactNavigationModule.NavigationEvents
local editProfileIXPLayer = game:DefineFastString("EditProfileIXPLayer", "Social.EditProfilePage")

local function _(p0) --[[ line: 51 | named "getHostRoute" ]]
	local var20 = p0._dangerouslyGetParent()
	local state = var20 and var20.state
	
	return if state and state.routeName then state else nil
end

local function getCoveredPage(p1, p2) --[[ line: 58 ]]
	local var22 = p1
	local var23 = var22._dangerouslyGetParent()
	while var23 do
		var22 = var23
		var23 = if var22._dangerouslyGetParent then var22._dangerouslyGetParent() else nil
	end
	local routes = var22.state.routes
	
	if not routes then
		return nil, nil
	end
	for i, v in routes do
		if v.routeName == p2.routeName and i > 1 then
			local var24 = routes[i - 1]
			local var25 = if var24.routes and var24.index then var24.routes[var24.index] else var24
			
			return var25.routeName, var25.params
		end
	end
	return nil, nil
end

return function(p3) --[[ line: 82 | named "EditProfileLandingContainer" ]]
	-- upvalues: useLocalUserId (ref), useRealNamesInDisplayNamesEnabledModule (ref), profileRefreshSignal (ref), reactModule (ref), focusNavigationUtilsModule (ref), reactFocusNavigationModule (ref), useEffect (ref), fFlagAXEnableProfileTab (ref), analyticsServiceV2Module (ref), enumsModule (ref), constantsModule (ref), useLocalRobuxBalance (ref), fFlagAXPPEReturnToEntrySurface (ref), fFlagEditProfilePPEStartOnEmotesPageModule (ref), getCoveredPage (ref), roactNavigationModule (ref), var6 (ref), useSignalState (ref), var12 (ref), editProfileStoreModule (ref), dataHydrationTypes (ref), focusNavigatorWrapperModule (ref), navigationEvents (ref), IXPService (ref), editProfileIXPLayer (ref), fFlagEditProfileLandingV2EnabledModule (ref), editProfileLandingV2Module (ref), editProfileLandingModule (ref)
	local var26 = useLocalUserId()
	local var27 = useRealNamesInDisplayNamesEnabledModule()
	
	local var28 = function() --[[ line: 85 ]]
		-- upvalues: profileRefreshSignal (copy), p3 (ref)
		profileRefreshSignal.notifyProfileRefresh()
		p3.navigation.pop()
	end
	
	local var29 = reactModule.useRef(nil)
	local t = {}
	local var31 = focusNavigationUtilsModule.useAutoFocus(t, 0.1)
	local var32 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	useEffect(function() --[[ line: 95 ]]
		-- upvalues: t (ref), var29 (ref), var32 (ref), var31 (ref)
		t[1] = var29.current
		local var48 = if var32 and var32.focusedGuiObject:getValue() ~= nil and var31 then var31() else nil
		
		return function() --[[ line: 101 ]]
			-- upvalues: var48 (write)
			if var48 then
				var48.cancel()
			end
		end
	end, { var31 })
	local var33 = fFlagAXEnableProfileTab and p3.navigation.getParam("fullBleed") == true
	
	local var34 = function() --[[ line: 113 ]]
		-- upvalues: analyticsServiceV2Module (copy), p3 (ref), enumsModule (copy), var33 (ref)
		analyticsServiceV2Module.sendDisplayNameModalOpened()
		p3.navigation.navigate(enumsModule.Screens.EditProfileSubScreen, {
			screen = enumsModule.Screens.EditDisplayName,
			fullBleed = var33
		})
	end
	
	local function showToast(p4) --[[ line: 121 ]]
		-- upvalues: p3 (ref), enumsModule (copy)
		p3.navigation.goBack()
		p3.navigation.navigate(enumsModule.Screens.EditProfileToast, { text = p4 })
	end
	
	local param = p3.navigation.getParam(constantsModule.EditUserNameWebView)
	
	local var37 = function() --[[ line: 128 ]]
		-- upvalues: p3 (ref), enumsModule (copy)
		p3.navigation.navigate(enumsModule.Screens.UsernameInsufficientFundsModal)
	end
	
	local var38 = useLocalRobuxBalance()
	
	local var39 = function() --[[ line: 133 ]]
		-- upvalues: var38 (ref), constantsModule (copy), param (ref), showToast (ref), p3 (ref), enumsModule (copy), var37 (ref), analyticsServiceV2Module (copy)
		if constantsModule.ChangeUsernamePrice <= var38 then
			param(showToast)
		else
			p3.navigation.navigate(enumsModule.Screens.UsernameInsufficientFundsModal, {
				robux = constantsModule.ChangeUsernamePrice - var38,
				navigateDownToPurchaseRobux = var37
			})
		end
		analyticsServiceV2Module.sendEditUsernameOpened()
	end
	
	local var40 = function() --[[ line: 145 ]]
		-- upvalues: p3 (ref), enumsModule (copy), var33 (ref)
		p3.navigation.navigate(enumsModule.Screens.EditProfileSubScreen, { screen = enumsModule.Screens.EditBio, fullBleed = var33 })
	end
	
	local var41 = function() --[[ line: 152 ]]
		-- upvalues: analyticsServiceV2Module (copy), fFlagAXPPEReturnToEntrySurface (copy), fFlagEditProfilePPEStartOnEmotesPageModule (copy), enumsModule (copy), p3 (ref), getCoveredPage (copy), roactNavigationModule (copy)
		analyticsServiceV2Module.sendOpenAvatarMarketplace()
		
		if fFlagAXPPEReturnToEntrySurface then
			local var49 = if fFlagEditProfilePPEStartOnEmotesPageModule then enumsModule.Screens.ProfilePictureEditorEmotes else enumsModule.Screens.ProfilePictureEditorCamera
			local var50 = p3.navigation._dangerouslyGetParent()
			local state = var50 and var50.state
			local var52 = if state and state.routeName then state else nil
			
			if var52 then
				local var53, var54 = getCoveredPage(p3.navigation, var52)
				p3.navigation.navigate(var49, {
					entryOrigin = {
						screenName = var52.routeName,
						screenParams = var52.params,
						reopenAction = roactNavigationModule.Actions.navigate({
							routeName = p3.navigation.state.routeName,
							params = p3.navigation.state.params
						}),
						coveredScreenName = var53,
						coveredScreenParams = var54
					}
				})
				
				return
			elseif fFlagEditProfilePPEStartOnEmotesPageModule then
				p3.navigation.navigate(enumsModule.Screens.ProfilePictureEditorEmotes)
				
				return
			end
			p3.navigation.navigate(enumsModule.Screens.ProfilePictureEditorCamera)
		end
	end
	
	local var42 = reactModule.useMemo(function() --[[ line: 185 ]]
		-- upvalues: var6 (copy), var26 (ref)
		return var6.fetchNamesByUserIds({ tostring(var26) })
	end, { var26 })
	useEffect(function() --[[ line: 188 ]]
		-- upvalues: analyticsServiceV2Module (copy)
		analyticsServiceV2Module.sendEditProfileOpened()
	end, {})
	local var43 = useSignalState(var42)
	local var44 = not var43 or var43.status ~= "success"
	local var45 = var43 and (var43.data and var43.data[1])
	local description = editProfileStoreModule.getDescription(var26)
	local t_1 = {
		userId = var26,
		fullBleed = var33,
		onClose = var28,
		username = useSignalState(if var45 then var45.names.getUsername else var12) or "",
		displayName = useSignalState(if var45 then var45.names.getDisplayName else var12) or "",
		areNamesLoading = var44,
		bioText = useSignalState(description.data) or "",
		isBioLoading = useSignalState(description.status) == dataHydrationTypes.DataStatus.NotReady,
		isPolicyEnabled = var27,
		settingButtonOnActivated = {
			displayName = var34,
			username = var39,
			bio = var40,
			avatar = var41
		},
		firstItemRef = var29
	}
	
	return focusNavigatorWrapperModule({ onClose = var28 }, {
		EditProfileLandingExposureLogger = reactModule.createElement(navigationEvents, {
			onDidFocus = function() --[[ line: 233 ]]
				-- upvalues: IXPService (copy), editProfileIXPLayer (copy)
				IXPService:LogUserLayerExposure(editProfileIXPLayer)
			end
		}),
		EditProfileLanding = if fFlagEditProfileLandingV2EnabledModule then reactModule.createElement(editProfileLandingV2Module, t_1) else reactModule.createElement(editProfileLandingModule, t_1)
	})
end