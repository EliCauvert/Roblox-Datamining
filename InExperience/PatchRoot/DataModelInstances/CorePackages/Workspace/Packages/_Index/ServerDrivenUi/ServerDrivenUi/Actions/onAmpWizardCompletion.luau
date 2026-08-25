local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ampUpsellModule = require(parent.AmpUpsell)
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local actionStatusEnum = ampUpsellModule.AmpEnums.ActionStatusEnum
local actionTypeEnum = ampUpsellModule.AmpEnums.ActionTypeEnum
local ageCheckUpsellDismissedData = require(parent.GameDetail).AgeCheckUpsellDismissedData

return function(p0, p1)
	-- upvalues: accessResponseEnum (ref), actionTypeEnum (ref), actionStatusEnum (ref), ageCheckUpsellDismissedData (ref)
	if p0 == accessResponseEnum.Granted and p1 and p1[actionTypeEnum.AgeEstimation] == actionStatusEnum.Success then
		ageCheckUpsellDismissedData.setAgeCheckUpsellDismissed()
	end
end