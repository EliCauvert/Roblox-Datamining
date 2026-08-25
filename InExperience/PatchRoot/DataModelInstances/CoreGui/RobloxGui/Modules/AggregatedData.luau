local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	
	return t_1
end

local function _(value)
	return value:find("rbxassetid://")
end

function t:addPlay(p0, p1, p2)
	if not p0:find("rbxassetid://") then return end
	local var2 = p0:sub(14)
	
	if self[var2] == nil then
		self[var2] = { playtime = p1, loopcount = p2 }
		
		return
	end
	self[var2].playtime += p1
	self[var2].loopcount += p2
end

return t