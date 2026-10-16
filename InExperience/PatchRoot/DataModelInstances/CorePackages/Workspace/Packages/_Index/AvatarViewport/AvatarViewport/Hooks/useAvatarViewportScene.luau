local AvatarViewport = script:FindFirstAncestor("AvatarViewport")
local ReactModule = require(AvatarViewport.Parent.React)
local _ = require(AvatarViewport.Types)

return function() --[[ Line: 10 | Named "useAvatarViewportScene" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	
	return ReactModule.useMemo(function() --[[ Line: 15 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		return {
			viewportFrame = UseRefResult,
			worldModel = UseRefResult1,
			camera = UseRefResult2
		}
	end, { UseRefResult, UseRefResult1, UseRefResult2 })
end