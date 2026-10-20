local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local UseDialogModule = require(script.Parent.Parent.useDialog)
local UseDialogVariantsFunction = require(script.Parent.Parent.useDialogVariants).useDialogVariants

return function(p1)
	-- upvalues: UseTokensModule (copy), UseDialogModule (copy), UseDialogVariantsFunction (copy), ReactModule (copy), ViewModule (copy), ConstantsModule (copy), TextModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseDialogModuleResult = UseDialogModule()
	local UseDialogVariantsResult = UseDialogVariantsFunction()
	
	return ReactModule.createElement(ViewModule, {
		tag = UseDialogVariantsResult.title.tag,
		LayoutOrder = ConstantsModule.MIN_LAYOUT_ORDER + 1,
		padding = {
			right = if UseDialogModuleResult.hasHeroMedia then nil else UDim.new(0, UseDialogVariantsResult.closeAffordance.offset + UseTokensModuleResult.Size.Size_1000),
			top = if UseDialogModuleResult.hasHeroMedia then nil else UDim.new(0, UseTokensModuleResult.Size.Size_500)
		},
		testId = `{UseDialogModuleResult.testId}--title`
	}, {
		Title = ReactModule.createElement(TextModule, {
			tag = UseDialogVariantsResult.titleText.tag,
			Text = p1.text
		})
	})
end