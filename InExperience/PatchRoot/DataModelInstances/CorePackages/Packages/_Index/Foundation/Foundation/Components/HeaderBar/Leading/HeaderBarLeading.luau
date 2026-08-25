local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local headerBarContextModule = require(foundation.Components.HeaderBar.HeaderBarContext)
local headerBarSlotModule = require(foundation.Enums.HeaderBarSlot)
local viewModule = require(foundation.Components.View)
local constantsModule = require(foundation.Components.HeaderBar.constants)
local useHeaderBarContextModule = require(foundation.Components.HeaderBar.useHeaderBarContext)

return function(p0)
	-- upvalues: useHeaderBarContextModule (ref), reactModule (ref), headerBarContextModule (ref), headerBarSlotModule (ref), viewModule (ref), constantsModule (ref)
	local var7 = useHeaderBarContextModule()
	
	return reactModule.createElement(headerBarContextModule.Provider, { testId = var7.testId, slot = headerBarSlotModule.Leading }, reactModule.createElement(viewModule, {
		tag = "row align-y-center shrink gap-small size-full",
		LayoutOrder = constantsModule.LEADING_LAYOUT_ORDER,
		testId = `{var7.testId}--leading`
	}, p0.children))
end