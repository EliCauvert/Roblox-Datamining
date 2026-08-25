local parent = script:FindFirstAncestor("AppChat").Parent
local roactModule = require(parent.Roact)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local var3 = roactModule.PureComponent:extend("AssetCard_Co\207\128tent")
var3.defaultProps = {
	cardIcon = nil,
	cardBodyText = nil,
	bodyActivated = nil,
	contentLoadedCallback = nil
}

function var3.init(p0)
	-- upvalues: roactModule (ref)
	p0.iconRef = roactModule.createRef()
end

function var3.render(p1)
	-- upvalues: UIBloxModule (ref), roactModule (ref), skeleton (ref), radius (ref)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: roactModule (copy), p1 (ref), UIBloxModule (copy), skeleton (copy), radius (copy)
		return roactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 0, 64),
			BackgroundTransparency = 1,
			[roactModule.Event.Activated] = p1.props.bodyActivated
		}, {
			layout = roactModule.createElement("UIListLayout", {
				Padding = UDim.new(0, 12),
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Icon = roactModule.createElement(UIBloxModule.App.Loading.LoadableImage, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				useShimmerAnimationWhileLoading = true,
				Size = UDim2.new(0, 64, 0, 64),
				Image = p1.props.cardIcon,
				cornerRadius = UDim.new(0, 4)
			}),
			Details = not p1.props.isLoading and roactModule.createElement("TextLabel", {
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
			}, p1.props[roactModule.Children]) or roactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(1, -76, 0, 64),
				radius = radius.Small
			})
		})
	end)
end

return var3