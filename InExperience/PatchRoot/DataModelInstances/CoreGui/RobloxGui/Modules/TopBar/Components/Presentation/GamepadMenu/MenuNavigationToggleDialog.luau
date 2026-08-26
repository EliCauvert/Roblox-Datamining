local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local userInputService = game:GetService("UserInputService")
local _ = coreGuiService:WaitForChild("RobloxGui")
local reactUtilsModule = require(corePackagesService.Packages.ReactUtils)
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Packages.UIBlox)
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local useEventConnection = reactUtilsModule.useEventConnection
local getTextSize = require(corePackagesService.Workspace.Packages.Style).GetTextSize
local useDesignTokens = require(corePackagesService.Workspace.Packages.Style).useDesignTokens
local parent = script.Parent.Parent.Parent.Parent
local chrome = parent.Parent.Chrome
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var2 = if fFlagEnableConsoleExpControls and not var1 then nil else require(parent.Components.GamepadConnector)
local useObservableValueModule = require(chrome.ChromeShared.Hooks.useObservableValue)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local fFlagLocalizeMenuNavigationToggleDialogModule = require(coreGuiService.RobloxGui.Modules.TopBar.Flags.FFlagLocalizeMenuNavigationToggleDialog)

return function(p1)
	-- upvalues: useDesignTokens (ref), fFlagLocalizeMenuNavigationToggleDialogModule (ref), userInputService (ref), reactModule (ref), localizationService (ref), useEventConnection (ref), localization (ref), getTextSize (ref), var1 (ref), fFlagEnableConsoleExpControls (ref), useObservableValueModule (ref), var2 (ref)
	local var3, var4
	local var5 = useDesignTokens()
	local captionMedium = var5.Typography.CaptionMedium
	local size400 = var5.Size.Size_400
	local size150 = var5.Size.Size_150
	local medium = var5.Radius.Medium
	local size600 = var5.Size.Size_600
	local overMedia0 = var5.Color.OverMedia.OverMedia_0
	local color3 = var5.Color.Content.Emphasis.Color3
	local size100 = var5.Size.Size_100
	local var6 = if fFlagLocalizeMenuNavigationToggleDialogModule and game:GetEngineFeature("GetImageForKeyCode") then userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonSelect) else "rbxasset://textures/ui/Controls/DesignSystem/ButtonSelect@2x.png"
	local _ = nil
	local _ = nil
	
	if fFlagLocalizeMenuNavigationToggleDialogModule then
		local var7, var8 = reactModule.useState(localizationService.RobloxLocaleId)
		useEventConnection(localizationService:GetPropertyChangedSignal("RobloxLocaleId"), function()
			-- upvalues: var8 (ref), localizationService (copy)
			var8(localizationService.RobloxLocaleId)
		end)
		local var9, var10 = reactModule.useMemo(function()
			-- upvalues: localization (copy), var7 (ref)
			local var11 = localization.new(var7)
			local ok, status = pcall(var11.Format, var11, "CoreScripts.InGameMenu.VirtualCursorHintPreIcon")
			local ok_1, status_1 = pcall(var11.Format, var11, "CoreScripts.InGameMenu.VirtualCursorHintPostIcon")
			local var12 = if ok then status else "Some experiences require pressing"
			
			if ok_1 then
				return var12, status_1
			end
			return var12, "to toggle menu navigation"
		end, { var7 })
		var3 = var9
		var4 = var10
	else
		local _ = {
			VirtualCursorHintPreIcon = "Some experiences require pressing ",
			VirtualCursorHintPostIcon = " to toggle menu navigation"
		}
		var3 = "Some experiences require pressing "
		var4 = " to toggle menu navigation"
	end
	local var11, var12 = reactModule.useMemo(function()
		-- upvalues: getTextSize (copy), var3 (write), captionMedium (ref), var4 (write)
		return getTextSize(var3, captionMedium.FontSize, captionMedium.Font, Vector2.new(1e999, 1e999)), getTextSize(var4, captionMedium.FontSize, captionMedium.Font, Vector2.new(1e999, 1e999))
	end, { captionMedium.FontSize, captionMedium.Font, var3, var4 })
	local var13 = nil
	
	if not var1 then
		var13 = nil
	elseif fFlagEnableConsoleExpControls then
		var13 = useObservableValueModule(var2:getSelectedCoreObject())
	end
	local var14
	local createElement = reactModule.createElement
	local var15 = "Frame"
	local t = {
		BackgroundColor3 = overMedia0.Color3,
		BackgroundTransparency = overMedia0.Transparency,
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.Position
	}
	
	if var1 and fFlagEnableConsoleExpControls then
		var14 = var13 ~= nil
		var14 = nil
	else
		var14 = true
	end
	t.Visible = var14
	
	return createElement(var15, t, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, medium) }),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = if fFlagLocalizeMenuNavigationToggleDialogModule then UDim.new(0, size100) else nil
		}),
		LeftText = reactModule.createElement("TextLabel", {
			TextWrapped = false,
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.fromOffset(var11.X, var11.Y),
			Text = var3,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = color3,
			Font = captionMedium.Font,
			TextSize = captionMedium.FontSize
		}),
		Icon = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 100,
			Size = UDim2.fromOffset(size600, size600),
			Image = var6
		}),
		RightText = reactModule.createElement("TextLabel", {
			TextWrapped = false,
			BackgroundTransparency = 1,
			LayoutOrder = 200,
			Size = UDim2.fromOffset(var12.X, var12.Y),
			Text = var4,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = color3,
			Font = captionMedium.Font,
			TextSize = captionMedium.FontSize
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, size150),
			PaddingBottom = UDim.new(0, size150),
			PaddingLeft = UDim.new(0, size400),
			PaddingRight = UDim.new(0, size400)
		})
	})
end