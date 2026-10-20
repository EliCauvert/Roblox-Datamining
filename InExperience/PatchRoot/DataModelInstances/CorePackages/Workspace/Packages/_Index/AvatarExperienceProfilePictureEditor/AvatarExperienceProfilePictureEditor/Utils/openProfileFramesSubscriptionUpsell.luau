local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local Parent = AvatarExperienceProfilePictureEditor.Parent
local AmpUpsellModule = require(Parent.AmpUpsell)
local OpenAmpWizardContainerFunction = AmpUpsellModule.OpenAmpWizardContainer
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local RobloxSubscriptionPurchaseAppModule = require(Parent.RobloxSubscriptionPurchaseApp)
local SurfaceName = RobloxSubscriptionPurchaseAppModule.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseAppModule.SurfaceContext
local PurchaseClientSessionIdType = RobloxSubscriptionPurchaseAppModule.PurchaseClientSessionIdType
local ProfileFrameAmpConstantsModule = require(AvatarExperienceProfilePictureEditor.Common.ProfileFrameAmpConstants)

return function(p1)
	-- upvalues: SurfaceName (copy), SurfaceContext (copy), PurchaseClientSessionIdType (copy), OpenAmpWizardContainerFunction (copy), ProfileFrameAmpConstantsModule (copy), AccessResponseEnum (copy)
	local OnGrantedFunction = p1.onGranted
	local OnDeniedFunction = p1.onDenied
	local PurchaseFlowUuid = p1.purchaseFlowUuid
	p1.dispatch(OpenAmpWizardContainerFunction(ProfileFrameAmpConstantsModule.FEATURE_NAME, function(Granted, _)
		-- upvalues: AccessResponseEnum (upval), OnGrantedFunction (copy), OnDeniedFunction (copy)
		if Granted == AccessResponseEnum.Granted then
			if OnGrantedFunction then
				OnGrantedFunction()
				
				return
			end
		elseif OnDeniedFunction then
			OnDeniedFunction()
		end
	end, {
		purchaseUIOptions = { showBackButton = false },
		surfaceName = SurfaceName.ProfileFramesUpsell,
		surfaceContext = SurfaceContext.InApp,
		analyticsContext = if PurchaseFlowUuid and PurchaseFlowUuid ~= "" then {
			clientSessionId = {
				clientSessionIdType = PurchaseClientSessionIdType.PurchaseFlowUUID,
				clientSessionId = PurchaseFlowUuid
			}
		} else nil
	}, ProfileFrameAmpConstantsModule.ENTRY_POINT_EVENT_CTX, nil, ProfileFrameAmpConstantsModule.NAME_SPACE))
end