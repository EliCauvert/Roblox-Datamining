local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local wrappersModule = require(foundation.Utility.Wrappers)
local connection = wrappersModule.Connection
local instance = wrappersModule.Instance
local signal = wrappersModule.Signal

return function(p1)
	-- upvalues: reactModule (ref), signal (ref), instance (ref), connection (ref)
	local var1, var2 = reactModule.useBinding(Rect.new(Vector2.zero, Vector2.zero))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), signal (copy), instance (copy), connection (copy)
		local current = p1.current
		
		if not current or not current:IsA("GuiObject") then return end
		local var3 = nil
		local parent = current.Parent
		while parent do
			if not parent:IsA("GuiObject") or not parent.ClipsDescendants then
				parent = parent.Parent
				continue
			end
			var3 = parent
			break
		end
		if not var3 then
			local layerCollector = current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if layerCollector and layerCollector:IsA("GuiBase2d") then
				var3 = layerCollector
			end
		end
		local function update()
			-- upvalues: var3 (write), current (ref), var2 (copy)
			if var3 then
				local absolutePosition = current.AbsolutePosition
				var2(Rect.new(var3.AbsolutePosition - absolutePosition, var3.AbsolutePosition + var3.AbsoluteSize - absolutePosition))
			end
		end
		
		local list = {
			signal.Connect(instance.GetPropertyChangedSignal(current, "AbsolutePosition"), update)
		}
		
		if var3 then
			table.insert(list, signal.Connect(instance.GetPropertyChangedSignal(var3, "AbsolutePosition"), update))
			table.insert(list, signal.Connect(instance.GetPropertyChangedSignal(var3, "AbsoluteSize"), update))
		end
		if var3 then
			local absolutePosition = current.AbsolutePosition
			var2(Rect.new(var3.AbsolutePosition - absolutePosition, var3.AbsolutePosition + var3.AbsoluteSize - absolutePosition))
		end
		return function()
			-- upvalues: list (ref), connection (copy)
			for i, v in list do
				connection.Disconnect(v)
			end
		end
	end, {})
	
	return var1
end