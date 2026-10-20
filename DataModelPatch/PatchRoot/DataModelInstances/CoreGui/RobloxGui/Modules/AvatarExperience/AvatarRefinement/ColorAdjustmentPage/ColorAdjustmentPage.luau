local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local Checkbox = FoundationModule.Checkbox
local CheckboxSize = FoundationModule.Enums.CheckboxSize
local ReactModule = require(CorePackages.Packages.React)
local UseTopBarHeightFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useTopBarHeight
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local RefinementNavBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementNavBar)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local RefinementControlBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementControlBar)
local BodyColorsFrameModule = require(Modules.AvatarExperience.AvatarEditor.Components.BodyColorsFrame)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXFixColorAdjustmentGamepadSupportModule = require(Modules.AvatarExperience.Flags.FFlagAXFixColorAdjustmentGamepadSupport)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local AXRemoveColorAdjustmentPageGamepadBindings = game:DefineFastFlag("AXRemoveColorAdjustmentPageGamepadBindings", false)

local function selectGlobalGuiInset(p1)
	return p1.GlobalGuiInset
end

return (require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)(function(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), FFlagAXFixColorAdjustmentGamepadSupportModule (copy), RoactGamepadModule (copy), ReactModule (copy), UseTokensFunction (copy), UseSelectorFunction (copy), selectGlobalGuiInset (copy), UseLocalizationFunction (copy), ResponsiveModule (copy), UseTopBarHeightFunction (copy), Focusable (copy), AXRemoveColorAdjustmentPageGamepadBindings (copy), TopBarModule (copy), GamepadFocusHandlerForPageModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), RefinementControlBarModule (copy), RefinementNavBarModule (copy), SceneInteractionFrameModule (copy), Checkbox (copy), CheckboxSize (copy), BodyColorsFrameModule (copy), Text (copy)
	local UseRootFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil elseif FFlagAXFixColorAdjustmentGamepadSupportModule then RoactGamepadModule.useRootFocusController() else nil
	local UseRefResult = if FFlagAXFixColorAdjustmentGamepadSupportModule then ReactModule.useRef(nil) else nil
	local UseRefResult1 = if FFlagAXFixColorAdjustmentGamepadSupportModule then ReactModule.useRef(nil) else nil
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(selectGlobalGuiInset)
	local UseLocalizationResult = UseLocalizationFunction({
		topBarTitle = "Feature.Avatar.ColorAdjustmentPage.Title",
		defaultColorsLabel = "Feature.Avatar.ColorAdjustmentPage.Label.SelectDefaultColors",
		notAvailableForBodyMessage = "Feature.Avatar.ColorAdjustmentPage.AdjustmentNotAvailableForBody"
	})
	local UsePreferredInputResult = if FFlagAXFixColorAdjustmentGamepadSupportModule then ResponsiveModule.usePreferredInput() else nil
	local IsUsePreferredInputResultMatch = if FFlagAXFixColorAdjustmentGamepadSupportModule then UsePreferredInputResult == ResponsiveModule.Input.Directional else nil
	local NoFFlagAXFixColorAdjustmentGamepadSupportModule: boolean = ResponsiveModule.useOrientation() ~= ResponsiveModule.BreakpointConfig.Enum.Landscape and (not FFlagAXFixColorAdjustmentGamepadSupportModule or not IsUsePreferredInputResultMatch)
	local XLarge = if ResponsiveModule.useResponsive() == "Small" then UseTokensResult.Padding.XLarge else UseTokensResult.Padding.XXLarge
	local UseTopBarHeightResult = UseTopBarHeightFunction()
	
	return ReactModule.createElement(if FFlagAXFixColorAdjustmentGamepadSupportModule then Focusable.Frame else "Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus or not FFlagAXFixColorAdjustmentGamepadSupportModule then nil else UseRootFocusControllerResult,
		defaultChild = if FFlagAXFixColorAdjustmentGamepadSupportModule then UseRefResult else nil,
		inputBindings = if FFlagAXFixColorAdjustmentGamepadSupportModule and not AXRemoveColorAdjustmentPageGamepadBindings then {
			Back = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.onBackButtonPressed)
		} else nil
	}, {
		TopBar = ReactModule.createElement(TopBarModule.Container, {
			transparentBackground = true,
			ZIndex = 3,
			titleText = UseLocalizationResult.topBarTitle,
			leftItem = TopBarModule.makeBackButton(p1.onBackButtonPressed),
			ref = if FFlagAXFixColorAdjustmentGamepadSupportModule then UseRefResult else nil,
			NextSelectionDown = if FFlagAXFixColorAdjustmentGamepadSupportModule then UseRefResult1 else nil
		}),
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus or not FFlagAXFixColorAdjustmentGamepadSupportModule then nil else ReactModule.createElement(GamepadFocusHandlerForPageModule, {
			captureFocusOnMount = true,
			focusController = UseRootFocusControllerResult
		}),
		RefinementNavBar = if NoFFlagAXFixColorAdjustmentGamepadSupportModule then ReactModule.createElement(if GetFFlagAXEnableSlotBasedEditorModule() then RefinementControlBarModule else RefinementNavBarModule, {}) else nil,
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -UseTopBarHeightResult + UseSelectorResult.bottom),
			Position = UDim2.fromOffset(0, UseTopBarHeightResult)
		}, {
			Layout = if NoFFlagAXFixColorAdjustmentGamepadSupportModule then ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}) else nil,
			SceneInteractionFrame = ReactModule.createElement(SceneInteractionFrameModule),
			ControlPanel = ReactModule.createElement("Frame", {
				ZIndex = 3,
				BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
				BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency,
				AnchorPoint = if NoFFlagAXFixColorAdjustmentGamepadSupportModule then Vector2.new(0, 1) else Vector2.new(0, 0.5),
				Position = if NoFFlagAXFixColorAdjustmentGamepadSupportModule then UDim2.new(0, 0, 1, 0) else UDim2.new(0, UseTokensResult.Size.Size_900, 0.5, 0),
				Size = if NoFFlagAXFixColorAdjustmentGamepadSupportModule then UDim2.new(1, 0, if p1.colorPickerAvailable then 0.5 else 0, 0) else UDim2.new(0.5, 0, 0, if p1.colorPickerAvailable then UseTokensResult.Size.Size_3000 * 3 else 0),
				AutomaticSize = if p1.colorPickerAvailable then nil else Enum.AutomaticSize.Y
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, XLarge),
					PaddingBottom = UDim.new(0, if NoFFlagAXFixColorAdjustmentGamepadSupportModule then XLarge + UseSelectorResult.bottom else XLarge),
					PaddingLeft = UDim.new(0, XLarge),
					PaddingRight = UDim.new(0, XLarge)
				}),
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, UseTokensResult.Radius.Large) }),
				ColorPicker = if p1.colorPickerAvailable then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.fromScale(1, 1)
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Bottom,
						FillDirection = Enum.FillDirection.Vertical,
						VerticalFlex = Enum.UIFlexAlignment.Fill
					}),
					AboveDivider = if p1.defaultColorCheckboxAvailable then ReactModule.createElement("Frame", {
						BorderSizePixel = 0,
						LayoutOrder = 1,
						Size = UDim2.fromScale(1, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
						BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency
					}, {
						Padding = ReactModule.createElement("UIPadding", {
							PaddingBottom = UDim.new(0, UseTokensResult.Gap.XLarge + 3)
						}),
						DefaultColorCheckBox = ReactModule.createElement(Checkbox, {
							isDisabled = false,
							label = UseLocalizationResult.defaultColorsLabel,
							isChecked = p1.defaultColorChecked,
							onActivated = p1.onDefaultColorCheckboxActivated,
							size = CheckboxSize.Medium
						}),
						Divider = ReactModule.createElement("Frame", {
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 1),
							Position = UDim2.new(0, 0, 1, UseTokensResult.Gap.Large),
							BackgroundColor3 = UseTokensResult.Color.Stroke.Default.Color3,
							BackgroundTransparency = UseTokensResult.Color.Stroke.Default.Transparency
						})
					}) else nil,
					BodyColorPicker = ReactModule.createElement(BodyColorsFrameModule, {
						LayoutOrder = 2,
						Size = UDim2.fromScale(1, 1),
						PaddingRight = UDim.new(),
						PaddingLeft = UDim.new(),
						PaddingTop = UDim.new(0, UseTokensResult.Gap.Large),
						PaddingBottom = UDim.new(),
						ref = if FFlagAXFixColorAdjustmentGamepadSupportModule then UseRefResult1 else nil,
						NextSelectionUp = if FFlagAXFixColorAdjustmentGamepadSupportModule then UseRefResult else nil
					})
				}) else ReactModule.createElement(Text, {
					Text = UseLocalizationResult.notAvailableForBodyMessage,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					fontStyle = {
						Font = UseTokensResult.Typography.LabelSmall.Font,
						FontSize = UseTokensResult.Typography.LabelSmall.FontSize,
						LineHeight = UseTokensResult.Typography.LabelSmall.LineHeight
					}
				}),
				BottomFiller = if NoFFlagAXFixColorAdjustmentGamepadSupportModule then ReactModule.createElement("Frame", {
					LayoutOrder = 2,
					ZIndex = -1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, UseSelectorResult.bottom),
					Position = UDim2.new(0, 0, 1, 0),
					BackgroundColor3 = UseTokensResult.Color.Surface.Surface_0.Color3,
					BackgroundTransparency = UseTokensResult.Color.Surface.Surface_0.Transparency
				}) else nil
			})
		})
	})
end))