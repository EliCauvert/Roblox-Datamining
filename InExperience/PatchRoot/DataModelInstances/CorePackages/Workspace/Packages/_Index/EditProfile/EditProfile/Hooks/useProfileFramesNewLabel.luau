local reactModule = require(script:FindFirstAncestor("EditProfile").Parent.React)
local appStorageService = game:GetService("AppStorageService")

return function(p0) --[[ line: 11 | named "useProfileFramesNewLabel" ]]
	-- upvalues: appStorageService (ref), reactModule (ref)
	p0 = p0 or appStorageService
	local var3, var4 = reactModule.useState(function() --[[ line: 13 ]]
		-- upvalues: p0 (ref)
		local ok, status = pcall(function() --[[ line: 14 ]]
			-- upvalues: p0 (copy)
			return p0:GetItem("ProfileFramesNewLabelSeen")
		end)
		
		return ok and status ~= "true"
	end)
	
	return var3, reactModule.useCallback(function() --[[ line: 21 ]]
		-- upvalues: var4 (ref), p0 (ref)
		var4(false)
		pcall(function() --[[ line: 23 ]]
			-- upvalues: p0 (copy)
			p0:SetItem("ProfileFramesNewLabelSeen", "true")
			p0:Flush()
		end)
	end, { p0 })
end