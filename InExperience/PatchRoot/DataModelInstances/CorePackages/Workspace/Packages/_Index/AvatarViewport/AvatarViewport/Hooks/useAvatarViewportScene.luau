local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local reactModule = require(avatarViewport.Parent.React)
local _ = require(avatarViewport.Types)

return function()
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), var2 (ref), var3 (ref)
		return { viewportFrame = var1, worldModel = var2, camera = var3 }
	end, { var1, var2, var3 })
end