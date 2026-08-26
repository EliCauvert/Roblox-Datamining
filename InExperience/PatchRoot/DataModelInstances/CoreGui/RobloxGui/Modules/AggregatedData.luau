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

function t:addPlay(p1, p2, p3)
	if not p1:find("rbxassetid://") then return end
	local var1 = p1:sub(14)
	
	if self[var1] == nil then
		self[var1] = { playtime = p2, loopcount = p3 }
		
		return
	end
	self[var1].playtime += p2
	self[var1].loopcount += p3
end

return t