local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local RoactModule = require(Parent.Roact)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local Text = require(Parent.AppCommonLib).Text
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local ItemTileCreatorName = RoactModule.PureComponent:extend("ItemTileCreatorName")
ItemTileCreatorName.defaultProps = { textYAlignment = Enum.TextYAlignment.Top }

function ItemTileCreatorName.render(p1)
	-- upvalues: WithStyleFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), WithLocalizationFunction (copy), Text (copy), RoactModule (copy), VerifiedBadgesModule (copy)
	local Name = p1.props.name
	local HasVerifiedBadge = p1.props.hasVerifiedBadge
	local TextYAlignment = p1.props.textYAlignment
	
	return WithStyleFunction(function(p2)
		-- upvalues: FFlagRenameDeprecatedUIBloxTokens (upval), WithLocalizationFunction (upval), Text (upval), RoactModule (upval), HasVerifiedBadge (copy), Name (copy), TextYAlignment (copy), VerifiedBadgesModule (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local ScaledBaseSize = _Font.BaseSize * _Font.Header2.RelativeSize
		local NewScaledBaseSize = ScaledBaseSize + (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_200 else p2.Tokens.Global.Size_100)
		
		return WithLocalizationFunction({ creatorByLabel = "Feature.GameDetails.Label.By" })(function(p3)
			-- upvalues: Text (upval), _Font (copy), ScaledBaseSize (copy), RoactModule (upval), HasVerifiedBadge (upval), Theme (copy), Name (upval), TextYAlignment (upval), NewScaledBaseSize (copy), VerifiedBadgesModule (upval)
			local CreatorByLabel = p3.creatorByLabel
			local TextWidth = Text.GetTextWidth(CreatorByLabel, _Font.Body.Font, ScaledBaseSize)
			local TextLabel = RoactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = if HasVerifiedBadge then UDim2.new(0, 0, 1, 0) else UDim2.new(1, -TextWidth, 1, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				TextSize = ScaledBaseSize,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				Font = _Font.Header2.Font,
				Text = Name,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = TextYAlignment
			}, {
				UITextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = NewScaledBaseSize })
			})
			
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					Padding = UDim.new(0, 6)
				}),
				Label = RoactModule.createElement("TextLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(0, 0, 0, 0),
					TextSize = ScaledBaseSize,
					TextColor3 = Theme.TextDefault.Color,
					TextTransparency = Theme.TextDefault.Transparency,
					Font = _Font.Header2.Font,
					Text = CreatorByLabel,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = TextYAlignment,
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UITextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = NewScaledBaseSize })
				}),
				CreatorName = not HasVerifiedBadge and TextLabel,
				VerifiedCreatorName = HasVerifiedBadge and RoactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
					layoutOrder = 2,
					emoji = VerifiedBadgesModule.emoji.verified,
					font = _Font.Body.Font,
					size = UDim2.new(1, -TextWidth, 0, 0),
					automaticSize = Enum.AutomaticSize.XY,
					horizontalAlignment = Enum.HorizontalAlignment.Left,
					verticalAlignment = Enum.VerticalAlignment.Center
				}, { CreatorName = TextLabel })
			})
		end)
	end)
end

return ItemTileCreatorName