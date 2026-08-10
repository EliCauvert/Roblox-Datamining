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
local var6 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var7 = if fFlagEnableConsoleExpControls and not var6 then nil else require(parent.Components.GamepadConnector)
local useObservableValueModule = require(chrome.ChromeShared.Hooks.useObservableValue)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local fFlagLocalizeMenuNavigationToggleDialogModule = require(coreGuiService.RobloxGui.Modules.TopBar.Flags.FFlagLocalizeMenuNavigationToggleDialog)

return function(p0) --[[ line: 41 | named "MenuNavigationToggleDialog" ]]
	-- upvalues: useDesignTokens (ref), fFlagLocalizeMenuNavigationToggleDialogModule (ref), userInputService (ref), reactModule (ref), localizationService (ref), useEventConnection (ref), localization (ref), getTextSize (ref), var6 (ref), fFlagEnableConsoleExpControls (ref), useObservableValueModule (ref), var7 (ref)
	local var12, var13
	local var10 = useDesignTokens()
	local captionMedium = var10.Typography.CaptionMedium
	local size400 = var10.Size.Size_400
	local size150 = var10.Size.Size_150
	local medium = var10.Radius.Medium
	local size600 = var10.Size.Size_600
	local overMedia0 = var10.Color.OverMedia.OverMedia_0
	local color3 = var10.Color.Content.Emphasis.Color3
	local size100 = var10.Size.Size_100
	local var11 = if fFlagLocalizeMenuNavigationToggleDialogModule and game:GetEngineFeature("GetImageForKeyCode") then userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonSelect) else "rbxasset://textures/ui/Controls/DesignSystem/ButtonSelect@2x.png"
	local _ = nil
	local _ = nil
	
	if fFlagLocalizeMenuNavigationToggleDialogModule then
		local var14, var15 = reactModule.useState(localizationService.RobloxLocaleId)
		useEventConnection(localizationService:GetPropertyChangedSignal("RobloxLocaleId"), function() --[[ line: 60 ]]
			-- upvalues: var15 (ref), localizationService (copy)
			var15(localizationService.RobloxLocaleId)
		end)
		local var16, var17 = reactModule.useMemo(function() --[[ line: 70 ]]
			-- upvalues: localization (copy), var14 (ref)
			local var24 = localization.new(var14)
			local ok, status = pcall(var24.Format, var24, "CoreScripts.InGameMenu.VirtualCursorHintPreIcon")
			local ok_1, status_1 = pcall(var24.Format, var24, "CoreScripts.InGameMenu.VirtualCursorHintPostIcon")
			local var25 = if ok then status else "Some experiences require pressing"
			
			if ok_1 then
				return var25, status_1
			end
			return var25, "to toggle menu navigation"
		end, { var14 })
		var12 = var16
		var13 = var17
	else
		local _ = {
			VirtualCursorHintPreIcon = "Some experiences require pressing ",
			VirtualCursorHintPostIcon = " to toggle menu navigation"
		}
		var12 = "Some experiences require pressing "
		var13 = " to toggle menu navigation"
	end
	local var18, var19 = reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: getTextSize (copy), var12 (write), captionMedium (ref), var13 (write)
		return getTextSize(var12, captionMedium.FontSize, captionMedium.Font, Vector2.new(1e999, 1e999)), getTextSize(var13, captionMedium.FontSize, captionMedium.Font, Vector2.new(1e999, 1e999))
	end, { captionMedium.FontSize, captionMedium.Font, var12, var13 })
	local var20 = nil
	
	if not var6 then
		var20 = nil
	elseif fFlagEnableConsoleExpControls then
		var20 = useObservableValueModule(var7:getSelectedCoreObject())
	end
	local var23
	local createElement = reactModule.createElement
	local var21 = "Frame"
	local t = {
		BackgroundColor3 = overMedia0.Color3,
		BackgroundTransparency = overMedia0.Transparency,
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p0.Position
	}
	
	if var6 and fFlagEnableConsoleExpControls then
		var23 = var20 ~= nil
		var23 = nil
	else
		var23 = true
	end
	t.Visible = var23
	
	return createElement(var21, t, {
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
			Size = UDim2.fromOffset(var18.X, var18.Y),
			Text = var12,
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
			Image = var11
		}),
		RightText = reactModule.createElement("TextLabel", {
			TextWrapped = false,
			BackgroundTransparency = 1,
			LayoutOrder = 200,
			Size = UDim2.fromOffset(var19.X, var19.Y),
			Text = var13,
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