local InExperienceDetailsPrompt = script:FindFirstAncestor("InExperienceDetailsPrompt")
local Parent = InExperienceDetailsPrompt.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.DataHydration)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local Radius = FoundationModule.Enums.Radius
local Sheet = FoundationModule.Sheet
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local InExperienceDetailsPromptSubtitleModule = require(InExperienceDetailsPrompt.Features.InExperienceDetailsPromptSubtitle)
local UseImageLoadingStateModule = require(InExperienceDetailsPrompt.Hooks.useImageLoadingState)

return function(p1) --[[ Line: 30 | Named "InExperienceDetailsPromptHeader" ]]
	-- upvalues: UseTokensFunction (copy), UseScaledValueFunction (copy), UseImageLoadingStateModule (copy), ReactModule (copy), Sheet (copy), View (copy), Image (copy), Skeleton (copy), Radius (copy), Text (copy), InExperienceDetailsPromptSubtitleModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseScaledValueResult = UseScaledValueFunction(200)
	local UseScaledValueResult1 = UseScaledValueFunction(150)
	
	return ReactModule.createElement(Sheet.Header, nil, {
		Content = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row gap-small size-full-0 auto-y items-center padding-top-medium"
		}, {
			GameIcon = if UseImageLoadingStateModule(p1.imageUri) then ReactModule.createElement(Image, {
				LayoutOrder = 1,
				Image = p1.imageUri,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1200, UseTokensResult.Size.Size_1200),
				cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
			}) else ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(UseTokensResult.Size.Size_1200, UseTokensResult.Size.Size_1200),
				radius = Radius.Medium
			}),
			TextContainer = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col gap-xxsmall fill auto-xy" }, {
				Title = if p1.name then ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "text-heading-small content-emphasis auto-xy text-truncate-end",
					Text = p1.name
				}) else ReactModule.createElement(Skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromOffset(UseScaledValueResult, UseTokensResult.Size.Size_600)
				}),
				Subtitle = if p1.creator then ReactModule.createElement(InExperienceDetailsPromptSubtitleModule, { layoutOrder = 2, creator = p1.creator }) else ReactModule.createElement(Skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(UseScaledValueResult1, UseTokensResult.Size.Size_500)
				})
			})
		})
	})
end