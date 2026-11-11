local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local TextModule = require(Modules.Common.Text)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local WithStyleFunction = require(game:GetService("CorePackages").Packages.UIBlox).Style.withStyle
local PrimaryStatWidget = RoactModule.PureComponent:extend("PrimaryStatWidget")
PrimaryStatWidget.defaultProps = {
	AnchorPoint = Vector2.new(0, 0),
	Position = UDim2.new(0, 0, 0, 0)
}

function PrimaryStatWidget.GetMinimumWidth(p1, p2, p3): number
	-- upvalues: TextModule (copy)
	return math.max(TextModule.GetTextWidth(p1, p3, 42), (TextModule.GetTextWidth(p2, p3, 12))) + 74
end

function PrimaryStatWidget.GetMinimumWidthRethemed(p1, p2, p3): number
	-- upvalues: TextModule (copy)
	return math.max(TextModule.GetTextWidth(p1, p3.Font.Title.Font, p3.Font.BaseSize * p3.Font.Title.RelativeSize), (TextModule.GetTextWidth(p2, p3.Font.CaptionHeader.Font, p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize))) + 74
end

function PrimaryStatWidget.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), DEPRECATEDImageSetLabelModule (copy)
	local Icon = p1.props.icon
	local Number = p1.props.number
	local Label = p1.props.label
	local Width: number = p1.props.width
	local LayoutOrder = p1.props.LayoutOrder
	local AnchorPoint = p1.props.AnchorPoint
	local Position = p1.props.Position
	local XOffset = Width - 74
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), AnchorPoint (copy), Position (copy), Width (copy), LayoutOrder (copy), DEPRECATEDImageSetLabelModule (upval), Icon (copy), XOffset (copy), Number (copy), Label (copy)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = AnchorPoint,
			Position = Position,
			Size = UDim2.new(0, Width, 0, 44),
			LayoutOrder = LayoutOrder
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 10)
			}),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10)
			}),
			Icon = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(0, 44, 0, 44),
				Image = Icon,
				ImageColor3 = p2.Theme.IconEmphasis.Color,
				ImageTransparency = p2.Theme.IconEmphasis.Transparency
			}),
			TextSection = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(0, XOffset, 1, 0)
			}, {
				Number = RoactModule.createElement("TextLabel", {
					TextScaled = true,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 42),
					Position = UDim2.new(0, 0, 0, -7),
					Text = Number,
					Font = p2.Font.Title.Font,
					TextSize = p2.Font.BaseSize * p2.Font.Title.RelativeSize,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					TextTransparency = p2.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Label = RoactModule.createElement("TextLabel", {
					TextScaled = true,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 12),
					Position = UDim2.new(0, 0, 0, 28),
					Text = Label,
					Font = p2.Font.CaptionHeader.Font,
					TextSize = p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					TextTransparency = p2.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			})
		})
	end)
end

return PrimaryStatWidget