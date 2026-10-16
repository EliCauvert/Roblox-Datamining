local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconsImageUnavailable = Images["icons/imageUnavailable"]
local ComponentAssetsCircle17 = Images["component_assets/circle_17"]
local _Rect = Rect.new(8, 8, 9, 9)
local MenuHeader = RoactModule.PureComponent:extend("MenuHeader")
MenuHeader.validateProps = TModule.strictInterface({
	gameName = TModule.string,
	layoutOrder = TModule.integer,
	height = TModule.numberPositive
})

function MenuHeader.render(p1) --[[ Line: 41 ]]
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), ComponentAssetsCircle17 (copy), _Rect (copy), IconsImageUnavailable (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return WithStyleFunction(function(p2) --[[ Line: 42 ]]
		-- upvalues: RoactModule (upval), ImageSetLabel (upval), ComponentAssetsCircle17 (upval), _Rect (upval), IconsImageUnavailable (upval), p1 (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			Size = UDim2.new(1, 0, 0, p1.props.height)
		}, {
			ContentsFrame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 20)
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 20),
					PaddingRight = UDim.new(0, 20)
				}),
				GameIcon = if game.GameId == 0 then RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = ComponentAssetsCircle17,
					SliceCenter = _Rect,
					ScaleType = Enum.ScaleType.Slice,
					Size = UDim2.fromOffset(80, 80),
					ImageColor3 = p2.Theme.PlaceHolder.Color,
					ImageTransparency = p2.Theme.PlaceHolder.Transparency
				}, {
					PlaceholderIcon = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						Size = UDim2.fromOffset(44, 44),
						Position = UDim2.fromScale(0.5, 0.5),
						Image = IconsImageUnavailable,
						ImageColor3 = p2.Theme.UIDefault.Color,
						ImageTransparency = p2.Theme.UIDefault.Transparency,
						AnchorPoint = Vector2.new(0.5, 0.5)
					})
				}) else RoactModule.createElement("ImageLabel", {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					Size = UDim2.fromOffset(80, 80),
					Image = ("rbxthumb://type=GameIcon&id=%d&w=%d&h=%d"):format(game.GameId, 128, 128)
				}),
				TextFrame = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -100, 1, 0)
				}, {
					TextLabel = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 1, -45),
						Position = UDim2.fromOffset(0, 25),
						Font = if FoundationFontFaceMigration then nil else _Font.Header1.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.HeadingSmall.Font) else nil,
						Text = p1.props.gameName,
						TextSize = _Font.BaseSize * _Font.Header1.RelativeSize,
						TextColor3 = Theme.TextEmphasis.Color,
						TextTransparency = Theme.TextEmphasis.TextTransparency,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						TextTruncate = Enum.TextTruncate.AtEnd
					})
				})
			}),
			Divider = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.fromScale(0, 1),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = Theme.Divider.Transparency,
				BackgroundColor3 = Theme.Divider.Color
			})
		})
	end)
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1) --[[ Line: 144 | Named "mapStateToProps" ]]
	return { gameName = p1.gameInfo.name }
end, nil)(MenuHeader)