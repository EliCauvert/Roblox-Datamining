local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local AmpUpsellModule = require(Parent.AmpUpsell)
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local ActionStatusEnum = AmpUpsellModule.AmpEnums.ActionStatusEnum
local ActionTypeEnum = AmpUpsellModule.AmpEnums.ActionTypeEnum
local AgeCheckUpsellDismissedData = require(Parent.GameDetail).AgeCheckUpsellDismissedData

return function(Granted, p1) --[[ Line: 17 | Named "onAmpWizardCompletion" ]]
	-- upvalues: AccessResponseEnum (copy), ActionTypeEnum (copy), ActionStatusEnum (copy), AgeCheckUpsellDismissedData (copy)
	if Granted == AccessResponseEnum.Granted and p1 and p1[ActionTypeEnum.AgeEstimation] == ActionStatusEnum.Success then
		AgeCheckUpsellDismissedData.setAgeCheckUpsellDismissed()
	end
end