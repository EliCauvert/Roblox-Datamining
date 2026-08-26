local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local transferFAEBlockSheetModule = require(currencyTransfers.Components.Generic.TransferFAEBlockSheet)
local VPCBlockContainerModule = require(currencyTransfers.Components.Generic.VPCBlockContainer)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local _ = require(currencyTransfers.Enums.TransferDirection)
local ampWizardTransferConstantsModule = require(currencyTransfers.Constants.AmpWizardTransferConstants)

return function(_)
	-- upvalues: useTransferStoreModule (ref), ampWizardTransferConstantsModule (ref), reactModule (ref), transferFAEBlockSheetModule (ref), VPCBlockContainerModule (ref)
	local var1 = useTransferStoreModule()
	local direction = var1.getDirection(false)
	local ampRecourseActions = var1.getAmpRecourseActions(false)
	local ampFeatureCheck = var1.getAmpFeatureCheck(false)
	local var2 = false
	local var3 = false
	
	if ampRecourseActions then
		for i, v in ipairs(ampRecourseActions) do
			if v == ampWizardTransferConstantsModule.RECOURSE_ID_VERIFICATION or v == ampWizardTransferConstantsModule.RECOURSE_AGE_ESTIMATION then
				var2 = true
			elseif v == ampWizardTransferConstantsModule.RECOURSE_PARENT_LINK or v == ampWizardTransferConstantsModule.RECOURSE_PARENT_CONSENT then
				var3 = true
			end
		end
	end
	return if var2 and direction then reactModule.createElement(transferFAEBlockSheetModule, {
		direction = direction,
		ampRecourseActions = ampRecourseActions,
		ampFeatureCheck = ampFeatureCheck
	}) elseif var3 and direction then reactModule.createElement(VPCBlockContainerModule, {
		direction = direction,
		ampRecourseActions = ampRecourseActions,
		ampFeatureCheck = ampFeatureCheck
	}) else reactModule.createElement(reactModule.Fragment)
end