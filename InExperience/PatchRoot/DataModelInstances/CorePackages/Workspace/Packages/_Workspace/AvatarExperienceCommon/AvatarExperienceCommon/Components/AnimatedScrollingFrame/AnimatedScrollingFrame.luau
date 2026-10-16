local ReactModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.React)
local UseAXAnimateScrollFrameModule = require(script.Parent.useAXAnimateScrollFrame)

return ReactModule.forwardRef(function(Tbl, Callback) --[[ Line: 8 | Named "AnimatedScrollingFrame" ]]
	-- upvalues: ReactModule (copy), UseAXAnimateScrollFrameModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	UseAXAnimateScrollFrameModule(UseRefResult)
	local Copy = table.clone(Tbl)
	Copy.children = nil
	Copy.ref = ReactModule.useCallback(function(Current) --[[ Line: 11 ]]
		-- upvalues: UseRefResult (copy), Callback (copy)
		UseRefResult.current = Current
		
		if typeof(Callback) == "table" then
			Callback.current = Current
			
			return
		end
		if typeof(Callback) == "function" then
			Callback(Current)
		end
	end, { Callback })
	
	return ReactModule.createElement("ScrollingFrame", Copy, Tbl.children)
end)