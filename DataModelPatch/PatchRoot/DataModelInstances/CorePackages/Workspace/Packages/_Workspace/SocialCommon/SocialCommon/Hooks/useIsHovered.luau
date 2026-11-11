local SocialCommon = script:FindFirstAncestor("SocialCommon")
local ReactModule = require(SocialCommon.Parent.React)
local InputUtilitiesModule = require(SocialCommon.Utils.InputUtilities)

return function()
	-- upvalues: ReactModule (copy), InputUtilitiesModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return UseStateResult, ReactModule.useCallback(function(_, p1)
		-- upvalues: InputUtilitiesModule (upval), UseStateResult2 (copy)
		if InputUtilitiesModule.isPointerInput(p1) then
			UseStateResult2(true)
		end
	end, { UseStateResult2 }), (ReactModule.useCallback(function(_, p1)
		-- upvalues: InputUtilitiesModule (upval), UseStateResult2 (copy)
		if InputUtilitiesModule.isPointerInput(p1) then
			UseStateResult2(false)
		end
	end, { UseStateResult2 }))
end