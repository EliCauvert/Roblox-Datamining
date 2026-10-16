local Foundation = script:FindFirstAncestor("Foundation")
local WrappersModule = require(Foundation.Utility.Wrappers)
local GuiService = WrappersModule.Services.GuiService
local UserInputService = WrappersModule.Services.UserInputService
local ReactModule = require(Foundation.Parent.React)

return function(Frame: Frame) --[[ Line: 11 | Named "useKeyboardAwareSize" ]]
	-- upvalues: ReactModule (copy), UserInputService (copy), GuiService (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 1))
	ReactModule.useLayoutEffect(function() --[[ Line: 14 ]]
		-- upvalues: Frame (copy), UserInputService (upval), UseBindingResult2 (copy), GuiService (upval), UseBindingResult (copy)
		if not Frame then return end
		local function updateSafeAreaSize() --[[ Line: 19 ]]
			-- upvalues: UserInputService (upval), UseBindingResult2 (upval), GuiService (upval), Frame (upval), UseBindingResult (upval)
			if not UserInputService.OnScreenKeyboardVisible then
				UseBindingResult2(UDim2.fromScale(1, 1))
				
				return
			end
			local _UDim2 = UDim2.new(1, 0, 1, -(Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y - (UserInputService.OnScreenKeyboardPosition.Y - GuiService:GetGuiInset().Y)))
			
			if UseBindingResult:getValue() ~= _UDim2 then
				UseBindingResult2(_UDim2)
			end
		end
		
		updateSafeAreaSize()
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateSafeAreaSize)
		local Connection1 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateSafeAreaSize)
		local Connection2 = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSafeAreaSize)
		
		return function() --[[ Line: 48 ]]
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Connection2:Disconnect()
		end
	end, { Frame })
	
	return UseBindingResult
end