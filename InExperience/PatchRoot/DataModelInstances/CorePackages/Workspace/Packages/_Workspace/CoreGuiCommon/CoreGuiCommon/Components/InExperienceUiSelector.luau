local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local CoreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")
local Parent = CoreGuiCommon.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FocusOnChromeFunction = require(Parent.Chrome).FocusUtils.FocusOnChrome
local GetUiSelectorSignalStore = require(CoreGuiCommon.Stores).GetUiSelectorSignalStore
local BaseMenu = FoundationModule.UNSTABLE.BaseMenu
local InputSize = FoundationModule.Enums.InputSize

return function(_) --[[ Line: 27 | Named "InExperienceUiSelector" ]]
	-- upvalues: SignalsReactModule (copy), GetUiSelectorSignalStore (copy), ReactModule (copy), UseLocalizationFunction (copy), GuiService (copy), FocusOnChromeFunction (copy), GamepadService (copy), FoundationModule (copy), BaseMenu (copy), InputSize (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetUiSelectorSignalStore)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseSignalStateResult.getVisibility)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		robloxMenu = "CoreScripts.InGameMenu.Controls.RobloxMenu",
		uiNavToggle = "CoreScripts.InGameMenu.GameSettings.UINavToggle"
	})
	ReactModule.useEffect(function() --[[ Line: 37 ]]
		-- upvalues: UseSignalStateResult1 (copy), UseRefResult1 (copy), GuiService (upval)
		if UseSignalStateResult1 and UseRefResult1.current then
			GuiService.SelectedCoreObject = UseRefResult1.current
			
			return
		end
		if not UseSignalStateResult1 then
			GuiService.SelectedCoreObject = nil
		end
	end, { UseSignalStateResult1 })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 45 ]]
		-- upvalues: UseLocalizationResult (copy), UseRefResult1 (copy), UseSignalStateResult (copy), FocusOnChromeFunction (upval), GuiService (upval), GamepadService (upval)
		return {
			{
				id = "RobloxMenu",
				text = UseLocalizationResult.robloxMenu,
				ref = UseRefResult1,
				onActivated = function() --[[ Line: 51 ]]
					-- upvalues: UseSignalStateResult (upval), FocusOnChromeFunction (upval)
					UseSignalStateResult.setVisibility(false)
					FocusOnChromeFunction()
				end
			},
			{
				id = "UiNavigationMode",
				text = UseLocalizationResult.uiNavToggle,
				onActivated = function() --[[ Line: 59 ]]
					-- upvalues: UseSignalStateResult (upval), GuiService (upval), GamepadService (upval)
					UseSignalStateResult.setVisibility(false)
					GuiService.SelectedCoreObject = nil
					local _, _ = pcall(function() --[[ Line: 62 ]]
						-- upvalues: GamepadService (upval)
						GamepadService:AutoSelectGui()
					end)
				end
			}
		}
	end, { UseSignalStateResult, UseLocalizationResult })
	
	return if UseSignalStateResult1 then ReactModule.createElement(FoundationModule.View, {
		tag = "position-center-center anchor-center-center auto-xy radius-medium bg-surface-200",
		testId = "in-experience-ui-selector",
		ref = UseRefResult,
		selectionGroup = {
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}
	}, {
		Menu = ReactModule.createElement(BaseMenu.Root, {
			items = UseMemoResult,
			size = InputSize.Medium,
			radius = FoundationModule.Enums.Radius.Medium
		})
	}) else nil
end