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
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local SocialUpsellModule = require(Parent.SocialUpsell)
local UseSocialUpsellOverlayControllerFunction = SocialUpsellModule.Hooks.useSocialUpsellOverlayController
local SocialUpsellType = SocialUpsellModule.Enums.SocialUpsellType
local UpsellEntrySurfaceType = SocialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local UpsellComponent = SocialUpsellModule.Analytics.Enum.UpsellComponent
local TCOpenAmpInGame = game:DefineFastFlag("TCOpenAmpInGame", false)
local FFlagEnableTrustedFriendsWizardVPCPrologueModule = require(TrustedContacts.Flags.FFlagEnableTrustedFriendsWizardVPCPrologue)
local FFlagLuaAppTrustedContactsVpcUseUfoModule = require(TrustedContacts.Flags.FFlagLuaAppTrustedContactsVpcUseUfo)
local _ = require(TrustedContacts.Common.Types)
local config = {
	Cancel = true,
	Back = true,
	Close = true,
	Acknowledge = true
}
local config1 = { Error = true, RateLimited = true, Failure = true }

local function useOpenVpc(Callback)
	-- upvalues: AmpUpsellModule (copy), UseLocalizationFunction (copy), ReactModule (copy), FFlagEnableTrustedFriendsWizardVPCPrologueModule (copy), TCOpenAmpInGame (copy), GetFFlagEnableAmpWizardVPCNavigationFixFunction (copy), config1 (copy), config (copy)
	local UseVpcLauncherResult = AmpUpsellModule.useVpcLauncher()
	local SomethingIsWrong = UseLocalizationFunction({
		somethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong"
	}).somethingIsWrong
	
	return ReactModule.useCallback(function(p1)
		-- upvalues: UseVpcLauncherResult (copy), FFlagEnableTrustedFriendsWizardVPCPrologueModule (upval), TCOpenAmpInGame (upval), GetFFlagEnableAmpWizardVPCNavigationFixFunction (upval), config1 (upval), Callback (copy), SomethingIsWrong (copy), config (upval)
		UseVpcLauncherResult({
			request = {
				requestType = "AddTrustedConnection",
				requestDetails = { targetUserId = p1.recourseData.targetUserId }
			},
			legacy = {
				featureName = p1.featureName,
				nameSpace = p1.nameSpace,
				recourseData = p1.recourseData,
				extraParameters = p1.extraParameters,
				entryPointEventCtx = p1.entryPointEventCtx,
				completionCallback = p1.completionCallback,
				usePrologue = if FFlagEnableTrustedFriendsWizardVPCPrologueModule then p1.usePrologue else nil,
				prologueOptions = if FFlagEnableTrustedFriendsWizardVPCPrologueModule then p1.prologueOptions else nil
			},
			legacyUseStandalone = TCOpenAmpInGame,
			popBeforeLegacyCompletion = not TCOpenAmpInGame and not GetFFlagEnableAmpWizardVPCNavigationFixFunction(),
			onComplete = function(p2)
				-- upvalues: config1 (upval), Callback (upval), SomethingIsWrong (upval), config (upval), p1 (copy)
				local Outcome = p2.outcome or ""
				
				if p2.reason == "Error" or p2.reason == "Completed" and config1[Outcome] then
					Callback(SomethingIsWrong)
					
					return
				end
				if p2.reason == "Completed" and not config[Outcome] then
					p1.completionCallback(nil, nil)
				end
			end
		})
	end, { UseVpcLauncherResult, Callback, SomethingIsWrong })
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSocialUpsellOverlayControllerFunction (copy), ReactModule (copy), NotificationModalsManagerModule (copy), UseOpenWebViewFunction (copy), TCOpenAmpInGame (copy), GetFFlagEnableAmpWizardVPCNavigationFixFunction (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), FFlagEnableTrustedFriendsWizardVPCPrologueModule (copy), InExpAmpWizardController (copy), OpenAmpWizardContainerFunction (copy), Default (copy), UpsellEntrySurfaceType (copy), SocialUpsellType (copy), UpsellComponent (copy), FFlagLuaAppTrustedContactsVpcUseUfoModule (copy), useOpenVpc (copy)
	local UseDispatchResult = UseDispatchFunction()
	local IsNotGameIdMatch = nil
	local UseSocialUpsellOverlayControllerResult = nil
	IsNotGameIdMatch = game.GameId ~= 0
	UseSocialUpsellOverlayControllerResult = UseSocialUpsellOverlayControllerFunction(IsNotGameIdMatch)
	local UseResult = ReactModule.useCallback(function(ToastTitle)
		-- upvalues: NotificationModalsManagerModule (upval)
		NotificationModalsManagerModule.SetUIBloxToast({
			sequenceNumber = DateTime.now().UnixTimestamp,
			toastTitle = ToastTitle
		})
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
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
		closeModal = UseResult1,
		openAmpWizard = ReactModule.useCallback(function(p2)
			-- upvalues: TCOpenAmpInGame (upval), GetFFlagEnableAmpWizardVPCNavigationFixFunction (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval), FFlagEnableTrustedFriendsWizardVPCPrologueModule (upval), InExpAmpWizardController (upval), OpenAmpWizardContainerFunction (upval)
			local function v30(p3, p4)
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
					InExpAmpWizardController.OpenAmpWizardContainerInExp(p2.featureName, v30, p2.recourseData, p2.entryPointEventCtx, p2.extraParameters, p2.nameSpace, nil, nil, nil, p2.usePrologue, p2.prologueOptions)
					
					return
				else
					UseDispatchResult(OpenAmpWizardContainerFunction(p2.featureName, v30, p2.recourseData, p2.entryPointEventCtx, p2.extraParameters, p2.nameSpace, nil, nil, nil, p2.usePrologue, p2.prologueOptions))
					
					return
				end
			elseif TCOpenAmpInGame then
				InExpAmpWizardController.OpenAmpWizardContainerInExp(p2.featureName, v30, p2.recourseData, p2.entryPointEventCtx, p2.extraParameters, p2.nameSpace)
				
				return
			else
				UseDispatchResult(OpenAmpWizardContainerFunction(p2.featureName, v30, p2.recourseData, p2.entryPointEventCtx, p2.extraParameters, p2.nameSpace))
			end
		end, { UseDispatchResult }),
		openVpc = if FFlagLuaAppTrustedContactsVpcUseUfoModule then useOpenVpc(UseResult) else nil,
		openFacialAgeEstimationUpsell = ReactModule.useCallback(function(p2)
			-- upvalues: IsNotGameIdMatch (ref), UpsellEntrySurfaceType (upval), UseSocialUpsellOverlayControllerResult (ref), SocialUpsellType (upval), UpsellComponent (upval), UseResult1 (copy)
			local TrustedFriendsInExperience = if IsNotGameIdMatch then UpsellEntrySurfaceType.TrustedFriendsInExperience else UpsellEntrySurfaceType.TrustedFriends
			UseSocialUpsellOverlayControllerResult.openSocialOverlay(SocialUpsellType.FacialAgeEstimation, {
				shouldIncludeVPC = true,
				upsellEntrySurface = TrustedFriendsInExperience,
				upsellEntryComponent = UpsellComponent.Modal,
				entryPointEventCtx = SocialUpsellType.FacialAgeEstimation .. TrustedFriendsInExperience,
				onSuccess = p2 and p2.onSuccess,
				onFailure = p2 and p2.onFailure,
				onAccept = p2 and p2.onAccept,
				onDismiss = UseResult1
			})
		end, {
			UseResult1,
			IsNotGameIdMatch,
			UseSocialUpsellOverlayControllerResult.openSocialOverlay
		}),
		showToast = UseResult,
		openWebView = UseOpenWebViewFunction(),
		shareUrl = ReactModule.useCallback(function(p2)
			-- upvalues: Default (upval)
			Default:shareUrl(p2)
		end, {})
	}
end