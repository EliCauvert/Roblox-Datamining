local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BuildPublishPreviewCardMaxWidth = game:DefineFastInt("BuildPublishPreviewCardMaxWidth", 560)
local NumberSequence1 = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 1),
	NumberSequenceKeypoint.new(0.499, 1),
	NumberSequenceKeypoint.new(0.5, 0),
	NumberSequenceKeypoint.new(1, 0)
})

local function _(p1)
	return p1.gameIcon or `rbxthumb://type=GameIcon&id={p1.universeId}&w=150&h=150`
end

local _ = function(p1)
	return if p1.placeId == nil then p1.gameIcon or `rbxthumb://type=GameIcon&id={p1.universeId}&w=150&h=150` else `rbxthumb://type=GameThumbnail&id={p1.placeId}&w=768&h=432`
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), BuildPublishPreviewCardMaxWidth (copy), Image (copy), NumberSequence1 (copy), Text (copy), Icon (copy), IconName (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = p1.testId or "publish-preview-card"
	local Target = p1.target
	local GameIcon = if Target.placeId == nil then Target.gameIcon or `rbxthumb://type=GameIcon&id={Target.universeId}&w=150&h=150` else `rbxthumb://type=GameThumbnail&id={Target.placeId}&w=768&h=432`
	local IsIsCreatorVerified = p1.isCreatorVerified == true
	
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
					cornerRadius = UDim.new(0, UseTokensResult.Radius.Medium),
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
				tag = "row align-y-center gap-medium size-full-0 auto-y padding-large"
			}, {
				GameIcon = ReactModule.createElement(Image, {
					LayoutOrder = 1,
					tag = "radius-medium clip bg-surface-200",
					Image = Target.gameIcon or `rbxthumb://type=GameIcon&id={Target.universeId}&w=150&h=150`,
					ScaleType = Enum.ScaleType.Crop,
					Size = UDim2.fromOffset(48, 48),
					testId = `{TestId}-game-icon`
				}),
				Details = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col fill size-full-0 auto-y" }, {
					Title = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
						Text = Target.experienceName
					}),
					CreatorRow = ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "row align-y-center gap-xsmall size-full-0 auto-y"
					}, {
						CreatorName = ReactModule.createElement(Text, {
							LayoutOrder = 1,
							tag = "auto-xy text-body-medium text-align-x-left text-truncate-end content-default",
							Text = Target.creatorName or ""
						}),
						VerifiedBadge = if IsIsCreatorVerified then ReactModule.createElement(View, {
							LayoutOrder = 2,
							Size = UDim2.fromOffset(16, 16),
							testId = `{TestId}-verified-badge`
						}, {
							Backplate = ReactModule.createElement(Icon, {
								ZIndex = 1,
								name = IconName.VerifiedBackplate,
								size = IconSize.Small,
								style = UseTokensResult.Color.System.Emphasis
							}),
							Check = ReactModule.createElement(Icon, {
								ZIndex = 2,
								name = IconName.VerifiedCheck,
								size = IconSize.Small,
								style = { Transparency = 0, Color3 = Color3.fromRGB(255, 255, 255) }
							})
						}) else nil
					})
				})
			})
		})
	})
end