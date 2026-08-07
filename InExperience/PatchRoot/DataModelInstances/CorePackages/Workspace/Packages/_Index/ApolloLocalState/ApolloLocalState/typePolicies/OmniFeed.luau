local makeDefaultReadPolicyModule = require(script.Parent.utils.makeDefaultReadPolicy)

return {
	keyFields = { "pageType" },
	fields = {
		sorts = {
			merge = if require(script.Parent.Parent.Flags).GetFFlagEnableMergeOmniFeedSorts() then require(script.Parent.utils.makeMergeOverlappingArraysPolicy)("topicId") else nil
		},
		nextPageToken = { read = makeDefaultReadPolicyModule("") },
		globalLayoutData = { read = makeDefaultReadPolicyModule({}) }
	}
}