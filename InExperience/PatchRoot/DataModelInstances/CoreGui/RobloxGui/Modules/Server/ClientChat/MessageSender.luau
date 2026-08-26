local t = {}
local _ = script.Parent
local t_1 = {}
t_1.__index = t_1

function t_1.SendMessage(p1, p2, p3)
	p1.SayMessageRequest:FireServer(p2, p3)
end

function t_1.RegisterSayMessageFunction(p1, p2)
	p1.SayMessageRequest = p2
end

function t.new()
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.SayMessageRequest = nil
	
	return tbl
end

return t.new()