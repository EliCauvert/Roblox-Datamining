local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	local Size300: number = UseTokensResult.Size.Size_300
	
	return ReactModule.createElement(View, {
		tag = Frame.tag or "auto-xy",
		LayoutOrder = Frame.LayoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseTokensResult.Size.Size_150),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		testId = Frame.testId
	}, {
		Label = ReactModule.createElement(Text, {
			tag = "auto-xy text-body-medium content-default",
			LayoutOrder = 1,
			Text = UseLocalizationFunction({ poweredBy = "Feature.Landing.Label.PoweredBy" }).poweredBy,
			testId = Frame.textTestId
		}),
		Wordmark = ReactModule.createElement(Image, {
			Image = "icons/logo/letterform",
			LayoutOrder = 2,
			imageStyle = UseTokensResult.Color.Content.Default,
			Size = UDim2.fromOffset(Size300 * 5.222222222222222, Size300),
			testId = Frame.wordmarkTestId
		})
	})
end