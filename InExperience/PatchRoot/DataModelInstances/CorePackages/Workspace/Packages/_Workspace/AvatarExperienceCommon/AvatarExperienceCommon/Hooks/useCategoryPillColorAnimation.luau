local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useTokens = require(parent.Foundation).Hooks.useTokens
local mutedError = require(parent.Loggers).mutedError

local function interpolateColors(p1, p2, p3)
	-- upvalues: mutedError (ref)
	local color3 = p2.Color3
	local color3_1 = p3.Color3
	local transparency = p2.Transparency
	local transparency_1 = p3.Transparency
	
	if color3 == nil or color3_1 == nil or (transparency == nil or transparency_1 == nil) then
		mutedError("useCategoryPillColorAnimation: ColorStyle is nil")
		
		return p2
	end
	return {
		Color3 = color3:Lerp(color3_1, p1),
		Transparency = transparency + (transparency_1 - transparency) * p1
	}
end

return function(p1)
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), interpolateColors (ref)
	local var1 = useTokens()
	local var2, var3 = reactOtterModule.useAnimatedBinding(if p1 then 1 else 0)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), reactOtterModule (copy)
		local var4 = if p1 then 1 else 0
		
		if p1 then
			var3(reactOtterModule.spring(var4, { frequency = 1.2, dampingRatio = 1 }))
			
			return
		end
		var3(reactOtterModule.instant(var4))
	end, { p1 })
	
	return {
		animatedBackgroundStyle = var2:map(function(p2)
			-- upvalues: interpolateColors (copy), var1 (ref)
			return interpolateColors(p2, var1.Color.ActionStandard.Background, var1.Color.ActionSubEmphasis.Background)
		end),
		animatedTextStyle = var2:map(function(p2)
			-- upvalues: interpolateColors (copy), var1 (ref)
			return interpolateColors(p2, var1.Color.ActionStandard.Foreground, var1.Color.ActionSubEmphasis.Foreground)
		end)
	}
end