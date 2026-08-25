local socialCommon = script:FindFirstAncestor("SocialCommon")
local reactModule = require(socialCommon.Parent.React)
local inputUtilitiesModule = require(socialCommon.Utils.InputUtilities)

return function()
	-- upvalues: reactModule (ref), inputUtilitiesModule (ref)
	local var3, var4 = reactModule.useState(false)
	
	return var3, reactModule.useCallback(function(_, p0)
		-- upvalues: inputUtilitiesModule (copy), var4 (ref)
		if inputUtilitiesModule.isPointerInput(p0) then
			var4(true)
		end
	end, { var4 }), reactModule.useCallback(function(_, p1)
		-- upvalues: inputUtilitiesModule (copy), var4 (ref)
		if inputUtilitiesModule.isPointerInput(p1) then
			var4(false)
		end
	end, { var4 })
end