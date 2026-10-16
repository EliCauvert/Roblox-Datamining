local Players = game:GetService("Players")
local SignalsModule = require(script:FindFirstAncestor("SplitPane").Parent.Signals)

return function() --[[ Line: 7 | Named "createCurrentScreenOrientationSignal" ]]
	-- upvalues: SignalsModule (copy), Players (copy)
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local Connection = nil
	local Connection1 = nil
	
	local function _(Object) --[[ Line: 13 | Named "connectToPlayerGui" ]]
		-- upvalues: Signal2 (copy), Connection (ref)
		Signal2(Object.CurrentScreenOrientation)
		Connection = Object:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function() --[[ Line: 15 ]]
			-- upvalues: Signal2 (upval), Object (copy)
			Signal2(Object.CurrentScreenOrientation)
		end)
	end
	
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer then
		local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		
		if PlayerGui then
			Signal2(PlayerGui.CurrentScreenOrientation)
			Connection = PlayerGui:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function() --[[ Line: 15 ]]
				-- upvalues: Signal2 (copy), PlayerGui (copy)
				Signal2(PlayerGui.CurrentScreenOrientation)
			end)
		else
			Connection1 = LocalPlayer.ChildAdded:Connect(function(Child) --[[ Line: 26 ]]
				-- upvalues: Connection1 (ref), Signal2 (copy), Connection (ref)
				if Child:IsA("PlayerGui") then
					if Connection1 then
						Connection1:Disconnect()
					end
					Connection1 = nil
					Signal2(Child.CurrentScreenOrientation)
					Connection = Child:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function() --[[ Line: 15 ]]
						-- upvalues: Signal2 (upval), Child (copy)
						Signal2(Child.CurrentScreenOrientation)
					end)
				end
			end)
		end
	end
	return Signal, function() --[[ Line: 39 ]]
		-- upvalues: Connection (ref), Connection1 (ref)
		if Connection then
			Connection:Disconnect()
		end
		if Connection1 then
			Connection1:Disconnect()
		end
	end
end