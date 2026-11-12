local TextChatService = game:GetService("TextChatService")

return function(Callback, p1)
	-- upvalues: TextChatService (copy)
	local Service = p1 and p1.service or TextChatService
	local Defer = p1 and p1.defer or function(Callback)
		task.defer(Callback)
	end
	local Success, Result = pcall(function()
		-- upvalues: Service (copy)
		return Service.CoreMessageReceived
	end)
	
	if Success and Result then
		local List = {}
		local Flag = false
		
		local function flush()
			-- upvalues: Flag (ref), List (ref), Callback (copy)
			Flag = false
			local List1 = List
			List = {}
			Callback(List1)
		end
		
		Result:Connect(function(TextChatMessage)
			-- upvalues: List (ref), Flag (ref), Defer (copy), flush (copy)
			if TextChatMessage.IsHistorical ~= true or TextChatMessage.TextSource == nil then return end
			table.insert(List, TextChatMessage)
			
			if not Flag then
				Flag = true
				Defer(flush)
			end
		end)
		pcall(function()
			-- upvalues: Service (copy)
			Service:ChatIsLoaded()
		end)
		
		return
	end
end