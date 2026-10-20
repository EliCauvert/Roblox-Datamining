local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local CFrameUtility = require(Parent.Thumbnailing).CFrameUtility
local CameraUtility = require(Parent.Thumbnailing).CameraUtility
local CharacterUtility = require(Parent.Thumbnailing).CharacterUtility
local ConstantsModule = require(script.Parent.Parent.Constants)
local ComputeCutoutFieldOfViewDegModule = require(script.Parent.computeCutoutFieldOfViewDeg)
local ComputeFocusAngleAboveCenterRadModule = require(script.Parent.computeFocusAngleAboveCenterRad)

return function(p1): CFrame?
	-- upvalues: ConstantsModule (copy), ComputeCutoutFieldOfViewDegModule (copy), ComputeFocusAngleAboveCenterRadModule (copy), CFrameUtility (copy), CharacterUtility (copy), CameraUtility (copy)
	local Character = p1.character
	local Head = Character:FindFirstChild("Head")
	
	if Head and Head:IsA("BasePart") then
		local Layout = p1.layout
		local FieldOfViewDeg = p1.fieldOfViewDeg or ConstantsModule.CameraFieldOfViewDeg
		local FieldOfViewForDistanceScaleDeg = p1.fieldOfViewForDistanceScaleDeg or ComputeCutoutFieldOfViewDegModule({
			viewportHeightPix = Layout.viewportHeight,
			cutoutTopOffsetPix = Layout.cutoutTopOffset,
			cutoutDiameterPix = Layout.cutoutDiameter,
			cameraFieldOfViewDeg = FieldOfViewDeg
		})
		local FocusAngleAboveCenterRadModule = ComputeFocusAngleAboveCenterRadModule({
			viewportHeightPix = Layout.viewportHeight,
			cutoutTopOffsetPix = Layout.cutoutTopOffset,
			cutoutDiameterPix = Layout.cutoutDiameter,
			cameraFieldOfViewDeg = FieldOfViewDeg
		})
		local TargetCFrame = CFrameUtility.CalculateTargetCFrame(Head.CFrame)
		local HeadExtents, HeadExtents2 = CharacterUtility.CalculateHeadExtents(Character, TargetCFrame)
		local NewTargetCFrame = TargetCFrame + Vector3.new(0, (HeadExtents.Y + HeadExtents2.Y) / 2, 0)
		
		return CFrame.lookAt((NewTargetCFrame * CFrame.Angles(0, math.rad(p1.yRotDeg), 0) * CFrame.new(0, 0, -(CameraUtility.CalculateBaseDistanceToCamera(math.rad(FieldOfViewForDistanceScaleDeg), HeadExtents, HeadExtents2, CameraUtility.DefaultHeadMarginScale) * p1.distanceScale))).Position, NewTargetCFrame.Position) * CFrame.fromEulerAnglesXYZ(-FocusAngleAboveCenterRadModule, 0, 0)
	else
		return nil
	end
end