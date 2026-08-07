local runService = game:GetService("RunService")
local reactModule = require(script:FindFirstAncestor("CollectionViews").Parent.React)

return function(p0, p1) --[[ line: 9 | named "useCarouselScrollingBinding" ]]
	-- upvalues: reactModule (ref), runService (ref)
	local var2, var3 = reactModule.useBinding(false)
	reactModule.useEffect(function() --[[ line: 15 ]]
		-- upvalues: p0 (ref), p1 (ref), var3 (ref), runService (copy)
		local current = p0.current
		
		if p1 and current then
			assert(current, "scrollingFrame must exist")
			local var4 = 0
			local var5 = nil
			local var6 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ line: 25 ]]
				-- upvalues: var4 (write), var5 (write), var3 (copy), runService (copy)
				var4 = os.clock() + 0.01
				
				if not var5 then
					var3(true)
					var5 = runService.Heartbeat:Connect(function() --[[ line: 29 ]]
						-- upvalues: var4 (copy), var3 (copy), var5 (copy)
						if var4 <= os.clock() then
							var3(false)
							
							if var5 then
								var5:Disconnect()
								var5 = nil
							end
						end
					end)
				end
			end)
			
			return function() --[[ line: 41 ]]
				-- upvalues: var6 (ref), var5 (write)
				var6:Disconnect()
				
				if var5 then
					var5:Disconnect()
				end
			end
		end
		return nil
	end, { p0 })
	
	return var2
end