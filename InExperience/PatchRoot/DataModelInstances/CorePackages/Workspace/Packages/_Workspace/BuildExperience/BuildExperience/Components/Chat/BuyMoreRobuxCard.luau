local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ChatCardPriorityModule = require(script.Parent.ChatCardEmphasis.ChatCardPriority)
local UseChatCardEmphasisModule = require(script.Parent.ChatCardEmphasis.useChatCardEmphasis)
local FFlagBuildExperienceBuyMoreRobuxCardLayoutModule = require(BuildExperience.Flags.FFlagBuildExperienceBuyMoreRobuxCardLayout)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local Button = FoundationModule.Button
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local InputSize = FoundationModule.Enums.InputSize

return function(Frame)
	-- upvalues: FFlagBuildExperienceChatCardEmphasisModule (copy), UseChatCardEmphasisModule (copy), ChatCardPriorityModule (copy), ReactModule (copy), Text (copy), View (copy), FFlagBuildExperienceBuyMoreRobuxCardLayoutModule (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseChatCardEmphasisModuleResult = if FFlagBuildExperienceChatCardEmphasisModule then UseChatCardEmphasisModule(ChatCardPriorityModule.BuyMoreRobux) else nil
	local Element = ReactModule.createElement(Text, {
		LayoutOrder = 1,
		tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
		Text = Frame.title
	})
	local Element1 = ReactModule.createElement(Text, {
		LayoutOrder = 2,
		tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
		Text = Frame.description
	})
	
	return ReactModule.createElement(View, {
		testId = "BuyMoreRobuxCard",
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["col size-full-0 auto-y padding-large stroke-standard stroke-default radius-large"] = true,
			["gap-large"] = FFlagBuildExperienceBuyMoreRobuxCardLayoutModule,
			["gap-medium"] = not FFlagBuildExperienceBuyMoreRobuxCardLayoutModule
		}
	}, {
		Copy = if FFlagBuildExperienceBuyMoreRobuxCardLayoutModule then ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col gap-xxsmall size-full-0 auto-y"
		}, { Title = Element, Description = Element1 }) else nil,
		Title = if FFlagBuildExperienceBuyMoreRobuxCardLayoutModule then nil else Element,
		Description = if FFlagBuildExperienceBuyMoreRobuxCardLayoutModule then nil else Element1,
		Actions = ReactModule.createElement(View, {
			tag = "row gap-small size-full-0 auto-y",
			LayoutOrder = if FFlagBuildExperienceBuyMoreRobuxCardLayoutModule then 2 else 3
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