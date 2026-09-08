local reactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)
local userInputService = game:GetService("UserInputService")
local useEffect = reactModule.useEffect
local useState = reactModule.useState

return function(p1)
	-- upvalues: useState (ref), useEffect (ref), userInputService (ref)
	local var1, var2 = useState(false)
	useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), userInputService (copy)
		if p1 then
			local t = {}
			
			local function _()
				-- upvalues: t (ref), var2 (copy)
				local var3 = 0
				
				for i in t do
					var3 += 1
				end
				var2(var3 >= 2)
			end
			
			local touchStartedConnection = userInputService.TouchStarted:Connect(function(p2)
				-- upvalues: t (ref), var2 (copy)
				t[p2] = true
				local var4 = 0
				
				for i in t do
					var4 += 1
				end
				var2(var4 >= 2)
			end)
			local touchEndedConnection = userInputService.TouchEnded:Connect(function(p3)
				-- upvalues: t (ref), var2 (copy)
				t[p3] = nil
				local var5 = 0
				
				for i in t do
					var5 += 1
				end
				var2(var5 >= 2)
			end)
			
			return function()
				-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref)
				touchStartedConnection:Disconnect()
				touchEndedConnection:Disconnect()
			end
		end
		var2(false)
		
		return nil
	end, { p1 })
	
	return var1
end