local playersService = game:GetService("Players")
local signalsModule = require(script:FindFirstAncestor("SplitPane").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref), playersService (ref)
	local var1, var2 = signalsModule.createSignal(nil)
	local var3 = nil
	local childAddedConnection = nil
	
	local function _(p1)
		-- upvalues: var2 (ref), var3 (write)
		var2(p1.CurrentScreenOrientation)
		var3 = p1:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function()
			-- upvalues: var2 (copy), p1 (ref)
			var2(p1.CurrentScreenOrientation)
		end)
	end
	
	local localPlayer = playersService.LocalPlayer
	
	if localPlayer then
		local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
		
		if playerGui then
			var2(playerGui.CurrentScreenOrientation)
			var3 = playerGui:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function()
				-- upvalues: var2 (ref), playerGui (ref)
				var2(playerGui.CurrentScreenOrientation)
			end)
		else
			childAddedConnection = localPlayer.ChildAdded:Connect(function(p1)
				-- upvalues: childAddedConnection (write), var2 (ref), var3 (write)
				if p1:IsA("PlayerGui") then
					if childAddedConnection then
						childAddedConnection:Disconnect()
					end
					childAddedConnection = nil
					var2(p1.CurrentScreenOrientation)
					var3 = p1:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function()
						-- upvalues: var2 (copy), p1 (ref)
						var2(p1.CurrentScreenOrientation)
					end)
				end
			end)
		end
	end
	return var1, function()
		-- upvalues: var3 (write), childAddedConnection (write)
		if var3 then
			var3:Disconnect()
		end
		if childAddedConnection then
			childAddedConnection:Disconnect()
		end
	end
end