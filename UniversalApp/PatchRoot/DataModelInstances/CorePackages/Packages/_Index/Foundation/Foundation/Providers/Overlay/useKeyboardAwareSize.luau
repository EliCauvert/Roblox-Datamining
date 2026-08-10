local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local wrappersModule = require(foundation.Utility.Wrappers)
local guiService = wrappersModule.Services.GuiService
local userInputService = wrappersModule.Services.UserInputService
local flagsModule = require(foundation.Utility.Flags)
local reactModule = require(parent.React)

return function(p0) --[[ line: 13 | named "useKeyboardAwareSize" ]]
	-- upvalues: reactModule (ref), userInputService (ref), guiService (ref), flagsModule (ref)
	local var4, var5 = reactModule.useBinding(UDim2.fromScale(1, 1))
	reactModule.useLayoutEffect(function() --[[ line: 16 ]]
		-- upvalues: p0 (ref), userInputService (copy), var5 (ref), guiService (copy), flagsModule (copy), var4 (ref)
		if p0 then
			local function updateSafeAreaSize() --[[ line: 21 ]]
				-- upvalues: userInputService (copy), var5 (copy), guiService (copy), p0 (copy), flagsModule (copy), var4 (copy)
				if not userInputService.OnScreenKeyboardVisible then
					var5(UDim2.fromScale(1, 1))
					
					return
				end
				local var10 = p0.AbsolutePosition.Y + p0.AbsoluteSize.Y - (userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y)
				
				if flagsModule.FoundationOverlayKeyboardAwarenessHardened then
					local uDim2 = UDim2.new(1, 0, 1, -var10)
					
					if var4:getValue() == uDim2 then
						return
					else
						var5(uDim2)
						
						return
					end
				else
					var5(var4:getValue() - UDim2.fromOffset(0, var10))
				end
			end
			
			updateSafeAreaSize()
			local var7 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateSafeAreaSize)
			local var8 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateSafeAreaSize)
			local var9 = if flagsModule.FoundationOverlayKeyboardAwarenessHardened then p0:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSafeAreaSize) else nil
			
			return function() --[[ line: 58 ]]
				-- upvalues: var7 (ref), var8 (ref), flagsModule (copy), var9 (write)
				var7:Disconnect()
				var8:Disconnect()
				
				if flagsModule.FoundationOverlayKeyboardAwarenessHardened then
					var9:Disconnect()
				end
			end
		end
	end, { p0 })
	
	return var4
end