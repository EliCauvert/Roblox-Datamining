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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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
	-- upvalues: useDispatch (ref), fFlagTFWithActionsCheck (ref), useSocialUpsellOverlayController (ref), reactModule (ref), notificationModalsManagerModule (ref), useOpenWebView (ref), TCOpenAmpInGame (ref), getFFlagEnableAmpWizardVPCNavigationFix (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateBack (ref), fFlagEnableTrustedFriendsWizardVPCPrologueModule (ref), inExpAmpWizardController (ref), openAmpWizardContainer (ref), default (ref), upsellEntrySurfaceType (ref), socialUpsellType (ref), upsellComponent (ref)
	local var2 = useDispatch()
	local var3 = nil
	local var4 = nil
	
	if fFlagTFWithActionsCheck then
		var3 = game.GameId ~= 0
		var4 = useSocialUpsellOverlayController(var3)
	end
	local var5 = reactModule.useCallback(function()
		-- upvalues: value (ref)
		if value.onClosed then
			value.onClosed()
			
			return
		elseif value.navigation then
			value.navigation.pop()
		end
	end, { value, value.navigation })
	
	return {
		closeModal = var5,
		openAmpWizard = reactModule.useCallback(function(p1)
			-- upvalues: TCOpenAmpInGame (copy), getFFlagEnableAmpWizardVPCNavigationFix (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (ref), navigateBack (copy), fFlagEnableTrustedFriendsWizardVPCPrologueModule (copy), inExpAmpWizardController (copy), openAmpWizardContainer (copy)
			local var6 = function(p2, p3)
				-- upvalues: TCOpenAmpInGame (copy), getFFlagEnableAmpWizardVPCNavigationFix (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var2 (copy), navigateBack (copy), p1 (ref)
				if not TCOpenAmpInGame and not getFFlagEnableAmpWizardVPCNavigationFix() then
					if fFlagSignalsNavP3Dispatch then
						var1.back(true)
					else
						var2(navigateBack(true))
					end
				end
				p1.completionCallback(p2, p3)
			end
			
			if fFlagEnableTrustedFriendsWizardVPCPrologueModule then
				if TCOpenAmpInGame then
					inExpAmpWizardController.OpenAmpWizardContainerInExp(p1.featureName, var6, p1.recourseData, p1.entryPointEventCtx, p1.extraParameters, p1.nameSpace, nil, nil, nil, p1.usePrologue, p1.prologueOptions)
					
					return
				end
				var2(openAmpWizardContainer(p1.featureName, var6, p1.recourseData, p1.entryPointEventCtx, p1.extraParameters, p1.nameSpace, nil, nil, nil, p1.usePrologue, p1.prologueOptions))
				
				return
			elseif TCOpenAmpInGame then
				inExpAmpWizardController.OpenAmpWizardContainerInExp(p1.featureName, var6, p1.recourseData, p1.entryPointEventCtx, p1.extraParameters, p1.nameSpace)
				
				return
			end
			var2(openAmpWizardContainer(p1.featureName, var6, p1.recourseData, p1.entryPointEventCtx, p1.extraParameters, p1.nameSpace))
		end, { var2 }),
		openFacialAgeEstimationUpsell = if fFlagTFWithActionsCheck then if fFlagTFWithActionsCheck then reactModule.useCallback(function(p1)
			-- upvalues: var3 (write), upsellEntrySurfaceType (copy), var4 (write), socialUpsellType (copy), upsellComponent (copy), var5 (ref)
			local var6 = if var3 then upsellEntrySurfaceType.TrustedFriendsInExperience else upsellEntrySurfaceType.TrustedFriends
			var4.openSocialOverlay(socialUpsellType.FacialAgeEstimation, {
				shouldIncludeVPC = true,
				upsellEntrySurface = var6,
				upsellEntryComponent = upsellComponent.Modal,
				entryPointEventCtx = socialUpsellType.FacialAgeEstimation .. var13,
				onSuccess = p1 and p1.onSuccess,
				onFailure = p1 and p1.onFailure,
				onAccept = p1 and p1.onAccept,
				onDismiss = var5
			})
		end, { var5, var3, var4.openSocialOverlay }) else nil else nil,
		showToast = reactModule.useCallback(function(p1)
			-- upvalues: notificationModalsManagerModule (copy)
			notificationModalsManagerModule.SetUIBloxToast({
				sequenceNumber = DateTime.now().UnixTimestamp,
				toastTitle = p1
			})
		end, {}),
		openWebView = useOpenWebView(),
		shareUrl = reactModule.useCallback(function(p1)
			-- upvalues: default (copy)
			default:shareUrl(p1)
		end, {})
	}
end