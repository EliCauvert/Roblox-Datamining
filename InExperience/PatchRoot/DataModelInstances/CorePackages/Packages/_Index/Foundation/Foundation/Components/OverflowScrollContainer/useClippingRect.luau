local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local wrappersModule = require(foundation.Utility.Wrappers)
local connection = wrappersModule.Connection
local instance = wrappersModule.Instance
local signal = wrappersModule.Signal

return function(p0)
	-- upvalues: reactModule (ref), signal (ref), instance (ref), connection (ref)
	local var3, var4 = reactModule.useBinding(Rect.new(Vector2.zero, Vector2.zero))
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var4 (ref), signal (copy), instance (copy), connection (copy)
		local current = p0.current
		
		if not current or not current:IsA("GuiObject") then return end
		local var5 = nil
		local parent = current.Parent
		while parent do
			if not parent:IsA("GuiObject") or not parent.ClipsDescendants then
				parent = parent.Parent
				continue
			end
			var5 = parent
			break
		end
		if not var5 then
			local layerCollector = current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if layerCollector and layerCollector:IsA("GuiBase2d") then
				var5 = layerCollector
			end
		end
		local function update()
			-- upvalues: var5 (write), current (ref), var4 (copy)
			if var5 then
				local absolutePosition = current.AbsolutePosition
				var4(Rect.new(var5.AbsolutePosition - absolutePosition, var5.AbsolutePosition + var5.AbsoluteSize - absolutePosition))
			end
		end
		
		local list = {
			signal.Connect(instance.GetPropertyChangedSignal(current, "AbsolutePosition"), update)
		}
		
		if var5 then
			table.insert(list, signal.Connect(instance.GetPropertyChangedSignal(var5, "AbsolutePosition"), update))
			table.insert(list, signal.Connect(instance.GetPropertyChangedSignal(var5, "AbsoluteSize"), update))
		end
		if var5 then
			local absolutePosition = current.AbsolutePosition
			var4(Rect.new(var5.AbsolutePosition - absolutePosition, var5.AbsolutePosition + var5.AbsoluteSize - absolutePosition))
		end
		return function()
			-- upvalues: list (ref), connection (copy)
			for i, v in list do
				connection.Disconnect(v)
			end
		end
	end, {})
	
	return var3
end