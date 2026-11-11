local _ = require(script:FindFirstAncestor("ApolloLocalState").Parent.ApolloClient)
local MakeMergeOverlappingArraysPolicyModule = require(script.Parent.utils.makeMergeOverlappingArraysPolicy)
local MakeDefaultReadPolicyModule = require(script.Parent.utils.makeDefaultReadPolicy)

return {
	fields = {
		topicLayoutData = { read = MakeDefaultReadPolicyModule({}) },
		recommendations = {
			read = MakeDefaultReadPolicyModule({}),
			merge = if require(script.Parent.Parent.Flags).GetFFlagEnableMergeOmniFeedSorts() then MakeMergeOverlappingArraysPolicyModule("contentId") else nil
		},
		experiences = {},
		hasMoreRows = {}
	}
}