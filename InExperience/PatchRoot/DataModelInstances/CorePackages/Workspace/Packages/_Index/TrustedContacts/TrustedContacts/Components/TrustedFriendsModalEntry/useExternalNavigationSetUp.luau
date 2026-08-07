local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local parent = trustedContacts.Parent
local reactModule = require(parent.React)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local default = require(parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local ampUpsellModule = require(parent.AmpUpsell)
local openAmpWizardContainer = ampUpsellModule.OpenAmpWizardContainer
local inExpAmpWizardController = ampUpsellModule.InExpAmpWizardController
local getFFlagEnableAmpWizardVPCNavigationFix = ampUpsellModule.GetFFlagEnableAmpWizardVPCNavigationFix
local navigateBack = require(parent.NavigationRodux).Thunks.NavigateBack
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var4 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local socialUpsellModule = require(parent.SocialUpsell)
local useSocialUpsellOverlayController = socialUpsellModule.Hooks.useSocialUpsellOverlayController
local socialUpsellType = socialUpsellModule.Enums.SocialUpsellType
local upsellEntrySurfaceType = socialUpsellModule.Analytics.Enum.UpsellEntrySurfaceType
local upsellComponent = socialUpsellModule.Analytics.Enum.UpsellComponent
local TCOpenAmpInGame = game:DefineFastFlag("TCOpenAmpInGame", false)
local fFlagTFWithActionsCheck = require(parent.SharedFlags).FFlagTFWithActionsCheck
local _ = require(trustedContacts.Common.Types)

return function(value) --[[ line: 44 | named "useExternalNavigationSetUp" ]]
	-- upvalues: useDispatch (ref), fFlagTFWithActionsCheck (ref), useSocialUpsellOverlayController (ref), reactModule (ref), notificationModalsManagerModule (ref), useOpenWebView (ref), TCOpenAmpInGame (ref), getFFlagEnableAmpWizardVPCNavigationFix (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateBack (ref), inExpAmpWizardController (ref), openAmpWizardContainer (ref), default (ref), upsellEntrySurfaceType (ref), socialUpsellType (ref), upsellComponent (ref)
	local var7 = useDispatch()
	local var8 = nil
	local var9 = nil
	
	if fFlagTFWithActionsCheck then
		var8 = game.GameId ~= 0
		var9 = useSocialUpsellOverlayController(var8)
	end
	local var10 = reactModule.useCallback(function() --[[ line: 98 ]]
		-- upvalues: value (ref)
		if value.onClosed then
			value.onClosed()
			
			return
		elseif value.navigation then
			value.navigation.pop()
		end
	end, { value, value.navigation })
	
	return {
		closeModal = var10,
		openAmpWizard = reactModule.useCallback(function(p0) --[[ line: 62 ]]
			-- upvalues: TCOpenAmpInGame (copy), getFFlagEnableAmpWizardVPCNavigationFix (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var7 (ref), navigateBack (copy), inExpAmpWizardController (copy), openAmpWizardContainer (copy)
			local var11 = function(p1, p2) --[[ line: 63 ]]
				-- upvalues: TCOpenAmpInGame (copy), getFFlagEnableAmpWizardVPCNavigationFix (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var7 (copy), navigateBack (copy), p0 (ref)
				if not TCOpenAmpInGame and not getFFlagEnableAmpWizardVPCNavigationFix() then
					if fFlagSignalsNavP3Dispatch then
						var4.back(true)
					else
						var7(navigateBack(true))
					end
				end
				p0.completionCallback(p1, p2)
			end
			
			if TCOpenAmpInGame then
				inExpAmpWizardController.OpenAmpWizardContainerInExp(p0.featureName, var11, p0.recourseData, p0.entryPointEventCtx, p0.extraParameters, p0.nameSpace)
				
				return
			end
			var7(openAmpWizardContainer(p0.featureName, var11, p0.recourseData, p0.entryPointEventCtx, p0.extraParameters, p0.nameSpace))
		end, { var7 }),
		openFacialAgeEstimationUpsell = if fFlagTFWithActionsCheck then if fFlagTFWithActionsCheck then reactModule.useCallback(function(p3) --[[ line: 111 ]]
			-- upvalues: var8 (write), upsellEntrySurfaceType (copy), var9 (write), socialUpsellType (copy), upsellComponent (copy), var10 (ref)
			local var12 = if var8 then upsellEntrySurfaceType.TrustedFriendsInExperience else upsellEntrySurfaceType.TrustedFriends
			var9.openSocialOverlay(socialUpsellType.FacialAgeEstimation, {
				shouldIncludeVPC = true,
				upsellEntrySurface = var12,
				upsellEntryComponent = upsellComponent.Modal,
				entryPointEventCtx = socialUpsellType.FacialAgeEstimation .. var12,
				onSuccess = p3 and p3.onSuccess,
				onFailure = p3 and p3.onFailure,
				onAccept = p3 and p3.onAccept,
				onDismiss = var10
			})
		end, { var10, var8, var9.openSocialOverlay }) else nil else nil,
		showToast = reactModule.useCallback(function(p4) --[[ line: 53 ]]
			-- upvalues: notificationModalsManagerModule (copy)
			notificationModalsManagerModule.SetUIBloxToast({
				sequenceNumber = DateTime.now().UnixTimestamp,
				toastTitle = p4
			})
		end, {}),
		openWebView = useOpenWebView(),
		shareUrl = reactModule.useCallback(function(p5) --[[ line: 106 ]]
			-- upvalues: default (copy)
			default:shareUrl(p5)
		end, {})
	}
end