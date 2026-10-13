local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local reactModule = require(parent.React)
local iconModule = require(foundation.Components.Icon)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local thumbnailModule = require(script.Parent.Thumbnail)
local useUpsellContentVariantsModule = require(script.Parent.useUpsellContentVariants)
local icon = builderIconsModule.Icon

return function(p1)
	-- upvalues: useTokensModule (ref), useUpsellContentVariantsModule (ref), reactModule (ref), viewModule (ref), thumbnailModule (ref), textModule (ref), iconModule (ref), icon (ref)
	local var1 = useUpsellContentVariantsModule(useTokensModule(), p1.density)
	
	return reactModule.createElement(viewModule, {
		LayoutOrder = 1,
		tag = var1.container.tag,
		testId = `{p1.testId}--upsell-content`
	}, {
		Thumbnail = if p1.thumbnail then reactModule.createElement(thumbnailModule, {
			LayoutOrder = 1,
			thumbnail = p1.thumbnail,
			density = p1.density,
			testId = p1.testId
		}) else nil,
		Content = reactModule.createElement(viewModule, {
			LayoutOrder = 2,
			tag = var1.content.tag,
			testId = `{p1.testId}--upsell-content--body`
		}, {
			Title = if p1.title then reactModule.createElement(textModule, {
				LayoutOrder = 1,
				Text = p1.title,
				tag = var1.title.tag,
				testId = `{p1.testId}--title`
			}) else nil,
			Description = if p1.description then reactModule.createElement(textModule, {
				LayoutOrder = 2,
				Text = p1.description,
				TextTruncate = Enum.TextTruncate.AtEnd,
				sizeConstraint = var1.description.sizeConstraint,
				tag = var1.description.tag,
				testId = `{p1.testId}--description`
			}) else nil
		}),
		Chevron = if p1.onActivated then reactModule.createElement(iconModule, {
			LayoutOrder = 3,
			name = icon.ChevronSmallRight,
			testId = `{p1.testId}--chevron`
		}) else nil
	})
end