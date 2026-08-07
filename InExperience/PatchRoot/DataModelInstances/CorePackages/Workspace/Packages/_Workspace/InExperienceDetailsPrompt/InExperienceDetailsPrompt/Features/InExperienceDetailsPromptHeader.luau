local inExperienceDetailsPrompt = script:FindFirstAncestor("InExperienceDetailsPrompt")
local parent = inExperienceDetailsPrompt.Parent
local reactModule = require(parent.React)
local _ = require(parent.DataHydration)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local radius = foundationModule.Enums.Radius
local sheet = foundationModule.Sheet
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useScaledValue = foundationModule.Hooks.useScaledValue
local inExperienceDetailsPromptSubtitleModule = require(inExperienceDetailsPrompt.Features.InExperienceDetailsPromptSubtitle)
local useImageLoadingStateModule = require(inExperienceDetailsPrompt.Hooks.useImageLoadingState)

return function(p0) --[[ line: 30 | named "InExperienceDetailsPromptHeader" ]]
	-- upvalues: useTokens (ref), useScaledValue (ref), useImageLoadingStateModule (ref), reactModule (ref), sheet (ref), view (ref), image (ref), skeleton (ref), radius (ref), text (ref), inExperienceDetailsPromptSubtitleModule (ref)
	local var5 = useTokens()
	
	return reactModule.createElement(sheet.Header, nil, {
		Content = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row gap-small size-full-0 auto-y items-center padding-top-medium"
		}, {
			GameIcon = if useImageLoadingStateModule(p0.imageUri) then reactModule.createElement(image, {
				LayoutOrder = 1,
				Image = p0.imageUri,
				Size = UDim2.fromOffset(var5.Size.Size_1200, var5.Size.Size_1200),
				cornerRadius = UDim.new(0, var5.Radius.Medium)
			}) else reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.fromOffset(var5.Size.Size_1200, var5.Size.Size_1200),
				radius = radius.Medium
			}),
			TextContainer = reactModule.createElement(view, { LayoutOrder = 2, tag = "col gap-xxsmall fill auto-xy" }, {
				Title = if p0.name then reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "text-heading-small content-emphasis auto-xy text-truncate-end",
					Text = p0.name
				}) else reactModule.createElement(skeleton, {
					LayoutOrder = 1,
					Size = UDim2.fromOffset(useScaledValue(200), var5.Size.Size_600)
				}),
				Subtitle = if p0.creator then reactModule.createElement(inExperienceDetailsPromptSubtitleModule, { layoutOrder = 2, creator = p0.creator }) else reactModule.createElement(skeleton, {
					LayoutOrder = 2,
					Size = UDim2.fromOffset(useScaledValue(150), var5.Size.Size_500)
				})
			})
		})
	})
end