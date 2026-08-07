local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local reactModule = require(script:FindFirstAncestor("ToastNotification").Parent.React)

return function(p0, p1, p2, p3, p4) --[[ line: 14 | named "useKeyCodeHold" ]]
	-- upvalues: reactModule (ref), userInputService (ref), runService (ref)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useBinding(0)
	local var7 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 25 ]]
		-- upvalues: p4 (ref), userInputService (copy), p0 (ref), var4 (ref)
		if p4 then
			return
		end
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p5, p6) --[[ line: 30 ]]
			-- upvalues: p0 (copy), var4 (copy)
			if p6 then return end
			if p5.KeyCode == p0 then
				var4(true)
			end
		end)
		local inputEndedConnection = userInputService.InputEnded:Connect(function(p7) --[[ line: 40 ]]
			-- upvalues: p0 (copy), var4 (copy)
			if p7.KeyCode == p0 then
				var4(false)
			end
		end)
		
		return function() --[[ line: 46 ]]
			-- upvalues: inputBeganConnection (ref), inputEndedConnection (ref), var4 (copy)
			inputBeganConnection:Disconnect()
			inputEndedConnection:Disconnect()
			var4(false)
		end
	end, { p4, p0 })
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: var3 (ref), var7 (ref), runService (copy), p1 (ref), p2 (ref), p3 (ref), var6 (ref)
		if var3 then
			local function _() --[[ line: 58 | named "disconnect" ]]
				-- upvalues: var7 (copy)
				if var7.current then
					var7.current:Disconnect()
					var7.current = nil
				end
			end
			
			local var10 = 0
			var7.current = runService.Heartbeat:Connect(function(p8) --[[ line: 66 ]]
				-- upvalues: var10 (write), p1 (copy), p2 (copy), var7 (copy), p3 (copy), var6 (copy)
				var10 += p8
				
				if var10 < p1 then return end
				if p2 == 0 then
					if var7.current then
						var7.current:Disconnect()
						var7.current = nil
					end
					p3()
					
					return
				else
					local clampedValue = math.clamp((var10 - p1) / p2, 0, 1)
					var6(clampedValue)
					
					if clampedValue >= 1 then
						if var7.current then
							var7.current:Disconnect()
							var7.current = nil
						end
						p3()
					end
				end
			end)
			
			return function() --[[ line: 89 ]]
				-- upvalues: var7 (copy), var6 (copy)
				if var7.current then
					var7.current:Disconnect()
					var7.current = nil
				end
				var6(0)
			end
		end
	end, { var3, p3, p1, p2 })
	
	return { holding = var3, holdProgress = var5 }
end