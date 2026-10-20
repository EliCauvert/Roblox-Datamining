local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local IconModule = require(Foundation.Components.Icon)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local ThumbnailModule = require(script.Parent.Thumbnail)
local UseUpsellContentVariantsModule = require(script.Parent.useUpsellContentVariants)
local Icon = require(Parent.BuilderIcons).Icon

return function(p1)
	-- upvalues: UseTokensModule (copy), UseUpsellContentVariantsModule (copy), ReactModule (copy), ViewModule (copy), ThumbnailModule (copy), TextModule (copy), IconModule (copy), Icon (copy)
	local UseUpsellContentVariantsModuleResult = UseUpsellContentVariantsModule(UseTokensModule(), p1.density)
	
	return ReactModule.createElement(ViewModule, {
		LayoutOrder = 1,
		tag = UseUpsellContentVariantsModuleResult.container.tag,
		testId = `{p1.testId}--upsell-content`
	}, {
		Thumbnail = if p1.thumbnail then ReactModule.createElement(ThumbnailModule, {
			LayoutOrder = 1,
			thumbnail = p1.thumbnail,
			density = p1.density,
			testId = p1.testId
		}) else nil,
		Content = ReactModule.createElement(ViewModule, {
			LayoutOrder = 2,
			tag = UseUpsellContentVariantsModuleResult.content.tag,
			testId = `{p1.testId}--upsell-content--body`
		}, {
			Title = if p1.title then ReactModule.createElement(TextModule, {
				LayoutOrder = 1,
				Text = p1.title,
				tag = UseUpsellContentVariantsModuleResult.title.tag,
				testId = `{p1.testId}--title`
			}) else nil,
			Description = if p1.description then ReactModule.createElement(TextModule, {
				LayoutOrder = 2,
				Text = p1.description,
				TextTruncate = Enum.TextTruncate.AtEnd,
				sizeConstraint = UseUpsellContentVariantsModuleResult.description.sizeConstraint,
				tag = UseUpsellContentVariantsModuleResult.description.tag,
				testId = `{p1.testId}--description`
			}) else nil
		}),
		Chevron = if p1.onActivated then ReactModule.createElement(IconModule, {
			LayoutOrder = 3,
			name = Icon.ChevronSmallRight,
			testId = `{p1.testId}--chevron`
		}) else nil
	})
end