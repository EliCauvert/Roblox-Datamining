local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local MutedErrorFunction = require(Parent.Loggers).mutedError

local function interpolateColors(Alpha, Background, Background1) --[[ Line: 19 ]]
	-- upvalues: MutedErrorFunction (copy)
	local BackgroundColor3 = Background.Color3
	local BackgroundColor3_1 = Background1.Color3
	local Transparency = Background.Transparency
	local Transparency1 = Background1.Transparency
	
	if BackgroundColor3 == nil or BackgroundColor3_1 == nil or Transparency == nil or Transparency1 == nil then
		MutedErrorFunction("useCategoryPillColorAnimation: ColorStyle is nil")
		
		return Background
	else
		return {
			Color3 = BackgroundColor3:Lerp(BackgroundColor3_1, Alpha),
			Transparency = Transparency + (Transparency1 - Transparency) * Alpha
		}
	end
end

return function(p1) --[[ Line: 38 | Named "useCategoryPillColorAnimation" ]]
	-- upvalues: UseTokensFunction (copy), ReactOtterModule (copy), ReactModule (copy), interpolateColors (copy)
	local UseTokensResult = UseTokensFunction()
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if p1 then 1 else 0)
	ReactModule.useEffect(function() --[[ Line: 45 ]]
		-- upvalues: p1 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		local v1: number = if p1 then 1 else 0
		
		if p1 then
			UseAnimatedBindingResult2((ReactOtterModule.spring(v1, { frequency = 1.2, dampingRatio = 1 })))
			
			return
		else
			UseAnimatedBindingResult2((ReactOtterModule.instant(v1)))
		end
	end, { p1 })
	
	return {
		animatedBackgroundStyle = UseAnimatedBindingResult:map(function(Alpha) --[[ Line: 60 ]]
			-- upvalues: interpolateColors (upval), UseTokensResult (copy)
			return (interpolateColors(Alpha, UseTokensResult.Color.ActionStandard.Background, UseTokensResult.Color.ActionSubEmphasis.Background))
		end),
		animatedTextStyle = UseAnimatedBindingResult:map(function(Alpha) --[[ Line: 68 ]]
			-- upvalues: interpolateColors (upval), UseTokensResult (copy)
			return (interpolateColors(Alpha, UseTokensResult.Color.ActionStandard.Foreground, UseTokensResult.Color.ActionSubEmphasis.Foreground))
		end)
	}
end