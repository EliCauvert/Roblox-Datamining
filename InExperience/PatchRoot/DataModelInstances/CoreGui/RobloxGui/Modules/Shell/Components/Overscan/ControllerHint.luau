local modules = game:GetService("CoreGui").RobloxGui.Modules
local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local globalSettingsModule = require(modules.Shell.GlobalSettings)
local localizedStringsModule = require(modules.Shell.LocalizedStrings)
local fFlagAppShellMigrateLocales = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagAppShellMigrateLocales

return function(_) --[[ line: 11 ]]
	-- upvalues: roactModule (ref), globalSettingsModule (ref), fFlagAppShellMigrateLocales (ref), localizedStringsModule (ref)
	return roactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/Shell/ScreenAdjustment/Controller@1080.png",
		Size = UDim2.new(0, 599, 0, 404),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		Line = roactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 240, 0, 1),
			Position = UDim2.new(0, 437, 0, 220),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, {
			InputHint = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 0),
				Position = UDim2.new(1, 3, 0, -1),
				Font = globalSettingsModule.RegularFont,
				FontSize = globalSettingsModule.ButtonSize,
				TextColor3 = globalSettingsModule.WhiteTextColor,
				TextXAlignment = Enum.TextXAlignment.Left,
				Text = if fFlagAppShellMigrateLocales then localizedStringsModule:LocStringUA("Xbox.Old.ResizeScreenInputHint") else localizedStringsModule:LocalizedString("ResizeScreenInputHint")
			})
		})
	})
end