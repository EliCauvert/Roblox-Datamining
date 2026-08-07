local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local useLocalization = require(momentsCreation.Parent.Localization).Hooks.useLocalization
local creationFlowStringsModule = require(momentsCreation.creationFlowStrings)

return function() --[[ line: 10 | named "useCreationFlowStrings" ]]
	-- upvalues: useLocalization (ref), creationFlowStringsModule (ref)
	return useLocalization(creationFlowStringsModule)
end