local httpService = game:GetService("HttpService")
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local reactUtilsModule = require(parent_1.ReactUtils)
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local toast = foundationModule.Toast
local keyLabel = foundationModule.KeyLabel
local view = foundationModule.View
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local controlState = foundationModule.Enums.ControlState
local inputTypeConstants = require(parent_1.InputType).InputTypeConstants
local useInputType = roactUtilsModule.Hooks.useInputType
local eventConnection = reactUtilsModule.EventConnection
local useFocusGuiObject = require(parent_1.ReactFocusNavigation).useFocusGuiObject
local constantsModule = require(parent.constants)

return reactModule.memo(reactModule.forwardRef(function(p1, _)
	-- upvalues: reactModule (ref), useInputType (ref), useFocusGuiObject (ref), controlState (ref), httpService (ref), guiService (ref), view (ref), stateLayerAffordance (ref), cryoModule (ref), toast (ref), inputTypeConstants (ref), eventConnection (ref), userInputService (ref), keyLabel (ref), constantsModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2, var3 = reactModule.useBinding(false)
	local var4, var5 = reactModule.useBinding(Enum.SelectionBehavior.Escape)
	local var6 = useInputType()
	local var7 = useFocusGuiObject()
	local var8 = if p1.onHover then reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), controlState (copy)
		p1.onHover(if p2 ~= controlState.Hover then if p2 ~= controlState.Pressed then p2 == controlState.SelectedPressed else true else true)
	end, { p1.onHover }) else nil
	local notificationInfo = httpService:JSONDecode(p1.notificationInfo)
	local t = {}
	
	if notificationInfo.Buttons then
		for i, v in ipairs(notificationInfo.Buttons) do
			table.insert(t, {
				text = v.Text,
				variant = v.ButtonType,
				onActivated = function()
					-- upvalues: guiService (copy), p1 (ref), i (ref)
					guiService:OnNotificationInteraction(p1.notificationId, i - 1)
				end
			})
		end
	end
	return reactModule.createElement(view, {
		tag = "auto-xy",
		GroupTransparency = if p1.transparency ~= nil then nil else p1.transparency,
		onStateChanged = var8,
		stateLayer = { affordance = stateLayerAffordance.None },
		SelectionGroup = var2,
		SelectionBehaviorUp = var4,
		SelectionBehaviorDown = var4,
		SelectionBehaviorLeft = var4,
		SelectionBehaviorRight = var4,
		ref = var1
	}, cryoModule.Dictionary.join(p1.children or {}, {
		Toast = reactModule.createElement(toast, {
			title = notificationInfo.Title,
			text = notificationInfo.Text,
			icon = notificationInfo.Icon,
			actions = t,
			width = p1.width
		}),
		KeyLabelView = if var6 == inputTypeConstants.Gamepad and #t > 0 then reactModule.createElement(view, {
			tag = "size-1400-1400 padding-medium anchor-top-right position-top-right"
		}, {
			EventConnection = reactModule.createElement(eventConnection, {
				event = userInputService.InputBegan,
				callback = function(p2)
					-- upvalues: var7 (ref), p1 (ref)
					if p2.KeyCode == Enum.KeyCode.ButtonB then
						var7(nil)
						p1.onPause(false)
					end
				end
			}),
			KeyLabel = reactModule.createElement(keyLabel, {
				Size = UDim2.fromScale(1, 1),
				keyCode = Enum.KeyCode.ButtonStart,
				holdBehavior = {
					holdTime = constantsModule.MenuButtonPressHoldTime,
					resetTime = constantsModule.MenuButtonPressResetTime,
					onBeginHold = function()
						-- upvalues: p1 (ref)
						p1.onPause(true)
					end,
					onEndHold = function(p2)
						-- upvalues: t (ref), p1 (ref), var3 (ref), var5 (ref), var7 (ref), var1 (ref)
						if not p2 then
							p1.onPause(false)
							
							return
						elseif #t == 1 then
							p1.onPause(false)
							t[1].onActivated()
							
							return
						end
						var3(true)
						var5(Enum.SelectionBehavior.Stop)
						var7(var1.current)
					end
				}
			})
		}) else nil
	}))
end))