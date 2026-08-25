local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local withStyle = UIBloxModule.Core.Style.withStyle
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local imageUnavailable = images["icons/imageUnavailable"]
local circle17 = images["component_assets/circle_17"]
local rect = Rect.new(8, 8, 9, 9)
local menuHeader = roactModule.PureComponent:extend("MenuHeader")
menuHeader.validateProps = tModule.strictInterface({
	gameName = tModule.string,
	layoutOrder = tModule.integer,
	height = tModule.numberPositive
})

function menuHeader.render(p0)
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), circle17 (ref), rect (ref), imageUnavailable (ref)
	return withStyle(function(p1)
		-- upvalues: roactModule (copy), imageSetLabel (copy), circle17 (copy), rect (copy), imageUnavailable (copy), p0 (ref)
		local theme = p1.Theme
		local font = p1.Font
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p0.props.layoutOrder,
			Size = UDim2.new(1, 0, 0, p0.props.height)
		}, {
			ContentsFrame = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 20)
				}),
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 20),
					PaddingRight = UDim.new(0, 20)
				}),
				GameIcon = if game.GameId == 0 then roactModule.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = circle17,
					SliceCenter = rect,
					ScaleType = Enum.ScaleType.Slice,
					Size = UDim2.fromOffset(80, 80),
					ImageColor3 = p1.Theme.PlaceHolder.Color,
					ImageTransparency = p1.Theme.PlaceHolder.Transparency
				}, {
					PlaceholderIcon = roactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						Size = UDim2.fromOffset(44, 44),
						Position = UDim2.fromScale(0.5, 0.5),
						Image = imageUnavailable,
						ImageColor3 = p1.Theme.UIDefault.Color,
						ImageTransparency = p1.Theme.UIDefault.Transparency,
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}) else roactModule.createElement("ImageLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(80, 80),
					Image = ("rbxthumb://type=GameIcon&id=%d&w=%d&h=%d"):format(game.GameId, 128, 128)
				}),
				TextFrame = roactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -100, 1, 0)
				}, {
					TextLabel = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, -45),
						Position = UDim2.fromOffset(0, 25),
						Font = font.Header1.Font,
						Text = p0.props.gameName,
						TextSize = font.BaseSize * font.Header1.RelativeSize,
						TextColor3 = theme.TextEmphasis.Color,
						TextTransparency = theme.TextEmphasis.TextTransparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						TextTruncate = Enum.TextTruncate.AtEnd
					})
				})
			}),
			Divider = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = theme.Divider.Transparency,
				BackgroundColor3 = theme.Divider.Color
			})
		})
	end)
end

return roactRoduxModule.UNSTABLE_connect2(function(p2)
	return { gameName = p2.gameInfo.name }
end, nil)(menuHeader)