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

return reactModule.memo(reactModule.forwardRef(function(p0, _)
	-- upvalues: reactModule (ref), useInputType (ref), useFocusGuiObject (ref), controlState (ref), httpService (ref), guiService (ref), view (ref), stateLayerAffordance (ref), cryoModule (ref), toast (ref), inputTypeConstants (ref), eventConnection (ref), userInputService (ref), keyLabel (ref), constantsModule (ref)
	local var9 = reactModule.useRef(nil)
	local var10, var11 = reactModule.useBinding(false)
	local var12, var13 = reactModule.useBinding(Enum.SelectionBehavior.Escape)
	local var14 = useInputType()
	local var15 = useFocusGuiObject()
	local var16 = if p0.onHover then reactModule.useCallback(function(p1)
		-- upvalues: p0 (ref), controlState (copy)
		p0.onHover(if p1 ~= controlState.Hover then if p1 ~= controlState.Pressed then p1 == controlState.SelectedPressed else true else true)
	end, { p0.onHover }) else nil
	local notificationInfo = httpService:JSONDecode(p0.notificationInfo)
	local t = {}
	
	if notificationInfo.Buttons then
		for i, v in ipairs(notificationInfo.Buttons) do
			table.insert(t, {
				text = v.Text,
				variant = v.ButtonType,
				onActivated = function()
					-- upvalues: guiService (copy), p0 (ref), i (ref)
					guiService:OnNotificationInteraction(p0.notificationId, i - 1)
				end
			})
		end
	end
	return reactModule.createElement(view, {
		tag = "auto-xy",
		GroupTransparency = if p0.transparency ~= nil then nil else p0.transparency,
		onStateChanged = var16,
		stateLayer = { affordance = stateLayerAffordance.None },
		SelectionGroup = var10,
		SelectionBehaviorUp = var12,
		SelectionBehaviorDown = var12,
		SelectionBehaviorLeft = var12,
		SelectionBehaviorRight = var12,
		ref = var9
	}, cryoModule.Dictionary.join(p0.children or {}, {
		Toast = reactModule.createElement(toast, {
			title = notificationInfo.Title,
			text = notificationInfo.Text,
			icon = notificationInfo.Icon,
			actions = t,
			width = p0.width
		}),
		KeyLabelView = if var14 == inputTypeConstants.Gamepad and #t > 0 then reactModule.createElement(view, {
			tag = "size-1400-1400 padding-medium anchor-top-right position-top-right"
		}, {
			EventConnection = reactModule.createElement(eventConnection, {
				event = userInputService.InputBegan,
				callback = function(p2)
					-- upvalues: var15 (ref), p0 (ref)
					if p2.KeyCode == Enum.KeyCode.ButtonB then
						var15(nil)
						p0.onPause(false)
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
						-- upvalues: p0 (ref)
						p0.onPause(true)
					end,
					onEndHold = function(p3)
						-- upvalues: t (ref), p0 (ref), var11 (ref), var13 (ref), var15 (ref), var9 (ref)
						if not p3 then
							p0.onPause(false)
							
							return
						elseif #t == 1 then
							p0.onPause(false)
							t[1].onActivated()
							
							return
						end
						var11(true)
						var13(Enum.SelectionBehavior.Stop)
						var15(var9.current)
					end
				}
			})
		}) else nil
	}))
end))