local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local WrappersModule = require(Foundation.Utility.Wrappers)
local Connection = WrappersModule.Connection
local WrappersModuleInstance = WrappersModule.Instance
local Signal = WrappersModule.Signal

return function(p1) --[[ Line: 21 | Named "useClippingRect" ]]
	-- upvalues: ReactModule (copy), FlagsModule (copy), Signal (copy), WrappersModuleInstance (copy), Connection (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Rect.new(Vector2.zero, Vector2.zero))
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	ReactModule.useEffect(function() --[[ Line: 27 ]]
		-- upvalues: p1 (copy), FlagsModule (upval), UseStateResult2 (copy), UseBindingResult2 (copy), Signal (upval), WrappersModuleInstance (upval), Connection (upval)
		local Current = p1.current
		
		if not Current or not Current:IsA("GuiObject") then return end
		local Frame = nil
		local Parent = Current.Parent
		while Parent do
			if not Parent:IsA("GuiObject") or not Parent.ClipsDescendants then
				Parent = Parent.Parent
				continue
			end
			Frame = Parent
			break
		end
		if FlagsModule.FoundationUnifiedScrimScrolling then
			UseStateResult2(Frame ~= nil)
		end
		if not Frame then
			if FlagsModule.FoundationUnifiedScrimScrolling then
				Frame = Current
			else
				local LayerCollector = Current:FindFirstAncestorWhichIsA("LayerCollector")
				
				if LayerCollector and LayerCollector:IsA("GuiBase2d") then
					Frame = LayerCollector
				end
			end
		end
		local function update() --[[ Line: 58 ]]
			-- upvalues: Frame (ref), Current (copy), UseBindingResult2 (upval)
			if Frame then
				local AbsolutePosition = Current.AbsolutePosition
				UseBindingResult2(Rect.new(Frame.AbsolutePosition - AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize - AbsolutePosition))
			end
		end
		
		local ConnectResults = {
			Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(Current, "AbsolutePosition"), update)
		}
		
		if Frame then
			table.insert(ConnectResults, Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(Frame, "AbsolutePosition"), update))
			table.insert(ConnectResults, Signal.Connect(WrappersModuleInstance.GetPropertyChangedSignal(Frame, "AbsoluteSize"), update))
		end
		if Frame then
			local AbsolutePosition = Current.AbsolutePosition
			UseBindingResult2(Rect.new(Frame.AbsolutePosition - AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize - AbsolutePosition))
		end
		return function() --[[ Line: 86 ]]
			-- upvalues: ConnectResults (copy), Connection (upval)
			for _, connectResult in ConnectResults do
				Connection.Disconnect(connectResult)
			end
		end
	end, {})
	
	return UseBindingResult, UseStateResult
end