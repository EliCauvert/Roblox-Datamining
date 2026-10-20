local TextChatService = game:GetService("TextChatService")
local IsHistoricalMessageModule = require(script:FindFirstAncestor("ExpChat").isHistoricalMessage)

local function _(p1, Callback): boolean
	local Success, Result = pcall(function()
		-- upvalues: p1 (copy)
		return p1.CoreMessageReceived
	end)
	
	if Success and Result then
		Result:Connect(Callback)
		
		return true
	else
		return false
	end
end

return function(Callback, p1)
	-- upvalues: TextChatService (copy), IsHistoricalMessageModule (copy)
	local Service = p1 and p1.service or TextChatService
	local Defer = p1 and p1.defer or function(Callback)
		task.defer(Callback)
	end
	local List = {}
	local Flag = false
	
	local function flush()
		-- upvalues: Flag (ref), List (ref), Callback (copy)
		Flag = false
		local List1 = List
		List = {}
		Callback(List1)
	end
	
	local function Callback1(p2)
		-- upvalues: IsHistoricalMessageModule (upval), List (ref), Flag (ref), Defer (copy), flush (copy)
		if not IsHistoricalMessageModule(p2) or p2.TextSource == nil then return end
		table.insert(List, p2)
		
		if not Flag then
			Flag = true
			Defer(flush)
		end
	end
	
	local Success, Result = pcall(function()
		-- upvalues: Service (copy)
		return Service.CoreMessageReceived
	end)
	local Flag1 = nil
	
	if Success and Result then
		Result:Connect(Callback1)
		Flag1 = true
	else
		Flag1 = false
	end
	if Flag1 then
		pcall(function()
			-- upvalues: Service (copy)
			Service:ChatIsLoaded()
		end)
	end
end