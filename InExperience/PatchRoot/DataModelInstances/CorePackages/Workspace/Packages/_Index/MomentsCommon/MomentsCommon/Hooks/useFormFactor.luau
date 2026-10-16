local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local ReactModule = require(MomentsCommon.Parent.React)
local UseScreenSizeModule = require(script.Parent.useScreenSize)
local FormFactorModule = require(MomentsCommon.Enums.FormFactor)

return function() --[[ Line: 27 | Named "useFormFactor" ]]
	-- upvalues: UseScreenSizeModule (copy), ReactModule (copy), FormFactorModule (copy)
	local UseScreenSizeModuleResult = UseScreenSizeModule()
	
	return (ReactModule.useMemo(function() --[[ Line: 32 ]]
		-- upvalues: UseScreenSizeModuleResult (copy), FormFactorModule (upval)
		return if UseScreenSizeModuleResult.X < 600 then FormFactorModule.MobilePortrait elseif UseScreenSizeModuleResult.Y < 480 then FormFactorModule.MobileLandscape else FormFactorModule.Wide
	end, { UseScreenSizeModuleResult }))
end