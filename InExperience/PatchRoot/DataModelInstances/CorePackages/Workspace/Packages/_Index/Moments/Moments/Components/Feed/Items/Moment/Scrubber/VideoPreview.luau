local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local GetColorStyleWithTransparencyModule = require(Moments.Utils.getColorStyleWithTransparency)
local _ = require(script.Parent.useVideoScrubPreview)
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(Frame) --[[ Line: 32 | Named "VideoPreview" ]]
	-- upvalues: UseTokensFunction (copy), GetColorStyleWithTransparencyModule (copy), ReactModule (copy), ReactOtterModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	local Preview = Frame.preview
	local MapResult = Frame.animationRatio:map(function(p1: number): number --[[ Line: 37 ]]
		return 1 - p1
	end)
	local MapResult1 = MapResult:map(function(p1) --[[ Line: 42 ]]
		-- upvalues: GetColorStyleWithTransparencyModule (upval), UseTokensResult (copy)
		return GetColorStyleWithTransparencyModule(UseTokensResult.Color.Shift.Shift_400, p1).Transparency or 0
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Preview.isLoading)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, function() --[[ Line: 49 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end)
	ReactModule.useEffect(function() --[[ Line: 53 ]]
		-- upvalues: Preview (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval)
		if not Preview.isLoading then
			UseAnimatedBindingResult2(ReactOtterModule.ease(1, { duration = 0.1, easingStyle = Enum.EasingStyle.Quad }))
		end
	end, { Preview.isLoading })
	local MapResult2 = UseAnimatedBindingResult:map(function(p1: number): number --[[ Line: 64 ]]
		return 1 - p1
	end)
	
	return ReactModule.createElement(View, {
		tag = "size-2800 radius-medium bg-shift-200",
		aspectRatio = {
			AspectRatio = 0.5625,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		},
		stroke = {
			Color = UseTokensResult.Color.Shift.Shift_400.Color3,
			Transparency = MapResult1,
			Thickness = UseTokensResult.Stroke.Thick
		},
		GroupTransparency = MapResult,
		LayoutOrder = Frame.LayoutOrder
	}, {
		FrameA = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ImageTransparency = MapResult2,
			ScaleType = Enum.ScaleType.Crop,
			ImageContent = Preview.contentA,
			ZIndex = Preview.frontIsA:map(function(p1): number --[[ Line: 91 ]]
				return if p1 then 2 else 1
			end),
			ref = Preview.imageARef
		}),
		FrameB = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ImageTransparency = MapResult2,
			ScaleType = Enum.ScaleType.Crop,
			ImageContent = Preview.contentB,
			ZIndex = Preview.frontIsA:map(function(p1): number --[[ Line: 102 ]]
				return if p1 then 1 else 2
			end),
			ref = Preview.imageBRef
		}),
		SkeletonOverlay = if UseStateResult then ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = 3,
			GroupTransparency = UseAnimatedBindingResult
		}, {
			Shimmer = ReactModule.createElement(Skeleton, { radius = Radius.Medium, Size = UDim2.fromScale(1, 1) })
		}) else nil
	})
end)