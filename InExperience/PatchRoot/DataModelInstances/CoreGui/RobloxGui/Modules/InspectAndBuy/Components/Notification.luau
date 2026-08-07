local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local colorsModule = require(parent.Colors)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local notification = roactModule.PureComponent:extend("Notification")

function notification.render(p0) --[[ line: 11 ]]
	-- upvalues: roactModule (ref), colorsModule (ref), appFonts (ref), robloxTranslatorModule (ref)
	return roactModule.createElement("Frame", {
		LayoutOrder = 0,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, -10, 0, 45)
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 10),
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		ExclamationPoint = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InspectMenu/ico_alert_tilt.png",
			LayoutOrder = 1,
			Size = UDim2.new(0, 16, 0, 16),
			ImageColor3 = colorsModule.White
		}),
		PartOfBundleText = roactModule.createElement("TextLabel", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			TextWrapped = true,
			TextScaled = true,
			TextSize = 12,
			Size = UDim2.new(1, -30, 1, 0),
			TextColor3 = colorsModule.White,
			TextXAlignment = Enum.TextXAlignment.Left,
			Font = appFonts.default:getDefault(),
			Text = robloxTranslatorModule:FormatByKeyForLocale(p0.props.noticeKey, p0.props.locale)
		}, {
			UITextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = 16 })
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ line: 54 ]]
	return { locale = p1.locale }
end)(notification)