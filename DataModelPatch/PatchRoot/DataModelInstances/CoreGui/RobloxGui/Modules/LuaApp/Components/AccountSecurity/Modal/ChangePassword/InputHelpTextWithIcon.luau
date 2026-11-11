local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

function ExtendResult.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy)
	local HelpText = p1.props.helpText
	local IconImage = p1.props.iconImage
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), ImageSetLabel (upval), IconImage (copy), HelpText (copy)
		local ScaledRelativeSize = p2.Font.CaptionBody.RelativeSize * p2.Font.BaseSize
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Icon = RoactModule.createElement(ImageSetLabel, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = IconImage,
				ImageColor3 = p2.Theme.SystemPrimaryDefault.Color,
				Size = UDim2.fromOffset(ScaledRelativeSize, ScaledRelativeSize)
			}),
			Text = RoactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				Font = p2.Font.CaptionBody.Font,
				Size = UDim2.new(1, -ScaledRelativeSize, 0, 0),
				Text = HelpText,
				TextColor3 = p2.Theme.SystemPrimaryDefault.Color,
				TextSize = p2.Font.CaptionBody.RelativeSize * p2.Font.BaseSize,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				Padding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 2) })
			})
		})
	end)
end

return ExtendResult