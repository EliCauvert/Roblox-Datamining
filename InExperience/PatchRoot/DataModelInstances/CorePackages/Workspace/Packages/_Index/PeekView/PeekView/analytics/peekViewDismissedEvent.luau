local parent = script:FindFirstAncestor("PeekView").Parent
local tModule = require(parent.t)
local mutedError = require(parent.Loggers).mutedError
local var1 = tModule.union(tModule.strictInterface({ page = tModule.string, dismissMethod = tModule.string }), tModule.strictInterface({
	page = tModule.string,
	dismissMethod = tModule.string,
	locale = tModule.optional(tModule.string),
	universeId = tModule.string,
	source = tModule.string,
	index = tModule.number
}))

return {
	dismissMethodEnum = {
		topBarTap = "topBarTap",
		scrimTap = "scrimTap",
		swipe = "swipe",
		handleTap = "handleTap"
	},
	logEvent = function(p1, p2, p3)
		-- upvalues: var1 (ref), mutedError (ref)
		local var2, var3 = var1(p3)
		
		if not var2 then
			mutedError(var3)
		end
		p1:sendEventDeferred(p2, "uiPeekViewDismissed", p3)
	end
}