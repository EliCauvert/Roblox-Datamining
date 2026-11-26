local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy)
	local TestId = p1.testId or "IconTextTileContent"
	local CaptionSmall = UseTokensFunction().Typography.CaptionSmall
	
	return ReactModule.createElement(View, {
		tag = "col flex-y-between size-full padding-small",
		testId = TestId
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = p1.iconName,
			size = IconSize.Small,
			testId = `{TestId}.Icon`
		}),
		TextRow = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row",
			Size = UDim2.new(1, 0, 0, (math.ceil(2 * CaptionSmall.FontSize * CaptionSmall.LineHeight)))
		}, {
			Text = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "fill size-0-full text-caption-small text-wrap text-align-x-left text-align-y-bottom text-truncate-end content-emphasis",
				Text = p1.text,
				testId = `{TestId}.Text`
			}),
			Suffix = if p1.suffix == nil then nil else ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-0-full auto-x text-caption-small text-align-y-bottom content-emphasis",
				Text = p1.suffix,
				testId = `{TestId}.Suffix`
			})
		})
	})
end