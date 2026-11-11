local Parent = script:FindFirstAncestor("AvatarExperienceServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FFlagAXFixSduiCatalogRowJump = require(Parent.AvatarExperienceFlags).FFlagAXFixSduiCatalogRowJump

return function(p1: number)
	-- upvalues: FFlagAXFixSduiCatalogRowJump (copy), ReactModule (copy)
	local v1 = if FFlagAXFixSduiCatalogRowJump and p1 and p1 > 0 then p1 else 0
	local UseStateResult, UseStateResult2 = ReactModule.useState(v1)
	local UseRefResult = ReactModule.useRef(v1)
	
	return UseStateResult, (ReactModule.useCallback(function(Frame)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		local X = Frame.AbsoluteSize.X
		
		if UseRefResult.current ~= X then
			UseRefResult.current = X
			UseStateResult2(X)
			
			return
		end
	end, {}))
end