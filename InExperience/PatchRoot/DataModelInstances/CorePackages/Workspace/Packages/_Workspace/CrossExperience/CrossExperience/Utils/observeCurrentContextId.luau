local var1 = nil
local var2 = false

local _ = function()
	-- upvalues: var2 (write), var1 (write)
	if not var2 then
		local ok, status = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			var1 = status
		end
		var2 = true
	end
	return var1
end

return function(p1)
	-- upvalues: var2 (write), var1 (write)
	if not var2 then
		local ok, status = pcall(function()
			return game:GetService("AudioFocusService")
		end)
		
		if ok and status then
			var1 = status
		end
		var2 = true
	end
	local var3 = var1
	
	if var3 then
		local focusedContextId = var3:GetFocusedContextId()
		p1(focusedContextId)
		
		local var4 = function()
			-- upvalues: var3 (ref), focusedContextId (write), p1 (ref)
			local focusedContextId_1 = var3:GetFocusedContextId()
			
			if focusedContextId ~= focusedContextId_1 then
				focusedContextId = focusedContextId_1
				p1(focusedContextId)
			end
		end
		
		var3.OnContextRegistered:Connect(var4)
		var3.OnContextUnregistered:Connect(var4)
		var3.OnDeafenVoiceAudio:Connect(var4)
		var3.OnUndeafenVoiceAudio:Connect(var4)
	end
end