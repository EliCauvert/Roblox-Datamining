local t = {}
local _ = script.Parent
local t_1 = {}
t_1.__index = t_1

function t_1.SendMessage(p0, p1, p2) --[[ line: 15 ]]
	p0.SayMessageRequest:FireServer(p1, p2)
end

function t_1.RegisterSayMessageFunction(p3, p4) --[[ line: 19 ]]
	p3.SayMessageRequest = p4
end

function t.new() --[[ line: 26 ]]
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.SayMessageRequest = nil
	
	return tbl
end

return t.new()