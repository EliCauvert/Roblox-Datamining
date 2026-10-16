local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local ReactModule = require(CurrencyTransfers.Parent.React)
local TransferFAEBlockSheetModule = require(CurrencyTransfers.Components.Generic.TransferFAEBlockSheet)
local SubscriptionUpsellContainerModule = require(CurrencyTransfers.Components.Generic.SubscriptionUpsellContainer)
local VPCBlockContainerModule = require(CurrencyTransfers.Components.Generic.VPCBlockContainer)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local _ = require(CurrencyTransfers.Enums.TransferDirection)
local AmpWizardTransferConstantsModule = require(CurrencyTransfers.Constants.AmpWizardTransferConstants)

return function(_) --[[ Line: 23 | Named "TransferBlockSheet" ]]
	-- upvalues: UseTransferStoreModule (copy), AmpWizardTransferConstantsModule (copy), ReactModule (copy), SubscriptionUpsellContainerModule (copy), TransferFAEBlockSheetModule (copy), VPCBlockContainerModule (copy)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local Direction = UseTransferStoreModuleResult.getDirection(false)
	local AmpRecourseActions = UseTransferStoreModuleResult.getAmpRecourseActions(false)
	local AmpFeatureCheck = UseTransferStoreModuleResult.getAmpFeatureCheck(false)
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	
	if AmpRecourseActions then
		for _, ampRecourseAction in ipairs(AmpRecourseActions) do
			if ampRecourseAction == AmpWizardTransferConstantsModule.RECOURSE_PLUS_SUBSCRIPTION then
				Flag = true
			elseif ampRecourseAction == AmpWizardTransferConstantsModule.RECOURSE_ID_VERIFICATION or ampRecourseAction == AmpWizardTransferConstantsModule.RECOURSE_AGE_ESTIMATION then
				Flag1 = true
			elseif ampRecourseAction == AmpWizardTransferConstantsModule.RECOURSE_PARENT_LINK or ampRecourseAction == AmpWizardTransferConstantsModule.RECOURSE_PARENT_CONSENT then
				Flag2 = true
			end
		end
	end
	local config = {
		direction = Direction,
		ampRecourseActions = AmpRecourseActions,
		ampFeatureCheck = AmpFeatureCheck
	}
	
	return if Flag and Direction then ReactModule.createElement(SubscriptionUpsellContainerModule, {
		direction = config.direction,
		ampRecourseActions = config.ampRecourseActions,
		ampFeatureCheck = config.ampFeatureCheck
	}) elseif Flag1 and Direction then ReactModule.createElement(TransferFAEBlockSheetModule, {
		direction = config.direction,
		ampRecourseActions = config.ampRecourseActions,
		ampFeatureCheck = config.ampFeatureCheck
	}) elseif Flag2 and Direction then ReactModule.createElement(VPCBlockContainerModule, {
		direction = config.direction,
		ampRecourseActions = config.ampRecourseActions,
		ampFeatureCheck = config.ampFeatureCheck
	}) else ReactModule.createElement(ReactModule.Fragment)
end