local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local PublishExperienceTitleModule = require(script.Parent.PublishExperienceTitle)
local Image = FoundationModule.Image
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BuildPublishPreviewCardMaxWidth = game:DefineFastInt("BuildPublishPreviewCardMaxWidth", 560)
local NumberSequence1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.499, 1),
	NumberSequenceKeypoint.new(0.5, 0),
	NumberSequenceKeypoint.new(1, 0)
})

local function _(p1)
	return if p1.placeId == nil then p1.gameIcon or `rbxthumb://type=GameIcon&id={p1.universeId}&w=150&h=150` else `rbxthumb://type=GameThumbnail&id={p1.placeId}&w=768&h=432`
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), BuildPublishPreviewCardMaxWidth (copy), Image (copy), NumberSequence1 (copy), PublishExperienceTitleModule (copy)
	local TestId = p1.testId or "publish-preview-card"
	local Target = p1.target
	local GameIcon = if Target.placeId == nil then Target.gameIcon or `rbxthumb://type=GameIcon&id={Target.universeId}&w=150&h=150` else `rbxthumb://type=GameThumbnail&id={Target.placeId}&w=768&h=432`
	
	return ReactModule.createElement(View, {
		tag = "col align-x-center size-full-0 auto-y padding-y-xsmall",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Card = ReactModule.createElement(View, {
			tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large clip bg-surface-100",
			sizeConstraint = {
				MaxSize = Vector2.new(BuildPublishPreviewCardMaxWidth, 1e999)
			},
			testId = `{TestId}-card`
		}, {
			Media = ReactModule.createElement(View, {
				LayoutOrder = 1,
				ClipsDescendants = true,
				tag = "size-full-full auto-y aspect-16-9 bg-surface-200"
			}, {
				RoundedCornerImage = ReactModule.createElement(Image, {
					ZIndex = 1,
					tag = "size-full",
					Image = GameIcon,
					ScaleType = Enum.ScaleType.Fit,
					cornerRadius = UDim.new(0, UseTokensFunction().Radius.Medium),
					testId = `{TestId}-media`
				}),
				SquareCornerImage = ReactModule.createElement(Image, {
					ZIndex = 2,
					tag = "size-full",
					Image = GameIcon,
					ScaleType = Enum.ScaleType.Fit,
					testId = `{TestId}-media-bottom`
				}, {
					BottomHalfMask = ReactModule.createElement("UIGradient", { Rotation = 90, Transparency = NumberSequence1 })
				})
			}),
			Content = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col size-full-0 auto-y padding-large"
			}, {
				Title = ReactModule.createElement(PublishExperienceTitleModule, {
					layoutOrder = 1,
					target = Target,
					isCreatorVerified = p1.isCreatorVerified,
					testId = `{TestId}-title`
				})
			})
		})
	})
end