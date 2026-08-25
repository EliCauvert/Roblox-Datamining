local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local formFactor = require(parent.FormFactor).Enums.FormFactor
local styleModule = require(parent.Style)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local hasExtraPlatformInset = responsiveModule.HardwareSafeAreaInsets.hasExtraPlatformInset
local useIsInExperienceModule = require(appChat.Hooks.useIsInExperience)
local useMemo = reactModule.useMemo
local usePreferredInput = responsiveModule.usePreferredInput
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

local function _(p0, p1)
	return if p0 < 1024 then p1.Size.Size_300 elseif p0 < 1280 then 18 elseif p0 < 1440 then p1.Size.Size_600 elseif p0 < 1920 then 34 elseif p0 < 2260 then 38 else p1.Size.Size_1200
end

local _ = function(p2, p3)
	-- upvalues: hasExtraPlatformInset (ref)
	return if hasExtraPlatformInset() then p2.Size.Size_1600 elseif p3 < 1024 then p2.Size.Size_300 elseif p3 < 1280 then 18 elseif p3 < 1440 then p2.Size.Size_600 elseif p3 < 1920 then 34 elseif p3 < 2260 then 38 else p2.Size.Size_1200
end

return function(p4)
	-- upvalues: useIsInExperienceModule (ref), useScreenSize (ref), styleModule (ref), usePreferredInput (ref), responsiveModule (ref), useSelector (ref), useMemo (ref), hasExtraPlatformInset (ref), formFactor (ref)
	local var5 = useIsInExperienceModule() or p4
	local var6 = useScreenSize()
	local var7 = if var6 and var6.X ~= nil then var6.X else 0
	local var8 = styleModule.useDesignTokens()
	local var9 = usePreferredInput() == responsiveModule.Input.Pointer
	local var10 = useSelector(function(p5)
		return p5.FormFactor
	end)
	
	return useMemo(function()
		-- upvalues: var5 (ref), var9 (ref), var8 (ref), var7 (ref), hasExtraPlatformInset (copy), var10 (ref), formFactor (copy)
		if var5 then
			return { outer = 12, inner = 12, default = 12 }
		end
		local var13
		local _ = nil
		
		if var9 then
			local var11 = var8
			local var12 = var7
			var13 = if hasExtraPlatformInset() then var11.Size.Size_1600 elseif var12 < 1024 then var11.Size.Size_300 elseif var12 < 1280 then 18 elseif var12 < 1440 then var11.Size.Size_600 elseif var12 < 1920 then 34 elseif var12 < 2260 then 38 else var11.Size.Size_1200
		else
			var13 = if var10 == formFactor.COMPACT then 24 else 48
		end
		return { default = 12, outer = var13, inner = var13 }
	end, { var7, var9, var10, var5 })
end