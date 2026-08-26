local roactUtils = script:FindFirstAncestor("RoactUtils")
local reactModule = require(roactUtils.Parent.React)
local _ = require(roactUtils.types)
local luaAppLazyComponentAsyncChunkLoad = game:DefineFastFlag("LuaAppLazyComponentAsyncChunkLoad", false)

return function(p1)
	-- upvalues: reactModule (ref), luaAppLazyComponentAsyncChunkLoad (ref)
	local var1 = reactModule.memo(function(p2)
		-- upvalues: luaAppLazyComponentAsyncChunkLoad (copy), reactModule (copy), p1 (ref)
		if not luaAppLazyComponentAsyncChunkLoad then
			return reactModule.createElement(reactModule.useMemo(p1, {}), p2)
		end
		local var2, var3 = reactModule.useState({ state = "idle" })
		
		if var2.state == "idle" then
			task.spawn(function()
				-- upvalues: var3 (ref), p1 (copy)
				var3({ state = "pending" })
				local ok, status = pcall(p1)
				
				if ok then
					var3({ state = "resolved", component = status })
					
					return
				end
				var3({ state = "failed", error = status })
			end)
			
			return nil
		elseif var2.state == "failed" then
			error(var2.error, 0)
		else
			return if var2.state == "pending" then nil else reactModule.createElement(var2.component, p2)
		end
	end)
	
	return function(p2)
		-- upvalues: reactModule (copy), var1 (ref)
		return reactModule.createElement(var1, p2)
	end
end