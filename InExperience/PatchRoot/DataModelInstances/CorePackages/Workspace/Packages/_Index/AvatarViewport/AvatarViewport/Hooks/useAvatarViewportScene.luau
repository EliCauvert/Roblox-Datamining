local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local _ = require(avatarViewport.Types)

return function() --[[ line: 10 | named "useAvatarViewportScene" ]]
	-- upvalues: reactModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	
	return reactModule.useMemo(function() --[[ line: 15 ]]
		-- upvalues: var2 (ref), var3 (ref), var4 (ref)
		return { viewportFrame = var2, worldModel = var3, camera = var4 }
	end, { var2, var3, var4 })
end