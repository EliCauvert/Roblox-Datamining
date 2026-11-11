local Parent = script:FindFirstAncestor("AppChat").Parent
local RoactModule = require(Parent.Roact)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local AssetCardCoTent = RoactModule.PureComponent:extend("AssetCard_Coπtent")
AssetCardCoTent.defaultProps = {
	cardIcon = nil,
	cardBodyText = nil,
	bodyActivated = nil,
	contentLoadedCallback = nil
}

function AssetCardCoTent.init(p1)
	-- upvalues: RoactModule (copy)
	p1.iconRef = RoactModule.createRef()
end

function AssetCardCoTent.render(p1)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), Skeleton (copy), Radius (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), UIBloxModule (upval), Skeleton (upval), Radius (upval)
		return RoactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 0, 64),
			BackgroundTransparency = 1,
			[RoactModule.Event.Activated] = p1.props.bodyActivated
		}, {
			layout = RoactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, 12),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Icon = RoactModule.createElement(UIBloxModule.App.Loading.LoadableImage, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				useShimmerAnimationWhileLoading = true,
				Size = UDim2.new(0, 64, 0, 64),
				Image = p1.props.cardIcon,
				cornerRadius = UDim.new(0, 4)
			}),
			Details = if p1.props.isLoading then RoactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, -76, 0, 64),
				radius = Radius.Small
			}) else RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 17,
				TextWrapped = true,
				LayoutOrder = 2,
				Size = UDim2.new(1, -76, 0, 64),
				Text = p1.props.cardBodyText,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				Font = p2.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top
			}, p1.props[RoactModule.Children]) or RoactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, -76, 0, 64),
				radius = Radius.Small
			})
		})
	end)
end

return AssetCardCoTent