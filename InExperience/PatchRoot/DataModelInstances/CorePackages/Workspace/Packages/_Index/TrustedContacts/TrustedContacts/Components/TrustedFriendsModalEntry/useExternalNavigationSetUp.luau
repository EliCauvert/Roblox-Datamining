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
local FFlagEnableTrustedFriendsWizardVPCPrologueModule = require(TrustedContacts.Flags.FFlagEnableTrustedFriendsWizardVPCPrologue)
local _ = require(TrustedContacts.Common.Types)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSocialUpsellOverlayControllerFunction (copy), ReactModule (copy), NotificationModalsManagerModule (copy), UseOpenWebViewFunction (copy), TCOpenAmpInGame (copy), GetFFlagEnableAmpWizardVPCNavigationFixFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), FFlagEnableTrustedFriendsWizardVPCPrologueModule (copy), InExpAmpWizardController (copy), OpenAmpWizardContainerFunction (copy), Default (copy), UpsellEntrySurfaceType (copy), SocialUpsellType (copy), UpsellComponent (copy)
	local UseDispatchResult = UseDispatchFunction()
	local IsNotGameIdMatch = nil
	local UseSocialUpsellOverlayControllerResult = nil
	IsNotGameIdMatch = game.GameId ~= 0
	UseSocialUpsellOverlayControllerResult = UseSocialUpsellOverlayControllerFunction(IsNotGameIdMatch)
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
	
	return {
		closeModal = UseResult,
		openAmpWizard = ReactModule.useCallback(function(p2)
			-- upvalues: TCOpenAmpInGame (upval), GetFFlagEnableAmpWizardVPCNavigationFixFunction (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), FFlagEnableTrustedFriendsWizardVPCPrologueModule (upval), InExpAmpWizardController (upval), OpenAmpWizardContainerFunction (upval)
			local function v22(p3, p4)
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
			
			if FFlagEnableTrustedFriendsWizardVPCPrologueModule then
				if TCOpenAmpInGame then
					InExpAmpWizardController.OpenAmpWizardContainerInExp(p2.featureName, v22, p2.recourseData, p2.entryPointEventCtx, p2.extraParameters, p2.nameSpace, nil, nil, nil, p2.usePrologue, p2.prologueOptions)
					
					return
				else
					UseDispatchResult(OpenAmpWizardContainerFunction(p2.featureName, v22, p2.recourseData, p2.entryPointEventCtx, p2.extraParameters, p2.nameSpace, nil, nil, nil, p2.usePrologue, p2.prologueOptions))
					
					return
				end
			elseif TCOpenAmpInGame then
				InExpAmpWizardController.OpenAmpWizardContainerInExp(p2.featureName, v22, p2.recourseData, p2.entryPointEventCtx, p2.extraParameters, p2.nameSpace)
				
				return
			else
				UseDispatchResult(OpenAmpWizardContainerFunction(p2.featureName, v22, p2.recourseData, p2.entryPointEventCtx, p2.extraParameters, p2.nameSpace))
			end
		end, { UseDispatchResult }),
		openFacialAgeEstimationUpsell = ReactModule.useCallback(function(p2)
			-- upvalues: IsNotGameIdMatch (ref), UpsellEntrySurfaceType (upval), UseSocialUpsellOverlayControllerResult (ref), SocialUpsellType (upval), UpsellComponent (upval), UseResult (copy)
			local TrustedFriendsInExperience = if IsNotGameIdMatch then UpsellEntrySurfaceType.TrustedFriendsInExperience else UpsellEntrySurfaceType.TrustedFriends
			UseSocialUpsellOverlayControllerResult.openSocialOverlay(SocialUpsellType.FacialAgeEstimation, {
				shouldIncludeVPC = true,
				upsellEntrySurface = TrustedFriendsInExperience,
				upsellEntryComponent = UpsellComponent.Modal,
				entryPointEventCtx = SocialUpsellType.FacialAgeEstimation .. TrustedFriendsInExperience,
				onSuccess = p2 and p2.onSuccess,
				onFailure = p2 and p2.onFailure,
				onAccept = p2 and p2.onAccept,
				onDismiss = UseResult
			})
		end, {
			UseResult,
			IsNotGameIdMatch,
			UseSocialUpsellOverlayControllerResult.openSocialOverlay
		}),
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