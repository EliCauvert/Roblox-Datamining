local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local ConstantsModule = require(Foundation.Constants)
local IconModule = require(Foundation.Components.Icon)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local _ = require(Foundation.Enums.DataSliderAccessoryPlacement)
local _ = require(script.Parent.getDataSliderAccessoryForm)
local UseDataSliderAccessoryVariantsModule = require(script.Parent.useDataSliderAccessoryVariants)

return function(Frame)
	-- upvalues: UseTokensModule (copy), UseDataSliderAccessoryVariantsModule (copy), ReactModule (copy), ViewModule (copy), ConstantsModule (copy), IconModule (copy), TextModule (copy)
	local UseDataSliderAccessoryVariantsModuleResult = UseDataSliderAccessoryVariantsModule(UseTokensModule(), Frame.placement, Frame.position)
	local Icon = if Frame.form == "Icon" or Frame.text == nil then Frame.icon else nil
	
	return ReactModule.createElement(ViewModule, {
		tag = UseDataSliderAccessoryVariantsModuleResult.container.tag,
		GroupTransparency = if Frame.isDisabled then ConstantsModule.DISABLED_TRANSPARENCY else nil,
		LayoutOrder = Frame.LayoutOrder,
		testId = Frame.testId
	}, {
		Icon = if Icon then ReactModule.createElement(IconModule, {
			LayoutOrder = 1,
			name = Icon,
			variant = Frame.iconVariant,
			testId = `{Frame.testId}--icon`
		}) else nil,
		Text = if Icon == nil and Frame.text then ReactModule.createElement(TextModule, {
			LayoutOrder = 2,
			Text = Frame.text,
			tag = UseDataSliderAccessoryVariantsModuleResult.text.tag,
			testId = `{Frame.testId}--text`
		}) else nil
	})
end