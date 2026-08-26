local gamepadService = game:GetService("GamepadService")
local guiService = game:GetService("GuiService")
local coreGuiCommon = script:FindFirstAncestor("CoreGuiCommon")
local parent = coreGuiCommon.Parent
local chromeModule = require(parent.Chrome)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = localizationModule.Hooks.useLocalization
local focusOnChrome = chromeModule.FocusUtils.FocusOnChrome
local getUiSelectorSignalStore = require(coreGuiCommon.Stores).GetUiSelectorSignalStore
local baseMenu = foundationModule.UNSTABLE.BaseMenu
local inputSize = foundationModule.Enums.InputSize

return function(_)
	-- upvalues: signalsReactModule (ref), getUiSelectorSignalStore (ref), reactModule (ref), useLocalization (ref), guiService (ref), focusOnChrome (ref), gamepadService (ref), foundationModule (ref), baseMenu (ref), inputSize (ref)
	local var1 = signalsReactModule.useSignalState(getUiSelectorSignalStore)
	local var2 = signalsReactModule.useSignalState(var1.getVisibility)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = useLocalization({
		robloxMenu = "CoreScripts.InGameMenu.Controls.RobloxMenu",
		uiNavToggle = "CoreScripts.InGameMenu.GameSettings.UINavToggle"
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref), guiService (copy)
		if var2 and var4.current then
			guiService.SelectedCoreObject = var4.current
			
			return
		elseif not var2 then
			guiService.SelectedCoreObject = nil
		end
	end, { var2 })
	
	return if var2 then reactModule.createElement(foundationModule.View, {
		tag = "position-center-center anchor-center-center auto-xy radius-medium bg-surface-200",
		testId = "in-experience-ui-selector",
		ref = var3,
		selectionGroup = {
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}
	}, {
		Menu = reactModule.createElement(baseMenu.Root, {
			items = reactModule.useMemo(function()
				-- upvalues: var5 (ref), var4 (ref), var1 (ref), focusOnChrome (copy), guiService (copy), gamepadService (copy)
				return {
					{
						id = "RobloxMenu",
						text = var5.robloxMenu,
						ref = var4,
						onActivated = function()
							-- upvalues: var1 (copy), focusOnChrome (copy)
							var1.setVisibility(false)
							focusOnChrome()
						end
					},
					{
						id = "UiNavigationMode",
						text = var5.uiNavToggle,
						onActivated = function()
							-- upvalues: var1 (copy), guiService (copy), gamepadService (copy)
							var1.setVisibility(false)
							guiService.SelectedCoreObject = nil
							local _, _ = pcall(function()
								-- upvalues: gamepadService (copy)
								gamepadService:AutoSelectGui()
							end)
						end
					}
				}
			end, { var1, var5 }),
			size = inputSize.Medium,
			radius = foundationModule.Enums.Radius.Medium
		})
	}) else nil
end