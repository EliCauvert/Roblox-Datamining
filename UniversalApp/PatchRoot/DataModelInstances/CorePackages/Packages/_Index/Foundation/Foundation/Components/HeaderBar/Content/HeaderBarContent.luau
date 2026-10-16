local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local HeaderBarContextModule = require(Foundation.Components.HeaderBar.HeaderBarContext)
local HeaderBarSlotModule = require(Foundation.Enums.HeaderBarSlot)
local ViewModule = require(Foundation.Components.View)
local ConstantsModule = require(Foundation.Components.HeaderBar.constants)
local UseHeaderBarContextModule = require(Foundation.Components.HeaderBar.useHeaderBarContext)

return function(p1) --[[ Line: 16 | Named "HeaderBarContent" ]]
	-- upvalues: UseHeaderBarContextModule (copy), ReactModule (copy), HeaderBarContextModule (copy), HeaderBarSlotModule (copy), ViewModule (copy), ConstantsModule (copy)
	local UseHeaderBarContextModuleResult = UseHeaderBarContextModule()
	
	return ReactModule.createElement(HeaderBarContextModule.Provider, {
		testId = UseHeaderBarContextModuleResult.testId,
		slot = HeaderBarSlotModule.Content
	}, ReactModule.createElement(ViewModule, {
		tag = "align-y-center grow size-0-full auto-x",
		LayoutOrder = ConstantsModule.CONTENT_LAYOUT_ORDER,
		testId = `{UseHeaderBarContextModuleResult.testId}--content`
	}, p1.children))
end