-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local headerBarContextModule = require(foundation.Components.HeaderBar.HeaderBarContext)
local headerBarSlotModule = require(foundation.Enums.HeaderBarSlot)
local viewModule = require(foundation.Components.View)
local constantsModule = require(foundation.Components.HeaderBar.constants)
local useHeaderBarContextModule = require(foundation.Components.HeaderBar.useHeaderBarContext)

return function(p0) --[[ line: 16 | named "HeaderBarTrailing" ]]
	-- upvalues: useHeaderBarContextModule (ref), reactModule (ref), headerBarContextModule (ref), headerBarSlotModule (ref), viewModule (ref), constantsModule (ref)
	local var7 = useHeaderBarContextModule()
	
	return reactModule.createElement(headerBarContextModule.Provider, {
		testId = var7.testId,
		slot = headerBarSlotModule.Trailing
	}, reactModule.createElement(viewModule, {
		tag = "row align-x-right align-y-center shrink gap-small size-full",
		LayoutOrder = constantsModule.TRAILING_LAYOUT_ORDER,
		testId = `{var7.testId}--trailing`
	}, p0.children))
end