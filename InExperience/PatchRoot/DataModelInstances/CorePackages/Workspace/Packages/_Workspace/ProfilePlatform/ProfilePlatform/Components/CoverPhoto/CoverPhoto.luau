local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseScreenSizeFunction = require(Parent.RobloxAppHooks).useScreenSize
local View = require(Parent.Foundation).View
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local EnumsModule = require(ProfilePlatform.Common.Enums)

local function _(p1, p2, p3) --[[ Line: 30 | Named "interpolateHeight" ]]
	return p1 + (p2 - p1) * p3
end

return function(p1) --[[ Line: 34 | Named "CoverPhoto" ]]
	-- upvalues: EnumsModule (copy), UseScreenSizeFunction (copy), ReactModule (copy), View (copy), LoadableImage (copy)
	local IsFormFactorMatch = p1.profileFormFactorInfo.formFactor == EnumsModule.ProfileFormFactor.Wide
	local IsFormFactorMatch1 = p1.profileFormFactorInfo.formFactor == EnumsModule.ProfileFormFactor.PeekView
	local IsFullView = p1.profileFormFactorInfo.isFullView
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseMemoResult = ReactModule.useMemo(function(): number --[[ Line: 40 ]]
		-- upvalues: IsFormFactorMatch1 (copy)
		return if IsFormFactorMatch1 then 393 else 456
	end, { IsFormFactorMatch1, IsFullView, p1.peekViewOpenPercent })
	local UseMemoResult1: number = ReactModule.useMemo(function() --[[ Line: 48 ]]
		-- upvalues: IsFormFactorMatch1 (copy), IsFullView (copy), p1 (copy), UseMemoResult (copy)
		return if IsFormFactorMatch1 and not IsFullView then p1.peekViewOpenPercent * 98 + 295 else UseMemoResult
	end, {
		IsFormFactorMatch1,
		IsFullView,
		p1.peekViewOpenPercent,
		UseMemoResult
	})
	local Offset = UseMemoResult1 - 100
	local OffsetDelta = Offset - p1.parallaxOffset
	
	return ReactModule.createElement(View, {
		ZIndex = -1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(if IsFullView then UDim.new(0, UseScreenSizeResult.X) else UDim.new(1, 0), UDim.new(0, Offset))
	}, {
		ParallaxWrapper = ReactModule.createElement(View, {
			Size = UDim2.new(1, 0, 0, OffsetDelta),
			Position = UDim2.new(0, 0, 0, p1.parallaxOffset)
		}, {
			CoverPhotoWrapper = ReactModule.createElement(View, {
				ClipsDescendants = true,
				Size = UDim2.new(1, 0, 0, UseMemoResult1 - p1.parallaxOffset)
			}, {
				CoverPhoto = ReactModule.createElement(LoadableImage, {
					BackgroundTransparency = 1,
					useShimmerAnimationWhileLoading = true,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = p1.coverPhotoThumbnail,
					Position = UDim2.fromScale(0.5, 0.5),
					ScaleType = Enum.ScaleType.Crop,
					Size = UDim2.new(1, 0, 0, UseMemoResult)
				})
			}),
			GradientWrapper = ReactModule.createElement(View, {
				Size = UDim2.new(1, 0, 0, 100),
				Position = UDim2.new(0, 0, 0, OffsetDelta),
				tag = if IsFormFactorMatch or IsFullView then "bg-surface-0" else "bg-surface-100"
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
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