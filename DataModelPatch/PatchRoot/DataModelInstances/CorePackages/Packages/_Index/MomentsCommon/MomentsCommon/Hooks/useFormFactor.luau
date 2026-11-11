local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local ReactModule = require(MomentsCommon.Parent.React)
local UseScreenSizeModule = require(MomentsCommon.Hooks.useScreenSize)
local FormFactorModule = require(MomentsCommon.Enums.FormFactor)

return function()
	-- upvalues: UseScreenSizeModule (copy), ReactModule (copy), FormFactorModule (copy)
	local UseScreenSizeModuleResult = UseScreenSizeModule()
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseScreenSizeModuleResult (copy), FormFactorModule (upval)
		return if UseScreenSizeModuleResult.X < 600 then FormFactorModule.MobilePortrait elseif UseScreenSizeModuleResult.Y < 480 then FormFactorModule.MobileLandscape else FormFactorModule.Wide
	end, { UseScreenSizeModuleResult }))
end