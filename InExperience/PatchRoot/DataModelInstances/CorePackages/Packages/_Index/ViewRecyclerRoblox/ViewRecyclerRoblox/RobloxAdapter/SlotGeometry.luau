local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local axis = require(viewRecyclerRoblox.Parent.ViewRecycler).Axis
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)
local t = {}

function t.get(p0, p1, p2, p3)
	-- upvalues: t (ref), axisMapModule (ref)
	if p0 ~= nil then
		return axisMapModule.positionFor(p0, p1, p3), axisMapModule.sizeFor(p0, p1, p2)
	elseif p2 then
		return UDim2.new(), t.getHostSize(t.getAutomaticSize(p1, true))
	end
	return UDim2.new(), UDim2.new()
end

function t.getAutomaticSize(p4, p5)
	-- upvalues: axis (ref)
	return if p5 then if p4 == axis.Y then Enum.AutomaticSize.Y else Enum.AutomaticSize.X else Enum.AutomaticSize.None
end

function t.getHostSize(p6)
	return if p6 == Enum.AutomaticSize.None then UDim2.fromScale(1, 1) elseif p6 == Enum.AutomaticSize.X then UDim2.fromScale(0, 1) elseif p6 == Enum.AutomaticSize.Y then UDim2.fromScale(1, 0) else UDim2.new()
end

return t