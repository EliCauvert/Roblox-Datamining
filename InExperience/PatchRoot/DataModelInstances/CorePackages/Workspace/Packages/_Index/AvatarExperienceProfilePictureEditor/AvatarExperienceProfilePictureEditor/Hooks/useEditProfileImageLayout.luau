local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)
local computeCutoutFieldOfViewDegModule = require(avatarExperienceProfilePictureEditor.Shared.computeCutoutFieldOfViewDeg)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation
local useScreenSize = robloxAppHooksModule.useScreenSize

local function _(p0, p1) --[[ line: 50 | named "computeVisiblePeekabooPreviewHeight" ]]
	-- upvalues: constantsModule (ref)
	return p0 + p1 + constantsModule.StackedPreviewBottomMargin
end

local function computeEditProfileImageLayout(p2) --[[ line: 55 ]]
	-- upvalues: constantsModule (ref), computeCutoutFieldOfViewDegModule (ref)
	local var5 = if p2.deviceOrientation == "Landscape" then "split" else "stacked"
	local var6 = p2.screenSize.X - p2.guiInset.left - p2.guiInset.right
	local var7 = p2.screenSize.Y - p2.guiInset.top - p2.guiInset.bottom
	local var8 = var6 - (if var5 == "split" then math.floor(var6 * constantsModule.SplitControlsPaneWidthScale + 0.5) else 0)
	local floored = math.floor(math.min(var8 * 0.666666666667, var7 * 0.375) + 0.5)
	local var10 = p2.guiInset.top + (if var5 == "split" then 72 else 36)
	
	return {
		mode = var5,
		safeWidth = var6,
		previewWidth = var8,
		previewHeight = var7,
		visiblePreviewHeight = if var5 == "split" then var7 else var10 + floored + constantsModule.StackedPreviewBottomMargin,
		cutoutSize = floored,
		cutoutTopOffset = var10,
		closeButtonTopOffset = p2.guiInset.top + 12,
		cutoutFieldOfViewDeg = computeCutoutFieldOfViewDegModule({
			viewportHeightPix = var7,
			cutoutTopOffsetPix = var10,
			cutoutDiameterPix = floored
		})
	}
end

return {
	useEditProfileImageLayout = function(p3) --[[ line: 89 ]]
		-- upvalues: useDeviceOrientation (ref), useScreenSize (ref), computeEditProfileImageLayout (ref)
		return computeEditProfileImageLayout({
			guiInset = p3.guiInset,
			deviceOrientation = useDeviceOrientation(),
			screenSize = useScreenSize()
		})
	end,
	computeEditProfileImageLayout = computeEditProfileImageLayout
}