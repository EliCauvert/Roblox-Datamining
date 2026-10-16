local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local FoundationModule = require(Parent1.Foundation)
local Toast = FoundationModule.Toast
local KeyLabel = FoundationModule.KeyLabel
local View = FoundationModule.View
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local ControlState = FoundationModule.Enums.ControlState
local InputTypeConstants = require(Parent1.InputType).InputTypeConstants
local UseInputTypeFunction = require(Parent1.RoactUtils).Hooks.useInputType
local EventConnection = require(Parent1.ReactUtils).EventConnection
local UseFocusGuiObjectFunction = require(Parent1.ReactFocusNavigation).useFocusGuiObject
local ConstantsModule = require(Parent.constants)

return ReactModule.memo(ReactModule.forwardRef(function(p1, _) --[[ Line: 39 | Named "ClientNotificationWrapper" ]]
	-- upvalues: ReactModule (copy), UseInputTypeFunction (copy), UseFocusGuiObjectFunction (copy), ControlState (copy), HttpService (copy), GuiService (copy), View (copy), StateLayerAffordance (copy), CryoModule (copy), Toast (copy), InputTypeConstants (copy), EventConnection (copy), UserInputService (copy), KeyLabel (copy), ConstantsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(Enum.SelectionBehavior.Escape)
	local UseInputTypeResult = UseInputTypeFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseResult = if p1.onHover then ReactModule.useCallback(function(Hover) --[[ Line: 48 ]]
		-- upvalues: p1 (copy), ControlState (upval)
		p1.onHover(Hover == ControlState.Hover or (Hover == ControlState.Pressed or Hover == ControlState.SelectedPressed))
	end, { p1.onHover }) else nil
	local Data = HttpService:JSONDecode(p1.notificationInfo)
	local Actions = {}
	
	if Data.Buttons then
		for i, button in ipairs(Data.Buttons) do
			table.insert(Actions, {
				text = button.Text,
				variant = button.ButtonType,
				onActivated = function() --[[ Line: 64 ]]
					-- upvalues: GuiService (upval), p1 (copy), i (copy)
					GuiService:OnNotificationInteraction(p1.notificationId, i - 1)
				end
			})
		end
	end
	return ReactModule.createElement(View, {
		tag = "auto-xy",
		GroupTransparency = if p1.transparency == nil then nil else p1.transparency,
		onStateChanged = UseResult,
		stateLayer = { affordance = StateLayerAffordance.None },
		SelectionGroup = UseBindingResult,
		SelectionBehaviorUp = UseBindingResult1,
		SelectionBehaviorDown = UseBindingResult1,
		SelectionBehaviorLeft = UseBindingResult1,
		SelectionBehaviorRight = UseBindingResult1,
		ref = UseRefResult
	}, CryoModule.Dictionary.join(p1.children or {}, {
		Toast = ReactModule.createElement(Toast, {
			title = Data.Title,
			text = Data.Text,
			icon = Data.Icon,
			actions = Actions,
			width = p1.width
		}),
		KeyLabelView = if UseInputTypeResult == InputTypeConstants.Gamepad and #Actions > 0 then ReactModule.createElement(View, {
			tag = "size-1400-1400 padding-medium anchor-top-right position-top-right"
		}, {
			EventConnection = ReactModule.createElement(EventConnection, {
				event = UserInputService.InputBegan,
				callback = function(Input) --[[ Line: 101 ]]
					-- upvalues: UseFocusGuiObjectResult (copy), p1 (copy)
					if Input.KeyCode == Enum.KeyCode.ButtonB then
						UseFocusGuiObjectResult(nil)
						p1.onPause(false)
					end
				end
			}),
			KeyLabel = ReactModule.createElement(KeyLabel, {
				Size = UDim2.fromScale(1, 1),
				keyCode = Enum.KeyCode.ButtonStart,
				holdBehavior = {
					holdTime = ConstantsModule.MenuButtonPressHoldTime,
					resetTime = ConstantsModule.MenuButtonPressResetTime,
					onBeginHold = function() --[[ Line: 114 ]]
						-- upvalues: p1 (copy)
						p1.onPause(true)
					end,
					onEndHold = function(p2) --[[ Line: 117 ]]
						-- upvalues: Actions (copy), p1 (copy), UseBindingResult2 (copy), UseBindingResult2_1 (copy), UseFocusGuiObjectResult (copy), UseRefResult (copy)
						if not p2 then
							p1.onPause(false)
							
							return
						end
						if #Actions == 1 then
							p1.onPause(false)
							Actions[1].onActivated()
							
							return
						else
							UseBindingResult2(true)
							UseBindingResult2_1(Enum.SelectionBehavior.Stop)
							UseFocusGuiObjectResult(UseRefResult.current)
						end
					end
				}
			})
		}) else nil
	}))
end))