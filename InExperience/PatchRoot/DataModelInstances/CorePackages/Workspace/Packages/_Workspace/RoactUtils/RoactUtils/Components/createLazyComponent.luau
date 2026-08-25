local roactUtils = script:FindFirstAncestor("RoactUtils")
local reactModule = require(roactUtils.Parent.React)
local _ = require(roactUtils.types)
local luaAppLazyComponentAsyncChunkLoad = game:DefineFastFlag("LuaAppLazyComponentAsyncChunkLoad", false)

return function(p0)
	-- upvalues: reactModule (ref), luaAppLazyComponentAsyncChunkLoad (ref)
	local var3 = reactModule.memo(function(p1)
		-- upvalues: luaAppLazyComponentAsyncChunkLoad (copy), reactModule (copy), p0 (ref)
		if not luaAppLazyComponentAsyncChunkLoad then
			return reactModule.createElement(reactModule.useMemo(p0, {}), p1)
		end
		local var4, var5 = reactModule.useState({ state = "idle" })
		
		if var4.state == "idle" then
			task.spawn(function()
				-- upvalues: var5 (ref), p0 (copy)
				var5({ state = "pending" })
				local ok, status = pcall(p0)
				
				if ok then
					var5({ state = "resolved", component = status })
					
					return
				end
				var5({ state = "failed", error = status })
			end)
			
			return nil
		elseif var4.state == "failed" then
			error(var4.error, 0)
		else
			return if var4.state == "pending" then nil else reactModule.createElement(var4.component, p1)
		end
	end)
	
	return function(p2)
		-- upvalues: reactModule (copy), var3 (ref)
		return reactModule.createElement(var3, p2)
	end
end