local PositionModule = {}
PositionModule.__index = PositionModule

function PositionModule.new(LineIndex, Index)
	-- upvalues: PositionModule (copy)
	return (setmetatable({ lineIndex = LineIndex, index = Index }, PositionModule))
end

function PositionModule:equals(p1): boolean
	return self == p1 or p1 ~= nil and (self.lineIndex == p1.lineIndex and self.index == p1.index)
end

local function _(p1, p2): number
	return if p1 < p2 then -1 elseif p1 == p2 then 0 else 1
end

function PositionModule:compareTo(p1): number
	local LineIndex = self.lineIndex
	local LineIndex1 = p1.lineIndex
	local v1: number = if LineIndex < LineIndex1 then -1 elseif LineIndex == LineIndex1 then 0 else 1
	
	if v1 == 0 then
		local Index = self.index
		local Index1 = p1.index
		
		return if Index < Index1 then -1 elseif Index == Index1 then 0 else 1
	else
		return v1
	end
end

return PositionModule