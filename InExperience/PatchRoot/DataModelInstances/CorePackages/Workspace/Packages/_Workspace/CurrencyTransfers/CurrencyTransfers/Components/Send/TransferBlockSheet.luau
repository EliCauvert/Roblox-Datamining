local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local transferFAEBlockSheetModule = require(currencyTransfers.Components.Generic.TransferFAEBlockSheet)
local subscriptionUpsellContainerModule = require(currencyTransfers.Components.Generic.SubscriptionUpsellContainer)
local VPCBlockContainerModule = require(currencyTransfers.Components.Generic.VPCBlockContainer)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local _ = require(currencyTransfers.Enums.TransferDirection)
local ampWizardTransferConstantsModule = require(currencyTransfers.Constants.AmpWizardTransferConstants)

return function(_)
	-- upvalues: useTransferStoreModule (ref), ampWizardTransferConstantsModule (ref), reactModule (ref), subscriptionUpsellContainerModule (ref), transferFAEBlockSheetModule (ref), VPCBlockContainerModule (ref)
	local var7 = useTransferStoreModule()
	local direction = var7.getDirection(false)
	local ampRecourseActions = var7.getAmpRecourseActions(false)
	local ampFeatureCheck = var7.getAmpFeatureCheck(false)
	local var11 = false
	local var12 = false
	local var13 = false
	
	if ampRecourseActions then
		for i, v in ipairs(ampRecourseActions) do
			if v == ampWizardTransferConstantsModule.RECOURSE_PLUS_SUBSCRIPTION then
				var11 = true
			elseif v == ampWizardTransferConstantsModule.RECOURSE_ID_VERIFICATION or v == ampWizardTransferConstantsModule.RECOURSE_AGE_ESTIMATION then
				var12 = true
			elseif v == ampWizardTransferConstantsModule.RECOURSE_PARENT_LINK or v == ampWizardTransferConstantsModule.RECOURSE_PARENT_CONSENT then
				var13 = true
			end
		end
	end
	local t = {
		direction = direction,
		ampRecourseActions = ampRecourseActions,
		ampFeatureCheck = ampFeatureCheck
	}
	
	return if var11 and direction then reactModule.createElement(subscriptionUpsellContainerModule, {
		direction = t.direction,
		ampRecourseActions = t.ampRecourseActions,
		ampFeatureCheck = t.ampFeatureCheck
	}) elseif var12 and direction then reactModule.createElement(transferFAEBlockSheetModule, {
		direction = t.direction,
		ampRecourseActions = t.ampRecourseActions,
		ampFeatureCheck = t.ampFeatureCheck
	}) elseif var13 and direction then reactModule.createElement(VPCBlockContainerModule, {
		direction = t.direction,
		ampRecourseActions = t.ampRecourseActions,
		ampFeatureCheck = t.ampFeatureCheck
	}) else reactModule.createElement(reactModule.Fragment)
end