local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Modules = script:FindFirstAncestor("Modules")
local ReactModule = require(CorePackages.Packages.React)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local CryoModule = require(CorePackages.Packages.Cryo)
local OpenPhoneUpsellModalModule = require(Modules.LuaApp.Thunks.Verification.OpenPhoneUpsellModal)
local OpenEmailUpsellModalModule = require(Modules.LuaApp.Thunks.Verification.OpenEmailUpsellModal)
local AppPageModule = require(Modules.LuaApp.AppPage)
local WizardContainer = require(CorePackages.Workspace.Packages.AmpUpsell).WizardContainer
local AmpWizardUserMismatchModal = require(CorePackages.Workspace.Packages.AmpUpsell).AmpWizardUserMismatchModal
local ActionTypeEnum = require(CorePackages.Workspace.Packages.AmpUpsell).AmpEnums.ActionTypeEnum
local GetFFlagEnableAmpEmailUpsellSupportFunction = require(CorePackages.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpEmailUpsellSupport
local GetFFlagEnableAmpIDVUpsellSupportFunction = require(CorePackages.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpIDVUpsellSupport
local GetFFlagEnableAmpSubscriptionUpsellFunction = require(CorePackages.Workspace.Packages.AmpUpsell).GetFFlagEnableAmpSubscriptionUpsell
local FFlagEnableAmpWizardDeepLinkValidateUserId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableAmpWizardDeepLinkValidateUserId

return function(p1)
	-- upvalues: UseNavigationFunction (copy), FFlagEnableAmpWizardDeepLinkValidateUserId (copy), Players (copy), UseDispatchFunction (copy), ReactModule (copy), OpenPhoneUpsellModalModule (copy), AppPageModule (copy), ActionTypeEnum (copy), GetFFlagEnableAmpEmailUpsellSupportFunction (copy), OpenEmailUpsellModalModule (copy), GetFFlagEnableAmpIDVUpsellSupportFunction (copy), GetFFlagEnableAmpSubscriptionUpsellFunction (copy), AmpWizardUserMismatchModal (copy), CryoModule (copy), WizardContainer (copy)
	local UseNavigationResult = UseNavigationFunction()
	local Flag = false
	
	if FFlagEnableAmpWizardDeepLinkValidateUserId then
		local TargetUserId = p1.metadata and p1.metadata.targetUserId
		
		if TargetUserId and TargetUserId ~= "" then
			local LocalPlayer = Players.LocalPlayer
			local Text = if LocalPlayer and LocalPlayer.UserId and LocalPlayer.UserId ~= 0 then tostring(LocalPlayer.UserId) else nil
			
			if Text ~= nil and Text ~= TargetUserId then
				Flag = true
			end
		end
	end
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(ExtraProps)
		-- upvalues: UseNavigationResult (copy), AppPageModule (upval)
		UseNavigationResult.push(AppPageModule.AccountSettingsUpsell, { extraProps = ExtraProps })
	end, { UseNavigationResult })
	local UseResults = {
		[ActionTypeEnum.Phone] = ReactModule.useCallback(function(p2)
			-- upvalues: UseDispatchResult (copy), OpenPhoneUpsellModalModule (upval)
			UseDispatchResult(OpenPhoneUpsellModalModule(p2))
		end, { UseDispatchResult })
	}
	
	if GetFFlagEnableAmpEmailUpsellSupportFunction() then
		UseResults[ActionTypeEnum.AddedEmail] = ReactModule.useCallback(function(p2)
			-- upvalues: UseDispatchResult (copy), OpenEmailUpsellModalModule (upval)
			UseDispatchResult(OpenEmailUpsellModalModule(p2))
		end, { UseDispatchResult })
	end
	if GetFFlagEnableAmpIDVUpsellSupportFunction() then
		UseResults[ActionTypeEnum.GovernmentId] = ReactModule.useCallback(function(ExtraProps)
			-- upvalues: UseNavigationResult (copy), AppPageModule (upval)
			UseNavigationResult.push(AppPageModule.IDVUpsellContainer, { extraProps = ExtraProps })
		end, { UseNavigationResult })
	end
	local UseResult1 = ReactModule.useCallback(function(ExtraProps)
		-- upvalues: UseNavigationResult (copy), AppPageModule (upval)
		UseNavigationResult.push(AppPageModule.VPCUpsellContainer, { extraProps = ExtraProps })
	end, { UseNavigationResult })
	UseResults[ActionTypeEnum.ParentLink] = UseResult1
	UseResults[ActionTypeEnum.ParentConsent] = UseResult1
	UseResults[ActionTypeEnum.AgeEstimation] = ReactModule.useCallback(function(ExtraProps)
		-- upvalues: UseNavigationResult (copy), AppPageModule (upval)
		UseNavigationResult.push(AppPageModule.FAEUpsell, { extraProps = ExtraProps })
	end, { UseNavigationResult })
	
	if GetFFlagEnableAmpSubscriptionUpsellFunction() then
		UseResults[ActionTypeEnum.Subscription] = ReactModule.useCallback(function(ExtraProps)
			-- upvalues: UseNavigationResult (copy), AppPageModule (upval)
			UseNavigationResult.push(AppPageModule.RobloxSubscriptionUpsell, { extraProps = ExtraProps })
		end, { UseNavigationResult })
	end
	return if Flag then ReactModule.createElement(AmpWizardUserMismatchModal, {
		navigation = UseNavigationResult,
		entryPointEventCtx = p1.entryPointEventCtx
	}) else ReactModule.createElement(WizardContainer, (CryoModule.Dictionary.join(p1 or {}, {
		openUpsells = UseResults,
		openAccountSettingsUpsell = UseResult
	})))
end