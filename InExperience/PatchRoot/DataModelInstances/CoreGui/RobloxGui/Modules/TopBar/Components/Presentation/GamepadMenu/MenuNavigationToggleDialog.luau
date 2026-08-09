local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local userInputService = game:GetService("UserInputService")
local _ = coreGuiService:WaitForChild("RobloxGui")
local reactUtilsModule = require(corePackagesService.Packages.ReactUtils)
local reactModule = require(corePackagesService.Packages.React)
local _ = require(corePackagesService.Packages.UIBlox)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagRenameDeprecatedUIBloxTokens = sharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local useEventConnection = reactUtilsModule.useEventConnection
local getTextSize = require(corePackagesService.Workspace.Packages.Style).GetTextSize
local useDesignTokens = require(corePackagesService.Workspace.Packages.Style).useDesignTokens
local parent = script.Parent.Parent.Parent.Parent
local chrome = parent.Parent.Chrome
local var7 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local var8 = if fFlagEnableConsoleExpControls and not var7 then nil else require(parent.Components.GamepadConnector)
local useObservableValueModule = require(chrome.ChromeShared.Hooks.useObservableValue)
local localization = require(corePackagesService.Workspace.Packages.InExperienceLocales).Localization
local fFlagLocalizeMenuNavigationToggleDialogModule = require(coreGuiService.RobloxGui.Modules.TopBar.Flags.FFlagLocalizeMenuNavigationToggleDialog)

return function(p0) --[[ line: 42 | named "MenuNavigationToggleDialog" ]]
	-- upvalues: useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), fFlagLocalizeMenuNavigationToggleDialogModule (ref), userInputService (ref), reactModule (ref), localizationService (ref), useEventConnection (ref), localization (ref), getTextSize (ref), var7 (ref), fFlagEnableConsoleExpControls (ref), useObservableValueModule (ref), var8 (ref)
	local var20, var21
	local var11 = useDesignTokens()
	local var12 = if fFlagRenameDeprecatedUIBloxTokens then var11.Typography.CaptionMedium else var11.Semantic.Typography.CaptionHeader
	local var13 = if fFlagRenameDeprecatedUIBloxTokens then var11.Size.Size_400 else var11.Global.Space_200
	local var14 = if fFlagRenameDeprecatedUIBloxTokens then var11.Size.Size_150 else var11.Global.Space_75
	local var15 = if fFlagRenameDeprecatedUIBloxTokens then var11.Radius.Medium else var11.Semantic.Radius.Medium
	local var16 = if fFlagRenameDeprecatedUIBloxTokens then var11.Size.Size_600 else var11.Global.Size_300
	local var17 = if fFlagRenameDeprecatedUIBloxTokens then var11.Color.OverMedia.OverMedia_0 else var11.Semantic.Color.BackgroundUi.Contrast
	local color3 = (if fFlagRenameDeprecatedUIBloxTokens then var11.Color.Content.Emphasis else var11.Semantic.Color.Text.Emphasis).Color3
	local var18 = if fFlagRenameDeprecatedUIBloxTokens then var11.Size.Size_100 else var11.Global.Space_50
	local var19 = if fFlagLocalizeMenuNavigationToggleDialogModule and game:GetEngineFeature("GetImageForKeyCode") then userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonSelect) else "rbxasset://textures/ui/Controls/DesignSystem/ButtonSelect@2x.png"
	local _ = nil
	local _ = nil
	
	if fFlagLocalizeMenuNavigationToggleDialogModule then
		local var22, var23 = reactModule.useState(localizationService.RobloxLocaleId)
		useEventConnection(localizationService:GetPropertyChangedSignal("RobloxLocaleId"), function() --[[ line: 61 ]]
			-- upvalues: var23 (ref), localizationService (copy)
			var23(localizationService.RobloxLocaleId)
		end)
		local var24, var25 = reactModule.useMemo(function() --[[ line: 71 ]]
			-- upvalues: localization (copy), var22 (ref)
			local var32 = localization.new(var22)
			local ok, status = pcall(var32.Format, var32, "CoreScripts.InGameMenu.VirtualCursorHintPreIcon")
			local ok_1, status_1 = pcall(var32.Format, var32, "CoreScripts.InGameMenu.VirtualCursorHintPostIcon")
			local var33 = if ok then status else "Some experiences require pressing"
			
			if ok_1 then
				return var33, status_1
			end
			return var33, "to toggle menu navigation"
		end, { var22 })
		var20 = var24
		var21 = var25
	else
		local _ = {
			VirtualCursorHintPreIcon = "Some experiences require pressing ",
			VirtualCursorHintPostIcon = " to toggle menu navigation"
		}
		var20 = "Some experiences require pressing "
		var21 = " to toggle menu navigation"
	end
	local var26, var27 = reactModule.useMemo(function() --[[ line: 95 ]]
		-- upvalues: getTextSize (copy), var20 (write), var12 (ref), var21 (write)
		return getTextSize(var20, var12.FontSize, var12.Font, Vector2.new(1e999, 1e999)), getTextSize(var21, var12.FontSize, var12.Font, Vector2.new(1e999, 1e999))
	end, { var12.FontSize, var12.Font, var20, var21 })
	local var28 = nil
	
	if not var7 then
		var28 = nil
	elseif fFlagEnableConsoleExpControls then
		var28 = useObservableValueModule(var8:getSelectedCoreObject())
	end
	local var31
	local createElement = reactModule.createElement
	local var29 = "Frame"
	local t = {
		BackgroundColor3 = var17.Color3,
		BackgroundTransparency = var17.Transparency,
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p0.Position
	}
	
	if var7 and fFlagEnableConsoleExpControls then
		var31 = var28 ~= nil
		var31 = nil
	else
		var31 = true
	end
	t.Visible = var31
	
	return createElement(var29, t, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var15) }),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = if fFlagLocalizeMenuNavigationToggleDialogModule then UDim.new(0, var18) else nil
		}),
		LeftText = reactModule.createElement("TextLabel", {
			TextWrapped = false,
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.fromOffset(var26.X, var26.Y),
			Text = var20,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = color3,
			Font = var12.Font,
			TextSize = var12.FontSize
		}),
		Icon = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 100,
			Size = UDim2.fromOffset(var16, var16),
			Image = var19
		}),
		RightText = reactModule.createElement("TextLabel", {
			TextWrapped = false,
			BackgroundTransparency = 1,
			LayoutOrder = 200,
			Size = UDim2.fromOffset(var27.X, var27.Y),
			Text = var21,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = color3,
			Font = var12.Font,
			TextSize = var12.FontSize
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var14),
			PaddingBottom = UDim.new(0, var14),
			PaddingLeft = UDim.new(0, var13),
			PaddingRight = UDim.new(0, var13)
		})
	})
end