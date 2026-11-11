local SocialOnboardingButtons = script:FindFirstAncestor("SocialOnboardingButtons")
local AnalyticsModule = require(SocialOnboardingButtons.Analytics)
local EventNames = AnalyticsModule.EventNames
local Parent = SocialOnboardingButtons.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local Images = require(Parent.UIBlox).App.ImageSet.Images
local GetContactImporterParams = require(Parent.ContactImporter).Utils.getContactImporterParams
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local AppStartupModule = require(Parent.AppStartup)
local UseLaunchContextFunction = AppStartupModule.Hooks.useLaunchContext
local LaunchContext = AppStartupModule.Enums.LaunchContext
local EnumScreens = require(Parent.SocialModalsCommon).EnumScreens
local SocialOnboardingButtonsEnumModule = require(SocialOnboardingButtons.Enums.SocialOnboardingButtonsEnum)
local SocialOnboardingButtonsIXPModule = require(SocialOnboardingButtons.Experiments.SocialOnboardingButtonsIXP)
local UseSocialOnboardingButtonsColorsModule = require(SocialOnboardingButtons.Hooks.useSocialOnboardingButtonsColors)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local Image = Images[game:DefineFastString("FindContactsIcon_v3", "icons/actions/friend_sort/find_contacts")]
local Image1 = Images[game:DefineFastString("MyQRCodeIcon_v3", "icons/actions/friend_sort/qr_code")]
local Image2 = Images[game:DefineFastString("SearchPeopleIcon_v3", "icons/actions/friend_sort/search_people")]
local Image3 = Images[game:DefineFastString("UnlockVoiceIcon_v3", "icons/actions/friend_sort/unlock_voice")]
local Image4 = Images[game:DefineFastString("MyProfileIcon_v3", "icons/actions/friend_sort/my_profile")]
local Image5 = Images[game:DefineFastString("AddFriendsIcon_v3", "icons/actions/friend_sort/add_friends")]

return function(p1, p2)
	-- upvalues: UseLocalUserIdFunction (copy), UseNavigationFunction (copy), UseLaunchContextFunction (copy), UseLocalizationFunction (copy), SocialOnboardingButtonsIXPModule (copy), UseSocialOnboardingButtonsColorsModule (copy), ReactModule (copy), AnalyticsModule (copy), UseSelectorFunction (copy), UseAppPolicyFunction (copy), GetContactImporterParams (copy), EventNames (copy), EnumScreens (copy), SocialOnboardingButtonsEnumModule (copy), Image1 (copy), Image2 (copy), Image3 (copy), Image4 (copy), Image (copy), Image5 (copy), LaunchContext (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseLaunchContextResult = UseLaunchContextFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		addFriends = "Feature.Friends.Feature.Friends.Heading.AddFriends",
		searchPeople = "Feature.Friends.Label.SearchPeople",
		findContacts = "Feature.Contacts.Label.FindContacts",
		unlockVoice = "Feature.Friends.Label.UnlockVoice",
		myProfile = "Feature.Friends.Label.MyProfile",
		shareQRCode = "Feature.AddFriends.Label.MyQrCode"
	})
	local UseSocialOnboardingBtnsEnabledResult = SocialOnboardingButtonsIXPModule.useSocialOnboardingBtnsEnabled()
	local UseSocialOnboardingButtonsColorsModuleResult, UseSocialOnboardingButtonsColorsModuleResult2, UseSocialOnboardingButtonsColorsModuleResult3 = UseSocialOnboardingButtonsColorsModule()
	local UseSocialOnboardingBtnsOrderResult = SocialOnboardingButtonsIXPModule.useSocialOnboardingBtnsOrder()
	local UseSocialOnboardingBtnsHideAfterSignupResult = SocialOnboardingButtonsIXPModule.useSocialOnboardingBtnsHideAfterSignup()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AnalyticsModule (upval), p1 (copy)
		return AnalyticsModule.getAnalytics(p1.entryPoint)().fireAnalyticsEvent
	end, { p1, AnalyticsModule })
	local UseSelectorResult = UseSelectorFunction(function(p3): boolean
		local HomePageUpsellCardVariation = p3.HomePageUpsellCardVariation
		
		return HomePageUpsellCardVariation ~= nil and (HomePageUpsellCardVariation.upsellCardType ~= nil and HomePageUpsellCardVariation.upsellCardType ~= "")
	end)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p3)
		return {
			contactImporterEnabled = p3.getContactImporterEnabled(),
			upsellVoiceForPhoneVerification = p3.getUpsellVoiceForPhoneVerification()
		}
	end)
	local UseSelectorResult1 = UseSelectorFunction(GetContactImporterParams)
	local HasOSPermissions = UseSelectorResult1.hasOSPermissions or false
	local IsDiscoverabilityUnset = UseSelectorResult1.isDiscoverabilityUnset or false
	local IsPhoneVerified = UseSelectorResult1.isPhoneVerified or false
	local ContactImporterEnabled = UseAppPolicyResult.contactImporterEnabled
	local NoUseSelectorResult: boolean = UseAppPolicyResult.upsellVoiceForPhoneVerification and (not IsPhoneVerified and not UseSelectorResult)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), EventNames (upval), HasOSPermissions (copy), p2 (copy), IsDiscoverabilityUnset (copy), IsPhoneVerified (copy), UseNavigationResult (copy), EnumScreens (upval)
		UseMemoResult(EventNames.FindContactsBtn)
		local config = {
			isFromAddFriendsPage = false,
			isFromSocialOnboardingButtons = true,
			openLearnMoreLink = p2.openLearnMoreLink,
			showToast = p2.showToast,
			isDiscoverabilityUnset = IsDiscoverabilityUnset,
			isPhoneVerified = IsPhoneVerified,
			openAmpUpsell = p2.openAmpUpsell
		}
		
		if not HasOSPermissions then
			UseNavigationResult.navigate(EnumScreens.ContactImporter, config)
			
			return
		else
			UseNavigationResult.navigate(EnumScreens.ContactsList, config)
		end
	end, {
		p2,
		IsDiscoverabilityUnset,
		IsPhoneVerified,
		UseNavigationResult,
		UseMemoResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p2 (copy), p1 (copy)
		p2.hideUpsellCard()
		p2.openDiscoverabilityModal({
			isStandaloneDiscoverabilityModal = true,
			showToast = p2.showToast,
			openLearnMoreLink = p2.openLearnMoreLink,
			entryPoint = p1.entryPoint,
			onClose = p2.closeCentralOverlay,
			navigateOnActivated = p2.closeCentralOverlay
		})
	end, { p2, p1 })
	local UseMemoResult1, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), EventNames (upval), p2 (copy), SocialOnboardingButtonsEnumModule (upval), UseLocalizationResult (copy), Image1 (upval), UseSocialOnboardingButtonsColorsModuleResult (copy), UseSocialOnboardingButtonsColorsModuleResult2 (copy), UseSocialOnboardingButtonsColorsModuleResult3 (copy), Image2 (upval), NoUseSelectorResult (copy), UseResult1 (copy), Image3 (upval), UseLocalUserIdResult (copy), Image4 (upval), ContactImporterEnabled (copy), Image (upval), UseResult (copy), UseSocialOnboardingBtnsOrderResult (copy), Image5 (upval)
		local config = {
			[SocialOnboardingButtonsEnumModule.ShareQRCodeBtn] = {
				id = SocialOnboardingButtonsEnumModule.ShareQRCodeBtn,
				text = UseLocalizationResult.shareQRCode,
				icon = Image1,
				onActivated = function()
					-- upvalues: UseMemoResult (upval), EventNames (upval), p2 (upval)
					UseMemoResult(EventNames.MyQRCodeBtn)
					p2.navigateToQRCodePage()
				end,
				backgroundColor = UseSocialOnboardingButtonsColorsModuleResult.myQRCode,
				iconColor = UseSocialOnboardingButtonsColorsModuleResult2,
				extraId = UseSocialOnboardingButtonsColorsModuleResult3
			},
			[SocialOnboardingButtonsEnumModule.SearchFriendsBtn] = {
				id = SocialOnboardingButtonsEnumModule.SearchFriendsBtn,
				text = UseLocalizationResult.searchPeople,
				icon = Image2,
				onActivated = function()
					-- upvalues: UseMemoResult (upval), EventNames (upval), p2 (upval)
					UseMemoResult(EventNames.SearchPeopleBtn)
					p2.navigateToSearchFriends()
				end,
				backgroundColor = UseSocialOnboardingButtonsColorsModuleResult.searchPeople,
				iconColor = UseSocialOnboardingButtonsColorsModuleResult2,
				extraId = UseSocialOnboardingButtonsColorsModuleResult3
			}
		}
		
		if NoUseSelectorResult then
			config[SocialOnboardingButtonsEnumModule.UnlockVoiceBtn] = {
				id = SocialOnboardingButtonsEnumModule.UnlockVoiceBtn,
				text = UseLocalizationResult.unlockVoice,
				icon = Image3,
				onActivated = function()
					-- upvalues: UseMemoResult (upval), EventNames (upval), p2 (upval), UseResult1 (upval)
					UseMemoResult(EventNames.UnlockVoiceBtn)
					p2.openPhoneVerificationModal(UseResult1)
				end,
				backgroundColor = UseSocialOnboardingButtonsColorsModuleResult.unlockVoice,
				iconColor = UseSocialOnboardingButtonsColorsModuleResult2,
				extraId = UseSocialOnboardingButtonsColorsModuleResult3
			}
		end
		local function OnActivated()
			-- upvalues: UseMemoResult (upval), EventNames (upval), p2 (upval), UseLocalUserIdResult (upval)
			UseMemoResult(EventNames.MyProfileBtn)
			p2.openProfilePeekView((tostring(UseLocalUserIdResult)))
		end
		
		if UseLocalUserIdResult then
			config[SocialOnboardingButtonsEnumModule.CompleteProfileBtn] = {
				id = SocialOnboardingButtonsEnumModule.CompleteProfileBtn,
				text = UseLocalizationResult.myProfile,
				icon = Image4,
				onActivated = OnActivated,
				backgroundColor = UseSocialOnboardingButtonsColorsModuleResult.myProfile,
				iconColor = UseSocialOnboardingButtonsColorsModuleResult2,
				extraId = UseSocialOnboardingButtonsColorsModuleResult3
			}
		end
		if ContactImporterEnabled then
			config[SocialOnboardingButtonsEnumModule.FindContactsBtn] = {
				id = SocialOnboardingButtonsEnumModule.FindContactsBtn,
				text = UseLocalizationResult.findContacts,
				icon = Image,
				onActivated = UseResult,
				backgroundColor = UseSocialOnboardingButtonsColorsModuleResult.findContacts,
				iconColor = UseSocialOnboardingButtonsColorsModuleResult2,
				extraId = UseSocialOnboardingButtonsColorsModuleResult3
			}
		end
		local List = {}
		
		for i in string.gmatch(UseSocialOnboardingBtnsOrderResult or "", "([^,]+)") do
			if config[i] then
				table.insert(List, config[i])
			end
		end
		return List, {
			id = SocialOnboardingButtonsEnumModule.AddFriendsBtn,
			icon = Image5,
			backgroundColor = UseSocialOnboardingButtonsColorsModuleResult.addFriends,
			iconColor = UseSocialOnboardingButtonsColorsModuleResult2,
			extraId = UseSocialOnboardingButtonsColorsModuleResult3
		}
	end, {
		p1, p2, ContactImporterEnabled, NoUseSelectorResult, UseResult1, UseResult,
		UseLocalizationResult, UseMemoResult,
		UseSocialOnboardingButtonsColorsModuleResult,
		UseSocialOnboardingButtonsColorsModuleResult2,
		UseSocialOnboardingButtonsColorsModuleResult3,
		UseSocialOnboardingBtnsOrderResult
	})
	
	if not UseSocialOnboardingBtnsEnabledResult then
		return nil, nil
	elseif UseSocialOnboardingBtnsHideAfterSignupResult and UseLaunchContextResult == LaunchContext.SignUp then
		return nil, UseMemoResult2
	else
		return UseMemoResult1, UseMemoResult2
	end
end