local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local Parent = TrustedContacts.Parent
local ReactModule = require(Parent.React)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local AmpUpsellModule = require(Parent.AmpUpsell)
local OpenAmpWizardContainerFunction = AmpUpsellModule.OpenAmpWizardContainer
local InExpAmpWizardController = AmpUpsellModule.InExpAmpWizardController
local GetFFlagEnableAmpWizardVPCNavigationFixFunction = AmpUpsellModule.GetFFlagEnableAmpWizardVPCNavigationFix
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local SocialUpsellModule = require(Parent.SocialUpsell)
local UseSocialUpsellOverlayControllerFunction = SocialUpsellModule.Hooks.useSocialUpsellOverlayController
local SocialUpsellType = SocialUpsellModule.Enums.SocialUpsellType
local UpsellEntrySurfaceType = SocialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local UpsellComponent = SocialUpsellModule.Analytics.Enum.UpsellComponent
local TCOpenAmpInGame = game:DefineFastFlag("TCOpenAmpInGame", false)
local FFlagTFWithActionsCheck = require(Parent.SharedFlags).FFlagTFWithActionsCheck
local _ = require(TrustedContacts.Common.Types)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), FFlagTFWithActionsCheck (copy), UseSocialUpsellOverlayControllerFunction (copy), ReactModule (copy), NotificationModalsManagerModule (copy), UseOpenWebViewFunction (copy), TCOpenAmpInGame (copy), GetFFlagEnableAmpWizardVPCNavigationFixFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), InExpAmpWizardController (copy), OpenAmpWizardContainerFunction (copy), Default (copy), UpsellEntrySurfaceType (copy), SocialUpsellType (copy), UpsellComponent (copy)
	local UseDispatchResult = UseDispatchFunction()
	local IsNotGameIdMatch: boolean? = nil
	local v1 = nil
	
	if FFlagTFWithActionsCheck then
		IsNotGameIdMatch = game.GameId ~= 0
		v1 = UseSocialUpsellOverlayControllerFunction(IsNotGameIdMatch)
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onClosed then
			p1.onClosed()
			
			return
		end
		if p1.navigation then
			p1.navigation.pop()
		end
	end, { p1, p1.navigation })
	local UseResult1 = if FFlagTFWithActionsCheck then ReactModule.useCallback(function(p2)
		-- upvalues: IsNotGameIdMatch (ref), UpsellEntrySurfaceType (upval), v1 (ref), SocialUpsellType (upval), UpsellComponent (upval), UseResult (copy)
		local TrustedFriendsInExperience = if IsNotGameIdMatch then UpsellEntrySurfaceType.TrustedFriendsInExperience else UpsellEntrySurfaceType.TrustedFriends
		v1.openSocialOverlay(SocialUpsellType.FacialAgeEstimation, {
			shouldIncludeVPC = true,
			upsellEntrySurface = TrustedFriendsInExperience,
			upsellEntryComponent = UpsellComponent.Modal,
			entryPointEventCtx = SocialUpsellType.FacialAgeEstimation .. TrustedFriendsInExperience,
			onSuccess = p2 and p2.onSuccess,
			onFailure = p2 and p2.onFailure,
			onAccept = p2 and p2.onAccept,
			onDismiss = UseResult
		})
	end, { UseResult, IsNotGameIdMatch, v1.openSocialOverlay }) else nil
	
	return {
		closeModal = UseResult,
		openAmpWizard = ReactModule.useCallback(function(p2)
			-- upvalues: TCOpenAmpInGame (upval), GetFFlagEnableAmpWizardVPCNavigationFixFunction (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), InExpAmpWizardController (upval), OpenAmpWizardContainerFunction (upval)
			local function v21(p3, p4)
				-- upvalues: TCOpenAmpInGame (upval), GetFFlagEnableAmpWizardVPCNavigationFixFunction (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateBackFunction (upval), p2 (copy)
				if not TCOpenAmpInGame and not GetFFlagEnableAmpWizardVPCNavigationFixFunction() then
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.back(true)
					else
						UseDispatchResult(NavigateBackFunction(true))
					end
				end
				p2.completionCallback(p3, p4)
			end
			
			if TCOpenAmpInGame then
				InExpAmpWizardController.OpenAmpWizardContainerInExp(p2.featureName, v21, p2.recourseData, p2.entryPointEventCtx, p2.extraParameters, p2.nameSpace)
				
				return
			else
				UseDispatchResult(OpenAmpWizardContainerFunction(p2.featureName, v21, p2.recourseData, p2.entryPointEventCtx, p2.extraParameters, p2.nameSpace))
			end
		end, { UseDispatchResult }),
		openFacialAgeEstimationUpsell = if FFlagTFWithActionsCheck then UseResult1 else nil,
		showToast = ReactModule.useCallback(function(ToastTitle)
			-- upvalues: NotificationModalsManagerModule (upval)
			NotificationModalsManagerModule.SetUIBloxToast({
				sequenceNumber = DateTime.now().UnixTimestamp,
				toastTitle = ToastTitle
			})
		end, {}),
		openWebView = UseOpenWebViewFunction(),
		shareUrl = ReactModule.useCallback(function(p2)
			-- upvalues: Default (upval)
			Default:shareUrl(p2)
		end, {})
	}
end