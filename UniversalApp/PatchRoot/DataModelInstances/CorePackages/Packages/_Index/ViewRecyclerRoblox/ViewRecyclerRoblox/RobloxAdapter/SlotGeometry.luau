local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local axis = require(viewRecyclerRoblox.Parent.ViewRecycler).Axis
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)
local t = {}

function t.get(p1, p2, p3, p4)
	-- upvalues: t (ref), axisMapModule (ref)
	if p1 ~= nil then
		return axisMapModule.positionFor(p1, p2, p4), axisMapModule.sizeFor(p1, p2, p3)
	elseif p3 then
		return UDim2.new(), t.getHostSize(t.getAutomaticSize(p2, true))
	end
	return UDim2.new(), UDim2.new()
end

function t.getAutomaticSize(p1, p2)
	-- upvalues: axis (ref)
	return if p2 then if p1 == axis.Y then Enum.AutomaticSize.Y else Enum.AutomaticSize.X else Enum.AutomaticSize.None
end

function t.getHostSize(p1)
	return if p1 == Enum.AutomaticSize.None then UDim2.fromScale(1, 1) elseif p1 == Enum.AutomaticSize.X then UDim2.fromScale(0, 1) elseif p1 == Enum.AutomaticSize.Y then UDim2.fromScale(1, 0) else UDim2.new()
end

return t