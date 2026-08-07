-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local reactModule = require(momentsCommon.Parent.React)
local useScreenSizeModule = require(momentsCommon.Hooks.useScreenSize)
local formFactorModule = require(momentsCommon.Enums.FormFactor)

return function() --[[ line: 13 | named "useFormFactor" ]]
	-- upvalues: useScreenSizeModule (ref), reactModule (ref), formFactorModule (ref)
	local var4 = useScreenSizeModule()
	
	return reactModule.useMemo(function() --[[ line: 16 ]]
		-- upvalues: var4 (ref), formFactorModule (copy)
		return if var4.X < 600 then formFactorModule.MobilePortrait elseif var4.Y < 480 then formFactorModule.MobileLandscape else formFactorModule.Wide
	end, { var4 })
end