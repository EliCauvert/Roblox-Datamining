local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local reactModule = require(momentsCommon.Parent.React)
local useScreenSizeModule = require(momentsCommon.Hooks.useScreenSize)
local formFactorModule = require(momentsCommon.Enums.FormFactor)

return function()
	-- upvalues: useScreenSizeModule (ref), reactModule (ref), formFactorModule (ref)
	local var4 = useScreenSizeModule()
	
	return reactModule.useMemo(function()
		-- upvalues: var4 (ref), formFactorModule (copy)
		return if var4.X < 600 then formFactorModule.MobilePortrait elseif var4.Y < 480 then formFactorModule.MobileLandscape else formFactorModule.Wide
	end, { var4 })
end