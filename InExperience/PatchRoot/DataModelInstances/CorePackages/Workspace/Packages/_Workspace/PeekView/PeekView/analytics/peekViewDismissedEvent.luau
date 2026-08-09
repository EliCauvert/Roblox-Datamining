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
	logEvent = function(p0, p1, p2) --[[ line: 31 ]]
		-- upvalues: var1 (ref), mutedError (ref)
		local var2, var3 = var1(p2)
		
		if not var2 then
			mutedError(var3)
		end
		p0:sendEventDeferred(p1, "uiPeekViewDismissed", p2)
	end
}