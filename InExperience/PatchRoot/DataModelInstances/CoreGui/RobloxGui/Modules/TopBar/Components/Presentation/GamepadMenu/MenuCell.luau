local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withStyle = UIBloxModule.Core.Style.withStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local menuCell = roactModule.PureComponent:extend("MenuCell")
menuCell.validateProps = tModule.strictInterface({
	layoutOrder = tModule.integer,
	icon = tModule.optional(tModule.union(tModule.table, tModule.string)),
	iconComponent = tModule.optional(tModule.table),
	localizationKey = tModule.string,
	height = tModule.numberPositive,
	hasDivider = tModule.boolean,
	isSelected = tModule.boolean
})

function menuCell.render(p0)
	-- upvalues: withStyle (ref), robloxTranslatorModule (ref), roactModule (ref), imageSetLabel (ref)
	return withStyle(function(p1)
		-- upvalues: robloxTranslatorModule (copy), p0 (ref), roactModule (copy), imageSetLabel (copy)
		local theme = p1.Theme
		local font = p1.Font
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p0.props.layoutOrder,
			Size = UDim2.new(1, 0, 0, p0.props.height)
		}, {
			SelectedFrame = p0.props.isSelected and roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 4, 1, 4),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, {
				TopBorder = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 2),
					BackgroundTransparency = theme.SystemPrimaryOnHover.Transparency,
					BackgroundColor3 = theme.SystemPrimaryOnHover.Color
				}),
				LeftBorder = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 2, 1, 0),
					BackgroundTransparency = theme.SystemPrimaryOnHover.Transparency,
					BackgroundColor3 = theme.SystemPrimaryOnHover.Color
				}),
				RightBorder = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 2, 1, 0),
					Position = UDim2.fromScale(1, 0),
					AnchorPoint = Vector2.new(1, 0),
					BackgroundTransparency = theme.SystemPrimaryOnHover.Transparency,
					BackgroundColor3 = theme.SystemPrimaryOnHover.Color
				}),
				BottomBorder = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 2),
					Position = UDim2.fromScale(0, 1),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = theme.SystemPrimaryOnHover.Transparency,
					BackgroundColor3 = theme.SystemPrimaryOnHover.Color
				})
			}),
			CellContents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Layout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 12)
				}),
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				IconFrame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromOffset(36, 36)
				}, {
					IconLabel = p0.props.icon ~= nil and roactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						Image = p0.props.icon,
						Size = UDim2.fromScale(1, 1),
						ImageTransparency = theme.IconEmphasis.Transparency,
						ImageColor3 = theme.IconEmphasis.Color
					}),
					IconComponent = p0.props.iconComponent ~= nil and roactModule.createElement(p0.props.iconComponent)
				}),
				Text = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, -48, 1, 0),
					Text = robloxTranslatorModule:FormatByKey(p0.props.localizationKey),
					Font = font.Header2.Font,
					TextSize = font.BaseSize * font.Header2.RelativeSize,
					TextColor3 = theme.TextEmphasis.Color,
					TextTransparency = theme.TextEmphasis.TextTransparency,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
			}),
			Divider = p0.props.hasDivider and roactModule.createElement("Frame", {
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

return menuCell