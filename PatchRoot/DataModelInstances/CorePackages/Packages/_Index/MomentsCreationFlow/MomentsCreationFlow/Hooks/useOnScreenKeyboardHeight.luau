-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local reactModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.React)
local userInputService = game:GetService("UserInputService")
local useEffect = reactModule.useEffect
local useState = reactModule.useState

return function() --[[ line: 10 ]]
	-- upvalues: useState (ref), useEffect (ref), userInputService (ref)
	local var2, var3 = useState(0)
	useEffect(function() --[[ line: 13 ]]
		-- upvalues: userInputService (copy), var3 (ref)
		local var4 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ line: 15 ]]
			-- upvalues: var3 (copy), userInputService (copy)
			var3(if userInputService.OnScreenKeyboardVisible then userInputService.OnScreenKeyboardSize.Y else 0)
		end)
		
		return function() --[[ line: 20 ]]
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return var2
end