local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactOtterModule = require(Parent.ReactOtter)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(p1) --[[ Line: 18 | Named "Scrubber" ]]
	-- upvalues: UseTokensFunction (copy), ReactOtterModule (copy), ReactModule (copy), MomentsCommonModule (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local IsHovering = p1.isHovering or p1.isPressed
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	ReactModule.useEffect(function() --[[ Line: 24 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), IsHovering (copy)
		UseAnimatedBindingResult2(ReactOtterModule.ease(if IsHovering then 1 else 0, {
			duration = if IsHovering then 0.12 else 0.08,
			easingStyle = Enum.EasingStyle.Quad
		}))
	end, { IsHovering })
	local MapResult = UseAnimatedBindingResult:map(function(Alpha: number) --[[ Line: 31 ]]
		-- upvalues: MomentsCommonModule (upval), UseTokensResult (copy)
		return {
			Color3 = MomentsCommonModule.Utils.Oklab.lerp(UseTokensResult.Color.System.Neutral.Color3, UseTokensResult.Color.System.Emphasis.Color3, Alpha),
			Transparency = math.lerp(UseTokensResult.Color.System.Neutral.Transparency, UseTokensResult.Color.System.Emphasis.Transparency, Alpha)
		}
	end)
	
	return ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center radius-circle bg-shift-100",
		Size = UseAnimatedBindingResult:map(function(Alpha: number): UDim2 --[[ Line: 46 ]]
			-- upvalues: UseTokensResult (copy)
			return UDim2.new(1, 0, 0, (math.lerp(UseTokensResult.Size.Size_100, UseTokensResult.Size.Size_150, Alpha)))
		end)
	}, {
		ProgressSegment = ReactModule.createElement(View, {
			tag = "radius-circle clip",
			Size = p1.progressRatio:map(function(XScale): UDim2 --[[ Line: 62 ]]
				return UDim2.fromScale(XScale, 1)
			end),
			backgroundStyle = MapResult
		}, {
			EndCap = ReactModule.createElement(View, {
				tag = "position-center-right anchor-center-right size-250-full",
				backgroundStyle = MapResult
			})
		}),
		Handle = ReactModule.createElement(View, {
			tag = "anchor-center-center radius-circle bg-contrast",
			ZIndex = 2,
			Size = UseAnimatedBindingResult:map(function(Alpha: number): UDim2 --[[ Line: 51 ]]
				-- upvalues: UseTokensResult (copy)
				local Interpolated = math.lerp(0, UseTokensResult.Size.Size_300, Alpha)
				
				return UDim2.fromOffset(Interpolated, Interpolated)
			end),
			Position = p1.progressRatio:map(function(XScale): UDim2 --[[ Line: 76 ]]
				return UDim2.fromScale(XScale, 0.5)
			end)
		})
	})
end)