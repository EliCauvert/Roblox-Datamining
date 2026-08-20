local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useAdCampaignCardViewModelModule = require(script.Parent.useAdCampaignCardViewModel)
local button = foundationModule.Button
local text = foundationModule.Text
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 21 | named "AdCampaignCard" ]]
	-- upvalues: useAdCampaignCardViewModelModule (ref), reactModule (ref), view (ref), text (ref), button (ref), inputSize (ref)
	local var3 = useAdCampaignCardViewModelModule(p0)
	
	return reactModule.createElement(view, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "AdCampaignCard",
		LayoutOrder = p0.LayoutOrder
	}, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = var3.title
			}),
			Description = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				Text = var3.description
			})
		}),
		Action = reactModule.createElement(button, {
			LayoutOrder = 2,
			testId = "AdCampaignCard.Primary",
			text = var3.actionText,
			size = inputSize.Small,
			variant = var3.buttonVariant,
			width = UDim.new(1, 0),
			isLoading = var3.isLoading,
			onActivated = var3.onActivated
		})
	})
end