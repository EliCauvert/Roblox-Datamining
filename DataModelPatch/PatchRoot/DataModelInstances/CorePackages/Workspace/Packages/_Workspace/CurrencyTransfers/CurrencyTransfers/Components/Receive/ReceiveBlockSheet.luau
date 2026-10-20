local CurrencyTransfers = script:FindFirstAncestor("CurrencyTransfers")
local ReactModule = require(CurrencyTransfers.Parent.React)
local TransferFAEBlockSheetModule = require(CurrencyTransfers.Components.Generic.TransferFAEBlockSheet)
local VPCBlockContainerModule = require(CurrencyTransfers.Components.Generic.VPCBlockContainer)
local UseTransferStoreModule = require(CurrencyTransfers.Hooks.useTransferStore)
local _ = require(CurrencyTransfers.Enums.TransferDirection)
local AmpWizardTransferConstantsModule = require(CurrencyTransfers.Constants.AmpWizardTransferConstants)

return function(_)
	-- upvalues: UseTransferStoreModule (copy), AmpWizardTransferConstantsModule (copy), ReactModule (copy), TransferFAEBlockSheetModule (copy), VPCBlockContainerModule (copy)
	local UseTransferStoreModuleResult = UseTransferStoreModule()
	local Direction = UseTransferStoreModuleResult.getDirection(false)
	local AmpRecourseActions = UseTransferStoreModuleResult.getAmpRecourseActions(false)
	local AmpFeatureCheck = UseTransferStoreModuleResult.getAmpFeatureCheck(false)
	local Flag = false
	local Flag1 = false
	
	if AmpRecourseActions then
		for _, ampRecourseAction in ipairs(AmpRecourseActions) do
			if ampRecourseAction == AmpWizardTransferConstantsModule.RECOURSE_ID_VERIFICATION or ampRecourseAction == AmpWizardTransferConstantsModule.RECOURSE_AGE_ESTIMATION then
				Flag = true
			elseif ampRecourseAction == AmpWizardTransferConstantsModule.RECOURSE_PARENT_LINK or ampRecourseAction == AmpWizardTransferConstantsModule.RECOURSE_PARENT_CONSENT then
				Flag1 = true
			end
		end
	end
	return if Flag and Direction then ReactModule.createElement(TransferFAEBlockSheetModule, {
		direction = Direction,
		ampRecourseActions = AmpRecourseActions,
		ampFeatureCheck = AmpFeatureCheck
	}) elseif Flag1 and Direction then ReactModule.createElement(VPCBlockContainerModule, {
		direction = Direction,
		ampRecourseActions = AmpRecourseActions,
		ampFeatureCheck = AmpFeatureCheck
	}) else ReactModule.createElement(ReactModule.Fragment)
end