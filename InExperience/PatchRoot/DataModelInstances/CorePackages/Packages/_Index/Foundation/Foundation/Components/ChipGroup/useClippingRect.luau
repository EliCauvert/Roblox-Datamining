local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useBinding(Rect.new(Vector2.zero, Vector2.zero))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if not p1.current then return end
		local var3 = nil
		local parent = p1.current.Parent
		while parent do
			if not parent:IsA("GuiObject") or not parent.ClipsDescendants then
				parent = parent.Parent
				continue
			end
			var3 = parent
			break
		end
		if not var3 then
			local layerCollector = p1.current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if layerCollector and layerCollector:IsA("GuiBase2d") then
				var3 = layerCollector
			end
		end
		local function update()
			-- upvalues: var3 (write), var2 (copy)
			if var3 then
				var2(Rect.new(var3.AbsolutePosition, var3.AbsolutePosition + var3.AbsoluteSize))
			end
		end
		
		local t = {}
		
		if var3 then
			table.insert(t, var3:GetPropertyChangedSignal("AbsolutePosition"):Connect(update))
			table.insert(t, var3:GetPropertyChangedSignal("AbsoluteSize"):Connect(update))
		end
		if var3 then
			var2(Rect.new(var3.AbsolutePosition, var3.AbsolutePosition + var3.AbsoluteSize))
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	
	return var1
end