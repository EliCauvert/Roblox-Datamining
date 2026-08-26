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

local function _(p1, p2)
	return if p1 < 1024 then p2.Size.Size_300 elseif p1 < 1280 then 18 elseif p1 < 1440 then p2.Size.Size_600 elseif p1 < 1920 then 34 elseif p1 < 2260 then 38 else p2.Size.Size_1200
end

local _ = function(p1, p2)
	-- upvalues: hasExtraPlatformInset (ref)
	return if hasExtraPlatformInset() then p1.Size.Size_1600 elseif p2 < 1024 then p1.Size.Size_300 elseif p2 < 1280 then 18 elseif p2 < 1440 then p1.Size.Size_600 elseif p2 < 1920 then 34 elseif p2 < 2260 then 38 else p1.Size.Size_1200
end

return function(p1)
	-- upvalues: useIsInExperienceModule (ref), useScreenSize (ref), styleModule (ref), usePreferredInput (ref), responsiveModule (ref), useSelector (ref), useMemo (ref), hasExtraPlatformInset (ref), formFactor (ref)
	local var1 = useIsInExperienceModule() or p1
	local var2 = useScreenSize()
	local var3 = if var2 and var2.X ~= nil then var2.X else 0
	local var4 = styleModule.useDesignTokens()
	local var5 = usePreferredInput() == responsiveModule.Input.Pointer
	local var6 = useSelector(function(p2)
		return p2.FormFactor
	end)
	
	return useMemo(function()
		-- upvalues: var1 (ref), var5 (ref), var4 (ref), var3 (ref), hasExtraPlatformInset (copy), var6 (ref), formFactor (copy)
		if var1 then
			return { outer = 12, inner = 12, default = 12 }
		end
		local var7
		local _ = nil
		
		if var5 then
			local var8 = var4
			local var9 = var3
			var7 = if hasExtraPlatformInset() then var8.Size.Size_1600 elseif var9 < 1024 then var8.Size.Size_300 elseif var9 < 1280 then 18 elseif var9 < 1440 then var8.Size.Size_600 elseif var9 < 1920 then 34 elseif var9 < 2260 then 38 else var8.Size.Size_1200
		else
			var7 = if var6 == formFactor.COMPACT then 24 else 48
		end
		return { default = 12, outer = var7, inner = var7 }
	end, { var3, var5, var6, var1 })
end