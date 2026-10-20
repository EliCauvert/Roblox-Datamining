local function _()
	return game:GetService("RunService"):IsStudio()
end

local IsStudio = game:GetService("RunService"):IsStudio()

return function(Callback, p1, p2)
	-- upvalues: IsStudio (copy)
	local IsStudio1 = if p2 == nil then IsStudio else p2
	local Success, Result = pcall(function()
		-- upvalues: Callback (copy)
		return Callback()
	end)
	
	if Success then
		return Result
	elseif IsStudio1 then
		assert(Success, Result)
		
		return p1
	else
		local Text = "safeCall failed"
		pcall(function()
			-- upvalues: Text (ref), Result (copy)
			Text = tostring(Result)
		end)
		warn(Text)
		
		return p1
	end
end