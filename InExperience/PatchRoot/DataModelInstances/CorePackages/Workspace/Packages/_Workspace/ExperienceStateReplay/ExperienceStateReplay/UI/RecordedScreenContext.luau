return {
	start = function(p1)
		local v1 = nil
		local ScreenContextReplayingConnection = nil
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy), ScreenContextReplayingConnection (ref), v1 (ref)
			local P0 = p1 or game:GetService("ExperienceStateRecordingService")
			
			if P0 ~= nil then
				ScreenContextReplayingConnection = P0.ScreenContextReplaying:Connect(function(p2, p3, p4, _, _, _, _)
					-- upvalues: v1 (upval)
					if typeof(p2) == "Rect" and typeof(p3) == "Vector2" and typeof(p4) == "Vector2" then
						local VectorDelta = Vector2.new(p2.Width, p2.Height) - p3 - p4
						v1 = if VectorDelta.X >= 16 and VectorDelta.Y >= 16 then VectorDelta else nil
						
						return
					end
				end)
				
				return
			end
		end)
		
		if not Success then
			warn("[AIMALIGN] recorded screen context event unavailable: " .. tostring(Result))
		end
		return {
			getViewportSize = function()
				-- upvalues: v1 (ref)
				return v1
			end,
			reset = function()
				-- upvalues: v1 (ref)
				v1 = nil
			end,
			stop = function()
				-- upvalues: ScreenContextReplayingConnection (ref), v1 (ref)
				if ScreenContextReplayingConnection ~= nil then
					ScreenContextReplayingConnection:Disconnect()
					ScreenContextReplayingConnection = nil
				end
				v1 = nil
			end
		}
	end
}