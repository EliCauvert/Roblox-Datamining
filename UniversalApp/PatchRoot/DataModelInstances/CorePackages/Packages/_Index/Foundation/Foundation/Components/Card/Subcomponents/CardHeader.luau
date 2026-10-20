local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.BuilderIcons)
local ReactModule = require(Parent.React)
local IconModule = require(Foundation.Components.Icon)
local InputSizeModule = require(Foundation.Enums.InputSize)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetSharedVariantsModule = require(Foundation.Components.Button.getSharedVariants)
local _ = require(script.Parent.Parent.useCardVariants)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: UseTokensModule (copy), ReactModule (copy), ViewModule (copy), TextModule (copy), IconModule (copy), GetSharedVariantsModule (copy), InputSizeModule (copy)
	local VariantProps = p1.variantProps
	local Gap = VariantProps.titleRow.gap
	local Name = if typeof(p1.icon) == "table" then p1.icon.name else p1.icon
	local Variant = if typeof(p1.icon) == "table" then p1.icon.variant else nil
	local ScaledLineHeight = if p1.descriptionLineClamp == nil then nil else VariantProps.description.lineHeight * p1.descriptionLineClamp
	
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = 1,
		tag = VariantProps.header.tag,
		sizeConstraint = {
			MinSize = Vector2.new(0, GetSharedVariantsModule((UseTokensModule())).sizes[InputSizeModule.Small].container.height)
		},
		testId = `{p1.testId}--header`
	}, {
		Text = ReactModule.createElement(ViewModule, {
			LayoutOrder = 1,
			tag = VariantProps.headerText.tag,
			testId = `{p1.testId}--header-content`
		}, {
			Eyebrow = if p1.eyebrow and p1.title ~= nil then ReactModule.createElement(TextModule, {
				LayoutOrder = 1,
				Text = p1.eyebrow,
				tag = VariantProps.eyebrow.tag,
				testId = `{p1.testId}--eyebrow`
			}) else nil,
			TitleRow = if p1.title == nil then nil else ReactModule.createElement(ViewModule, {
				LayoutOrder = 2,
				tag = VariantProps.titleRow.tag,
				layout = if Gap then {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, Gap)
				} else nil,
				testId = `{p1.testId}--title-row`
			}, {
				Icon = if Name then ReactModule.createElement(IconModule, {
					LayoutOrder = 1,
					name = Name,
					variant = Variant,
					size = VariantProps.icon.size,
					testId = `{p1.testId}--icon`
				}) else nil,
				Title = if p1.title then ReactModule.createElement(TextModule, {
					LayoutOrder = 2,
					Text = p1.title,
					tag = VariantProps.title.tag,
					testId = `{p1.testId}--title`
				}) else nil
			}),
			Description = if p1.description then ReactModule.createElement(TextModule, {
				LayoutOrder = 3,
				Text = p1.description,
				TextTruncate = if ScaledLineHeight then Enum.TextTruncate.AtEnd else nil,
				sizeConstraint = if ScaledLineHeight then { MaxSize = Vector2.new(1e999, ScaledLineHeight) } else nil,
				tag = VariantProps.description.tag,
				testId = `{p1.testId}--description`
			}) else nil
		}),
		Actions = p1.actions
	})
end