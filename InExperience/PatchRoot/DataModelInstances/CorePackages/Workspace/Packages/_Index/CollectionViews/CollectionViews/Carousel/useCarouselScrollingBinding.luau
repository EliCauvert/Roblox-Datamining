local runService = game:GetService("RunService")
local reactModule = require(script:FindFirstAncestor("CollectionViews").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref), runService (ref)
	local var1, var2 = reactModule.useBinding(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), var2 (ref), runService (copy)
		local current = p1.current
		
		if p2 and current then
			assert(current, "scrollingFrame must exist")
			local var3 = 0
			local var4 = nil
			local var5 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var3 (write), var4 (write), var2 (copy), runService (copy)
				var3 = os.clock() + 0.01
				
				if not var4 then
					var2(true)
					var4 = runService.Heartbeat:Connect(function()
						-- upvalues: var3 (copy), var2 (copy), var4 (copy)
						if var3 <= os.clock() then
							var2(false)
							
							if var4 then
								var4:Disconnect()
								var4 = nil
							end
						end
					end)
				end
			end)
			
			return function()
				-- upvalues: var5 (ref), var4 (write)
				var5:Disconnect()
				
				if var4 then
					var4:Disconnect()
				end
			end
		end
		return nil
	end, { p1 })
	
	return var1
end