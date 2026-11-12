local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local HeaderBarContextModule = require(Foundation.Components.HeaderBar.HeaderBarContext)
local HeaderBarSlotModule = require(Foundation.Enums.HeaderBarSlot)
local ViewModule = require(Foundation.Components.View)
local ConstantsModule = require(Foundation.Components.HeaderBar.constants)
local UseHeaderBarContextModule = require(Foundation.Components.HeaderBar.useHeaderBarContext)

return function(p1)
	-- upvalues: UseHeaderBarContextModule (copy), ReactModule (copy), HeaderBarContextModule (copy), HeaderBarSlotModule (copy), ViewModule (copy), ConstantsModule (copy)
	local UseHeaderBarContextModuleResult = UseHeaderBarContextModule()
	
	return ReactModule.createElement(HeaderBarContextModule.Provider, {
		testId = UseHeaderBarContextModuleResult.testId,
		slot = HeaderBarSlotModule.Trailing
	}, ReactModule.createElement(ViewModule, {
		tag = "row align-x-right align-y-center shrink gap-small size-full",
		LayoutOrder = ConstantsModule.TRAILING_LAYOUT_ORDER,
		testId = `{UseHeaderBarContextModuleResult.testId}--trailing`
	}, p1.children))
end