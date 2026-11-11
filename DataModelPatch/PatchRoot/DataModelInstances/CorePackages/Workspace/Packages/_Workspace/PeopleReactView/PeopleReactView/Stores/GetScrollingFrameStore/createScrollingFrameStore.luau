local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local SignalsModule = require(Parent.Signals)
local FFlagFixVirtualizedGridNumItems = require(Parent.PeopleService).getService("Flags").FFlagFixVirtualizedGridNumItems

return function()
	-- upvalues: SignalsModule (copy), FFlagFixVirtualizedGridNumItems (copy)
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Signal3, Signal2_2 = SignalsModule.createSignal(0)
	local Callback = nil
	local v1 = nil
	
	if FFlagFixVirtualizedGridNumItems then
		Callback, v9 = SignalsModule.createSignal(0)
	end
	local Computed = if FFlagFixVirtualizedGridNumItems then SignalsModule.createComputed(function(p1)
		-- upvalues: Signal3 (copy), Callback (ref)
		return Signal3(p1) + Callback(p1)
	end) else nil
	local Connection = nil
	local Connection1 = nil
	local Connection2 = nil
	
	return {
		getAbsolutePositionY = Signal,
		getAbsoluteSizeY = Signal1,
		getCanvasPositionY = if FFlagFixVirtualizedGridNumItems then Computed else Signal3,
		setScrollingFrame = function(Frame: Frame)
			-- upvalues: Connection (ref), Connection1 (ref), Connection2 (ref), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
			if Connection2 then
				Connection2:Disconnect()
			end
			Signal2(Frame.AbsolutePosition.Y)
			Signal2_1(Frame.AbsoluteSize.Y)
			Signal2_2(Frame.CanvasPosition.Y)
			Connection = Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: Signal2 (upval), Frame (copy)
				Signal2(Frame.AbsolutePosition.Y)
			end)
			Connection1 = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: Signal2_1 (upval), Frame (copy)
				Signal2_1(Frame.AbsoluteSize.Y)
			end)
			Connection2 = Frame:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: Signal2_2 (upval), Frame (copy)
				Signal2_2(Frame.CanvasPosition.Y)
			end)
		end,
		setCanvasPositionYOffset = if FFlagFixVirtualizedGridNumItems then v1 else nil,
		cleanUp = function()
			-- upvalues: Connection (ref), Connection1 (ref), Connection2 (ref)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
			if Connection2 then
				Connection2:Disconnect()
			end
		end
	}
end