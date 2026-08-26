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

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), getColorStyleWithTransparencyModule (ref), reactModule (ref), reactOtterModule (ref), view (ref), skeleton (ref), radius (ref)
	local var1 = useTokens()
	local preview = p1.preview
	local var2 = p1.animationRatio:map(function(p2)
		return 1 - p2
	end)
	local var3 = var2:map(function(p2)
		-- upvalues: getColorStyleWithTransparencyModule (copy), var1 (ref)
		return getColorStyleWithTransparencyModule(var1.Color.Shift.Shift_400, p2).Transparency or 0
	end)
	local var4, var5 = reactModule.useState(preview.isLoading)
	local var6, var7 = reactOtterModule.useAnimatedBinding(0, function()
		-- upvalues: var5 (ref)
		var5(false)
	end)
	reactModule.useEffect(function()
		-- upvalues: preview (ref), var7 (ref), reactOtterModule (copy)
		if not preview.isLoading then
			var7(reactOtterModule.ease(1, { duration = 0.1, easingStyle = Enum.EasingStyle.Quad }))
		end
	end, { preview.isLoading })
	local var8 = var6:map(function(p2)
		return 1 - p2
	end)
	
	return reactModule.createElement(view, {
		tag = "size-2800 radius-medium bg-shift-200",
		aspectRatio = {
			AspectRatio = 0.5625,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		},
		stroke = {
			Color = var1.Color.Shift.Shift_400.Color3,
			Transparency = var3,
			Thickness = var1.Stroke.Thick
		},
		GroupTransparency = var2,
		LayoutOrder = p1.LayoutOrder
	}, {
		FrameA = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ImageTransparency = var8,
			ScaleType = Enum.ScaleType.Crop,
			ImageContent = preview.contentA,
			ZIndex = preview.frontIsA:map(function(p2)
				return if p2 then 2 else 1
			end),
			ref = preview.imageARef
		}),
		FrameB = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ImageTransparency = var8,
			ScaleType = Enum.ScaleType.Crop,
			ImageContent = preview.contentB,
			ZIndex = preview.frontIsA:map(function(p2)
				return if p2 then 1 else 2
			end),
			ref = preview.imageBRef
		}),
		SkeletonOverlay = if var4 then reactModule.createElement(view, { tag = "size-full", ZIndex = 3, GroupTransparency = var6 }, {
			Shimmer = reactModule.createElement(skeleton, { radius = radius.Medium, Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
end)