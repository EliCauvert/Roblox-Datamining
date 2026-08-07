local appCommonLibModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.AppCommonLib)

return function() --[[ line: 26 | named "createSduiFocusActivationStore" ]]
	-- upvalues: appCommonLibModule (ref)
	local tbl = setmetatable({}, { __mode = "v" })
	
	return {
		register = function(p0, p1) --[[ line: 34 ]]
			-- upvalues: tbl (ref), appCommonLibModule (copy)
			local var2 = tbl[p0]
			
			if var2 == nil then
				var2 = appCommonLibModule.Signal.new()
				tbl[p0] = var2
			end
			local var3 = var2:connect(p1)
			
			return function() --[[ line: 41 ]]
				-- upvalues: var3 (ref)
				var3.disconnect()
			end
		end,
		activate = function(p2) --[[ line: 46 ]]
			-- upvalues: tbl (ref)
			local var4 = tbl[p2]
			
			if var4 then
				var4:fire()
			end
		end
	}
end