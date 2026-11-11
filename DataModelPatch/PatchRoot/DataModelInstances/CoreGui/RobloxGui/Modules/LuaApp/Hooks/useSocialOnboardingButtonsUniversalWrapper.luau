local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSocialOnboardingButtonsFunction = require(CorePackages.Workspace.Packages.SocialOnboardingButtons).Hooks.useSocialOnboardingButtons
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local OpenAmpWizardContainerFunction = require(CorePackages.Workspace.Packages.AmpUpsell).OpenAmpWizardContainer
local SetHomePageUpsellCardVariationFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.SetHomePageUpsellCardVariation
local OpenPhoneUpsellModalModule = require(Modules.LuaApp.Thunks.Verification.OpenPhoneUpsellModal)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local OpenContactImporterLearnMoreLinkModule = require(Modules.LuaApp.Thunks.OpenContactImporterLearnMoreLink)
local NavigateDownTo3DQRCodePageModule = require(Modules.LuaApp.Thunks.NavigateDownTo3DQRCodePage)
local OpenProfilePeekViewModule = require(Modules.LuaApp.Thunks.OpenProfilePeekView)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local OpenCentralOverlayForDiscoverabilityUpsellModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForDiscoverabilityUpsell)
local FFlagSocialCarouselShareQREnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSocialCarouselShareQREnabled

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), SetCurrentToastMessageModule (copy), SetHomePageUpsellCardVariationFunction (copy), OpenContactImporterLearnMoreLinkModule (copy), OpenAmpWizardContainerFunction (copy), NavigateDownTo3DQRCodePageModule (copy), FFlagSocialCarouselShareQREnabled (copy), OpenCentralOverlayForDiscoverabilityUpsellModule (copy), CloseCentralOverlayModule (copy), OpenPhoneUpsellModalModule (copy), AppPage (copy), OpenProfilePeekViewModule (copy), UseSocialOnboardingButtonsFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	
	return UseSocialOnboardingButtonsFunction(p1, {
		openPhoneVerificationModal = function(OnSuccess)
			-- upvalues: UseDispatchResult (copy), OpenPhoneUpsellModalModule (upval)
			return UseDispatchResult(OpenPhoneUpsellModalModule({
				eventContext = "verificationUpsell",
				origin = "friendsCarousel",
				shouldAutofillAndroidPhoneNumberAtLaunch = true,
				addPhoneTitleKey = "Feature.ContactUpsell.Header.UnlockVoiceChat",
				onSuccess = OnSuccess
			}, true))
		end,
		openLearnMoreLink = function()
			-- upvalues: UseDispatchResult (copy), OpenContactImporterLearnMoreLinkModule (upval)
			UseDispatchResult(OpenContactImporterLearnMoreLinkModule())
		end,
		openAmpUpsell = function(p2, p3)
			-- upvalues: UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval)
			UseDispatchResult(OpenAmpWizardContainerFunction(p2, p3))
		end,
		navigateToQRCodePage = function()
			-- upvalues: UseDispatchResult (copy), NavigateDownTo3DQRCodePageModule (upval), p1 (copy), FFlagSocialCarouselShareQREnabled (upval)
			UseDispatchResult(NavigateDownTo3DQRCodePageModule({
				source = p1.entryPoint,
				onClose = if FFlagSocialCarouselShareQREnabled then nil else function() end
			}))
		end,
		navigateToSearchFriends = function()
			-- upvalues: UseNavigationResult (copy), AppPage (upval), p1 (copy)
			UseNavigationResult.navigate(AppPage.UserSearch, {
				shouldShowUserSearchLandingPage = true,
				entryPoint = p1.entryPoint
			})
		end,
		openProfilePeekView = function(p2)
			-- upvalues: UseDispatchResult (copy), OpenProfilePeekViewModule (upval)
			UseDispatchResult(OpenProfilePeekViewModule(p2, {}))
		end,
		hideUpsellCard = function()
			-- upvalues: UseDispatchResult (copy), SetHomePageUpsellCardVariationFunction (upval)
			UseDispatchResult(SetHomePageUpsellCardVariationFunction("", "", ""))
		end,
		openDiscoverabilityModal = function(p2)
			-- upvalues: UseDispatchResult (copy), OpenCentralOverlayForDiscoverabilityUpsellModule (upval)
			UseDispatchResult(OpenCentralOverlayForDiscoverabilityUpsellModule(p2))
		end,
		closeCentralOverlay = function()
			-- upvalues: UseDispatchResult (copy), CloseCentralOverlayModule (upval)
			UseDispatchResult(CloseCentralOverlayModule())
		end,
		showToast = function(ToastMessage)
			-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageModule (upval)
			UseDispatchResult(SetCurrentToastMessageModule({ toastMessage = ToastMessage }))
		end
	})
end