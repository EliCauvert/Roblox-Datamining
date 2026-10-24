local RunService = game:GetService("RunService")

return function(p1, Callback, p2)
	-- upvalues: RunService (copy)
	local Connection = nil
	Connection = (p2 or RunService.Heartbeat):Connect(function()
		-- upvalues: p1 (copy), Connection (ref), Callback (copy)
		if not p1.Parent then
			Connection:Disconnect()
			
			return
		end
		if p1.IsLoaded then
			Connection:Disconnect()
			Callback()
		end
	end)
	
	return Connection
end