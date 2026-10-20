local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local GameBanner = RoactModule.PureComponent:extend("GameBanner")
GameBanner.defaultProps = {
	creator = "By (placeholder)",
	name = "Placeholder Game",
	thumbnail = "rbxasset://textures/grid2.png",
	isLoading = false,
	shouldShowCreatorName = true
}

function GameBanner.render(p1)
	-- upvalues: UIBloxModule (copy), RoactModule (copy), LoadableImage (copy), Skeleton (copy), Radius (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), LoadableImage (upval), Skeleton (upval), Radius (upval)
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = p2.Theme.BackgroundContrast.Color,
			Size = UDim2.new(1, 0, 0, 72)
		}, {
			layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal
			}),
			PlaceThumbnailFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 0,
				Size = UDim2.new(0, 72, 0, 72)
			}, {
				layout = RoactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				placeThumbnail = if p1.props.isLoading then RoactModule.createElement(Skeleton, { Size = UDim2.new(0, 48, 0, 48), radius = Radius.Small }) else RoactModule.createElement(LoadableImage, {
					BackgroundTransparency = 1,
					Image = p1.props.thumbnail,
					Size = UDim2.new(0, 48, 0, 48)
				}) or RoactModule.createElement(Skeleton, { Size = UDim2.new(0, 48, 0, 48), radius = Radius.Small })
			}),
			ContentFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, -84, 1, 0)
			}, {
				layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 3)
				}),
				padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 17) }),
				PlaceTitle = if p1.props.isLoading then RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 20), radius = Radius.Small }) else RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 20,
					LayoutOrder = 0,
					Size = UDim2.new(1, 0, 0, 20),
					TextColor3 = p2.Theme.TextEmphasis.Color,
					Font = p2.Font.Header2.Font,
					Text = p1.props.name,
					TextXAlignment = Enum.TextXAlignment.Left
				}) or RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 20), radius = Radius.Small }),
				BuilderLabel = if p1.props.isLoading then RoactModule.createElement(Skeleton, { Size = UDim2.new(0.6, 0, 0, 17), radius = Radius.Small }) else RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 17,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 17),
					TextColor3 = p2.Theme.TextDefault.Color,
					Font = p2.Font.Body.Font,
					Text = p1.props.creator,
					TextXAlignment = Enum.TextXAlignment.Left,
					Visible = p1.props.shouldShowCreatorName
				}) or RoactModule.createElement(Skeleton, { Size = UDim2.new(0.6, 0, 0, 17), radius = Radius.Small })
			})
		})
	end)
end

return GameBanner