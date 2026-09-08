local editProfile = script:FindFirstAncestor("EditProfile")
local IXPService = game:GetService("IXPService")
local parent = editProfile.Parent
local editProfileLandingModule = require(editProfile.Components.EditProfileLanding.EditProfileLanding)
local editProfileLandingV2Module = require(editProfile.Components.EditProfileLanding.EditProfileLandingV2)
local fFlagEditProfileLandingV2EnabledModule = require(editProfile.Flags.FFlagEditProfileLandingV2Enabled)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useEffect = reactModule.useEffect
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local var1 = require(parent.UserProfiles).Stores.UserProfileStore.get()
local editProfileStoreModule = require(editProfile.Stores.EditProfileStore)
local profileRefreshSignal = require(parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local enumsModule = require(editProfile.Common.Enums)
local constantsModule = require(editProfile.Common.Constants)
local useLocalRobuxBalance = require(parent.RobloxAppHooks).useLocalRobuxBalance
local useRealNamesInDisplayNamesEnabledModule = require(editProfile.Hooks.useRealNamesInDisplayNamesEnabled)
local focusNavigatorWrapperModule = require(editProfile.Utils.FocusNavigatorWrapper)
local fFlagEditProfilePPEStartOnEmotesPageModule = require(editProfile.Flags.FFlagEditProfilePPEStartOnEmotesPage)
local useSignalState = require(parent.SignalsReact).useSignalState
local dataHydrationTypes = require(parent.DataHydration).DataHydrationTypes
local var2 = require(parent.Signals).createSignal("")
local analyticsServiceV2Module = require(editProfile.Analytics.AnalyticsServiceV2)
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab
local fFlagAXPPEReturnToEntrySurface = require(parent.SharedFlags).FFlagAXPPEReturnToEntrySurface
local fFlagEditProfileImageV2Enabled = require(parent.SharedFlags).FFlagEditProfileImageV2Enabled
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local roactNavigationModule = require(parent.RoactNavigation)
local navigationEvents = roactNavigationModule.NavigationEvents
local editProfileIXPLayer = game:DefineFastString("EditProfileIXPLayer", "Social.EditProfilePage")

local function _(p1)
	local var3 = p1._dangerouslyGetParent()
	local state = var3 and var3.state
	
	return if state and state.routeName then state else nil
end

local function getCoveredPage(p1, p2)
	local var3 = p1
	local var4 = var3._dangerouslyGetParent()
	while var4 do
		var3 = var4
		var4 = if var3._dangerouslyGetParent then var3._dangerouslyGetParent() else nil
	end
	local routes = var3.state.routes
	
	if not routes then
		return nil, nil
	end
	for i, v in routes do
		if v.routeName == p2.routeName and i > 1 then
			local var5 = routes[i - 1]
			local var6 = if var5.routes and var5.index then var5.routes[var5.index] else var5
			
			return var6.routeName, var6.params
		end
	end
	return nil, nil
end

local function openEditProfileImageFromProfilePlatform(p3, p4)
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

return function(p3)
	-- upvalues: useLocalUserId (ref), useRealNamesInDisplayNamesEnabledModule (ref), profileRefreshSignal (ref), reactModule (ref), focusNavigationUtilsModule (ref), reactFocusNavigationModule (ref), useEffect (ref), fFlagAXEnableProfileTab (ref), analyticsServiceV2Module (ref), enumsModule (ref), constantsModule (ref), useLocalRobuxBalance (ref), fFlagEditProfileImageV2Enabled (ref), openEditProfileImageFromProfilePlatform (ref), fFlagAXPPEReturnToEntrySurface (ref), fFlagEditProfilePPEStartOnEmotesPageModule (ref), getCoveredPage (ref), roactNavigationModule (ref), var1 (ref), useSignalState (ref), var2 (ref), editProfileStoreModule (ref), dataHydrationTypes (ref), focusNavigatorWrapperModule (ref), navigationEvents (ref), IXPService (ref), editProfileIXPLayer (ref), fFlagEditProfileLandingV2EnabledModule (ref), editProfileLandingV2Module (ref), cryoModule (ref), editProfileLandingModule (ref)
	local var7 = useLocalUserId()
	local var8 = useRealNamesInDisplayNamesEnabledModule()
	
	local var9 = function()
		-- upvalues: profileRefreshSignal (copy), p3 (ref)
		profileRefreshSignal.notifyProfileRefresh()
		p3.navigation.pop()
	end
	
	local var10 = reactModule.useRef(nil)
	local t = {}
	local var11 = focusNavigationUtilsModule.useAutoFocus(t, 0.1)
	local var12 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	useEffect(function()
		-- upvalues: t (ref), var10 (ref), var12 (ref), var11 (ref)
		t[1] = var10.current
		local var13 = if var12 and var12.focusedGuiObject:getValue() ~= nil and var11 then var11() else nil
		
		return function()
			-- upvalues: var13 (write)
			if var13 then
				var13.cancel()
			end
		end
	end, { var11 })
	local var13 = fFlagAXEnableProfileTab and p3.navigation.getParam("fullBleed") == true
	
	local var14 = function()
		-- upvalues: analyticsServiceV2Module (copy), p3 (ref), enumsModule (copy), var13 (ref)
		analyticsServiceV2Module.sendDisplayNameModalOpened()
		p3.navigation.navigate(enumsModule.Screens.EditProfileSubScreen, {
			screen = enumsModule.Screens.EditDisplayName,
			fullBleed = var13
		})
	end
	
	local function showToast(p4)
		-- upvalues: p3 (ref), enumsModule (copy)
		p3.navigation.goBack()
		p3.navigation.navigate(enumsModule.Screens.EditProfileToast, { text = p4 })
	end
	
	local param = p3.navigation.getParam(constantsModule.EditUserNameWebView)
	
	local var15 = function()
		-- upvalues: p3 (ref), enumsModule (copy)
		p3.navigation.navigate(enumsModule.Screens.UsernameInsufficientFundsModal)
	end
	
	local var16 = useLocalRobuxBalance()
	
	local var17 = function()
		-- upvalues: var16 (ref), constantsModule (copy), param (ref), showToast (ref), p3 (ref), enumsModule (copy), var15 (ref), analyticsServiceV2Module (copy)
		if constantsModule.ChangeUsernamePrice <= var16 then
			param(showToast)
		else
			p3.navigation.navigate(enumsModule.Screens.UsernameInsufficientFundsModal, {
				robux = constantsModule.ChangeUsernamePrice - var16,
				navigateDownToPurchaseRobux = var15
			})
		end
		analyticsServiceV2Module.sendEditUsernameOpened()
	end
	
	local var18 = function()
		-- upvalues: p3 (ref), enumsModule (copy), var13 (ref)
		p3.navigation.navigate(enumsModule.Screens.EditProfileSubScreen, { screen = enumsModule.Screens.EditBio, fullBleed = var13 })
	end
	
	local var19 = function()
		-- upvalues: analyticsServiceV2Module (copy), fFlagEditProfileImageV2Enabled (copy), openEditProfileImageFromProfilePlatform (copy), p3 (ref), fFlagAXPPEReturnToEntrySurface (copy), fFlagEditProfilePPEStartOnEmotesPageModule (copy), enumsModule (copy), getCoveredPage (copy), roactNavigationModule (copy)
		analyticsServiceV2Module.sendOpenAvatarMarketplace()
		
		if fFlagEditProfileImageV2Enabled then
			openEditProfileImageFromProfilePlatform(p3.navigation)
			
			return
		elseif fFlagAXPPEReturnToEntrySurface then
			local var20 = if fFlagEditProfilePPEStartOnEmotesPageModule then enumsModule.Screens.ProfilePictureEditorEmotes else enumsModule.Screens.ProfilePictureEditorCamera
			local var21 = p3.navigation._dangerouslyGetParent()
			local state = var21 and var21.state
			local var22 = if state and state.routeName then state else nil
			
			if var22 then
				local var23, var24 = getCoveredPage(p3.navigation, var22)
				p3.navigation.navigate(var20, {
					entryOrigin = {
						screenName = var22.routeName,
						screenParams = var22.params,
						reopenAction = roactNavigationModule.Actions.navigate({
							routeName = p3.navigation.state.routeName,
							params = p3.navigation.state.params
						}),
						coveredScreenName = var23,
						coveredScreenParams = var24
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
	
	local var20 = reactModule.useMemo(function()
		-- upvalues: var1 (copy), var7 (ref)
		return var1.fetchNamesByUserIds({ tostring(var7) })
	end, { var7 })
	useEffect(function()
		-- upvalues: analyticsServiceV2Module (copy)
		analyticsServiceV2Module.sendEditProfileOpened()
	end, {})
	local var21 = useSignalState(var20)
	local var22 = not var21 or var21.status ~= "success"
	local var23 = var21 and (var21.data and var21.data[1])
	local description = editProfileStoreModule.getDescription(var7)
	local t_1 = {
		userId = var7,
		fullBleed = var13,
		onClose = var9,
		username = useSignalState(if var23 then var23.names.getUsername else var2) or "",
		displayName = useSignalState(if var23 then var23.names.getDisplayName else var2) or "",
		areNamesLoading = var22,
		bioText = useSignalState(description.data) or "",
		isBioLoading = useSignalState(description.status) == dataHydrationTypes.DataStatus.NotReady,
		isPolicyEnabled = var8,
		settingButtonOnActivated = {
			displayName = var14,
			username = var17,
			bio = var18,
			avatar = var19
		},
		firstItemRef = var10
	}
	
	return focusNavigatorWrapperModule({ onClose = var9 }, {
		EditProfileLandingExposureLogger = reactModule.createElement(navigationEvents, {
			onDidFocus = function()
				-- upvalues: IXPService (copy), editProfileIXPLayer (copy)
				IXPService:LogUserLayerExposure(editProfileIXPLayer)
			end
		}),
		EditProfileLanding = if fFlagEditProfileLandingV2EnabledModule then reactModule.createElement(editProfileLandingV2Module, cryoModule.Dictionary.join(t_1, {
			onProfileFramesActivated = function()
				-- upvalues: openEditProfileImageFromProfilePlatform (copy), p3 (ref), enumsModule (copy)
				openEditProfileImageFromProfilePlatform(p3.navigation, { mode = enumsModule.EditProfileImageMode.FramesOnly })
			end
		})) else reactModule.createElement(editProfileLandingModule, t_1)
	})
end