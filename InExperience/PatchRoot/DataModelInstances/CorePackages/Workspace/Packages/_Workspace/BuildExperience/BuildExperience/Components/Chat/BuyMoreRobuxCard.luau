local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChatCardPriorityModule = require(script.Parent.ChatCardEmphasis.ChatCardPriority)
local UseChatCardEmphasisModule = require(script.Parent.ChatCardEmphasis.useChatCardEmphasis)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize

return function(Frame) --[[ Line: 31 | Named "BuyMoreRobuxCard" ]]
	-- upvalues: FFlagBuildExperienceChatCardEmphasisModule (copy), UseChatCardEmphasisModule (copy), ChatCardPriorityModule (copy), ReactModule (copy), View (copy), Text (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseChatCardEmphasisModuleResult = if FFlagBuildExperienceChatCardEmphasisModule then UseChatCardEmphasisModule(ChatCardPriorityModule.BuyMoreRobux) else nil
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y padding-large stroke-standard stroke-default radius-large",
		testId = "BuyMoreRobuxCard",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Title = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
			Text = Frame.title
		}),
		Description = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
			Text = Frame.description
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "row gap-small size-full-0 auto-y"
		}, {
			PrimaryAction = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				testId = "BuyMoreRobuxCard.PrimaryAction",
				text = Frame.primaryActionText,
				size = InputSize.Small,
				variant = if UseChatCardEmphasisModuleResult == false then ButtonVariant.SoftEmphasis else ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				onActivated = Frame.onPrimaryAction
			}),
			SecondaryAction = ReactModule.createElement(Button, {
				LayoutOrder = 2,
				testId = "BuyMoreRobuxCard.SecondaryAction",
				text = Frame.secondaryActionText,
				size = InputSize.Small,
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fill,
				onActivated = Frame.onSecondaryAction
			})
		})
	})
end