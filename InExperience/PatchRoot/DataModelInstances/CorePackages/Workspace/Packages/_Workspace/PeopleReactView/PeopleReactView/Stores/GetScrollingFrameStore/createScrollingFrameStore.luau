local parent = script:FindFirstAncestor("PeopleReactView").Parent
local signalsModule = require(parent.Signals)
local fFlagFixVirtualizedGridNumItems = require(parent.PeopleService).getService("Flags").FFlagFixVirtualizedGridNumItems

return function()
	-- upvalues: signalsModule (ref), fFlagFixVirtualizedGridNumItems (ref)
	local var1, var2 = signalsModule.createSignal(0)
	local var3, var4 = signalsModule.createSignal(0)
	local var5, var6 = signalsModule.createSignal(0)
	local var7 = nil
	local var8 = nil
	
	if fFlagFixVirtualizedGridNumItems then
		local var9, var10 = signalsModule.createSignal(0)
		var7 = var9
		var8 = var10
	end
	local var11 = if fFlagFixVirtualizedGridNumItems then signalsModule.createComputed(function(p0)
		-- upvalues: var5 (ref), var7 (write)
		return var5(p0) + var7(p0)
	end) else nil
	local var12 = nil
	local var13 = nil
	local var14 = nil
	
	return {
		getAbsolutePositionY = var1,
		getAbsoluteSizeY = var3,
		getCanvasPositionY = if fFlagFixVirtualizedGridNumItems then var11 else var5,
		setScrollingFrame = function(p1)
			-- upvalues: var12 (write), var13 (write), var14 (write), var2 (ref), var4 (ref), var6 (ref)
			if var12 then
				var12:Disconnect()
			end
			if var13 then
				var13:Disconnect()
			end
			if var14 then
				var14:Disconnect()
			end
			var2(p1.AbsolutePosition.Y)
			var4(p1.AbsoluteSize.Y)
			var6(p1.CanvasPosition.Y)
			var12 = p1:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: var2 (copy), p1 (ref)
				var2(p1.AbsolutePosition.Y)
			end)
			var13 = p1:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var4 (copy), p1 (ref)
				var4(p1.AbsoluteSize.Y)
			end)
			var14 = p1:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: var6 (copy), p1 (ref)
				var6(p1.CanvasPosition.Y)
			end)
		end,
		setCanvasPositionYOffset = if fFlagFixVirtualizedGridNumItems then var8 else nil,
		cleanUp = function()
			-- upvalues: var12 (write), var13 (write), var14 (write)
			if var12 then
				var12:Disconnect()
			end
			if var13 then
				var13:Disconnect()
			end
			if var14 then
				var14:Disconnect()
			end
		end
	}
end