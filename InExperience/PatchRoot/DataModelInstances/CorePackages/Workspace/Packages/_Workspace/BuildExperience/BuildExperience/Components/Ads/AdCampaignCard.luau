local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useAdCampaignCardViewModelModule = require(script.Parent.useAdCampaignCardViewModel)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: useAdCampaignCardViewModelModule (ref), reactModule (ref), view (ref), text (ref), button (ref), inputSize (ref)
	local var1 = useAdCampaignCardViewModelModule(p1)
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "AdCampaignCard",
		LayoutOrder = p1.LayoutOrder
	}, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = var1.title
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				Text = var1.description
			})
		}),
		Action = reactModule.createElement(button, {
			LayoutOrder = 2,
			testId = "AdCampaignCard.Primary",
			text = var1.actionText,
			size = inputSize.Small,
			variant = var1.buttonVariant,
			width = UDim.new(1, 0),
			isLoading = var1.isLoading,
			onActivated = var1.onActivated
		})
	})
end