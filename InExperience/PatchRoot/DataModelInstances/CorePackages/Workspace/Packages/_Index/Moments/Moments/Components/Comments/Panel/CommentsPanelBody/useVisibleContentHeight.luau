local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useBinding(0)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), var2 (ref)
		local current = p1.current
		
		if current == nil then return end
		local function update()
			-- upvalues: current (ref), p2 (copy), var2 (copy)
			local y = current.AbsolutePosition.Y
			local var3 = y + current.AbsoluteWindowSize.Y
			
			if p2 ~= nil then
				var3 = math.min(var3, p2.AbsolutePosition.Y)
			end
			var2(math.max(0, var3 - y))
		end
		
		local y = current.AbsolutePosition.Y
		local var3 = y + current.AbsoluteWindowSize.Y
		
		if p2 ~= nil then
			var3 = math.min(var3, p2.AbsolutePosition.Y)
		end
		var2(math.max(0, var3 - y))
		local list = {
			current:GetPropertyChangedSignal("AbsolutePosition"):Connect(update),
			current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(update)
		}
		
		if p2 ~= nil then
			table.insert(list, p2:GetPropertyChangedSignal("AbsolutePosition"):Connect(update))
		end
		return function()
			-- upvalues: list (ref)
			for i, v in list do
				v:Disconnect()
			end
		end
	end, { p1, p2 })
	
	return var1
end