local editProfile = script:FindFirstAncestor("EditProfile")
local IXPService = game:GetService("IXPService")
local parent = editProfile.Parent
local editProfileLandingModule = require(editProfile.Components.EditProfileLanding.EditProfileLanding)
local editProfileLandingV2Module = require(editProfile.Components.EditProfileLanding.EditProfileLandingV2)
local fFlagEditProfileLandingV2EnabledModule = require(editProfile.Flags.FFlagEditProfileLandingV2Enabled)
local reactModule = require(parent.React)
local useEffect = reactModule.useEffect
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local var6 = require(parent.UserProfiles).Stores.UserProfileStore.get()
local editProfileStoreModule = require(editProfile.Stores.EditProfileStore)
local profileRefreshSignal = require(parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local enumsModule = require(editProfile.Common.Enums)
local constantsModule = require(editProfile.Common.Constants)
local useLocalRobuxBalance = require(parent.RobloxAppHooks).useLocalRobuxBalance
local useRealNamesInDisplayNamesEnabledModule = require(editProfile.Hooks.useRealNamesInDisplayNamesEnabled)
local useProfileFramesNewLabelModule = require(editProfile.Hooks.useProfileFramesNewLabel)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)
local fFlagEditProfilePPEStartOnEmotesPageModule = require(editProfile.Flags.FFlagEditProfilePPEStartOnEmotesPage)
local fFlagProfileFramesNewLabelEnabledModule = require(editProfile.Flags.FFlagProfileFramesNewLabelEnabled)
local useUserAvatarConfigurations = require(parent.AvatarExperienceProfilePictureEditor).useUserAvatarConfigurations
local useSignalState = require(parent.SignalsReact).useSignalState
local dataHydrationTypes = require(parent.DataHydration).DataHydrationTypes
local var15 = require(parent.Signals).createSignal("")
local analyticsServiceV2Module = require(editProfile.Analytics.AnalyticsServiceV2)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagAXPPEReturnToEntrySurface = require(parent.SharedFlags).FFlagAXPPEReturnToEntrySurface
local fFlagEditProfileImageV2Enabled2 = require(parent.SharedFlags).FFlagEditProfileImageV2Enabled2
local fFlagEditProfileFramesEnabled2 = require(parent.SharedFlags).FFlagEditProfileFramesEnabled2
local useFocusGuiObject = require(parent.ReactFocusNavigation).useFocusGuiObject
local navigationModule = require(parent.Navigation)
local roactNavigationModule = require(parent.RoactNavigation)
local navigationEvents = roactNavigationModule.NavigationEvents
local editProfileIXPLayer = game:DefineFastString("EditProfileIXPLayer", "Social.EditProfilePage")

local function _(p0) --[[ line: 62 | named "getHostRoute" ]]
	local var22 = p0._dangerouslyGetParent()
	local state = var22 and var22.state
	
	return if state and state.routeName then state else nil
end

local function getCoveredPage(p1, p2) --[[ line: 69 ]]
	local var24 = p1
	local var25 = var24._dangerouslyGetParent()
	while var25 do
		var24 = var25
		var25 = if var24._dangerouslyGetParent then var24._dangerouslyGetParent() else nil
	end
	local routes = var24.state.routes
	
	if not routes then
		return nil, nil
	end
	for i, v in routes do
		if v.routeName == p2.routeName and i > 1 then
			local var26 = routes[i - 1]
			local var27 = if var26.routes and var26.index then var26.routes[var26.index] else var26
			
			return var27.routeName, var27.params
		end
	end
	return nil, nil
end

local function openEditProfileImageFromProfilePlatform(p3, p4) --[[ line: 97 ]]
	-- upvalues: fFlagAXEnableProfileTab (ref), enumsModule (ref)
	local t = {}
	
	if p4 and p4.mode then
		t.mode = p4.mode
	end
	if fFlagAXEnableProfileTab and p3.getParam and p3.getParam("fullBleed") == true then
		t.fullBleed = true
	end
	if next(t) == nil then
		p3.navigate(enumsModule.Screens.EditProfileImageProfilePlatform)
		
		return
	end
	p3.navigate(enumsModule.Screens.EditProfileImageProfilePlatform, t)
end

return function(p5) --[[ line: 117 | named "EditProfileLandingContainer" ]]
	-- upvalues: useLocalUserId (ref), useRealNamesInDisplayNamesEnabledModule (ref), profileRefreshSignal (ref), reactModule (ref), useFocusGuiObject (ref), navigationModule (ref), useEffect (ref), fFlagAXEnableProfileTab (ref), analyticsServiceV2Module (ref), enumsModule (ref), constantsModule (ref), useLocalRobuxBalance (ref), fFlagEditProfileImageV2Enabled2 (ref), openEditProfileImageFromProfilePlatform (ref), fFlagAXPPEReturnToEntrySurface (ref), fFlagEditProfilePPEStartOnEmotesPageModule (ref), getCoveredPage (ref), roactNavigationModule (ref), var6 (ref), useSignalState (ref), var15 (ref), editProfileStoreModule (ref), dataHydrationTypes (ref), useUserAvatarConfigurations (ref), fFlagEditProfileFramesEnabled2 (ref), fFlagProfileFramesNewLabelEnabledModule (ref), useProfileFramesNewLabelModule (ref), focusNavigatorWrapperModule (ref), navigationEvents (ref), IXPService (ref), editProfileIXPLayer (ref), fFlagEditProfileLandingV2EnabledModule (ref), editProfileLandingV2Module (ref), editProfileLandingModule (ref)
	local var29 = useLocalUserId()
	local var30 = useRealNamesInDisplayNamesEnabledModule()
	
	local var31 = function() --[[ line: 120 ]]
		-- upvalues: profileRefreshSignal (copy), p5 (ref)
		profileRefreshSignal.notifyProfileRefresh()
		p5.navigation.pop()
	end
	
	local var32 = reactModule.useRef(nil)
	local var33 = useFocusGuiObject()
	local var34 = navigationModule.useNavigationFocus()
	local var35 = reactModule.useRef(false)
	useEffect(function() --[[ line: 135 ]]
		-- upvalues: var34 (ref), var35 (ref), var32 (ref), var33 (ref)
		if var34 and not var35.current and var32.current then
			var35.current = true
			var33(var32.current)
			
			return
		end
	end, { var34, var33 })
	local var36 = fFlagAXEnableProfileTab and p5.navigation.getParam("fullBleed") == true
	
	local var37 = function() --[[ line: 148 ]]
		-- upvalues: analyticsServiceV2Module (copy), p5 (ref), enumsModule (copy), var36 (ref)
		analyticsServiceV2Module.sendDisplayNameModalOpened()
		p5.navigation.navigate(enumsModule.Screens.EditProfileSubScreen, {
			screen = enumsModule.Screens.EditDisplayName,
			fullBleed = var36
		})
	end
	
	local function showToast(p6) --[[ line: 156 ]]
		-- upvalues: p5 (ref), enumsModule (copy)
		p5.navigation.goBack()
		p5.navigation.navigate(enumsModule.Screens.EditProfileToast, { text = p6 })
	end
	
	local param = p5.navigation.getParam(constantsModule.EditUserNameWebView)
	
	local var40 = function() --[[ line: 163 ]]
		-- upvalues: p5 (ref), enumsModule (copy)
		p5.navigation.navigate(enumsModule.Screens.UsernameInsufficientFundsModal)
	end
	
	local var41 = useLocalRobuxBalance()
	
	local var42 = function() --[[ line: 168 ]]
		-- upvalues: var41 (ref), constantsModule (copy), param (ref), showToast (ref), p5 (ref), enumsModule (copy), var40 (ref), analyticsServiceV2Module (copy)
		if constantsModule.ChangeUsernamePrice <= var41 then
			param(showToast)
		else
			p5.navigation.navigate(enumsModule.Screens.UsernameInsufficientFundsModal, {
				robux = constantsModule.ChangeUsernamePrice - var41,
				navigateDownToPurchaseRobux = var40
			})
		end
		analyticsServiceV2Module.sendEditUsernameOpened()
	end
	
	local var43 = function() --[[ line: 180 ]]
		-- upvalues: p5 (ref), enumsModule (copy), var36 (ref)
		p5.navigation.navigate(enumsModule.Screens.EditProfileSubScreen, { screen = enumsModule.Screens.EditBio, fullBleed = var36 })
	end
	
	local var44 = function() --[[ line: 187 ]]
		-- upvalues: analyticsServiceV2Module (copy), fFlagEditProfileImageV2Enabled2 (copy), openEditProfileImageFromProfilePlatform (copy), p5 (ref), fFlagAXPPEReturnToEntrySurface (copy), fFlagEditProfilePPEStartOnEmotesPageModule (copy), enumsModule (copy), getCoveredPage (copy), roactNavigationModule (copy)
		analyticsServiceV2Module.sendOpenAvatarMarketplace()
		
		if fFlagEditProfileImageV2Enabled2 then
			openEditProfileImageFromProfilePlatform(p5.navigation)
			
			return
		elseif fFlagAXPPEReturnToEntrySurface then
			local var63 = if fFlagEditProfilePPEStartOnEmotesPageModule then enumsModule.Screens.ProfilePictureEditorEmotes else enumsModule.Screens.ProfilePictureEditorCamera
			local var64 = p5.navigation._dangerouslyGetParent()
			local state = var64 and var64.state
			local var66 = if state and state.routeName then state else nil
			
			if var66 then
				local var67, var68 = getCoveredPage(p5.navigation, var66)
				p5.navigation.navigate(var63, {
					entryOrigin = {
						screenName = var66.routeName,
						screenParams = var66.params,
						reopenAction = roactNavigationModule.Actions.navigate({
							routeName = p5.navigation.state.routeName,
							params = p5.navigation.state.params
						}),
						coveredScreenName = var67,
						coveredScreenParams = var68
					}
				})
				
				return
			elseif fFlagEditProfilePPEStartOnEmotesPageModule then
				p5.navigation.navigate(enumsModule.Screens.ProfilePictureEditorEmotes)
				
				return
			end
			p5.navigation.navigate(enumsModule.Screens.ProfilePictureEditorCamera)
		end
	end
	
	local var45 = reactModule.useMemo(function() --[[ line: 224 ]]
		-- upvalues: var6 (copy), var29 (ref)
		return var6.fetchNamesByUserIds({ tostring(var29) })
	end, { var29 })
	useEffect(function() --[[ line: 227 ]]
		-- upvalues: analyticsServiceV2Module (copy)
		analyticsServiceV2Module.sendEditProfileOpened()
	end, {})
	local var46 = useSignalState(var45)
	local var47 = not var46 or var46.status ~= "success"
	local var48 = var46 and (var46.data and var46.data[1])
	local var49 = useSignalState(if var48 then var48.names.getUsername else var15) or ""
	local var50 = useSignalState(if var48 then var48.names.getDisplayName else var15) or ""
	local description = editProfileStoreModule.getDescription(var29)
	local var52 = useSignalState(description.status) == dataHydrationTypes.DataStatus.NotReady
	local data = useSignalState(description.data) or ""
	local _, var54, var55 = useUserAvatarConfigurations(if fFlagEditProfileFramesEnabled2 then var29 else nil)
	local var56 = nil
	local var57 = nil
	
	if fFlagProfileFramesNewLabelEnabledModule then
		local var58, var59 = useProfileFramesNewLabelModule()
		var56 = var58
		var57 = var59
	end
	local var62
	local t = {
		userId = var29,
		fullBleed = var36,
		onClose = var31,
		username = var49,
		displayName = var50,
		areNamesLoading = var47,
		bioText = data,
		isBioLoading = var52,
		isPolicyEnabled = var30,
		settingButtonOnActivated = {
			displayName = var37,
			username = var42,
			bio = var43,
			avatar = var44
		},
		firstItemRef = var32
	}
	local t_1 = {
		userId = t.userId,
		fullBleed = t.fullBleed,
		onClose = t.onClose,
		username = t.username,
		displayName = t.displayName,
		areNamesLoading = t.areNamesLoading,
		bioText = t.bioText,
		isBioLoading = t.isBioLoading,
		isPolicyEnabled = t.isPolicyEnabled,
		settingButtonOnActivated = {
			displayName = t.settingButtonOnActivated.displayName,
			username = t.settingButtonOnActivated.username,
			bio = t.settingButtonOnActivated.bio,
			avatar = t.settingButtonOnActivated.avatar,
			profileFrames = function() --[[ line: 254 ]]
				-- upvalues: fFlagProfileFramesNewLabelEnabledModule (copy), var57 (write), openEditProfileImageFromProfilePlatform (copy), p5 (ref)
				if fFlagProfileFramesNewLabelEnabledModule then
					var57()
				end
				openEditProfileImageFromProfilePlatform(p5.navigation, { mode = "framesOnly" })
			end
		},
		firstItemRef = t.firstItemRef,
		profileFrameAssetId = var54,
		isProfileFrameLoading = var55
	}
	
	if fFlagProfileFramesNewLabelEnabledModule then
		var62 = var56 == true
		var62 = nil
	else
		var62 = false
	end
	t_1.showProfileFramesNewLabel = var62
	
	return focusNavigatorWrapperModule({ onClose = var31 }, {
		EditProfileLandingExposureLogger = reactModule.createElement(navigationEvents, {
			onDidFocus = function() --[[ line: 314 ]]
				-- upvalues: IXPService (copy), editProfileIXPLayer (copy)
				IXPService:LogUserLayerExposure(editProfileIXPLayer)
			end
		}),
		EditProfileLanding = if fFlagEditProfileLandingV2EnabledModule then reactModule.createElement(editProfileLandingV2Module, t_1) else reactModule.createElement(editProfileLandingModule, t)
	})
end