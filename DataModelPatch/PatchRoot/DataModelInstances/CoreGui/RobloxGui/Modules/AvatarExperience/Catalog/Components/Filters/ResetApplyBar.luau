local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local GetPageMarginFunction = UIBloxModule.App.Container.getPageMargin
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UsePropertyFunction = require(CorePackages.Workspace.Packages.GuiObjectUtils).useProperty
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local GetFFlagAXEnableNewInventoryItemsListModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

return function(Gui)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), UsePropertyFunction (copy), GetPageMarginFunction (copy), GetFFlagAXEnableNewInventoryItemsListModule (copy), ButtonType (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), ButtonStack (copy)
	local Theme = UseStyleFunction().Theme
	local UseLocalizationResult = UseLocalizationFunction({
		apply = "CommonUI.Messages.Action.Apply",
		reset = "CommonUI.Messages.Action.Reset"
	})
	local UseRefResult = ReactModule.useRef(nil)
	local FrameRef = Gui.frameRef or UseRefResult
	local AbsoluteSize = UsePropertyFunction(FrameRef, "AbsoluteSize")
	local PageMargin = if AbsoluteSize then GetPageMarginFunction(AbsoluteSize.X) else 0
	local UseMemoResult = if GetFFlagAXEnableNewInventoryItemsListModule() then ReactModule.useMemo(function()
		-- upvalues: Gui (copy), UseLocalizationResult (copy), ButtonType (upval)
		local List = {}
		
		if Gui.onReset then
			table.insert(List, {
				props = {
					onActivated = Gui.onReset,
					text = UseLocalizationResult.reset,
					isDisabled = not Gui.canReset
				},
				isDefaultChild = Gui.onApply == nil
			})
		end
		if Gui.onApply then
			table.insert(List, {
				isDefaultChild = true,
				buttonType = ButtonType.PrimarySystem,
				props = {
					onActivated = Gui.onApply,
					text = UseLocalizationResult.apply,
					isDisabled = not Gui.canApply
				}
			})
		end
		return List
	end, {
		Gui.onApply,
		Gui.onReset,
		UseLocalizationResult,
		Gui.canReset,
		Gui.canApply
	}) else nil
	
	return ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundUIDefault.Transparency,
		Size = UDim2.new(1, 0, 0, Gui.height),
		AutomaticSize = Enum.AutomaticSize.Y,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else Gui.NextSelectionUp,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else Gui.NextSelectionDown,
		NextSelectionRight = if FFlagAXMigrateAXToGlobalAutofocus then nil else Gui.NextSelectionRight,
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else Gui.NextSelectionLeft,
		ref = FrameRef
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, PageMargin),
			PaddingRight = UDim.new(0, PageMargin),
			PaddingTop = UDim.new(0, 32)
		}),
		Gradient = ReactModule.createElement("UIGradient", {
			Rotation = 270,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, Theme.BackgroundDefault.Transparency),
				NumberSequenceKeypoint.new(0.8, Theme.BackgroundDefault.Transparency),
				NumberSequenceKeypoint.new(1, 1)
			})
		}),
		Buttons = ReactModule.createElement(ButtonStack, {
			isRoactGamepadEnabled = not FFlagAXMigrateAXToGlobalAutofocus and nil,
			buttons = if GetFFlagAXEnableNewInventoryItemsListModule() then UseMemoResult else {
				{
					props = {
						onActivated = Gui.onReset,
						text = UseLocalizationResult.reset,
						isDisabled = not Gui.canReset
					}
				},
				{
					isDefaultChild = true,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = Gui.onApply,
						text = UseLocalizationResult.apply,
						isDisabled = not Gui.canApply
					}
				}
			}
		})
	})
end