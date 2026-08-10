local var0 = nil

local function _() --[[ line: 29 | named "getNpcInferenceService" ]]
	-- upvalues: var0 (write)
	if var0 == nil then
		var0 = game:GetService("NpcInferenceService")
	end
	return var0
end

return {
	applyAction = function(p0) --[[ line: 38 ]]
		-- upvalues: var0 (write)
		if p0 == nil then return end
		local t = {}
		local keys = p0.keys
		
		if keys then
			for i, v in ipairs(keys) do
				local ok, status = pcall(function() --[[ line: 48 ]]
					-- upvalues: v (ref)
					return Enum.KeyCode:FromValue(v)
				end)
				
				if ok and status then
					table.insert(t, status)
				end
			end
		end
		local mouseButtons = p0.mouse_buttons
		local var2 = false
		local var3 = false
		local var4 = false
		
		if mouseButtons then
			var2 = mouseButtons[1] == true
			var3 = mouseButtons[2] == true
			var4 = mouseButtons[3] == true
		end
		local mouseDelta = p0.mouse_delta
		local var5 = 0
		local var6 = 0
		local var7 = 0
		
		if mouseDelta then
			var5 = mouseDelta[1] or 0
			var6 = mouseDelta[2] or 0
			var7 = mouseDelta[3] or 0
		end
		if var0 == nil then
			var0 = game:GetService("NpcInferenceService")
		end
		var0:ApplyNPCInputAction(t, var2, var3, var4, Vector2.new(var5, var6), var7)
	end,
	reset = function(_) --[[ line: 89 ]]
		-- upvalues: var0 (write)
		if var0 == nil then
			var0 = game:GetService("NpcInferenceService")
		end
		var0:ResetNPCInput()
	end
}