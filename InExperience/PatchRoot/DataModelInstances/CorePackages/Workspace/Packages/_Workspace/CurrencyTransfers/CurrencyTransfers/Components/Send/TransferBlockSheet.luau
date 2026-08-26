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
	local var1 = useTransferStoreModule()
	local direction = var1.getDirection(false)
	local ampRecourseActions = var1.getAmpRecourseActions(false)
	local ampFeatureCheck = var1.getAmpFeatureCheck(false)
	local var2 = false
	local var3 = false
	local var4 = false
	
	if ampRecourseActions then
		for i, v in ipairs(ampRecourseActions) do
			if v == ampWizardTransferConstantsModule.RECOURSE_PLUS_SUBSCRIPTION then
				var2 = true
			elseif v == ampWizardTransferConstantsModule.RECOURSE_ID_VERIFICATION or v == ampWizardTransferConstantsModule.RECOURSE_AGE_ESTIMATION then
				var3 = true
			elseif v == ampWizardTransferConstantsModule.RECOURSE_PARENT_LINK or v == ampWizardTransferConstantsModule.RECOURSE_PARENT_CONSENT then
				var4 = true
			end
		end
	end
	local t = {
		direction = direction,
		ampRecourseActions = ampRecourseActions,
		ampFeatureCheck = ampFeatureCheck
	}
	
	return if var2 and direction then reactModule.createElement(subscriptionUpsellContainerModule, {
		direction = t.direction,
		ampRecourseActions = t.ampRecourseActions,
		ampFeatureCheck = t.ampFeatureCheck
	}) elseif var3 and direction then reactModule.createElement(transferFAEBlockSheetModule, {
		direction = t.direction,
		ampRecourseActions = t.ampRecourseActions,
		ampFeatureCheck = t.ampFeatureCheck
	}) elseif var4 and direction then reactModule.createElement(VPCBlockContainerModule, {
		direction = t.direction,
		ampRecourseActions = t.ampRecourseActions,
		ampFeatureCheck = t.ampFeatureCheck
	}) else reactModule.createElement(reactModule.Fragment)
end