local parent = script:FindFirstAncestor("ProgressLoading").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local image = foundationModule.Image
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref), image (ref)
	local var1 = useTokens()
	local size300 = var1.Size.Size_300
	
	return reactModule.createElement(view, {
		tag = p1.tag or "auto-xy",
		LayoutOrder = p1.LayoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var1.Size.Size_150),
			SortOrder = Enum.SortOrder.LayoutOrder
		},
		testId = p1.testId
	}, {
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium content-default",
			LayoutOrder = 1,
			Text = useLocalization({ poweredBy = "Feature.Landing.Label.PoweredBy" }).poweredBy,
			testId = p1.textTestId
		}),
		Wordmark = reactModule.createElement(image, {
			Image = "icons/logo/letterform",
			LayoutOrder = 2,
			imageStyle = var1.Color.Content.Default,
			Size = UDim2.fromOffset(size300 * 5.222222222222, size300),
			testId = p1.wordmarkTestId
		})
	})
end