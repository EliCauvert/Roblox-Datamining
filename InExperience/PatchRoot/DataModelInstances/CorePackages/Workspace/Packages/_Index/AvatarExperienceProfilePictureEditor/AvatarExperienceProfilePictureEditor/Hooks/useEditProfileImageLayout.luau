local AvatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local ConstantsModule = require(AvatarExperienceProfilePictureEditor.Constants)
local ComputeCutoutFieldOfViewDegModule = require(AvatarExperienceProfilePictureEditor.Shared.computeCutoutFieldOfViewDeg)
local RobloxAppHooksModule = require(AvatarExperienceProfilePictureEditor.Parent.RobloxAppHooks)
local UseDeviceOrientationFunction = RobloxAppHooksModule.useDeviceOrientation
local UseScreenSizeFunction = RobloxAppHooksModule.useScreenSize

local function _(p1, p2) --[[ Line: 50 | Named "computeVisiblePeekabooPreviewHeight" ]]
	-- upvalues: ConstantsModule (copy)
	return p1 + p2 + ConstantsModule.StackedPreviewBottomMargin
end

local function computeEditProfileImageLayout(p1) --[[ Line: 55 ]]
	-- upvalues: ConstantsModule (copy), ComputeCutoutFieldOfViewDegModule (copy)
	local Split: string = if p1.deviceOrientation == "Landscape" then "split" else "stacked"
	local XDelta = p1.screenSize.X - p1.guiInset.left - p1.guiInset.right
	local YDelta = p1.screenSize.Y - p1.guiInset.top - p1.guiInset.bottom
	local XDeltaDelta = XDelta - (if Split == "split" then math.floor(XDelta * ConstantsModule.SplitControlsPaneWidthScale + 0.5) else 0)
	local Floored = math.floor(math.min(XDeltaDelta * 0.6666666666666666, YDelta * 0.375) + 0.5)
	local NewTop = p1.guiInset.top + (if Split == "split" then 72 else 36)
	
	return {
		mode = Split,
		safeWidth = XDelta,
		previewWidth = XDeltaDelta,
		previewHeight = YDelta,
		visiblePreviewHeight = if Split == "split" then YDelta else NewTop + Floored + ConstantsModule.StackedPreviewBottomMargin,
		cutoutSize = Floored,
		cutoutTopOffset = NewTop,
		closeButtonTopOffset = p1.guiInset.top + 12,
		cutoutFieldOfViewDeg = ComputeCutoutFieldOfViewDegModule({
			viewportHeightPix = YDelta,
			cutoutTopOffsetPix = NewTop,
			cutoutDiameterPix = Floored
		})
	}
end

return {
	useEditProfileImageLayout = function(p1) --[[ Line: 89 ]]
		-- upvalues: UseDeviceOrientationFunction (copy), UseScreenSizeFunction (copy), computeEditProfileImageLayout (copy)
		return (computeEditProfileImageLayout({
			guiInset = p1.guiInset,
			deviceOrientation = UseDeviceOrientationFunction(),
			screenSize = UseScreenSizeFunction()
		}))
	end,
	computeEditProfileImageLayout = computeEditProfileImageLayout
}