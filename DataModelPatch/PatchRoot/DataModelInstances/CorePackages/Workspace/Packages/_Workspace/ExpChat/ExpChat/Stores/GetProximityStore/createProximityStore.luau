local CreateSignalFunction = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local t = {}
	local config = {
		isInsideRenderDistance = false,
		isInsideMaximizeDistance = false
	}
	
	local function _(p1): string
		return (tostring(p1))
	end
	
	return {
		getUserProximityState = function(p1)
			-- upvalues: t (copy), CreateSignalFunction (upval), config (copy)
			local Text = tostring(p1)
			
			if not t[Text] then
				local Signal, Signal2 = CreateSignalFunction(config)
				t[Text] = { getter = Signal, setter = Signal2 }
			end
			return t[Text].getter
		end,
		updateProximity = function(p1, IsInsideRenderDistance, IsInsideMaximizeDistance)
			-- upvalues: t (copy), CreateSignalFunction (upval), config (copy)
			local Text = tostring(p1)
			
			if not t[Text] then
				local Text1 = tostring(p1)
				
				if not t[Text1] then
					local Signal, Signal2 = CreateSignalFunction(config)
					t[Text1] = { getter = Signal, setter = Signal2 }
				end
				local _ = t[Text1].getter
			end
			t[Text].setter({
				isInsideRenderDistance = IsInsideRenderDistance,
				isInsideMaximizeDistance = IsInsideMaximizeDistance
			})
		end,
		removeUser = function(p1)
			-- upvalues: t (copy), config (copy)
			local Text = tostring(p1)
			
			if t[Text] then
				t[Text].setter(config)
				t[Text] = nil
			end
		end
	}
end