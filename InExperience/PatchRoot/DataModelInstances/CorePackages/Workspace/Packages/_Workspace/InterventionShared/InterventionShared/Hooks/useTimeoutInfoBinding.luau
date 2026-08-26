local interventionShared = script:FindFirstAncestor("InterventionShared")
local runService = game:GetService("RunService")
local reactModule = require(interventionShared.Parent.React)
local useBinding = reactModule.useBinding
local useEffect = reactModule.useEffect
local determineChatTimeoutInfoModule = require(interventionShared.Utils.determineChatTimeoutInfo)

return function(value, p1)
	-- upvalues: useBinding (ref), useEffect (ref), determineChatTimeoutInfoModule (ref), runService (ref)
	local var1, var2 = useBinding("")
	local var3, var4 = useBinding("")
	local var5 = if value and value ~= "" then DateTime.fromIsoDate(value) else nil
	useEffect(function()
		-- upvalues: determineChatTimeoutInfoModule (copy), var5 (ref), p1 (ref), var2 (ref), var4 (ref)
		local _, var6, var7 = determineChatTimeoutInfoModule(var5, p1)
		var2(var6)
		var4(var7)
	end, { var5, p1 })
	useEffect(function()
		-- upvalues: var5 (ref), runService (copy), determineChatTimeoutInfoModule (copy), p1 (ref), var2 (ref), var4 (ref)
		local heartbeatConnection = nil
		
		if var5 == nil then return end
		if var5.UnixTimestamp - DateTime.now().UnixTimestamp <= 0 then
			return
		end
		local var6 = 0
		heartbeatConnection = runService.Heartbeat:Connect(function()
			-- upvalues: var6 (write), determineChatTimeoutInfoModule (copy), var5 (copy), p1 (copy), var2 (copy), var4 (copy), heartbeatConnection (write)
			local processTime = os.clock()
			
			if processTime - var6 < 1 then return end
			var6 = processTime
			local var7, var8, var9 = determineChatTimeoutInfoModule(var5, p1)
			var2(var8)
			var4(var9)
			
			if var7 <= 0 and heartbeatConnection then
				heartbeatConnection:Disconnect()
			end
		end)
		
		return function()
			-- upvalues: heartbeatConnection (write)
			if heartbeatConnection then
				heartbeatConnection:Disconnect()
			end
		end
	end, { var5 })
	
	return { heading = var1, description = var3 }
end