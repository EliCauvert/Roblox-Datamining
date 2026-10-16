local CorePackages = game:GetService("CorePackages")
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local RoactModule = require(CorePackages.Packages.Roact)
local LimitedLabel = RoactModule.PureComponent:extend("LimitedLabel")
local GetFFlagIBEnableCollectiblesSystemSupportModule = require(script.Parent.Parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)

function LimitedLabel.render(p1) --[[ Line: 21 ]]
	-- upvalues: Images (copy), RoactModule (copy), ImageSetLabel (copy), GetFFlagIBEnableCollectiblesSystemSupportModule (copy), AppFonts (copy)
	local TextSize = p1.props.textSize
	local TextPosition = p1.props.textPosition
	local Text = p1.props.text
	
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = 3,
		Size = p1.props.frameSize,
		Position = p1.props.framePosition,
		BackgroundColor3 = Color3.fromRGB(120, 120, 120)
	}, {
		Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		CollectiblesIcon = RoactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Visible = true,
			Position = p1.props.imagePosition,
			Size = p1.props.imageSize,
			Image = Images["icons/status/item/limited"]
		}),
		CollectiblesText = if GetFFlagIBEnableCollectiblesSystemSupportModule() and not Text then nil else RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 12,
			Position = TextPosition,
			Size = TextSize,
			Text = Text,
			Font = AppFonts.default:getDefault(),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Color3.new(1, 1, 1)
		})
	})
end

return LimitedLabel