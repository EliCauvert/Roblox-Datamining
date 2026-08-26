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

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), t (ref), t_1 (ref), TILT_DEGREES (ref), view (ref), skeleton (ref), image (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(false)
	local keyart = p1.keyart or t
	local frame = p1.frame or t_1
	local var4 = var1.Size.Size_2400 * 2
	local var5 = var4 / (math.cos(math.rad(TILT_DEGREES)) + math.sin(math.rad(TILT_DEGREES)))
	
	return reactModule.createElement(view, {
		testId = "tilt-keyart",
		Size = UDim2.fromOffset(var4, var4)
	}, {
		Square = reactModule.createElement(view, {
			tag = "position-center-center anchor-center-center stroke-standard stroke-system-neutral",
			testId = "tilt-keyart-frame",
			ZIndex = 1,
			Size = frame.sizeScale:map(function(p2)
				-- upvalues: var5 (ref)
				return UDim2.fromOffset(var5 * p2, var5 * p2)
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
			Size = keyart.sizeScale:map(function(p2)
				-- upvalues: var5 (ref)
				return UDim2.fromOffset(var5 * p2, var5 * p2)
			end),
			Rotation = keyart.rotation
		}, {
			ThumbnailSkeleton = if not var2 then reactModule.createElement(skeleton, {
				tag = "size-full",
				ZIndex = 1,
				testId = "tilt-keyart-skeleton"
			}) else nil,
			Thumbnail = if p1.thumbnailUrl ~= "" then nil else reactModule.createElement(image, {
				tag = "size-full radius-small",
				ZIndex = 2,
				testId = "tilt-keyart-thumbnail",
				Image = p1.thumbnailUrl,
				ScaleType = Enum.ScaleType.Crop,
				ImageTransparency = if var2 then 0 else 1,
				onLoaded = reactModule.useCallback(function(p2)
					-- upvalues: var3 (ref)
					if p2 == Enum.AssetFetchStatus.Success then
						var3(true)
					end
				end, {})
			}),
			RevealCover = reactModule.createElement(view, {
				tag = "size-full",
				ZIndex = 3,
				backgroundStyle = keyart.coverTransparency:map(function(p2)
					-- upvalues: var1 (ref)
					return {
						Color3 = var1.Color.Extended.Black.Black_100.Color3,
						Transparency = p2
					}
				end)
			})
		})
	})
end)