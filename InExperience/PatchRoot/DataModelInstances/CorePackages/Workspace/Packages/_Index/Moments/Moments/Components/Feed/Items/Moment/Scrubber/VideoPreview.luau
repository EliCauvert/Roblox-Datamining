local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local getColorStyleWithTransparencyModule = require(moments.Utils.getColorStyleWithTransparency)
local _ = require(script.Parent.useVideoScrubPreview)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p0) --[[ line: 32 | named "VideoPreview" ]]
	-- upvalues: useTokens (ref), getColorStyleWithTransparencyModule (ref), reactModule (ref), reactOtterModule (ref), view (ref), skeleton (ref), radius (ref)
	local var5 = useTokens()
	local preview = p0.preview
	local var6 = p0.animationRatio:map(function(p1) --[[ line: 37 ]]
		return 1 - p1
	end)
	local var7 = var6:map(function(p2) --[[ line: 42 ]]
		-- upvalues: getColorStyleWithTransparencyModule (copy), var5 (ref)
		return getColorStyleWithTransparencyModule(var5.Color.Shift.Shift_400, p2).Transparency or 0
	end)
	local var8, var9 = reactModule.useState(preview.isLoading)
	local var10, var11 = reactOtterModule.useAnimatedBinding(0, function() --[[ line: 49 ]]
		-- upvalues: var9 (ref)
		var9(false)
	end)
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: preview (ref), var11 (ref), reactOtterModule (copy)
		if not preview.isLoading then
			var11(reactOtterModule.ease(1, { duration = 0.1, easingStyle = Enum.EasingStyle.Quad }))
		end
	end, { preview.isLoading })
	local var12 = var10:map(function(p3) --[[ line: 64 ]]
		return 1 - p3
	end)
	
	return reactModule.createElement(view, {
		tag = "size-2800 radius-medium bg-shift-200",
		aspectRatio = {
			AspectRatio = 0.5625,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		},
		stroke = {
			Color = var5.Color.Shift.Shift_400.Color3,
			Transparency = var7,
			Thickness = var5.Stroke.Thick
		},
		GroupTransparency = var6,
		LayoutOrder = p0.LayoutOrder
	}, {
		FrameA = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ImageTransparency = var12,
			ScaleType = Enum.ScaleType.Crop,
			ImageContent = preview.contentA,
			ZIndex = preview.frontIsA:map(function(p4) --[[ line: 91 ]]
				return if p4 then 2 else 1
			end),
			ref = preview.imageARef
		}),
		FrameB = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ImageTransparency = var12,
			ScaleType = Enum.ScaleType.Crop,
			ImageContent = preview.contentB,
			ZIndex = preview.frontIsA:map(function(p5) --[[ line: 102 ]]
				return if p5 then 1 else 2
			end),
			ref = preview.imageBRef
		}),
		SkeletonOverlay = if var8 then reactModule.createElement(view, { tag = "size-full", ZIndex = 3, GroupTransparency = var10 }, {
			Shimmer = reactModule.createElement(skeleton, { radius = radius.Medium, Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
end)