local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local wrappersModule = require(foundation.Utility.Wrappers)
local guiService = wrappersModule.Services.GuiService
local userInputService = wrappersModule.Services.UserInputService
local reactModule = require(parent.React)

return function(p1)
	-- upvalues: reactModule (ref), userInputService (ref), guiService (ref)
	local var1, var2 = reactModule.useBinding(UDim2.fromScale(1, 1))
	reactModule.useLayoutEffect(function()
		-- upvalues: p1 (ref), userInputService (copy), var2 (ref), guiService (copy), var1 (ref)
		if p1 then
			local function updateSafeAreaSize()
				-- upvalues: userInputService (copy), var2 (copy), guiService (copy), p1 (copy), var1 (copy)
				if not userInputService.OnScreenKeyboardVisible then
					var2(UDim2.fromScale(1, 1))
					
					return
				end
				local uDim2 = UDim2.new(1, 0, 1, -(p1.AbsolutePosition.Y + p1.AbsoluteSize.Y - (userInputService.OnScreenKeyboardPosition.Y - guiService:GetGuiInset().Y)))
				
				if var1:getValue() ~= uDim2 then
					var2(uDim2)
				end
			end
			
			updateSafeAreaSize()
			local var3 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateSafeAreaSize)
			local var4 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateSafeAreaSize)
			local var5 = p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSafeAreaSize)
			
			return function()
				-- upvalues: var3 (ref), var4 (ref), var5 (ref)
				var3:Disconnect()
				var4:Disconnect()
				var5:Disconnect()
			end
		end
	end, { p1 })
	
	return var1
end