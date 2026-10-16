local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseAdCampaignCardViewModelModule = require(script.Parent.useAdCampaignCardViewModel)
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize

return function(Frame) --[[ Line: 21 | Named "AdCampaignCard" ]]
	-- upvalues: UseAdCampaignCardViewModelModule (copy), ReactModule (copy), View (copy), Text (copy), Button (copy), InputSize (copy)
	local UseAdCampaignCardViewModelModuleResult = UseAdCampaignCardViewModelModule(Frame)
	
	return ReactModule.createElement(View, {
		tag = "col gap-large size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "AdCampaignCard",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Content = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
				Text = UseAdCampaignCardViewModelModuleResult.title
			}),
			Description = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
				Text = UseAdCampaignCardViewModelModuleResult.description
			})
		}),
		Action = ReactModule.createElement(Button, {
			LayoutOrder = 2,
			testId = "AdCampaignCard.Primary",
			text = UseAdCampaignCardViewModelModuleResult.actionText,
			size = InputSize.Small,
			variant = UseAdCampaignCardViewModelModuleResult.buttonVariant,
			width = UDim.new(1, 0),
			isLoading = UseAdCampaignCardViewModelModuleResult.isLoading,
			onActivated = UseAdCampaignCardViewModelModuleResult.onActivated
		})
	})
end