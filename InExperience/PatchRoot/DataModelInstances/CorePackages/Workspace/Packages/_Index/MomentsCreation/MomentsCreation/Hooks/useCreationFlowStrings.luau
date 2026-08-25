local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local useLocalization = require(momentsCreation.Parent.Localization).Hooks.useLocalization
local creationFlowStringsModule = require(momentsCreation.creationFlowStrings)

return function()
	-- upvalues: useLocalization (ref), creationFlowStringsModule (ref)
	return useLocalization(creationFlowStringsModule)
end