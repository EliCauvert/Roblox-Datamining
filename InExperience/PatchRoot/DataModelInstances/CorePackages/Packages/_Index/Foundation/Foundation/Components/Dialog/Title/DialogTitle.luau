local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local useDialogModule = require(script.Parent.Parent.useDialog)
local useDialogVariants = require(script.Parent.Parent.useDialogVariants).useDialogVariants

return function(p0)
	-- upvalues: useTokensModule (ref), useDialogModule (ref), useDialogVariants (ref), reactModule (ref), viewModule (ref), constantsModule (ref), textModule (ref)
	local var7 = useTokensModule()
	local var8 = useDialogModule()
	local var9 = useDialogVariants()
	
	return reactModule.createElement(viewModule, {
		tag = var9.title.tag,
		LayoutOrder = constantsModule.MIN_LAYOUT_ORDER + 1,
		padding = {
			right = if var8.hasHeroMedia then nil else UDim.new(0, var9.closeAffordance.offset + var7.Size.Size_1000),
			top = if var8.hasHeroMedia then nil else UDim.new(0, var7.Size.Size_500)
		},
		testId = `{var8.testId}--title`
	}, {
		Title = reactModule.createElement(textModule, { tag = var9.titleText.tag, Text = p0.text })
	})
end