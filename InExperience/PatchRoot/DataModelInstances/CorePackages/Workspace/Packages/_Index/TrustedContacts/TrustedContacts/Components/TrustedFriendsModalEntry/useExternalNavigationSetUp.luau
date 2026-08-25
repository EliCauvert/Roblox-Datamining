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
local fFlagEnableTrustedFriendsWizardVPCPrologueModule = require(trustedContacts.Flags.FFlagEnableTrustedFriendsWizardVPCPrologue)
local _ = require(trustedContacts.Common.Types)

return function(value)
	-- upvalues: useDispatch (ref), fFlagTFWithActionsCheck (ref), useSocialUpsellOverlayController (ref), reactModule (ref), notificationModalsManagerModule (ref), useOpenWebView (ref), TCOpenAmpInGame (ref), getFFlagEnableAmpWizardVPCNavigationFix (ref), fFlagSignalsNavP3Dispatch (ref), var4 (ref), navigateBack (ref), fFlagEnableTrustedFriendsWizardVPCPrologueModule (ref), inExpAmpWizardController (ref), openAmpWizardContainer (ref), default (ref), upsellEntrySurfaceType (ref), socialUpsellType (ref), upsellComponent (ref)
	local var8 = useDispatch()
	local var9 = nil
	local var10 = nil
	
	if fFlagTFWithActionsCheck then
		var9 = game.GameId ~= 0
		var10 = useSocialUpsellOverlayController(var9)
	end
	local var11 = reactModule.useCallback(function()
		-- upvalues: value (ref)
		if value.onClosed then
			value.onClosed()
			
			return
		elseif value.navigation then
			value.navigation.pop()
		end
	end, { value, value.navigation })
	
	return {
		closeModal = var11,
		openAmpWizard = reactModule.useCallback(function(p0)
			-- upvalues: TCOpenAmpInGame (copy), getFFlagEnableAmpWizardVPCNavigationFix (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var8 (ref), navigateBack (copy), fFlagEnableTrustedFriendsWizardVPCPrologueModule (copy), inExpAmpWizardController (copy), openAmpWizardContainer (copy)
			local var12 = function(p1, p2)
				-- upvalues: TCOpenAmpInGame (copy), getFFlagEnableAmpWizardVPCNavigationFix (copy), fFlagSignalsNavP3Dispatch (copy), var4 (copy), var8 (copy), navigateBack (copy), p0 (ref)
				if not TCOpenAmpInGame and not getFFlagEnableAmpWizardVPCNavigationFix() then
					if fFlagSignalsNavP3Dispatch then
						var4.back(true)
					else
						var8(navigateBack(true))
					end
				end
				p0.completionCallback(p1, p2)
			end
			
			if fFlagEnableTrustedFriendsWizardVPCPrologueModule then
				if TCOpenAmpInGame then
					inExpAmpWizardController.OpenAmpWizardContainerInExp(p0.featureName, var12, p0.recourseData, p0.entryPointEventCtx, p0.extraParameters, p0.nameSpace, nil, nil, nil, p0.usePrologue, p0.prologueOptions)
					
					return
				end
				var8(openAmpWizardContainer(p0.featureName, var12, p0.recourseData, p0.entryPointEventCtx, p0.extraParameters, p0.nameSpace, nil, nil, nil, p0.usePrologue, p0.prologueOptions))
				
				return
			elseif TCOpenAmpInGame then
				inExpAmpWizardController.OpenAmpWizardContainerInExp(p0.featureName, var12, p0.recourseData, p0.entryPointEventCtx, p0.extraParameters, p0.nameSpace)
				
				return
			end
			var8(openAmpWizardContainer(p0.featureName, var12, p0.recourseData, p0.entryPointEventCtx, p0.extraParameters, p0.nameSpace))
		end, { var8 }),
		openFacialAgeEstimationUpsell = if fFlagTFWithActionsCheck then if fFlagTFWithActionsCheck then reactModule.useCallback(function(p3)
			-- upvalues: var9 (write), upsellEntrySurfaceType (copy), var10 (write), socialUpsellType (copy), upsellComponent (copy), var11 (ref)
			local var13 = if var9 then upsellEntrySurfaceType.TrustedFriendsInExperience else upsellEntrySurfaceType.TrustedFriends
			var10.openSocialOverlay(socialUpsellType.FacialAgeEstimation, {
				shouldIncludeVPC = true,
				upsellEntrySurface = var13,
				upsellEntryComponent = upsellComponent.Modal,
				entryPointEventCtx = socialUpsellType.FacialAgeEstimation .. var13,
				onSuccess = p3 and p3.onSuccess,
				onFailure = p3 and p3.onFailure,
				onAccept = p3 and p3.onAccept,
				onDismiss = var11
			})
		end, { var11, var9, var10.openSocialOverlay }) else nil else nil,
		showToast = reactModule.useCallback(function(p4)
			-- upvalues: notificationModalsManagerModule (copy)
			notificationModalsManagerModule.SetUIBloxToast({
				sequenceNumber = DateTime.now().UnixTimestamp,
				toastTitle = p4
			})
		end, {}),
		openWebView = useOpenWebView(),
		shareUrl = reactModule.useCallback(function(p5)
			-- upvalues: default (copy)
			default:shareUrl(p5)
		end, {})
	}
end