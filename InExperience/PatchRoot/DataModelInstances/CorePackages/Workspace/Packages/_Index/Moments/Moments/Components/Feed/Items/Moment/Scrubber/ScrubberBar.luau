local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local momentsCommonModule = require(parent.MomentsCommon)
local reactOtterModule = require(parent.ReactOtter)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p0) --[[ line: 18 | named "Scrubber" ]]
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), momentsCommonModule (ref), view (ref)
	local var4 = useTokens()
	local isHovering = p0.isHovering or p0.isPressed
	local var6, var7 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: var7 (ref), reactOtterModule (copy), isHovering (ref)
		var7(reactOtterModule.ease(if isHovering then 1 else 0, {
			duration = if isHovering then 0.12 else 0.08,
			easingStyle = Enum.EasingStyle.Quad
		}))
	end, { isHovering })
	local var8 = var6:map(function(p1) --[[ line: 31 ]]
		-- upvalues: momentsCommonModule (copy), var4 (ref)
		return {
			Color3 = momentsCommonModule.Utils.Oklab.lerp(var4.Color.System.Neutral.Color3, var4.Color.System.Emphasis.Color3, p1),
			Transparency = math.lerp(var4.Color.System.Neutral.Transparency, var4.Color.System.Emphasis.Transparency, p1)
		}
	end)
	
	return reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center radius-circle bg-shift-100",
		Size = var6:map(function(p2) --[[ line: 46 ]]
			-- upvalues: var4 (ref)
			return UDim2.new(1, 0, 0, math.lerp(var4.Size.Size_100, var4.Size.Size_150, p2))
		end)
	}, {
		ProgressSegment = reactModule.createElement(view, {
			tag = "radius-circle clip",
			Size = p0.progressRatio:map(function(p3) --[[ line: 62 ]]
				return UDim2.fromScale(p3, 1)
			end),
			backgroundStyle = var8
		}, {
			EndCap = reactModule.createElement(view, {
				tag = "position-center-right anchor-center-right size-250-full",
				backgroundStyle = var8
			})
		}),
		Handle = reactModule.createElement(view, {
			tag = "anchor-center-center radius-circle bg-contrast",
			ZIndex = 2,
			Size = var6:map(function(p4) --[[ line: 51 ]]
				-- upvalues: var4 (ref)
				local lerped = math.lerp(0, var4.Size.Size_300, p4)
				
				return UDim2.fromOffset(lerped, lerped)
			end),
			Position = p0.progressRatio:map(function(p5) --[[ line: 76 ]]
				return UDim2.fromScale(p5, 0.5)
			end)
		})
	})
end)