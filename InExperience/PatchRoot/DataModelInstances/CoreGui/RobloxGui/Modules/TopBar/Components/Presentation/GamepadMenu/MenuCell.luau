local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local MenuCell = RoactModule.PureComponent:extend("MenuCell")
MenuCell.validateProps = TModule.strictInterface({
	layoutOrder = TModule.integer,
	icon = TModule.optional(TModule.union(TModule.table, TModule.string)),
	iconComponent = TModule.optional(TModule.table),
	localizationKey = TModule.string,
	height = TModule.numberPositive,
	hasDivider = TModule.boolean,
	isSelected = TModule.boolean
})

function MenuCell.render(p1)
	-- upvalues: WithStyleFunction (copy), RobloxTranslatorModule (copy), RoactModule (copy), ImageSetLabel (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: RobloxTranslatorModule (upval), p1 (copy), RoactModule (upval), ImageSetLabel (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			Size = UDim2.new(1, 0, 0, p1.props.height)
		}, {
			SelectedFrame = p1.props.isSelected and RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 4, 1, 4),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, {
				TopBorder = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 2),
					BackgroundTransparency = Theme.SystemPrimaryOnHover.Transparency,
					BackgroundColor3 = Theme.SystemPrimaryOnHover.Color
				}),
				LeftBorder = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 2, 1, 0),
					BackgroundTransparency = Theme.SystemPrimaryOnHover.Transparency,
					BackgroundColor3 = Theme.SystemPrimaryOnHover.Color
				}),
				RightBorder = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 2, 1, 0),
					Position = UDim2.fromScale(1, 0),
					AnchorPoint = Vector2.new(1, 0),
					BackgroundTransparency = Theme.SystemPrimaryOnHover.Transparency,
					BackgroundColor3 = Theme.SystemPrimaryOnHover.Color
				}),
				BottomBorder = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.fromScale(0, 1),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = Theme.SystemPrimaryOnHover.Transparency,
					BackgroundColor3 = Theme.SystemPrimaryOnHover.Color
				})
			}),
			CellContents = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 12)
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				IconFrame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromOffset(36, 36)
				}, {
					IconLabel = p1.props.icon ~= nil and RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						Image = p1.props.icon,
						Size = UDim2.fromScale(1, 1),
						ImageTransparency = Theme.IconEmphasis.Transparency,
						ImageColor3 = Theme.IconEmphasis.Color
					}),
					IconComponent = p1.props.iconComponent ~= nil and RoactModule.createElement(p1.props.iconComponent)
				}),
				Text = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, -48, 1, 0),
					Text = RobloxTranslatorModule:FormatByKey(p1.props.localizationKey),
					Font = if FoundationFontFaceMigration then nil else _Font.Header2.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Tokens.Typography.TitleLarge.Font) else nil,
					TextSize = _Font.BaseSize * _Font.Header2.RelativeSize,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.TextTransparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
			}),
			Divider = p1.props.hasDivider and RoactModule.createElement("Frame", {
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

return MenuCell