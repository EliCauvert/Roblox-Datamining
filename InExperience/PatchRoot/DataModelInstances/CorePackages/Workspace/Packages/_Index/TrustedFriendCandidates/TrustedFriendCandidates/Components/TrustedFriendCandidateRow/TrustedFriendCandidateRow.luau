local Parent = script:FindFirstAncestor("TrustedFriendCandidates").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.UserList)
local UseImpressionsTaggerFunction = require(Parent.Impressions).useImpressionsTagger
local UseTrustedFriendCandidateRowViewModelModule = require(script.Parent.useTrustedFriendCandidateRowViewModel)
local View = FoundationModule.View

return function(p1)
	-- upvalues: UseTrustedFriendCandidateRowViewModelModule (copy), ReactModule (copy), UseImpressionsTaggerFunction (copy), View (copy)
	local UseTrustedFriendCandidateRowViewModelModuleResult = UseTrustedFriendCandidateRowViewModelModule(p1)
	local UseRefResult = ReactModule.useRef(nil)
	UseImpressionsTaggerFunction(UseRefResult, p1.impressionsTag, p1.absolutePosition)
	
	return ReactModule.createElement(View, { tag = "size-full-0 auto-y", ref = UseRefResult }, {
		Row = p1.createRow(UseTrustedFriendCandidateRowViewModelModuleResult)
	})
end