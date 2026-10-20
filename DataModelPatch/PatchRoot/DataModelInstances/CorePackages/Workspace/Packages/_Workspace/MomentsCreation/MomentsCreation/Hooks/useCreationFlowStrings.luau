local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local UseLocalizationFunction = require(MomentsCreation.Parent.Localization).Hooks.useLocalization
local CreationFlowStringsModule = require(MomentsCreation.creationFlowStrings)

return function()
	-- upvalues: UseLocalizationFunction (copy), CreationFlowStringsModule (copy)
	return UseLocalizationFunction(CreationFlowStringsModule)
end