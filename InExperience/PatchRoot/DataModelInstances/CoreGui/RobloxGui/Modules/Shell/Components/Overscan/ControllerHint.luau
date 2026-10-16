local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local GlobalSettingsModule = require(Modules.Shell.GlobalSettings)
local LocalizedStringsModule = require(Modules.Shell.LocalizedStrings)

return function(_) --[[ Line: 10 ]]
	-- upvalues: RoactModule (copy), GlobalSettingsModule (copy), LocalizedStringsModule (copy)
	return RoactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/Controller@1080.png",
		Size = UDim2.new(0, 599, 0, 404),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		Line = RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 240, 0, 1),
			Position = UDim2.new(0, 437, 0, 220),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, {
			InputHint = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 0),
				Position = UDim2.new(1, 3, 0, -1),
				Font = GlobalSettingsModule.RegularFont,
				FontSize = GlobalSettingsModule.ButtonSize,
				TextColor3 = GlobalSettingsModule.WhiteTextColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = LocalizedStringsModule:LocStringUA("Xbox.Old.ResizeScreenInputHint")
			})
		})
	})
end