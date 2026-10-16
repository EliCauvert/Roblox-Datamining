local RoactUtils = script:FindFirstAncestor("RoactUtils")
local ReactModule = require(RoactUtils.Parent.React)
local _ = require(RoactUtils.types)
local LuaAppLazyComponentAsyncChunkLoad = game:DefineFastFlag("LuaAppLazyComponentAsyncChunkLoad", false)

return function(p1) --[[ Line: 17 | Named "createLazyComponent" ]]
	-- upvalues: ReactModule (copy), LuaAppLazyComponentAsyncChunkLoad (copy)
	local MemoResult = ReactModule.memo(function(p2) --[[ Line: 18 ]]
		-- upvalues: LuaAppLazyComponentAsyncChunkLoad (upval), ReactModule (upval), p1 (copy)
		if not LuaAppLazyComponentAsyncChunkLoad then
			return ReactModule.createElement(ReactModule.useMemo(p1, {}), p2)
		end
		local UseStateResult, UseStateResult2 = ReactModule.useState({ state = "idle" })
		
		if UseStateResult.state == "idle" then
			task.spawn(function() --[[ Line: 23 ]]
				-- upvalues: UseStateResult2 (copy), p1 (upval)
				UseStateResult2({ state = "pending" })
				local Success, Result = pcall(p1)
				
				if Success then
					UseStateResult2({ state = "resolved", component = Result })
					
					return
				else
					UseStateResult2({ state = "failed", error = Result })
				end
			end)
			
			return nil
		end
		if UseStateResult.state == "failed" then
			error(UseStateResult.error, 0)
		elseif UseStateResult.state == "pending" then
			return nil
		end
		return ReactModule.createElement(UseStateResult.component, p2)
	end)
	
	return function(p2) --[[ Line: 45 ]]
		-- upvalues: ReactModule (upval), MemoResult (copy)
		return ReactModule.createElement(MemoResult, p2)
	end
end