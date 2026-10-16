local TiltLoadingScreen = script:FindFirstAncestor("TiltLoadingScreen")
local Parent = TiltLoadingScreen.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Image = FoundationModule.Image
local Skeleton = FoundationModule.Skeleton
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagLoadingScreenMilestones = require(Parent.SharedFlags).FFlagLoadingScreenMilestones
local TILTDEGREES = require(TiltLoadingScreen.Constants).KEYART.TILT_DEGREES
local _ = require(TiltLoadingScreen.Types)
local config = {
	rotation = ReactModule.createBinding(TILTDEGREES),
	sizeScale = ReactModule.createBinding(1),
	coverTransparency = ReactModule.createBinding(1)
}
local config1 = {
	rotation = ReactModule.createBinding(-TILTDEGREES),
	sizeScale = ReactModule.createBinding(1),
	groupTransparency = ReactModule.createBinding(0)
}

return ReactModule.memo(function(p1) --[[ Line: 30 | Named "TiltKeyart" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), config (copy), config1 (copy), TILTDEGREES (copy), FFlagLoadingScreenMilestones (copy), View (copy), Skeleton (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Keyart = p1.keyart or config
	local Frame = p1.frame or config1
	local ScaledSize = UseTokensResult.Size.Size_2400 * 2
	local ScaledSizeRatio = ScaledSize / (math.cos((math.rad(TILTDEGREES))) + math.sin((math.rad(TILTDEGREES))))
	local UseResult = ReactModule.useCallback(function(AssetFetchStatus) --[[ Line: 39 ]]
		-- upvalues: UseStateResult2 (copy)
		if AssetFetchStatus == Enum.AssetFetchStatus.Success then
			UseStateResult2(true)
		end
	end, {})
	
	if FFlagLoadingScreenMilestones then
		ReactModule.useEffect(function() --[[ Line: 46 ]]
			-- upvalues: p1 (copy), UseStateResult (copy)
			local OnThumbnailLoadedFunction: (any) -> () = p1.onThumbnailLoaded
			
			if not OnThumbnailLoadedFunction then return end
			if UseStateResult and p1.thumbnailUrl ~= "" then
				OnThumbnailLoadedFunction(p1.thumbnailUrl)
			end
			return function() --[[ Line: 54 ]]
				-- upvalues: OnThumbnailLoadedFunction (copy)
				OnThumbnailLoadedFunction(nil)
			end
		end, { UseStateResult, p1.thumbnailUrl, p1.onThumbnailLoaded })
	end
	return ReactModule.createElement(View, {
		testId = "tilt-keyart",
		Size = UDim2.fromOffset(ScaledSize, ScaledSize)
	}, {
		Square = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center stroke-standard stroke-system-neutral",
			testId = "tilt-keyart-frame",
			ZIndex = 1,
			Size = Frame.sizeScale:map(function(p2): UDim2 --[[ Line: 67 ]]
				-- upvalues: ScaledSizeRatio (copy)
				return UDim2.fromOffset(ScaledSizeRatio * p2, ScaledSizeRatio * p2)
			end),
			Rotation = Frame.rotation,
			GroupTransparency = Frame.groupTransparency,
			Visible = Frame.groupTransparency:map(function(p2: number): boolean --[[ Line: 72 ]]
				return p2 < 1
			end)
		}),
		Keyart = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center",
			testId = "tilt-keyart-card",
			ZIndex = 2,
			Size = Keyart.sizeScale:map(function(p2): UDim2 --[[ Line: 80 ]]
				-- upvalues: ScaledSizeRatio (copy)
				return UDim2.fromOffset(ScaledSizeRatio * p2, ScaledSizeRatio * p2)
			end),
			Rotation = Keyart.rotation
		}, {
			ThumbnailSkeleton = if UseStateResult then nil else ReactModule.createElement(Skeleton, {
				tag = "size-full",
				ZIndex = 1,
				testId = "tilt-keyart-skeleton"
			}),
			Thumbnail = if p1.thumbnailUrl == "" then nil else ReactModule.createElement(Image, {
				tag = "size-full radius-small",
				ZIndex = 2,
				testId = "tilt-keyart-thumbnail",
				Image = p1.thumbnailUrl,
				ScaleType = Enum.ScaleType.Crop,
				ImageTransparency = if UseStateResult then 0 else 1,
				onLoaded = UseResult
			}),
			RevealCover = ReactModule.createElement(View, {
				tag = "size-full",
				ZIndex = 3,
				backgroundStyle = Keyart.coverTransparency:map(function(Transparency) --[[ Line: 106 ]]
					-- upvalues: UseTokensResult (copy)
					return {
						Color3 = UseTokensResult.Color.Extended.Black.Black_100.Color3,
						Transparency = Transparency
					}
				end)
			})
		})
	})
end)