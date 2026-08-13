local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local wrappersModule = require(foundation.Utility.Wrappers)
local guiService = wrappersModule.Services.GuiService
local userInputService = wrappersModule.Services.UserInputService
local reactModule = require(parent.React)

return function(p0) --[[ line: 11 | named "useKeyboardAwareSize" ]]
	-- upvalues: reactModule (ref), userInputService (ref), guiService (ref)
	local var3, var4 = reactModule.useBinding(UDim2.fromScale(1, 1))
	reactModule.useLayoutEffect(function() --[[ line: 14 ]]
		-- upvalues: p0 (ref), userInputService (copy), var4 (ref), guiService (copy), var3 (ref)
		if p0 then
			local function updateSafeAreaSize() --[[ line: 19 ]]
				-- upvalues: userInputService (copy), var4 (copy), guiService (copy), p0 (copy), var3 (copy)
				if not userInputService.OnScreenKeyboardVisible then
					var4(UDim2.fromScale(1, 1))
					
					return
				end
				local uDim2 = UDim2.new(1, 0, 1, -(p0.AbsolutePosition.Y + p0.AbsoluteSize.Y - (userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y)))
				
				if var3:getValue() ~= uDim2 then
					var4(uDim2)
				end
			end
			
			updateSafeAreaSize()
			local var6 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateSafeAreaSize)
			local var7 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateSafeAreaSize)
			local var8 = p0:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSafeAreaSize)
			
			return function() --[[ line: 48 ]]
				-- upvalues: var6 (ref), var7 (ref), var8 (ref)
				var6:Disconnect()
				var7:Disconnect()
				var8:Disconnect()
			end
		end
	end, { p0 })
	
	return var3
end