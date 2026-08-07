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

return function(_) --[[ line: 27 | named "InExperienceUiSelector" ]]
	-- upvalues: signalsReactModule (ref), getUiSelectorSignalStore (ref), reactModule (ref), useLocalization (ref), guiService (ref), focusOnChrome (ref), gamepadService (ref), foundationModule (ref), baseMenu (ref), inputSize (ref)
	local var8 = signalsReactModule.useSignalState(getUiSelectorSignalStore)
	local var9 = signalsReactModule.useSignalState(var8.getVisibility)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	local var12 = useLocalization({
		robloxMenu = "CoreScripts.InGameMenu.Controls.RobloxMenu",
		uiNavToggle = "CoreScripts.InGameMenu.GameSettings.UINavToggle"
	})
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: var9 (ref), var11 (ref), guiService (copy)
		if var9 and var11.current then
			guiService.SelectedCoreObject = var11.current
			
			return
		elseif not var9 then
			guiService.SelectedCoreObject = nil
		end
	end, { var9 })
	
	return if var9 then reactModule.createElement(foundationModule.View, {
		tag = "position-center-center anchor-center-center auto-xy radius-medium bg-surface-200",
		testId = "in-experience-ui-selector",
		ref = var10,
		selectionGroup = {
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		}
	}, {
		Menu = reactModule.createElement(baseMenu.Root, {
			items = reactModule.useMemo(function() --[[ line: 45 ]]
				-- upvalues: var12 (ref), var11 (ref), var8 (ref), focusOnChrome (copy), guiService (copy), gamepadService (copy)
				return {
					{
						id = "RobloxMenu",
						text = var12.robloxMenu,
						ref = var11,
						onActivated = function() --[[ line: 51 ]]
							-- upvalues: var8 (copy), focusOnChrome (copy)
							var8.setVisibility(false)
							focusOnChrome()
						end
					},
					{
						id = "UiNavigationMode",
						text = var12.uiNavToggle,
						onActivated = function() --[[ line: 59 ]]
							-- upvalues: var8 (copy), guiService (copy), gamepadService (copy)
							var8.setVisibility(false)
							guiService.SelectedCoreObject = nil
							local _, _ = pcall(function() --[[ line: 62 ]]
								-- upvalues: gamepadService (copy)
								gamepadService:AutoSelectGui()
							end)
						end
					}
				}
			end, { var8, var12 }),
			size = inputSize.Medium,
			radius = foundationModule.Enums.Radius.Medium
		})
	}) else nil
end