local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local roactModule = require(corePackagesService.Packages.Roact)
local limitedLabel = roactModule.PureComponent:extend("LimitedLabel")
local getFFlagIBEnableCollectiblesSystemSupportModule = require(parent.Flags.GetFFlagIBEnableCollectiblesSystemSupport)

function limitedLabel.render(p0)
	-- upvalues: images (ref), roactModule (ref), imageSetLabel (ref), getFFlagIBEnableCollectiblesSystemSupportModule (ref), appFonts (ref)
	local text = p0.props.text
	
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = 3,
		Size = p0.props.frameSize,
		Position = p0.props.framePosition,
		BackgroundColor3 = Color3.fromRGB(120, 120, 120)
	}, {
		Corner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		CollectiblesIcon = roactModule.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Visible = true,
			Position = p0.props.imagePosition,
			Size = p0.props.imageSize,
			Image = images["icons/status/item/limited"]
		}),
		CollectiblesText = if getFFlagIBEnableCollectiblesSystemSupportModule() and not text then nil else roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 12,
			Position = p0.props.textPosition,
			Size = p0.props.textSize,
			Text = text,
			Font = appFonts.default:getDefault(),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Color3.new(1, 1, 1)
		})
	})
end

return limitedLabel