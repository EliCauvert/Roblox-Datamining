local var0 = nil
local var1 = false

local _ = function()
	-- upvalues: var1 (write), var0 (write)
	if not var1 then
		local ok, status = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			var0 = status
		end
		var1 = true
	end
	return var0
end

return function(p0)
	-- upvalues: var1 (write), var0 (write)
	if not var1 then
		local ok, status = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			var0 = status
		end
		var1 = true
	end
	local var2 = var0
	
	if var2 then
		local focusedContextId = var2:GetFocusedContextId()
		p0(focusedContextId)
		
		local var4 = function()
			-- upvalues: var2 (ref), focusedContextId (write), p0 (ref)
			local focusedContextId_1 = var2:GetFocusedContextId()
			
			if focusedContextId ~= focusedContextId_1 then
				focusedContextId = focusedContextId_1
				p0(focusedContextId)
			end
		end
		
		var2.OnContextRegistered:Connect(var4)
		var2.OnContextUnregistered:Connect(var4)
		var2.OnDeafenVoiceAudio:Connect(var4)
		var2.OnUndeafenVoiceAudio:Connect(var4)
	end
end