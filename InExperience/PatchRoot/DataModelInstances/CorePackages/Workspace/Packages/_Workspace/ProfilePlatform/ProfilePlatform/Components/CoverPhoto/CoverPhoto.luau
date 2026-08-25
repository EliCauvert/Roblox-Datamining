local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local view = require(parent.Foundation).View
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage
local enumsModule = require(profilePlatform.Common.Enums)

local function _(p0, p1, p2)
	return p0 + (p1 - p0) * p2
end

return function(p3)
	-- upvalues: enumsModule (ref), useScreenSize (ref), reactModule (ref), view (ref), loadableImage (ref)
	local var3 = p3.profileFormFactorInfo.formFactor == enumsModule.ProfileFormFactor.Wide
	local var4 = p3.profileFormFactorInfo.formFactor == enumsModule.ProfileFormFactor.PeekView
	local isFullView = p3.profileFormFactorInfo.isFullView
	local var5 = useScreenSize()
	local var6 = reactModule.useMemo(function()
		-- upvalues: var4 (ref)
		return if var4 then 393 else 456
	end, { var4, isFullView, p3.peekViewOpenPercent })
	local var7 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), isFullView (ref), p3 (ref), var6 (ref)
		return if var4 and not isFullView then p3.peekViewOpenPercent * 98 + 295 else var6
	end, { var4, isFullView, p3.peekViewOpenPercent, var6 })
	local var8 = var7 - 100
	local var9 = var8 - p3.parallaxOffset
	
	return reactModule.createElement(view, {
		ZIndex = -1,
		LayoutOrder = p3.layoutOrder,
		Size = UDim2.new(if isFullView then UDim.new(0, var5.X) else UDim.new(1, 0), UDim.new(0, var8))
	}, {
		ParallaxWrapper = reactModule.createElement(view, {
			Size = UDim2.new(1, 0, 0, var9),
			Position = UDim2.new(0, 0, 0, p3.parallaxOffset)
		}, {
			CoverPhotoWrapper = reactModule.createElement(view, {
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 0, var7 - p3.parallaxOffset)
			}, {
				CoverPhoto = reactModule.createElement(loadableImage, {
					BackgroundTransparency = 1,
					useShimmerAnimationWhileLoading = true,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = p3.coverPhotoThumbnail,
					Position = UDim2.fromScale(0.5, 0.5),
					ScaleType = Enum.ScaleType.Crop,
					Size = UDim2.new(1, 0, 0, var6)
				})
			}),
			GradientWrapper = reactModule.createElement(view, {
				Size = UDim2.new(1, 0, 0, 100),
				Position = UDim2.new(0, 0, 0, var9),
				tag = if var3 or isFullView then "bg-surface-0" else "bg-surface-100"
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Rotation = 270,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 0),
						NumberSequenceKeypoint.new(0.25, 0),
						NumberSequenceKeypoint.new(0.5, 0.1),
						NumberSequenceKeypoint.new(0.75, 0.5),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			})
		})
	})
end