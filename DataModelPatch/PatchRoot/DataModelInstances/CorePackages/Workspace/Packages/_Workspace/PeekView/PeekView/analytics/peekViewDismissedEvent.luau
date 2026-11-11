local Parent = script:FindFirstAncestor("PeekView").Parent
local TModule = require(Parent.t)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local UnionResult = TModule.union(TModule.strictInterface({ page = TModule.string, dismissMethod = TModule.string }), (TModule.strictInterface({
	page = TModule.string,
	dismissMethod = TModule.string,
	locale = TModule.optional(TModule.string),
	universeId = TModule.string,
	source = TModule.string,
	index = TModule.number
})))

return {
	dismissMethodEnum = {
		topBarTap = "topBarTap",
		scrimTap = "scrimTap",
		swipe = "swipe",
		handleTap = "handleTap"
	},
	logEvent = function(p1, p2, p3)
		-- upvalues: UnionResult (copy), MutedErrorFunction (copy)
		local UnionResultResult, UnionResultResult2 = UnionResult(p3)
		
		if not UnionResultResult then
			MutedErrorFunction(UnionResultResult2)
		end
		p1:sendEventDeferred(p2, "uiPeekViewDismissed", p3)
	end
}