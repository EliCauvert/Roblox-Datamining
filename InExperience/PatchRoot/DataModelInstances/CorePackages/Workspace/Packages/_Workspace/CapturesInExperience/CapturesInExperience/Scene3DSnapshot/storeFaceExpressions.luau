local list = {
	"ChinRaiser", "ChinRaiserUpperLip", "Corrugator", "EyesLookDown",
	"EyesLookLeft", "EyesLookRight", "EyesLookUp", "FlatPucker", "Funneler",
	"JawDrop", "JawLeft", "JawRight", "LeftBrowLowerer", "LeftCheekPuff",
	"LeftCheekRaiser", "LeftDimpler", "LeftEyeClosed", "LeftEyeUpperLidRaiser",
	"LeftInnerBrowRaiser", "LeftLipCornerDown", "LeftLipCornerPuller",
	"LeftLipStretcher", "LeftLowerLipDepressor", "LeftNoseWrinkler",
	"LeftOuterBrowRaiser", "LeftUpperLipRaiser", "LipPresser", "LipsTogether",
	"LowerLipSuck", "MouthLeft", "MouthRight", "Pucker", "RightBrowLowerer",
	"RightCheekPuff", "RightCheekRaiser", "RightDimpler", "RightEyeClosed",
	"RightEyeUpperLidRaiser", "RightInnerBrowRaiser", "RightLipCornerDown",
	"RightLipCornerPuller", "RightLipStretcher", "RightLowerLipDepressor",
	"RightNoseWrinkler", "RightOuterBrowRaiser", "RightUpperLipRaiser",
	"TongueDown", "TongueOut", "TongueUp", "UpperLipSuck"
}

local function storeFaceControls(FaceControls)
	-- upvalues: list (copy)
	for _, value in list do
		local FaceControl = FaceControls[value]
		FaceControls:SetAttribute("Scene3DFace_" .. value, if type(FaceControl) == "number" and FaceControl ~= 0 then FaceControl else nil)
	end
end

return {
	FACS_ATTRIBUTE_PREFIX = "Scene3DFace_",
	storeFaceExpressions = function(FaceControls)
		-- upvalues: storeFaceControls (copy)
		if FaceControls:IsA("FaceControls") then
			storeFaceControls(FaceControls)
		end
		for _, FaceControls1 in FaceControls:GetDescendants() do
			if FaceControls1:IsA("FaceControls") then
				storeFaceControls(FaceControls1)
			end
		end
	end,
	FACS_PROPERTIES = list
}