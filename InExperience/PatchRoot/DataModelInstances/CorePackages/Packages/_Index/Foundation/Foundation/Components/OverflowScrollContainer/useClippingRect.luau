local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local flagsModule = require(foundation.Utility.Flags)
local wrappersModule = require(foundation.Utility.Wrappers)
local connection = wrappersModule.Connection
local instance = wrappersModule.Instance
local signal = wrappersModule.Signal

return function(p1)
	-- upvalues: reactModule (ref), flagsModule (ref), signal (ref), instance (ref), connection (ref)
	local var1, var2 = reactModule.useBinding(Rect.new(Vector2.zero, Vector2.zero))
	local var3, var4 = reactModule.useState(true)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), flagsModule (copy), var4 (ref), var2 (ref), signal (copy), instance (copy), connection (copy)
		local current = p1.current
		
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
		if flagsModule.FoundationUnifiedScrimScrolling then
			var4(var5 ~= nil)
		end
		if not var5 then
			if flagsModule.FoundationUnifiedScrimScrolling then
				var5 = current
			else
				local layerCollector = current:FindFirstAncestorWhichIsA("LayerCollector")
				
				if layerCollector and layerCollector:IsA("GuiBase2d") then
					var5 = layerCollector
				end
			end
		end
		local function update()
			-- upvalues: var5 (write), current (ref), var2 (copy)
			if var5 then
				local absolutePosition = current.AbsolutePosition
				var2(Rect.new(var5.AbsolutePosition - absolutePosition, var5.AbsolutePosition + var5.AbsoluteSize - absolutePosition))
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
			var2(Rect.new(var5.AbsolutePosition - absolutePosition, var5.AbsolutePosition + var5.AbsoluteSize - absolutePosition))
		end
		return function()
			-- upvalues: list (ref), connection (copy)
			for i, v in list do
				connection.Disconnect(v)
			end
		end
	end, {})
	
	return var1, var3
end