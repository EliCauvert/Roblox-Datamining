local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local ColorsModule = require(script.Parent.Parent.Colors)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Notification = RoactModule.PureComponent:extend("Notification")

function Notification.render(p1) --[[ Line: 11 ]]
	-- upvalues: RoactModule (copy), ColorsModule (copy), AppFonts (copy), RobloxTranslatorModule (copy)
	return RoactModule.createElement("Frame", {
		LayoutOrder = 0,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, -10, 0, 45)
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 10),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		ExclamationPoint = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InspectMenu/ico_alert_tilt.png",
			LayoutOrder = 1,
			Size = UDim2.new(0, 16, 0, 16),
			ImageColor3 = ColorsModule.White
		}),
		PartOfBundleText = RoactModule.createElement("TextLabel", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = true,
			TextScaled = true,
			TextSize = 12,
			Size = UDim2.new(1, -30, 1, 0),
			TextColor3 = ColorsModule.White,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = AppFonts.default:getDefault(),
			Text = RobloxTranslatorModule:FormatByKeyForLocale(p1.props.noticeKey, p1.props.locale)
		}, {
			UITextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = 16 })
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 54 ]]
	return { locale = p1.locale }
end)(Notification)