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

local function selectIsChatHotkeyEnabled(p1)
	return p1.ChatVisibility.isChatHotkeyEnabled.value
end

local function selectDevDefinedFocusKeyCode(p1)
	return p1.ChatLayout.ChatInputBarSettings.KeyboardKeyCode
end

return function(p1)
	-- upvalues: contextActionService (ref), useSelector (ref), selectIsChatHotkeyEnabled (ref), useSelectedTabTypeModule (ref), selectDevDefinedFocusKeyCode (ref), useDispatch (ref), reactModule (ref), configModule (ref), getTabFocusBehaviorModule (ref), focusChatHotKeyActivatedModule (ref)
	local contextActionService_1 = p1.contextActionService or contextActionService
	local var1 = useSelector(selectIsChatHotkeyEnabled)
	local var2 = useSelectedTabTypeModule()
	local var3 = useSelector(selectDevDefinedFocusKeyCode)
	local var4 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), configModule (copy), var3 (ref), var2 (ref), getTabFocusBehaviorModule (copy), var4 (ref), focusChatHotKeyActivatedModule (copy), contextActionService_1 (ref)
		contextActionService_1:BindCoreAction("ExpChatFocusHotKey", function(_, p2, p3)
			-- upvalues: var1 (copy), configModule (copy), var3 (copy), var2 (copy), getTabFocusBehaviorModule (copy), var4 (copy), focusChatHotKeyActivatedModule (copy)
			if not var1 then
				return Enum.ContextActionResult.Pass
			elseif p2 ~= Enum.UserInputState.Begin or p3 == nil then
				return Enum.ContextActionResult.Pass
			end
			local keyCode = p3.KeyCode
			
			if keyCode ~= configModule.ChatInputBarDefaultFocusKeyCode and keyCode ~= var3 then
				return Enum.ContextActionResult.Pass
			elseif var2 == nil then
				return Enum.ContextActionResult.Pass
			end
			local var5 = getTabFocusBehaviorModule(var2)
			
			if var5.shouldProceed then
				var4(focusChatHotKeyActivatedModule())
				
				return var5.onFocusKeyPressed(keyCode)
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.UserInputType.Keyboard)
		
		return function()
			-- upvalues: contextActionService_1 (copy)
			contextActionService_1:UnbindCoreAction("ExpChatFocusHotKey")
		end
	end, {
		var1,
		var2,
		var3,
		contextActionService_1,
		var4
	})
	
	return nil
end