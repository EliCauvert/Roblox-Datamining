local tiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local parent = tiltLoadingScreen.Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local useTokens = foundationModule.Hooks.useTokens
local TILT_DEGREES = require(tiltLoadingScreen.Constants).KEYART.TILT_DEGREES
local _ = require(tiltLoadingScreen.Types)
local t = {
	rotation = reactModule.createBinding(TILT_DEGREES),
	sizeScale = reactModule.createBinding(1),
	coverTransparency = reactModule.createBinding(1)
}
local t_1 = {
	rotation = reactModule.createBinding(-TILT_DEGREES),
	sizeScale = reactModule.createBinding(1),
	groupTransparency = reactModule.createBinding(0)
}

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), t (ref), t_1 (ref), TILT_DEGREES (ref), view (ref), skeleton (ref), image (ref)
	local var5 = useTokens()
	local var6, var7 = reactModule.useState(false)
	local keyart = p0.keyart or t
	local frame = p0.frame or t_1
	local var10 = var5.Size.Size_2400 * 2
	local var11 = var10 / (math.cos(math.rad(TILT_DEGREES)) + math.sin(math.rad(TILT_DEGREES)))
	
	return reactModule.createElement(view, {
		testId = "tilt-keyart",
		Size = UDim2.fromOffset(var10, var10)
	}, {
		Square = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center stroke-standard stroke-system-neutral",
			testId = "tilt-keyart-frame",
			ZIndex = 1,
			Size = frame.sizeScale:map(function(p1)
				-- upvalues: var11 (ref)
				return UDim2.fromOffset(var11 * p1, var11 * p1)
			end),
			Rotation = frame.rotation,
			GroupTransparency = frame.groupTransparency,
			Visible = frame.groupTransparency:map(function(p2)
				return p2 < 1
			end)
		}),
		Keyart = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center",
			testId = "tilt-keyart-card",
			ZIndex = 2,
			Size = keyart.sizeScale:map(function(p3)
				-- upvalues: var11 (ref)
				return UDim2.fromOffset(var11 * p3, var11 * p3)
			end),
			Rotation = keyart.rotation
		}, {
			ThumbnailSkeleton = if not var6 then reactModule.createElement(skeleton, {
				tag = "size-full",
				ZIndex = 1,
				testId = "tilt-keyart-skeleton"
			}) else nil,
			Thumbnail = if p0.thumbnailUrl ~= "" then nil else reactModule.createElement(image, {
				tag = "size-full radius-small",
				ZIndex = 2,
				testId = "tilt-keyart-thumbnail",
				Image = p0.thumbnailUrl,
				ScaleType = Enum.ScaleType.Crop,
				ImageTransparency = if var6 then 0 else 1,
				onLoaded = reactModule.useCallback(function(p4)
					-- upvalues: var7 (ref)
					if p4 == Enum.AssetFetchStatus.Success then
						var7(true)
					end
				end, {})
			}),
			RevealCover = reactModule.createElement(view, {
				tag = "size-full",
				ZIndex = 3,
				backgroundStyle = keyart.coverTransparency:map(function(p5)
					-- upvalues: var5 (ref)
					return {
						Color3 = var5.Color.Extended.Black.Black_100.Color3,
						Transparency = p5
					}
				end)
			})
		})
	})
end)