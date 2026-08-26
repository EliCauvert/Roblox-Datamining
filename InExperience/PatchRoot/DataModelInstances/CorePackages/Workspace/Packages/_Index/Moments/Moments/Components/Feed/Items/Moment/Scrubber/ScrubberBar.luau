local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local momentsCommonModule = require(parent.MomentsCommon)
local reactOtterModule = require(parent.ReactOtter)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactOtterModule (ref), reactModule (ref), momentsCommonModule (ref), view (ref)
	local var1 = useTokens()
	local isHovering = p1.isHovering or p1.isPressed
	local var2, var3 = reactOtterModule.useAnimatedBinding(0)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), reactOtterModule (copy), isHovering (ref)
		var3(reactOtterModule.ease(if isHovering then 1 else 0, {
			duration = if isHovering then 0.12 else 0.08,
			easingStyle = Enum.EasingStyle.Quad
		}))
	end, { isHovering })
	local var4 = var2:map(function(p2)
		-- upvalues: momentsCommonModule (copy), var1 (ref)
		return {
			Color3 = momentsCommonModule.Utils.Oklab.lerp(var1.Color.System.Neutral.Color3, var1.Color.System.Emphasis.Color3, p2),
			Transparency = math.lerp(var1.Color.System.Neutral.Transparency, var1.Color.System.Emphasis.Transparency, p2)
		}
	end)
	
	return reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center radius-circle bg-shift-100",
		Size = var2:map(function(p2)
			-- upvalues: var1 (ref)
			return UDim2.new(1, 0, 0, math.lerp(var1.Size.Size_100, var1.Size.Size_150, p2))
		end)
	}, {
		ProgressSegment = reactModule.createElement(view, {
			tag = "radius-circle clip",
			Size = p1.progressRatio:map(function(p2)
				return UDim2.fromScale(p2, 1)
			end),
			backgroundStyle = var4
		}, {
			EndCap = reactModule.createElement(view, {
				tag = "position-center-right anchor-center-right size-250-full",
				backgroundStyle = var4
			})
		}),
		Handle = reactModule.createElement(view, {
			tag = "anchor-center-center radius-circle bg-contrast",
			ZIndex = 2,
			Size = var2:map(function(p2)
				-- upvalues: var1 (ref)
				local lerped = math.lerp(0, var1.Size.Size_300, p2)
				
				return UDim2.fromOffset(lerped, lerped)
			end),
			Position = p1.progressRatio:map(function(p2)
				return UDim2.fromScale(p2, 0.5)
			end)
		})
	})
end)