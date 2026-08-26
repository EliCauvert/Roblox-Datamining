local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local constantsModule = require(avatarExperienceProfilePictureEditor.Constants)
local computeCutoutFieldOfViewDegModule = require(avatarExperienceProfilePictureEditor.Shared.computeCutoutFieldOfViewDeg)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation
local useScreenSize = robloxAppHooksModule.useScreenSize

local function _(p1, p2)
	-- upvalues: constantsModule (ref)
	return p1 + p2 + constantsModule.StackedPreviewBottomMargin
end

local function computeEditProfileImageLayout(p1)
	-- upvalues: constantsModule (ref), computeCutoutFieldOfViewDegModule (ref)
	local var1 = if p1.deviceOrientation == "Landscape" then "split" else "stacked"
	local var2 = p1.screenSize.X - p1.guiInset.left - p1.guiInset.right
	local var3 = p1.screenSize.Y - p1.guiInset.top - p1.guiInset.bottom
	local var4 = var2 - (if var1 == "split" then math.floor(var2 * constantsModule.SplitControlsPaneWidthScale + 0.5) else 0)
	local floored = math.floor(math.min(var4 * 0.666666666667, var3 * 0.375) + 0.5)
	local var5 = p1.guiInset.top + (if var1 == "split" then 72 else 36)
	
	return {
		mode = var1,
		safeWidth = var2,
		previewWidth = var4,
		previewHeight = var3,
		visiblePreviewHeight = if var1 == "split" then var3 else var5 + floored + constantsModule.StackedPreviewBottomMargin,
		cutoutSize = floored,
		cutoutTopOffset = var5,
		closeButtonTopOffset = p1.guiInset.top + 12,
		cutoutFieldOfViewDeg = computeCutoutFieldOfViewDegModule({
			viewportHeightPix = var3,
			cutoutTopOffsetPix = var5,
			cutoutDiameterPix = floored
		})
	}
end

return {
	useEditProfileImageLayout = function(p1)
		-- upvalues: useDeviceOrientation (ref), useScreenSize (ref), computeEditProfileImageLayout (ref)
		return computeEditProfileImageLayout({
			guiInset = p1.guiInset,
			deviceOrientation = useDeviceOrientation(),
			screenSize = useScreenSize()
		})
	end,
	computeEditProfileImageLayout = computeEditProfileImageLayout
}