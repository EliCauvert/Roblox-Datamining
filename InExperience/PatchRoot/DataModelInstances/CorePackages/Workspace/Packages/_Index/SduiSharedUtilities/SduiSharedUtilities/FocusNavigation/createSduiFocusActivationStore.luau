local appCommonLibModule = require(script:FindFirstAncestor("SduiSharedUtilities").Parent.AppCommonLib)

return function()
	-- upvalues: appCommonLibModule (ref)
	local tbl = setmetatable({}, { __mode = "v" })
	
	return {
		register = function(p1, p2)
			-- upvalues: tbl (ref), appCommonLibModule (copy)
			local var1 = tbl[p1]
			
			if var1 == nil then
				var1 = appCommonLibModule.Signal.new()
				tbl[p1] = var1
			end
			local var2 = var1:connect(p2)
			
			return function()
				-- upvalues: var2 (ref)
				var2.disconnect()
			end
		end,
		activate = function(p1)
			-- upvalues: tbl (ref)
			local var1 = tbl[p1]
			
			if var1 then
				var1:fire()
			end
		end
	}
end