local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local ampUpsellModule = require(parent.AmpUpsell)
local openAmpWizardContainer = ampUpsellModule.OpenAmpWizardContainer
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local robloxSubscriptionPurchaseAppModule = require(parent.RobloxSubscriptionPurchaseApp)
local surfaceName = robloxSubscriptionPurchaseAppModule.SurfaceName
local surfaceContext = robloxSubscriptionPurchaseAppModule.SurfaceContext
local purchaseClientSessionIdType = robloxSubscriptionPurchaseAppModule.PurchaseClientSessionIdType
local profileFrameAmpConstantsModule = require(avatarExperienceProfilePictureEditor.Common.ProfileFrameAmpConstants)

return function(p1)
	-- upvalues: surfaceName (ref), surfaceContext (ref), purchaseClientSessionIdType (ref), openAmpWizardContainer (ref), profileFrameAmpConstantsModule (ref), accessResponseEnum (ref)
	local dispatch = p1.dispatch
	local onGranted = p1.onGranted
	local onDenied = p1.onDenied
	local purchaseFlowUuid = p1.purchaseFlowUuid
	dispatch(openAmpWizardContainer(profileFrameAmpConstantsModule.FEATURE_NAME, function(p2, _)
		-- upvalues: accessResponseEnum (copy), onGranted (ref), onDenied (ref)
		if p2 == accessResponseEnum.Granted then
			if onGranted then
				onGranted()
				
				return
			end
		elseif onDenied then
			onDenied()
		end
	end, {
		purchaseUIOptions = { showBackButton = false },
		surfaceName = surfaceName.ProfileFramesUpsell,
		surfaceContext = surfaceContext.InApp,
		analyticsContext = if purchaseFlowUuid and purchaseFlowUuid ~= "" then {
			clientSessionId = {
				clientSessionIdType = purchaseClientSessionIdType.PurchaseFlowUUID,
				clientSessionId = purchaseFlowUuid
			}
		} else nil
	}, profileFrameAmpConstantsModule.ENTRY_POINT_EVENT_CTX, nil, profileFrameAmpConstantsModule.NAME_SPACE))
end