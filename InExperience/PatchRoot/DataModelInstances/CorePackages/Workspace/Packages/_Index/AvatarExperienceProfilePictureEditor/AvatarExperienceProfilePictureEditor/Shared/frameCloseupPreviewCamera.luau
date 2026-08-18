local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local cFrameUtility = require(parent.Thumbnailing).CFrameUtility
local cameraUtility = require(parent.Thumbnailing).CameraUtility
local characterUtility = require(parent.Thumbnailing).CharacterUtility
local constantsModule = require(script.Parent.Parent.Constants)
local computeCutoutFieldOfViewDegModule = require(script.Parent.computeCutoutFieldOfViewDeg)
local computeFocusAngleAboveCenterRadModule = require(script.Parent.computeFocusAngleAboveCenterRad)

return function(p0) --[[ line: 32 | named "frameCloseupPreviewCamera" ]]
	-- upvalues: constantsModule (ref), computeCutoutFieldOfViewDegModule (ref), computeFocusAngleAboveCenterRadModule (ref), cFrameUtility (ref), characterUtility (ref), cameraUtility (ref)
	local character = p0.character
	local head = character:FindFirstChild("Head")
	
	if head and head:IsA("BasePart") then
		local layout = p0.layout
		local fieldOfViewDeg = p0.fieldOfViewDeg or constantsModule.CameraFieldOfViewDeg
		local fieldOfViewForDistanceScaleDeg = p0.fieldOfViewForDistanceScaleDeg or computeCutoutFieldOfViewDegModule({
			viewportHeightPix = layout.viewportHeight,
			cutoutTopOffsetPix = layout.cutoutTopOffset,
			cutoutDiameterPix = layout.cutoutDiameter,
			cameraFieldOfViewDeg = fieldOfViewDeg
		})
		local var6 = computeFocusAngleAboveCenterRadModule({
			viewportHeightPix = layout.viewportHeight,
			cutoutTopOffsetPix = layout.cutoutTopOffset,
			cutoutDiameterPix = layout.cutoutDiameter,
			cameraFieldOfViewDeg = fieldOfViewDeg
		})
		local var7 = cFrameUtility.CalculateTargetCFrame(head.CFrame)
		local var8, var9 = characterUtility.CalculateHeadExtents(character, var7)
		local var10 = var7 + Vector3.new(0, (var8.Y + var9.Y) / 2, 0)
		
		return CFrame.lookAt((var10 * CFrame.Angles(0, math.rad(p0.yRotDeg), 0) * CFrame.new(0, 0, -(cameraUtility.CalculateBaseDistanceToCamera(math.rad(fieldOfViewForDistanceScaleDeg), var8, var9, cameraUtility.DefaultHeadMarginScale) * p0.distanceScale))).Position, var10.Position) * CFrame.fromEulerAnglesXYZ(-var6, 0, 0)
	end
	return nil
end