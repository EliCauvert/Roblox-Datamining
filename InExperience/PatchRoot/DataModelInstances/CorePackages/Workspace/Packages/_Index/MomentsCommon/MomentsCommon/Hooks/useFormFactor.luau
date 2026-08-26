local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local reactModule = require(momentsCommon.Parent.React)
local useScreenSizeModule = require(script.Parent.useScreenSize)
local formFactorModule = require(momentsCommon.Enums.FormFactor)

return function()
	-- upvalues: useScreenSizeModule (ref), reactModule (ref), formFactorModule (ref)
	local var1 = useScreenSizeModule()
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref), formFactorModule (copy)
		return if var1.X < 600 then formFactorModule.MobilePortrait elseif var1.Y < 480 then formFactorModule.MobileLandscape else formFactorModule.Wide
	end, { var1 })
end