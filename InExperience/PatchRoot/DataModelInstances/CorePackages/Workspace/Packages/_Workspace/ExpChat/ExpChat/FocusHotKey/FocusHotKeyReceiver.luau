local contextActionService = game:GetService("ContextActionService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local configModule = require(expChat.Config)
local focusChatHotKeyActivatedModule = require(expChat.Actions.FocusChatHotKeyActivated)
local getTabFocusBehaviorModule = require(script.Parent.getTabFocusBehavior)
local useSelectedTabTypeModule = require(expChat.useSelectedTabType)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch

local function selectIsChatHotkeyEnabled(p0) --[[ line: 41 ]]
	return p0.ChatVisibility.isChatHotkeyEnabled.value
end

local function selectDevDefinedFocusKeyCode(p1) --[[ line: 45 ]]
	return p1.ChatLayout.ChatInputBarSettings.KeyboardKeyCode
end

return function(p2) --[[ line: 54 | named "FocusHotKeyReceiver" ]]
	-- upvalues: contextActionService (ref), useSelector (ref), selectIsChatHotkeyEnabled (ref), useSelectedTabTypeModule (ref), selectDevDefinedFocusKeyCode (ref), useDispatch (ref), reactModule (ref), configModule (ref), getTabFocusBehaviorModule (ref), focusChatHotKeyActivatedModule (ref)
	local contextActionService_1 = p2.contextActionService or contextActionService
	local var11 = useSelector(selectIsChatHotkeyEnabled)
	local var12 = useSelectedTabTypeModule()
	local var13 = useSelector(selectDevDefinedFocusKeyCode)
	local var14 = useDispatch()
	reactModule.useEffect(function() --[[ line: 62 ]]
		-- upvalues: var11 (ref), configModule (copy), var13 (ref), var12 (ref), getTabFocusBehaviorModule (copy), var14 (ref), focusChatHotKeyActivatedModule (copy), contextActionService_1 (ref)
		contextActionService_1:BindCoreAction("ExpChatFocusHotKey", function(_, p3, p4) --[[ line: 63 | named "handleAction" ]]
			-- upvalues: var11 (copy), configModule (copy), var13 (copy), var12 (copy), getTabFocusBehaviorModule (copy), var14 (copy), focusChatHotKeyActivatedModule (copy)
			if not var11 then
				return Enum.ContextActionResult.Pass
			elseif p3 ~= Enum.UserInputState.Begin or p4 == nil then
				return Enum.ContextActionResult.Pass
			end
			local keyCode = p4.KeyCode
			
			if keyCode ~= configModule.ChatInputBarDefaultFocusKeyCode and keyCode ~= var13 then
				return Enum.ContextActionResult.Pass
			elseif var12 == nil then
				return Enum.ContextActionResult.Pass
			end
			local var15 = getTabFocusBehaviorModule(var12)
			
			if var15.shouldProceed then
				var14(focusChatHotKeyActivatedModule())
				
				return var15.onFocusKeyPressed(keyCode)
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.UserInputType.Keyboard)
		
		return function() --[[ line: 103 ]]
			-- upvalues: contextActionService_1 (copy)
			contextActionService_1:UnbindCoreAction("ExpChatFocusHotKey")
		end
	end, {
		var11,
		var12,
		var13,
		contextActionService_1,
		var14
	})
	
	return nil
end