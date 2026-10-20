local _ = script.Parent
local Module = {}
Module.__index = Module

function Module.SendMessage(p1, p2, p3)
	p1.SayMessageRequest:FireServer(p2, p3)
end

function Module.RegisterSayMessageFunction(p1, SayMessageRequest)
	p1.SayMessageRequest = SayMessageRequest
end

return ({
	new = function()
		-- upvalues: Module (copy)
		local self = setmetatable({}, Module)
		self.SayMessageRequest = nil
		
		return self
	end
}).new()