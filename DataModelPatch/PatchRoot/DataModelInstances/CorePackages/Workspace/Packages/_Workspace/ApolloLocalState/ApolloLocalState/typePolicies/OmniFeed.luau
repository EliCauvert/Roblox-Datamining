local MakeDefaultReadPolicyModule = require(script.Parent.utils.makeDefaultReadPolicy)
local MakeMergeOverlappingArraysPolicyModule = require(script.Parent.utils.makeMergeOverlappingArraysPolicy)

return {
	keyFields = { "pageType" },
	fields = {
		sorts = {
			merge = if require(script.Parent.Parent.Flags).GetFFlagEnableMergeOmniFeedSorts() then MakeMergeOverlappingArraysPolicyModule("topicId") else nil
		},
		nextPageToken = { read = MakeDefaultReadPolicyModule("") },
		globalLayoutData = { read = MakeDefaultReadPolicyModule({}) }
	}
}