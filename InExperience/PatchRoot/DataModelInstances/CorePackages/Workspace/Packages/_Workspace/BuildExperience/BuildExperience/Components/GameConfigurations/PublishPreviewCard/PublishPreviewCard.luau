local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local icon = foundationModule.Icon
local image = foundationModule.Image
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local buildPublishPreviewCardMaxWidth = game:DefineFastInt("BuildPublishPreviewCardMaxWidth", 560)
local numberSequence = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.499, 1),
	NumberSequenceKeypoint.new(0.5, 0),
	NumberSequenceKeypoint.new(1, 0)
})

local function _(p0) --[[ line: 37 | named "getGameIconUrl" ]]
	return p0.gameIcon or `rbxthumb://type=GameIcon&id={p0.universeId}&w=150&h=150`
end

local _ = function(p1) --[[ line: 41 | named "getMediaUrl" ]]
	return if p1.placeId == nil then p1.gameIcon or `rbxthumb://type=GameIcon&id={p1.universeId}&w=150&h=150` else `rbxthumb://type=GameThumbnail&id={p1.placeId}&w=768&h=432`
end

return function(p2) --[[ line: 49 | named "PublishPreviewCard" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), buildPublishPreviewCardMaxWidth (ref), image (ref), numberSequence (ref), text (ref), icon (ref), iconName (ref), iconSize (ref)
	local var5 = useTokens()
	local testId = p2.testId or "publish-preview-card"
	local target = p2.target
	local var7 = if target.placeId ~= nil then target.gameIcon or `rbxthumb://type=GameIcon&id={target.universeId}&w=150&h=150` else `rbxthumb://type=GameThumbnail&id={target.placeId}&w=768&h=432`
	
	return reactModule.createElement(view, {
		tag = "col align-x-center size-full-0 auto-y padding-x-large padding-bottom-xsmall",
		LayoutOrder = p2.layoutOrder,
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
					Image = var7,
					ScaleType = Enum.ScaleType.Fit,
					cornerRadius = UDim.new(0, var5.Radius.Medium),
					testId = `{testId}-media`
				}),
				SquareCornerImage = reactModule.createElement(image, {
					ZIndex = 2,
					tag = "size-full",
					Image = var7,
					ScaleType = Enum.ScaleType.Fit,
					testId = `{testId}-media-bottom`
				}, {
					BottomHalfMask = reactModule.createElement("UIGradient", { Rotation = 90, Transparency = numberSequence })
				})
			}),
			Content = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-y-center gap-medium size-full-0 auto-y padding-large"
			}, {
				GameIcon = reactModule.createElement(image, {
					LayoutOrder = 1,
					tag = "radius-medium clip bg-surface-200",
					Image = target.gameIcon or `rbxthumb://type=GameIcon&id={target.universeId}&w=150&h=150`,
					ScaleType = Enum.ScaleType.Crop,
					Size = UDim2.fromOffset(48, 48),
					testId = `{testId}-game-icon`
				}),
				Details = reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill size-full-0 auto-y" }, {
					Title = reactModule.createElement(text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
						Text = target.experienceName
					}),
					CreatorRow = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "row align-y-center gap-xsmall size-full-0 auto-y"
					}, {
						CreatorName = reactModule.createElement(text, {
							LayoutOrder = 1,
							tag = "auto-xy text-body-medium text-align-x-left text-truncate-end content-default",
							Text = target.creatorName or ""
						}),
						VerifiedBadge = if p2.isCreatorVerified == true then reactModule.createElement(view, {
							LayoutOrder = 2,
							Size = UDim2.fromOffset(16, 16),
							testId = `{testId}-verified-badge`
						}, {
							Backplate = reactModule.createElement(icon, {
								ZIndex = 1,
								name = iconName.VerifiedBackplate,
								size = iconSize.Small,
								style = var5.Color.System.Emphasis
							}),
							Check = reactModule.createElement(icon, {
								ZIndex = 2,
								name = iconName.VerifiedCheck,
								size = iconSize.Small,
								style = { Transparency = 0, Color3 = Color3.fromRGB(255, 255, 255) }
							})
						}) else nil
					})
				})
			})
		})
	})
end