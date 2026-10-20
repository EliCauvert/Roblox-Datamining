local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Rect.new(Vector2.zero, Vector2.zero))
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseBindingResult2 (copy)
		if not p1.current then return end
		local Frame = nil
		local Parent = p1.current.Parent
		while Parent do
			if not Parent:IsA("GuiObject") or not Parent.ClipsDescendants then
				Parent = Parent.Parent
				continue
			end
			Frame = Parent
			break
		end
		if not Frame then
			local LayerCollector = p1.current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if LayerCollector and LayerCollector:IsA("GuiBase2d") then
				Frame = LayerCollector
			end
		end
		local function update()
			-- upvalues: Frame (ref), UseBindingResult2 (upval)
			if Frame then
				UseBindingResult2(Rect.new(Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize))
			end
		end
		
		local List = {}
		
		if Frame then
			table.insert(List, Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(update))
			table.insert(List, Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(update))
		end
		if Frame then
			UseBindingResult2(Rect.new(Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {})
	
	return UseBindingResult
end