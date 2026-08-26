local socialCommon = script:FindFirstAncestor("SocialCommon")
local reactModule = require(socialCommon.Parent.React)
local inputUtilitiesModule = require(socialCommon.Utils.InputUtilities)

return function()
	-- upvalues: reactModule (ref), inputUtilitiesModule (ref)
	local var1, var2 = reactModule.useState(false)
	
	return var1, reactModule.useCallback(function(_, p1)
		-- upvalues: inputUtilitiesModule (copy), var2 (ref)
		if inputUtilitiesModule.isPointerInput(p1) then
			var2(true)
		end
	end, { var2 }), reactModule.useCallback(function(_, p1)
		-- upvalues: inputUtilitiesModule (copy), var2 (ref)
		if inputUtilitiesModule.isPointerInput(p1) then
			var2(false)
		end
	end, { var2 })
end