local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local publishExperienceTitleModule = require(script.Parent.PublishExperienceTitle)
local image = foundationModule.Image
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local buildPublishPreviewCardMaxWidth = game:DefineFastInt("BuildPublishPreviewCardMaxWidth", 560)
local numberSequence = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.499, 1),
	NumberSequenceKeypoint.new(0.5, 0),
	NumberSequenceKeypoint.new(1, 0)
})

local function _(p1)
	return if p1.placeId == nil then p1.gameIcon or `rbxthumb://type=GameIcon&id={p1.universeId}&w=150&h=150` else `rbxthumb://type=GameThumbnail&id={p1.placeId}&w=768&h=432`
end

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), buildPublishPreviewCardMaxWidth (ref), image (ref), numberSequence (ref), publishExperienceTitleModule (ref)
	local var1 = useTokens()
	local testId = p1.testId or "publish-preview-card"
	local target = p1.target
	local var2 = if target.placeId ~= nil then target.gameIcon or `rbxthumb://type=GameIcon&id={target.universeId}&w=150&h=150` else `rbxthumb://type=GameThumbnail&id={target.placeId}&w=768&h=432`
	
	return reactModule.createElement(view, {
		tag = "col align-x-center size-full-0 auto-y padding-y-xsmall",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Card = reactModule.createElement(view, {
			tag = "col size-full-0 auto-y stroke-standard stroke-default radius-large clip bg-surface-100",
			sizeConstraint = {
				MaxSize = Vector2.new(buildPublishPreviewCardMaxWidth, 1e999)
			},
			testId = `{testId}-card`
		}, {
			Media = reactModule.createElement(view, {
				LayoutOrder = 1,
				ClipsDescendants = true,
				tag = "size-full-full auto-y aspect-16-9 bg-surface-200"
			}, {
				RoundedCornerImage = reactModule.createElement(image, {
					ZIndex = 1,
					tag = "size-full",
					Image = var2,
					ScaleType = Enum.ScaleType.Fit,
					cornerRadius = UDim.new(0, var1.Radius.Medium),
					testId = `{testId}-media`
				}),
				SquareCornerImage = reactModule.createElement(image, {
					ZIndex = 2,
					tag = "size-full",
					Image = var2,
					ScaleType = Enum.ScaleType.Fit,
					testId = `{testId}-media-bottom`
				}, {
					BottomHalfMask = reactModule.createElement("UIGradient", { Rotation = 90, Transparency = numberSequence })
				})
			}),
			Content = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "col size-full-0 auto-y padding-large"
			}, {
				Title = reactModule.createElement(publishExperienceTitleModule, {
					layoutOrder = 1,
					target = target,
					isCreatorVerified = p1.isCreatorVerified,
					testId = `{testId}-title`
				})
			})
		})
	})
end