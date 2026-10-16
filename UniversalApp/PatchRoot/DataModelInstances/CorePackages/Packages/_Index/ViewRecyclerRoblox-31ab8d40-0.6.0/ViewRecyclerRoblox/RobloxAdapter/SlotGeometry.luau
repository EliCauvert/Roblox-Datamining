local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local Axis = require(ViewRecyclerRoblox.Parent.ViewRecycler).Axis
local AxisMapModule = require(ViewRecyclerRoblox.RobloxAdapter.axisMap)
local SlotGeometryModule = {}

function SlotGeometryModule.get(p1, p2, p3, p4) --[[ Line: 11 ]]
	-- upvalues: SlotGeometryModule (copy), AxisMapModule (copy)
	if p1 ~= nil then
		return AxisMapModule.positionFor(p1, p2, p4), AxisMapModule.sizeFor(p1, p2, p3)
	elseif p3 then
		return UDim2.new(), SlotGeometryModule.getHostSize(SlotGeometryModule.getAutomaticSize(p2, true))
	else
		return UDim2.new(), UDim2.new()
	end
end

function SlotGeometryModule.getAutomaticSize(Y, p1) --[[ Line: 26 ]]
	-- upvalues: Axis (copy)
	return if p1 then if Y == Axis.Y then Enum.AutomaticSize.Y else Enum.AutomaticSize.X else Enum.AutomaticSize.None
end

function SlotGeometryModule.getHostSize(AutomaticSize): UDim2 --[[ Line: 33 ]]
	return if AutomaticSize == Enum.AutomaticSize.None then UDim2.fromScale(1, 1) elseif AutomaticSize == Enum.AutomaticSize.X then UDim2.fromScale(0, 1) elseif AutomaticSize == Enum.AutomaticSize.Y then UDim2.fromScale(1, 0) else UDim2.new()
end

return SlotGeometryModule