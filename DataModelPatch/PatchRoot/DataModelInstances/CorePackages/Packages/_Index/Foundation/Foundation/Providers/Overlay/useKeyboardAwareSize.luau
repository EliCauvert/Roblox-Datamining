local Foundation = script:FindFirstAncestor("Foundation")
local WrappersModule = require(Foundation.Utility.Wrappers)
local GuiService = WrappersModule.Services.GuiService
local UserInputService = WrappersModule.Services.UserInputService
local FlagsModule = require(Foundation.Utility.Flags)
local ReactModule = require(Foundation.Parent.React)

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), UserInputService (copy), GuiService (copy), FlagsModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.fromScale(1, 1))
	ReactModule.useLayoutEffect(function()
		-- upvalues: Frame (copy), UserInputService (upval), UseBindingResult2 (copy), GuiService (upval), FlagsModule (upval), UseBindingResult (copy)
		if not Frame then return end
		local function updateSafeAreaSize()
			-- upvalues: UserInputService (upval), UseBindingResult2 (upval), GuiService (upval), Frame (upval), FlagsModule (upval), UseBindingResult (upval)
			if not UserInputService.OnScreenKeyboardVisible then
				UseBindingResult2(UDim2.fromScale(1, 1))
				
				return
			end
			local YDelta = Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y - (UserInputService.OnScreenKeyboardPosition.Y - GuiService:GetGuiInset().Y)
			
			if FlagsModule.FoundationOverlayKeyboardAwarenessHardened then
				local _UDim2 = UDim2.new(1, 0, 1, -YDelta)
				
				if UseBindingResult:getValue() ~= _UDim2 then
					UseBindingResult2(_UDim2)
					
					return
				end
			else
				UseBindingResult2(UseBindingResult:getValue() - UDim2.fromOffset(0, YDelta))
			end
		end
		
		updateSafeAreaSize()
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateSafeAreaSize)
		local Connection1 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateSafeAreaSize)
		local Connection2 = if FlagsModule.FoundationOverlayKeyboardAwarenessHardened then Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSafeAreaSize) else nil
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy), FlagsModule (upval), Connection2 (ref)
			Connection:Disconnect()
			Connection1:Disconnect()
			
			if FlagsModule.FoundationOverlayKeyboardAwarenessHardened then
				Connection2:Disconnect()
			end
		end
	end, { Frame })
	
	return UseBindingResult
end