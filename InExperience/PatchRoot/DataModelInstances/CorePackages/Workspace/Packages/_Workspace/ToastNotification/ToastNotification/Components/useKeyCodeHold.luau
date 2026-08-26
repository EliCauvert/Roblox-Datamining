local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local reactModule = require(script:FindFirstAncestor("ToastNotification").Parent.React)

return function(p1, p2, p3, p4, p5)
	-- upvalues: reactModule (ref), userInputService (ref), runService (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useBinding(0)
	local var5 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), userInputService (copy), p1 (ref), var2 (ref)
		if p5 then
			return
		end
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p6, p7)
			-- upvalues: p1 (copy), var2 (copy)
			if p7 then return end
			if p6.KeyCode == p1 then
				var2(true)
			end
		end)
		local inputEndedConnection = userInputService.InputEnded:Connect(function(p6)
			-- upvalues: p1 (copy), var2 (copy)
			if p6.KeyCode == p1 then
				var2(false)
			end
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref), inputEndedConnection (ref), var2 (copy)
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
			var2(false)
		end
	end, { p5, p1 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var5 (ref), runService (copy), p2 (ref), p3 (ref), p4 (ref), var4 (ref)
		if var1 then
			local function _()
				-- upvalues: var5 (copy)
				if var5.current then
					var5.current:Disconnect()
					var5.current = nil
				end
			end
			
			local var6 = 0
			var5.current = runService.Heartbeat:Connect(function(p6)
				-- upvalues: var6 (write), p2 (copy), p3 (copy), var5 (copy), p4 (copy), var4 (copy)
				var6 += p6
				
				if var6 < p2 then return end
				if p3 == 0 then
					if var5.current then
						var5.current:Disconnect()
						var5.current = nil
					end
					p4()
					
					return
				else
					local clampedValue = math.clamp((var6 - p2) / p3, 0, 1)
					var4(clampedValue)
					
					if clampedValue >= 1 then
						if var5.current then
							var5.current:Disconnect()
							var5.current = nil
						end
						p4()
					end
				end
			end)
			
			return function()
				-- upvalues: var5 (copy), var4 (copy)
				if var5.current then
					var5.current:Disconnect()
					var5.current = nil
				end
				var4(0)
			end
		end
	end, { var1, p4, p2, p3 })
	
	return { holding = var1, holdProgress = var3 }
end