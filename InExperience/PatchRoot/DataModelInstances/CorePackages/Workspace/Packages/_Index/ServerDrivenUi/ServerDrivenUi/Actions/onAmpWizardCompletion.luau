local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ampUpsellModule = require(parent.AmpUpsell)
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local actionStatusEnum = ampUpsellModule.AmpEnums.ActionStatusEnum
local actionTypeEnum = ampUpsellModule.AmpEnums.ActionTypeEnum
local ageCheckUpsellDismissedData = require(parent.GameDetail).AgeCheckUpsellDismissedData

return function(p1, p2)
	-- upvalues: accessResponseEnum (ref), actionTypeEnum (ref), actionStatusEnum (ref), ageCheckUpsellDismissedData (ref)
	if p1 == accessResponseEnum.Granted and p2 and p2[actionTypeEnum.AgeEstimation] == actionStatusEnum.Success then
		ageCheckUpsellDismissedData.setAgeCheckUpsellDismissed()
	end
end