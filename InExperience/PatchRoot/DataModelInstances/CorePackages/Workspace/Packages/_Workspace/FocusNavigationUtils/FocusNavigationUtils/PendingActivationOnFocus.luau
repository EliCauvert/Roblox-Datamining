local v1 = nil
local PendingActivationOnFocusModule = {
	get = function()
		-- upvalues: v1 (ref)
		return v1
	end,
	set = function(p1)
		-- upvalues: v1 (ref)
		v1 = p1
	end,
	cancel = function()
		-- upvalues: v1 (ref)
		local v2 = v1
		
		if v2 ~= nil then
			v1 = nil
			pcall(task.cancel, v2.thread)
			
			return
		end
	end
}

function PendingActivationOnFocusModule.flush()
	-- upvalues: v1 (ref), PendingActivationOnFocusModule (copy)
	local v2 = v1
	
	if v2 == nil then
		return nil
	else
		PendingActivationOnFocusModule.cancel()
		
		return v2.activate()
	end
end

return PendingActivationOnFocusModule