local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local FFlagAXMigrateResellersInputBindingsToRoactGamepad = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMigrateResellersInputBindingsToRoactGamepad
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local Overlay = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.Overlay
local AXMigrateCenteredModalViewToAutoFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus and game:DefineFastFlag("AXMigrateCenteredModalViewToAutoFocus", false)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local _ = require(CorePackages.Packages.React)

local function getWindowSize(p1): UDim2
	-- upvalues: GetSafeAreaSizeFunction (copy)
	return if p1.wideMode then UDim2.new(0, math.min(GetSafeAreaSizeFunction(p1.screenSize, p1.globalGuiInset).X.Offset, 640), 1, 0) else UDim2.fromScale(1, 1)
end

return (require(CorePackages.Packages.RoactRodux).connect(function(p1, _)
	-- upvalues: FormFactor (copy)
	return {
		wideMode = p1.FormFactor == FormFactor.WIDE,
		screenSize = p1.ScreenSize,
		globalGuiInset = p1.GlobalGuiInset
	}
end, nil)(function(p1)
	-- upvalues: getWindowSize (copy), RoactModule (copy), WithStyleFunction (copy), FFlagAXMigrateResellersInputBindingsToRoactGamepad (copy), AXMigrateCenteredModalViewToAutoFocus (copy), Overlay (copy)
	local WindowSize = getWindowSize(p1)
	local v1 = p1[RoactModule.Children]
	
	return if p1.wideMode then WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), FFlagAXMigrateResellersInputBindingsToRoactGamepad (upval), p1 (copy), AXMigrateCenteredModalViewToAutoFocus (upval), Overlay (upval), WindowSize (copy), v1 (copy)
		return RoactModule.createElement("TextButton", {
			Active = true,
			AutoButtonColor = false,
			Text = " ",
			ref = if FFlagAXMigrateResellersInputBindingsToRoactGamepad then p1.forwardRef else nil,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p2.Theme.Overlay.Transparency,
			BackgroundColor3 = p2.Theme.Overlay.Color,
			Selectable = not AXMigrateCenteredModalViewToAutoFocus and nil
		}, {
			Window = RoactModule.createElement(if AXMigrateCenteredModalViewToAutoFocus then Overlay else "Frame", {
				BorderSizePixel = 0,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				Size = WindowSize,
				BackgroundTransparency = if p1.backgroundTransparency then p1.backgroundTransparency else p2.Theme.BackgroundDefault.Transparency,
				BackgroundColor3 = p2.Theme.BackgroundDefault.Color
			}, v1)
		})
	end) else RoactModule.createFragment(v1)
end))