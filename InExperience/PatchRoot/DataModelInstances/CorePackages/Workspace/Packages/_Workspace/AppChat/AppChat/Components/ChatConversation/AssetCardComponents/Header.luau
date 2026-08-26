local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local assetCardHeader = roactModule.PureComponent:extend("AssetCard_Header")
assetCardHeader.defaultProps = { cardTitle = nil }

function assetCardHeader.render(p1)
	-- upvalues: UIBloxModule (ref), roactModule (ref), skeleton (ref), radius (ref)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: roactModule (copy), p1 (ref), skeleton (copy), radius (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20)
		}, {
			padding = roactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, 2) }),
			title = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -6, 1, 0)
			}, {
				layout = roactModule.createElement("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Center }),
				label = not p1.props.isLoading and roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 23,
					TextTruncate = Enum.TextTruncate.AtEnd,
					Size = UDim2.new(1, 0, 1, 0),
					Text = p1.props.cardTitle,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					Font = p2.Font.CaptionHeader.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center
				}) or roactModule.createElement(skeleton, { Size = UDim2.fromScale(0.5, 1), radius = radius.Small })
			})
		})
	end)
end

return assetCardHeader