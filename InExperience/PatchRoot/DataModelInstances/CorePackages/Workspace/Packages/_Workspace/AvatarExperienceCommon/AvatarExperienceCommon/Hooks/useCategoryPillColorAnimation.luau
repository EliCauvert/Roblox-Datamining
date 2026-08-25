local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local useTokens = require(parent.Foundation).Hooks.useTokens
local mutedError = require(parent.Loggers).mutedError

local function interpolateColors(p0, p1, p2)
	-- upvalues: mutedError (ref)
	local color3 = p1.Color3
	local color3_1 = p2.Color3
	local transparency = p1.Transparency
	local transparency_1 = p2.Transparency
	
	if color3 == nil or color3_1 == nil or (transparency == nil or transparency_1 == nil) then
		mutedError("useCategoryPillColorAnimation: ColorStyle is nil")
		
		return p1
	end
	return {
		Color3 = color3:Lerp(color3_1, p0),
		Transparency = transparency + (transparency_1 - transparency) * p0
	}
end

return function(p3)
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), interpolateColors (ref)
	local var3 = useTokens()
	local var4, var5 = reactOtterModule.useAnimatedBinding(if p3 then 1 else 0)
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var5 (ref), reactOtterModule (copy)
		local var6 = if p3 then 1 else 0
		
		if p3 then
			var5(reactOtterModule.spring(var6, { frequency = 1.2, dampingRatio = 1 }))
			
			return
		end
		var5(reactOtterModule.instant(var6))
	end, { p3 })
	
	return {
		animatedBackgroundStyle = var4:map(function(p4)
			-- upvalues: interpolateColors (copy), var3 (ref)
			return interpolateColors(p4, var3.Color.ActionStandard.Background, var3.Color.ActionSubEmphasis.Background)
		end),
		animatedTextStyle = var4:map(function(p5)
			-- upvalues: interpolateColors (copy), var3 (ref)
			return interpolateColors(p5, var3.Color.ActionStandard.Foreground, var3.Color.ActionSubEmphasis.Foreground)
		end)
	}
end