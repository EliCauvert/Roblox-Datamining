local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local AssetCardHeader = RoactModule.PureComponent:extend("AssetCard_Header")
AssetCardHeader.defaultProps = { cardTitle = nil }

function AssetCardHeader.render(p1)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), Skeleton (copy), Radius (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), Skeleton (upval), Radius (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}, {
			padding = RoactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 2) }),
			title = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -6, 1, 0)
			}, {
				layout = RoactModule.createElement("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Center }),
				label = if p1.props.isLoading then RoactModule.createElement(Skeleton, { Size = UDim2.fromScale(0.5, 1), radius = Radius.Small }) else RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 23,
					TextTruncate = Enum.TextTruncate.AtEnd,
					Size = UDim2.new(1, 0, 1, 0),
					Text = p1.props.cardTitle,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					Font = p2.Font.CaptionHeader.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center
				}) or RoactModule.createElement(Skeleton, { Size = UDim2.fromScale(0.5, 1), radius = Radius.Small })
			})
		})
	end)
end

return AssetCardHeader