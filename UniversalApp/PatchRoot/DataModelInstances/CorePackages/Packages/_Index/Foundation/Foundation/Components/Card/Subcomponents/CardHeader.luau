local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local iconModule = require(foundation.Components.Icon)
local inputSizeModule = require(foundation.Enums.InputSize)
local textModule = require(foundation.Components.Text)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local getSharedVariantsModule = require(foundation.Components.Button.getSharedVariants)
local _ = require(script.Parent.Parent.useCardVariants)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: useTokensModule (ref), reactModule (ref), viewModule (ref), textModule (ref), iconModule (ref), getSharedVariantsModule (ref), inputSizeModule (ref)
	local var1 = useTokensModule()
	local variantProps = p1.variantProps
	local gap = variantProps.titleRow.gap
	local var2 = if typeof(p1.icon) == "table" then p1.icon.name else p1.icon
	local var3 = if p1.descriptionLineClamp ~= nil then nil else variantProps.description.lineHeight * p1.descriptionLineClamp
	
	return reactModule.createElement(viewModule, {
		LayoutOrder = 1,
		tag = variantProps.header.tag,
		sizeConstraint = {
			MinSize = Vector2.new(0, getSharedVariantsModule(var1).sizes[inputSizeModule.Small].container.height)
		},
		testId = `{p1.testId}--header`
	}, {
		Text = reactModule.createElement(viewModule, {
			LayoutOrder = 1,
			tag = variantProps.headerText.tag,
			testId = `{p1.testId}--header-content`
		}, {
			Eyebrow = if p1.eyebrow and p1.title ~= nil then reactModule.createElement(textModule, {
				LayoutOrder = 1,
				Text = p1.eyebrow,
				tag = variantProps.eyebrow.tag,
				testId = `{p1.testId}--eyebrow`
			}) else nil,
			TitleRow = if p1.title ~= nil then nil else reactModule.createElement(viewModule, {
				LayoutOrder = 2,
				tag = variantProps.titleRow.tag,
				layout = if gap then {
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, gap)
				} else nil,
				testId = `{p1.testId}--title-row`
			}, {
				Icon = if var2 then reactModule.createElement(iconModule, {
					LayoutOrder = 1,
					name = var2,
					variant = if typeof(p1.icon) == "table" then p1.icon.variant else nil,
					size = variantProps.icon.size,
					testId = `{p1.testId}--icon`
				}) else nil,
				Title = if p1.title then reactModule.createElement(textModule, {
					LayoutOrder = 2,
					Text = p1.title,
					tag = variantProps.title.tag,
					testId = `{p1.testId}--title`
				}) else nil
			}),
			Description = if p1.description then reactModule.createElement(textModule, {
				LayoutOrder = 3,
				Text = p1.description,
				TextTruncate = if var3 then Enum.TextTruncate.AtEnd else nil,
				sizeConstraint = if var3 then { MaxSize = Vector2.new(1e999, var3) } else nil,
				tag = variantProps.description.tag,
				testId = `{p1.testId}--description`
			}) else nil
		}),
		Actions = p1.actions
	})
end