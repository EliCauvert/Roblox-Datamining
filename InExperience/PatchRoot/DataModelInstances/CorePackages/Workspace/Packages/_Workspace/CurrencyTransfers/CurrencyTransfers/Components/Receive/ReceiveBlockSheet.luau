local currencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local reactModule = require(currencyTransfers.Parent.React)
local transferFAEBlockSheetModule = require(currencyTransfers.Components.Generic.TransferFAEBlockSheet)
local VPCBlockContainerModule = require(currencyTransfers.Components.Generic.VPCBlockContainer)
local useTransferStoreModule = require(currencyTransfers.Hooks.useTransferStore)
local _ = require(currencyTransfers.Enums.TransferDirection)
local ampWizardTransferConstantsModule = require(currencyTransfers.Constants.AmpWizardTransferConstants)

return function(_) --[[ line: 22 | named "ReceiveBlockSheet" ]]
	-- upvalues: useTransferStoreModule (ref), ampWizardTransferConstantsModule (ref), reactModule (ref), transferFAEBlockSheetModule (ref), VPCBlockContainerModule (ref)
	local var6 = useTransferStoreModule()
	local direction = var6.getDirection(false)
	local ampRecourseActions = var6.getAmpRecourseActions(false)
	local ampFeatureCheck = var6.getAmpFeatureCheck(false)
	local var10 = false
	local var11 = false
	
	if ampRecourseActions then
		for i, v in ipairs(ampRecourseActions) do
			if v == ampWizardTransferConstantsModule.RECOURSE_ID_VERIFICATION or v == ampWizardTransferConstantsModule.RECOURSE_AGE_ESTIMATION then
				var10 = true
			elseif v == ampWizardTransferConstantsModule.RECOURSE_PARENT_LINK or v == ampWizardTransferConstantsModule.RECOURSE_PARENT_CONSENT then
				var11 = true
			end
		end
	end
	return if var10 and direction then reactModule.createElement(transferFAEBlockSheetModule, {
		direction = direction,
		ampRecourseActions = ampRecourseActions,
		ampFeatureCheck = ampFeatureCheck
	}) elseif var11 and direction then reactModule.createElement(VPCBlockContainerModule, {
		direction = direction,
		ampRecourseActions = ampRecourseActions,
		ampFeatureCheck = ampFeatureCheck
	}) else reactModule.createElement(reactModule.Fragment)
end