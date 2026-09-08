local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local cFrameUtility = require(parent.Thumbnailing).CFrameUtility
local cameraUtility = require(parent.Thumbnailing).CameraUtility
local characterUtility = require(parent.Thumbnailing).CharacterUtility
local constantsModule = require(script.Parent.Parent.Constants)
local computeCutoutFieldOfViewDegModule = require(script.Parent.computeCutoutFieldOfViewDeg)
local computeFocusAngleAboveCenterRadModule = require(script.Parent.computeFocusAngleAboveCenterRad)

return function(p1)
	-- upvalues: constantsModule (ref), computeCutoutFieldOfViewDegModule (ref), computeFocusAngleAboveCenterRadModule (ref), cFrameUtility (ref), characterUtility (ref), cameraUtility (ref)
	local character = p1.character
	local head = character:FindFirstChild("Head")
	
	if head and head:IsA("BasePart") then
		local layout = p1.layout
		local fieldOfViewDeg = p1.fieldOfViewDeg or constantsModule.CameraFieldOfViewDeg
		local fieldOfViewForDistanceScaleDeg = p1.fieldOfViewForDistanceScaleDeg or computeCutoutFieldOfViewDegModule({
			viewportHeightPix = layout.viewportHeight,
			cutoutTopOffsetPix = layout.cutoutTopOffset,
			cutoutDiameterPix = layout.cutoutDiameter,
			cameraFieldOfViewDeg = fieldOfViewDeg
		})
		local var1 = computeFocusAngleAboveCenterRadModule({
			viewportHeightPix = layout.viewportHeight,
			cutoutTopOffsetPix = layout.cutoutTopOffset,
			cutoutDiameterPix = layout.cutoutDiameter,
			cameraFieldOfViewDeg = fieldOfViewDeg
		})
		local var2 = cFrameUtility.CalculateTargetCFrame(head.CFrame)
		local var3, var4 = characterUtility.CalculateHeadExtents(character, var2)
		local var5 = var2 + Vector3.new(0, (var3.Y + var4.Y) / 2, 0)
		
		return CFrame.lookAt((var5 * CFrame.Angles(0, math.rad(p1.yRotDeg), 0) * CFrame.new(0, 0, -(cameraUtility.CalculateBaseDistanceToCamera(math.rad(fieldOfViewForDistanceScaleDeg), var3, var4, cameraUtility.DefaultHeadMarginScale) * p1.distanceScale))).Position, var5.Position) * CFrame.fromEulerAnglesXYZ(-var1, 0, 0)
	end
	return nil
end