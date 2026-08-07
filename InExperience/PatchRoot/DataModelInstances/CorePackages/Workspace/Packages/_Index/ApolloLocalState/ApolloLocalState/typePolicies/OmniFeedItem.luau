local getFFlagEnableMergeOmniFeedSorts = require(script.Parent.Parent.Flags).GetFFlagEnableMergeOmniFeedSorts
local _ = require(script:FindFirstAncestor("ApolloLocalState").Parent.ApolloClient)
local makeDefaultReadPolicyModule = require(script.Parent.utils.makeDefaultReadPolicy)

return {
	fields = {
		topicLayoutData = { read = makeDefaultReadPolicyModule({}) },
		recommendations = {
			read = makeDefaultReadPolicyModule({}),
			merge = if getFFlagEnableMergeOmniFeedSorts() then require(script.Parent.utils.makeMergeOverlappingArraysPolicy)("contentId") else nil
		},
		experiences = {},
		hasMoreRows = {}
	}
}