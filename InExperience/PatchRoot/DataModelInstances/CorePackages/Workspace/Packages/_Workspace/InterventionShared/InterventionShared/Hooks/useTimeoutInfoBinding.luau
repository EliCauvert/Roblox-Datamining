local interventionShared = script:FindFirstAncestor("InterventionShared")
local runService = game:GetService("RunService")
local reactModule = require(interventionShared.Parent.React)
local useBinding = reactModule.useBinding
local useEffect = reactModule.useEffect
local determineChatTimeoutInfoModule = require(interventionShared.Utils.determineChatTimeoutInfo)

return function(value, p0)
	-- upvalues: useBinding (ref), useEffect (ref), determineChatTimeoutInfoModule (ref), runService (ref)
	local var4, var5 = useBinding("")
	local var6, var7 = useBinding("")
	local var8 = if value and value ~= "" then DateTime.fromIsoDate(value) else nil
	useEffect(function()
		-- upvalues: determineChatTimeoutInfoModule (copy), var8 (ref), p0 (ref), var5 (ref), var7 (ref)
		local _, var9, var10 = determineChatTimeoutInfoModule(var8, p0)
		var5(var9)
		var7(var10)
	end, { var8, p0 })
	useEffect(function()
		-- upvalues: var8 (ref), runService (copy), determineChatTimeoutInfoModule (copy), p0 (ref), var5 (ref), var7 (ref)
		local heartbeatConnection = nil
		
		if var8 == nil then return end
		if var8.UnixTimestamp - DateTime.now().UnixTimestamp <= 0 then
			return
		end
		local var12 = 0
		heartbeatConnection = runService.Heartbeat:Connect(function()
			-- upvalues: var12 (write), determineChatTimeoutInfoModule (copy), var8 (copy), p0 (copy), var5 (copy), var7 (copy), heartbeatConnection (write)
			local processTime = os.clock()
			
			if processTime - var12 < 1 then return end
			var12 = processTime
			local var14, var15, var16 = determineChatTimeoutInfoModule(var8, p0)
			var5(var15)
			var7(var16)
			
			if var14 <= 0 and heartbeatConnection then
				heartbeatConnection:Disconnect()
			end
		end)
		
		return function()
			-- upvalues: heartbeatConnection (write)
			if heartbeatConnection then
				heartbeatConnection:Disconnect()
			end
		end
	end, { var8 })
	
	return { heading = var4, description = var6 }
end