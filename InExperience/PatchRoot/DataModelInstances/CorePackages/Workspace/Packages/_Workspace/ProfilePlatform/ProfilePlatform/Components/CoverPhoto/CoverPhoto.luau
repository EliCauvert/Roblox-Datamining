local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local view = require(parent.Foundation).View
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage
local enumsModule = require(profilePlatform.Common.Enums)

local function _(p1, p2, p3)
	return p1 + (p2 - p1) * p3
end

return function(p1)
	-- upvalues: enumsModule (ref), useScreenSize (ref), reactModule (ref), view (ref), loadableImage (ref)
	local var1 = p1.profileFormFactorInfo.formFactor == enumsModule.ProfileFormFactor.Wide
	local var2 = p1.profileFormFactorInfo.formFactor == enumsModule.ProfileFormFactor.PeekView
	local isFullView = p1.profileFormFactorInfo.isFullView
	local var3 = useScreenSize()
	local var4 = reactModule.useMemo(function()
		-- upvalues: var2 (ref)
		return if var2 then 393 else 456
	end, { var2, isFullView, p1.peekViewOpenPercent })
	local var5 = reactModule.useMemo(function()
		-- upvalues: var2 (ref), isFullView (ref), p1 (ref), var4 (ref)
		return if var2 and not isFullView then p1.peekViewOpenPercent * 98 + 295 else var4
	end, { var2, isFullView, p1.peekViewOpenPercent, var4 })
	local var6 = var5 - 100
	local var7 = var6 - p1.parallaxOffset
	
	return reactModule.createElement(view, {
		ZIndex = -1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(if isFullView then UDim.new(0, var3.X) else UDim.new(1, 0), UDim.new(0, var6))
	}, {
		ParallaxWrapper = reactModule.createElement(view, {
			Size = UDim2.new(1, 0, 0, var7),
			Position = UDim2.new(0, 0, 0, p1.parallaxOffset)
		}, {
			CoverPhotoWrapper = reactModule.createElement(view, {
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 0, var5 - p1.parallaxOffset)
			}, {
				CoverPhoto = reactModule.createElement(loadableImage, {
					BackgroundTransparency = 1,
					useShimmerAnimationWhileLoading = true,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = p1.coverPhotoThumbnail,
					Position = UDim2.fromScale(0.5, 0.5),
					ScaleType = Enum.ScaleType.Crop,
					Size = UDim2.new(1, 0, 0, var4)
				})
			}),
			GradientWrapper = reactModule.createElement(view, {
				Size = UDim2.new(1, 0, 0, 100),
				Position = UDim2.new(0, 0, 0, var7),
				tag = if var1 or isFullView then "bg-surface-0" else "bg-surface-100"
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