local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local UserInputService = game:GetService("UserInputService")
local _ = CoreGui:WaitForChild("RobloxGui")
local ReactModule = require(CorePackages.Packages.React)
local _ = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseEventConnectionFunction = require(CorePackages.Packages.ReactUtils).useEventConnection
local GetTextSizeFunction = require(CorePackages.Workspace.Packages.Style).GetTextSize
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local Parent = script.Parent.Parent.Parent.Parent
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local GamepadConnectorModule = if FFlagEnableConsoleExpControls and not EnabledResult then nil else require(Parent.Components.GamepadConnector)
local UseObservableValueModule = require(Parent.Parent.Chrome.ChromeShared.Hooks.useObservableValue)
local Localization = require(CorePackages.Workspace.Packages.InExperienceLocales).Localization
local FFlagLocalizeMenuNavigationToggleDialogModule = require(CoreGui.RobloxGui.Modules.TopBar.Flags.FFlagLocalizeMenuNavigationToggleDialog)

return function(p1) --[[ Line: 46 | Named "MenuNavigationToggleDialog" ]]
	-- upvalues: UseDesignTokensFunction (copy), FFlagLocalizeMenuNavigationToggleDialogModule (copy), UserInputService (copy), ReactModule (copy), LocalizationService (copy), UseEventConnectionFunction (copy), Localization (copy), GetTextSizeFunction (copy), EnabledResult (copy), FFlagEnableConsoleExpControls (copy), UseObservableValueModule (copy), GamepadConnectorModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local CaptionMedium = UseDesignTokensResult.Typography.CaptionMedium
	local Size400 = UseDesignTokensResult.Size.Size_400
	local Size150 = UseDesignTokensResult.Size.Size_150
	local Medium = UseDesignTokensResult.Radius.Medium
	local Size600 = UseDesignTokensResult.Size.Size_600
	local OverMedia0 = UseDesignTokensResult.Color.OverMedia.OverMedia_0
	local EmphasisColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3
	local Size100 = UseDesignTokensResult.Size.Size_100
	local ImageForKeyCode = if FFlagLocalizeMenuNavigationToggleDialogModule and game:GetEngineFeature("GetImageForKeyCode") then UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonSelect) else "rbxasset://textures/ui/Controls/DesignSystem/ButtonSelect@2x.png"
	local UseMemoResult = nil
	local UseMemoResult2 = nil
	
	if FFlagLocalizeMenuNavigationToggleDialogModule then
		local UseStateResult, UseStateResult2 = ReactModule.useState(LocalizationService.RobloxLocaleId)
		UseEventConnectionFunction(LocalizationService:GetPropertyChangedSignal("RobloxLocaleId"), function() --[[ Line: 65 ]]
			-- upvalues: UseStateResult2 (copy), LocalizationService (upval)
			UseStateResult2(LocalizationService.RobloxLocaleId)
		end)
		UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 75 ]]
			-- upvalues: Localization (upval), UseStateResult (copy)
			local NewLocalization = Localization.new(UseStateResult)
			local Success, Result = pcall(NewLocalization.Format, NewLocalization, "CoreScripts.InGameMenu.VirtualCursorHintPreIcon")
			local Success1, Result1 = pcall(NewLocalization.Format, NewLocalization, "CoreScripts.InGameMenu.VirtualCursorHintPostIcon")
			local Result2 = if Success then Result else "Some experiences require pressing"
			
			if Success1 then
				return Result2, Result1
			else
				return Result2, "to toggle menu navigation"
			end
		end, { UseStateResult })
	else
		UseMemoResult = "Some experiences require pressing "
		UseMemoResult2 = " to toggle menu navigation"
	end
	local UseMemoResult1, UseMemoResult2_1 = ReactModule.useMemo(function() --[[ Line: 99 ]]
		-- upvalues: GetTextSizeFunction (upval), UseMemoResult (ref), CaptionMedium (copy), UseMemoResult2 (ref)
		return GetTextSizeFunction(UseMemoResult, CaptionMedium.FontSize, CaptionMedium.Font, Vector2.new(1e999, 1e999)), (GetTextSizeFunction(UseMemoResult2, CaptionMedium.FontSize, CaptionMedium.Font, Vector2.new(1e999, 1e999)))
	end, {
		CaptionMedium.FontSize,
		CaptionMedium.Font,
		UseMemoResult,
		UseMemoResult2
	})
	local UseObservableValueModuleResult = if EnabledResult and FFlagEnableConsoleExpControls then UseObservableValueModule(GamepadConnectorModule:getSelectedCoreObject()) else nil
	
	return ReactModule.createElement("Frame", {
		BackgroundColor3 = OverMedia0.Color3,
		BackgroundTransparency = OverMedia0.Transparency,
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = p1.Position,
		Visible = not EnabledResult or not FFlagEnableConsoleExpControls or UseObservableValueModuleResult ~= nil
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Medium) }),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = if FFlagLocalizeMenuNavigationToggleDialogModule then UDim.new(0, Size100) else nil
		}),
		LeftText = ReactModule.createElement("TextLabel", {
			TextWrapped = false,
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			Size = UDim2.fromOffset(UseMemoResult1.X, UseMemoResult1.Y),
			Text = UseMemoResult,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = EmphasisColor3,
			Font = if FoundationFontFaceMigration then nil else CaptionMedium.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(CaptionMedium.Font) else nil,
			TextSize = CaptionMedium.FontSize
		}),
		Icon = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 100,
			Size = UDim2.fromOffset(Size600, Size600),
			Image = ImageForKeyCode
		}),
		RightText = ReactModule.createElement("TextLabel", {
			TextWrapped = false,
			BackgroundTransparency = 1,
			LayoutOrder = 200,
			Size = UDim2.fromOffset(UseMemoResult2_1.X, UseMemoResult2_1.Y),
			Text = UseMemoResult2,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextColor3 = EmphasisColor3,
			Font = if FoundationFontFaceMigration then nil else CaptionMedium.Font,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(CaptionMedium.Font) else nil,
			TextSize = CaptionMedium.FontSize
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, Size150),
			PaddingBottom = UDim.new(0, Size150),
			PaddingLeft = UDim.new(0, Size400),
			PaddingRight = UDim.new(0, Size400)
		})
	})
end