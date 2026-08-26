local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local useDialogModule = require(script.Parent.Parent.useDialog)
local useDialogVariants = require(script.Parent.Parent.useDialogVariants).useDialogVariants

return function(p1)
	-- upvalues: useTokensModule (ref), useDialogModule (ref), useDialogVariants (ref), reactModule (ref), viewModule (ref), constantsModule (ref), textModule (ref)
	local var1 = useTokensModule()
	local var2 = useDialogModule()
	local var3 = useDialogVariants()
	
	return reactModule.createElement(viewModule, {
		tag = var3.title.tag,
		LayoutOrder = constantsModule.MIN_LAYOUT_ORDER + 1,
		padding = {
			right = if var2.hasHeroMedia then nil else UDim.new(0, var3.closeAffordance.offset + var1.Size.Size_1000),
			top = if var2.hasHeroMedia then nil else UDim.new(0, var1.Size.Size_500)
		},
		testId = `{var2.testId}--title`
	}, {
		Title = reactModule.createElement(textModule, { tag = var3.titleText.tag, Text = p1.text })
	})
end