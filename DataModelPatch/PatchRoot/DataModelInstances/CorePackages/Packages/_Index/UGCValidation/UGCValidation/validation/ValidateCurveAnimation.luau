local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local Util = Parent.util
local _ = require(Util.Types)
local FailureReasonsAccumulatorModule = require(Util.FailureReasonsAccumulator)
local AssetCalculatorModule = require(Util.AssetCalculator)
local Validation = Parent.validation
local ValidateAttributesModule = require(Validation.validateAttributes)
local ValidateTagsModule = require(Validation.validateTags)
local ValidatePropertiesSensibleModule = require(Validation.ValidatePropertiesSensible)
local Flags = Parent.flags
local GetFStringUGCValidationMaxAnimationLengthModule = require(Flags.GetFStringUGCValidationMaxAnimationLength)
local GetFStringUGCValidationMaxAnimationBoundsModule = require(Flags.GetFStringUGCValidationMaxAnimationBounds)
local GetFStringUGCValidationMaxAnimationDeltasModule = require(Flags.GetFStringUGCValidationMaxAnimationDeltas)
local GetFFlagUGCValidateDuplicatesInAnimationModule = require(Flags.getFFlagUGCValidateDuplicatesInAnimation)
local GetFFlagUGCValidateMaxTotalInstancesModule = require(Flags.getFFlagUGCValidateMaxTotalInstances)
local GetFIntUGCValidateMaxAnimationFPSModule = require(Flags.getFIntUGCValidateMaxAnimationFPS)
local GetFIntUGCValidateMaxMarkerCurveValueLengthModule = require(Flags.getFIntUGCValidateMaxMarkerCurveValueLength)
local GetFStringUGCValidateMaxAnimationMovementPerPartModule = require(Flags.GetFStringUGCValidateMaxAnimationMovementPerPart)
local GetFStringUGCValidateFrameDeltaKeyTimeTolModule = require(Flags.GetFStringUGCValidateFrameDeltaKeyTimeTol)
local GetEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(Parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local GetFStringUGCValidateAnimationHeightTolModule = require(Flags.GetFStringUGCValidateAnimationHeightTol)
local GetFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule = require(Flags.getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessage)
local GetFFlagUGCValidateCurveAnimRotationSpeedModule = require(Flags.getFFlagUGCValidateCurveAnimRotationSpeed)
local GetFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule = require(Flags.getFIntUGCValidationMaxAnimationRotationSpeedPerSecond)
local GetFFlagUGCValidateCurveAnimFinalFrameBugModule = require(Flags.getFFlagUGCValidateCurveAnimFinalFrameBug)
local GetFFlagUGCValidateCurveAnimMinTimeFixModule = require(Flags.getFFlagUGCValidateCurveAnimMinTimeFix)
local GetFStringUGCValidateCurveAnimationMinLengthModule = require(Flags.GetFStringUGCValidateCurveAnimationMinLength)
local GetFFlagUGCValidateCurveAnimTimeErrorMessageFixModule = require(Flags.getFFlagUGCValidateCurveAnimTimeErrorMessageFix)
local GetFFlagUGCValidateRestrictNumMarkerCurvesModule = require(Flags.getFFlagUGCValidateRestrictNumMarkerCurves)
local GetFIntUGCValidateMaxTotalMarkerCurvesModule = require(Flags.getFIntUGCValidateMaxTotalMarkerCurves)
local GetFFlagUGCValidateRestrictNumFaceControlsModule = require(Flags.getFFlagUGCValidateRestrictNumFaceControls)
local GetFIntUGCValidateMaxTotalFaceControlsModule = require(Flags.getFIntUGCValidateMaxTotalFaceControls)
local GetFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule = require(Flags.getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurves)
local GetFIntUGCValidateMaxTotalInternalMarkersModule = require(Flags.getFIntUGCValidateMaxTotalInternalMarkers)
local GetFFlagUGCValidateMigrateSchemaPropertiesModule = require(Flags.getFFlagUGCValidateMigrateSchemaProperties)
local GetFFlagUGCValidationCombineEntrypointResultsModule = require(Flags.getFFlagUGCValidationCombineEntrypointResults)

local function reportFailure(Message, ValidateCurveAnimationAnimationHierarchyIsIncorrect, p1)
	-- upvalues: AnalyticsModule (copy)
	AnalyticsModule.reportFailure(ValidateCurveAnimationAnimationHierarchyIsIncorrect, nil, p1)
	
	return false, { Message }
end

local BodyPartsToParents = nil

local function _()
	-- upvalues: BodyPartsToParents (ref), AssetCalculatorModule (copy)
	if not BodyPartsToParents then
		BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
	end
	return BodyPartsToParents
end

local _ = function(p1): boolean
	-- upvalues: BodyPartsToParents (ref), AssetCalculatorModule (copy)
	local IsHumanoidRootPart = true
	
	if not BodyPartsToParents then
		BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
	end
	if BodyPartsToParents[p1] == nil then
		IsHumanoidRootPart = p1 == "HumanoidRootPart"
	end
	return IsHumanoidRootPart
end

local function areChildrenAcceptable(Position, List): boolean
	if not Position then
		return true
	end
	local function findAndRemoveMatching(p1): boolean
		-- upvalues: List (copy)
		for i, value in List do
			if value.ClassName == p1.ClassName and value.Name == p1.Name then
				table.remove(List, i)
				
				return true
			end
		end
		return false
	end
	
	for _, child in Position:GetChildren() do
		if not findAndRemoveMatching(child) then
			return false
		end
	end
	return true
end

local function calculateAcceptableChildBodyPartFolders(Name)
	-- upvalues: BodyPartsToParents (ref), AssetCalculatorModule (copy)
	local List = {}
	
	if not BodyPartsToParents then
		BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
	end
	for Name1, bodyPartsToParent in BodyPartsToParents do
		if bodyPartsToParent == Name then
			table.insert(List, { ClassName = "Folder", Name = Name1 })
		end
	end
	return List
end

local function calculateAcceptableBodyPartFolderChildrenArray(p2, p3)
	-- upvalues: calculateAcceptableChildBodyPartFolders (copy)
	local AcceptableChildBodyPartFolders = calculateAcceptableChildBodyPartFolders(p2.Name)
	
	if p2.Name == "HumanoidRootPart" then
		return AcceptableChildBodyPartFolders
	end
	table.insert(AcceptableChildBodyPartFolders, { ClassName = "Vector3Curve", Name = "Position" })
	table.insert(AcceptableChildBodyPartFolders, {
		Name = "Rotation",
		ClassName = if p3 then "EulerRotationCurve" else "RotationCurve"
	})
	
	if p2.Name == "Head" then
		table.insert(AcceptableChildBodyPartFolders, { ClassName = "Folder", Name = "FaceControls" })
		
		return AcceptableChildBodyPartFolders
	else
		return AcceptableChildBodyPartFolders
	end
end

local function calculateAcceptableCurveChildrenArray()
	return {
		{ ClassName = "FloatCurve", Name = "X" },
		{ ClassName = "FloatCurve", Name = "Y" },
		{ ClassName = "FloatCurve", Name = "Z" }
	}
end

local _ = function(Object): boolean
	return if Object then #Object:GetChildren() < #Object:GetDescendants() else false
end

local function validateBodyPartFolderChildren(Object): boolean
	-- upvalues: calculateAcceptableBodyPartFolderChildrenArray (copy), areChildrenAcceptable (copy), calculateAcceptableCurveChildrenArray (copy), GetFFlagUGCValidateRestrictNumFaceControlsModule (copy), GetFIntUGCValidateMaxTotalFaceControlsModule (copy)
	if not areChildrenAcceptable(Object, (calculateAcceptableBodyPartFolderChildrenArray(Object, true))) then
		return false
	end
	if not areChildrenAcceptable(Object:FindFirstChild("Position"), (calculateAcceptableCurveChildrenArray())) then
		return false
	end
	if not areChildrenAcceptable(Object:FindFirstChild("Rotation"), (calculateAcceptableCurveChildrenArray())) then
		return false
	end
	local FaceControls = Object:FindFirstChild("FaceControls")
	
	if FaceControls then
		local Children = FaceControls:GetChildren()
		
		if GetFFlagUGCValidateRestrictNumFaceControlsModule() and GetFIntUGCValidateMaxTotalFaceControlsModule() < #Children then
			return false
		end
		for _, FloatCurve in Children do
			if not FloatCurve:IsA("FloatCurve") then
				return false
			end
		end
	end
	local Position = Object:FindFirstChild("Position")
	
	if if Position then #Position:GetDescendants() > #Position:GetChildren() else false then
		return false
	else
		local Rotation = Object:FindFirstChild("Rotation")
		
		return not (if Rotation then #Rotation:GetDescendants() > #Rotation:GetChildren() else false) and not (if FaceControls then #FaceControls:GetDescendants() > #FaceControls:GetChildren() else false)
	end
end

local _ = function(p2, p3)
	-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), AnalyticsModule (copy), BodyPartsToParents (ref), AssetCalculatorModule (copy)
	local function validateBodyPartFolderInternal(Folder)
		-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (upval), validateBodyPartFolderChildren (upval), reportFailure (upval), AnalyticsModule (upval), p3 (copy), validateBodyPartFolderInternal (copy), BodyPartsToParents (upval), AssetCalculatorModule (upval)
		if GetFFlagUGCValidateDuplicatesInAnimationModule() then
			if not validateBodyPartFolderChildren(Folder) then
				return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", Folder.Name), AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p3)
			end
			local v1 = nil
			for _, Folder1 in Folder:GetChildren() do
				if Folder1:IsA("Folder") and Folder1.Name ~= "FaceControls" then
					local v2
					v2, v78 = validateBodyPartFolderInternal(Folder1)
					
					if not v2 then
						return false, v1
					end
				end
			end
			return true
		else
			local Name = nil
			for _, Folder2 in Folder:GetChildren() do
				if Folder2:IsA("Folder") then
					if Folder2.Name == "HumanoidRootPart" then
						return false
					end
					if not BodyPartsToParents then
						BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
					end
					Name = BodyPartsToParents[Folder2.Name]
					
					if Name then
						return Name == Folder.Name and validateBodyPartFolderInternal(Folder2)
					end
				end
			end
			return true
		end
	end
	
	local Name = p2.Name
	local IsHumanoidRootPart = true
	
	if not BodyPartsToParents then
		BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
	end
	if BodyPartsToParents[Name] == nil then
		IsHumanoidRootPart = Name == "HumanoidRootPart"
	end
	return not IsHumanoidRootPart or validateBodyPartFolderInternal(p2)
end

local function validateSingleBodyRoot(CurveAnimation, p4)
	-- upvalues: BodyPartsToParents (ref), AssetCalculatorModule (copy), reportFailure (copy), AnalyticsModule (copy), GetFFlagUGCValidateDuplicatesInAnimationModule (copy)
	local Count = 0
	
	for _, Folder in CurveAnimation:GetChildren() do
		if Folder:IsA("Folder") then
			local Name = Folder.Name
			local IsHumanoidRootPart = true
			
			if not BodyPartsToParents then
				BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
			end
			if BodyPartsToParents[Name] == nil then
				IsHumanoidRootPart = Name == "HumanoidRootPart"
			end
			if IsHumanoidRootPart then
				Count += 1
				
				if Count > 1 then
					return reportFailure("CurveAnimation contains more than one body part or HumanoidRootPart Folder children. Please ensure there is only one child Folder named after a body part or HumanoidRootPart.", AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p4)
				end
			end
		end
	end
	return not GetFFlagUGCValidateDuplicatesInAnimationModule() or Count ~= 0 or reportFailure("CurveAnimation contains zero body part or HumanoidRootPart Folder children. Please ensure there is one (and only one) child Folder named after a body part or HumanoidRootPart.", AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p4)
end

local ValidateCurveAnimationModule = {
	validateMarkerCurves = function(CurveAnimation, p5)
		-- upvalues: GetFIntUGCValidateMaxTotalMarkerCurvesModule (copy), reportFailure (copy), AnalyticsModule (copy)
		local FIntUGCValidateMaxTotalMarkerCurvesModule = GetFIntUGCValidateMaxTotalMarkerCurvesModule()
		local Count = 0
		
		for _, MarkerCurve in CurveAnimation:GetDescendants() do
			if MarkerCurve:IsA("MarkerCurve") then
				Count += 1
				
				if FIntUGCValidateMaxTotalMarkerCurvesModule < Count then
					return reportFailure(`CurveAnimation contains more than {FIntUGCValidateMaxTotalMarkerCurvesModule} MarkerCurve(s). Please ensure there is no more than {FIntUGCValidateMaxTotalMarkerCurvesModule} MarkerCurve descendant(s).`, AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p5)
				end
			end
		end
		return true
	end,
	validateSingleAnimationRigData = function(CurveAnimation, p6)
		-- upvalues: reportFailure (copy), AnalyticsModule (copy)
		local Count = 0
		
		for _, AnimationRigData in CurveAnimation:GetChildren() do
			if AnimationRigData:IsA("AnimationRigData") then
				Count += 1
				
				if Count > 1 then
					return reportFailure("CurveAnimation contains more than one AnimationRigData children. Please ensure there is only one AnimationRigData child.", AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p6)
				end
			end
		end
		return Count ~= 0 or reportFailure("CurveAnimation contains zero AnimationRigData children. Please ensure there is one (and only one) AnimationRigData children.", AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p6)
	end,
	validateAnimationRigDataInternals = function(CurveAnimation, p7)
		-- upvalues: reportFailure (copy), AnalyticsModule (copy)
		for _, AnimationRigData in CurveAnimation:GetChildren() do
			if AnimationRigData:IsA("AnimationRigData") and not AnimationRigData:IsValidR15() then
				return reportFailure("AnimationRigData failed internal validation. Please ensure the AnimationRigData is set up correctly.", AnalyticsModule.ErrorType.validateCurveAnimation_IncorrectAnimationRigData, p7)
			end
		end
		return true
	end
}

local _ = function(p8, p9)
	-- upvalues: ValidateCurveAnimationModule (copy)
	local ValidateSingleAnimationRigDataResult, ValidateSingleAnimationRigDataResult2 = ValidateCurveAnimationModule.validateSingleAnimationRigData(p8, p9)
	
	if not ValidateSingleAnimationRigDataResult then
		return false, ValidateSingleAnimationRigDataResult2
	end
	local ValidateAnimationRigDataInternalsResult, ValidateAnimationRigDataInternalsResult2 = ValidateCurveAnimationModule.validateAnimationRigDataInternals(p8, p9)
	
	if ValidateAnimationRigDataInternalsResult then
		return true
	else
		return false, ValidateAnimationRigDataInternalsResult2
	end
end

local function validateScripts(CurveAnimation, p8)
	-- upvalues: reportFailure (copy), AnalyticsModule (copy)
	for _, descendant in CurveAnimation:GetDescendants() do
		if descendant:IsA("Script") or descendant:IsA("ModuleScript") then
			return reportFailure("CurveAnimation hierarchy contains Scripts, LocalScripts, or ModuleScripts. Please remove them.", AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p8)
		end
	end
	return true
end

local List = {
	"MarkerCurve", "AnimationRigData", "Folder", "Vector3Curve",
	"EulerRotationCurve", "FloatCurve"
}

if require(Flags.getFFlagUGCValidateAddObjectValueToAcceptableTypes)() then
	table.insert(List, "ObjectValue")
end
local function validateExtraInstances(CurveAnimation, p9)
	-- upvalues: List (copy), reportFailure (copy), AnalyticsModule (copy)
	local Flag = nil
	for _, descendant in CurveAnimation:GetDescendants() do
		Flag = false
		
		for _, ClassName in List do
			if descendant:IsA(ClassName) then
				Flag = true
				break
			end
		end
		if not Flag then
			return reportFailure(`CurveAnimation hierarchy can only contain {table.concat(List, ", ")}. Please remove any other Instance types.`, AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p9)
		end
	end
	return true
end

function ValidateCurveAnimationModule.validateExtraInstancesUnitTest(p10, p11)
	-- upvalues: validateExtraInstances (copy)
	return validateExtraInstances(p10, p11)
end

function ValidateCurveAnimationModule.validateScriptsUnitTest(p10, p11)
	-- upvalues: validateScripts (copy)
	return validateScripts(p10, p11)
end

local function validateAnimationHierarchy(CurveAnimation, p10)
	-- upvalues: AnalyticsModule (copy), GetFFlagUGCValidateMaxTotalInstancesModule (copy), reportFailure (copy), validateSingleBodyRoot (copy), ValidateCurveAnimationModule (copy), GetFFlagUGCValidateRestrictNumMarkerCurvesModule (copy), GetFFlagUGCValidateDuplicatesInAnimationModule (copy), BodyPartsToParents (ref), AssetCalculatorModule (copy), validateBodyPartFolderChildren (copy), FailureReasonsAccumulatorModule (copy), validateScripts (copy), validateExtraInstances (copy)
	if not CurveAnimation:IsA("CurveAnimation") then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, p10)
		
		return false, {
			"Referenced Animation is not a CurveAnimation. Please ensure the animation is uploaded correctly."
		}
	end
	local Count = #CurveAnimation:GetDescendants()
	
	if GetFFlagUGCValidateMaxTotalInstancesModule() < Count then
		return reportFailure(`CurveAnimation has {Count} descendants. Maximum allowed is {GetFFlagUGCValidateMaxTotalInstancesModule()}. Please reduce the number of descendants.`, AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p10)
	end
	local ValidateSingleBodyRootResult, ValidateSingleBodyRootResult2 = validateSingleBodyRoot(CurveAnimation, p10)
	
	if not ValidateSingleBodyRootResult then
		return false, ValidateSingleBodyRootResult2
	end
	local ValidateSingleAnimationRigDataResult, ValidateSingleAnimationRigDataResult2 = ValidateCurveAnimationModule.validateSingleAnimationRigData(CurveAnimation, p10)
	local ValidateSingleAnimationRigDataResult1 = nil
	local Flag = nil
	
	if ValidateSingleAnimationRigDataResult then
		local ValidateAnimationRigDataInternalsResult, ValidateAnimationRigDataInternalsResult2 = ValidateCurveAnimationModule.validateAnimationRigDataInternals(CurveAnimation, p10)
		
		if ValidateAnimationRigDataInternalsResult then
			Flag = true
			ValidateSingleAnimationRigDataResult1 = nil
		else
			Flag = false
			ValidateSingleAnimationRigDataResult1 = ValidateAnimationRigDataInternalsResult2
		end
	else
		Flag = false
		ValidateSingleAnimationRigDataResult1 = ValidateSingleAnimationRigDataResult2
	end
	local ValidateSingleAnimationRigDataResult3 = ValidateSingleAnimationRigDataResult1
	
	if not Flag then
		return false, ValidateSingleAnimationRigDataResult3
	end
	if GetFFlagUGCValidateRestrictNumMarkerCurvesModule() then
		local ValidateMarkerCurvesResult, ValidateMarkerCurvesResult2 = ValidateCurveAnimationModule.validateMarkerCurves(CurveAnimation, p10)
		
		if not ValidateMarkerCurvesResult then
			return false, ValidateMarkerCurvesResult2
		end
	end
	local v3 = nil
	for _, child in CurveAnimation:GetChildren() do
		if child:IsA("MarkerCurve") or child:IsA("AnimationRigData") then
			if GetFFlagUGCValidateDuplicatesInAnimationModule() and #child:GetChildren() > 0 then
				return reportFailure("CurveAnimation child MarkerCurves and AnimationRigData cannot have children", AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p10)
			end
			continue
		end
		if not child:IsA("Folder") then
			return reportFailure("CurveAnimation contains unexpected child: " .. child.Name, AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p10)
		end
		if GetFFlagUGCValidateDuplicatesInAnimationModule() then
			local Name = child.Name
			local IsHumanoidRootPart = true
			
			if not BodyPartsToParents then
				BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
			end
			if BodyPartsToParents[Name] == nil then
				IsHumanoidRootPart = Name == "HumanoidRootPart"
			end
			if not IsHumanoidRootPart then
				return reportFailure("CurveAnimation contains unexpected child: " .. child.Name, AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p10)
			end
			local function validateBodyPartFolderInternal1(Folder)
				-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (upval), validateBodyPartFolderChildren (upval), reportFailure (upval), AnalyticsModule (upval), p10 (copy), validateBodyPartFolderInternal1 (copy), BodyPartsToParents (upval), AssetCalculatorModule (upval)
				if GetFFlagUGCValidateDuplicatesInAnimationModule() then
					if not validateBodyPartFolderChildren(Folder) then
						return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", Folder.Name), AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p10)
					end
					local v4 = nil
					for _, Folder1 in Folder:GetChildren() do
						if Folder1:IsA("Folder") and Folder1.Name ~= "FaceControls" then
							local v5
							v5, v78 = validateBodyPartFolderInternal1(Folder1)
							
							if not v5 then
								return false, v4
							end
						end
					end
					return true
				else
					local Name = nil
					for _, Folder2 in Folder:GetChildren() do
						if Folder2:IsA("Folder") then
							if Folder2.Name == "HumanoidRootPart" then
								return false
							end
							if not BodyPartsToParents then
								BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
							end
							Name = BodyPartsToParents[Folder2.Name]
							
							if Name then
								return Name == Folder.Name and validateBodyPartFolderInternal1(Folder2)
							end
						end
					end
					return true
				end
			end
			
			local Name1 = child.Name
			local IsHumanoidRootPart1 = true
			
			if not BodyPartsToParents then
				BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
			end
			if BodyPartsToParents[Name1] == nil then
				IsHumanoidRootPart1 = Name1 == "HumanoidRootPart"
			end
			local v6 = nil
			local v7 = nil
			if IsHumanoidRootPart1 then
				v6, v113 = validateBodyPartFolderInternal1(child)
			else
				v6 = true
				v7 = nil
			end
			v3 = v7
			
			if not v6 then
				return false, v3
			end
		else
			local v8 = nil
			
			local function validateBodyPartFolderInternal(Folder)
				-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (upval), validateBodyPartFolderChildren (upval), reportFailure (upval), AnalyticsModule (upval), v8 (copy), validateBodyPartFolderInternal (copy), BodyPartsToParents (upval), AssetCalculatorModule (upval)
				if GetFFlagUGCValidateDuplicatesInAnimationModule() then
					if not validateBodyPartFolderChildren(Folder) then
						return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", Folder.Name), AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, v8)
					end
					local v9 = nil
					for _, Folder1 in Folder:GetChildren() do
						if Folder1:IsA("Folder") and Folder1.Name ~= "FaceControls" then
							local v10
							v10, v78 = validateBodyPartFolderInternal(Folder1)
							
							if not v10 then
								return false, v9
							end
						end
					end
					return true
				else
					local Name = nil
					for _, Folder2 in Folder:GetChildren() do
						if Folder2:IsA("Folder") then
							if Folder2.Name == "HumanoidRootPart" then
								return false
							end
							if not BodyPartsToParents then
								BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
							end
							Name = BodyPartsToParents[Folder2.Name]
							
							if Name then
								return Name == Folder.Name and validateBodyPartFolderInternal(Folder2)
							end
						end
					end
					return true
				end
			end
			
			local Name1 = child.Name
			local IsHumanoidRootPart1 = true
			
			if not BodyPartsToParents then
				BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
			end
			if BodyPartsToParents[Name1] == nil then
				IsHumanoidRootPart1 = Name1 == "HumanoidRootPart"
			end
			if IsHumanoidRootPart1 and not validateBodyPartFolderInternal(child) then
				return reportFailure("CurveAnimation contains child body part Folder " .. child.Name .. " which has an invalid hierarchy", AnalyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p10)
			end
		end
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	NewFailureReasonsAccumulator:updateReasons(validateScripts(CurveAnimation, p10))
	NewFailureReasonsAccumulator:updateReasons(validateExtraInstances(CurveAnimation, p10))
	
	return NewFailureReasonsAccumulator:getFinalResults()
end

local function createDefaultCharacter(p11)
	-- upvalues: Players (copy)
	local HumanoidModelFromDescriptionAsync = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then Players:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	for _, descendant in HumanoidModelFromDescriptionAsync:GetDescendants() do
		if descendant:IsA("Decal") then
			descendant.Transparency = 1
		elseif descendant:IsA("MeshPart") then
			descendant.Transparency = 1
			descendant.CanCollide = false
		elseif descendant:IsA("Motor6D") and p11 then
			descendant:Destroy()
		end
	end
	return HumanoidModelFromDescriptionAsync
end

local Amount = 1 / GetFIntUGCValidateMaxAnimationFPSModule()

local function getBodyPartFolderRoot(Object)
	-- upvalues: BodyPartsToParents (ref), AssetCalculatorModule (copy)
	for _, Folder in Object:GetChildren() do
		if Folder:IsA("Folder") then
			local Name = Folder.Name
			local IsHumanoidRootPart = true
			
			if not BodyPartsToParents then
				BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
			end
			if BodyPartsToParents[Name] == nil then
				IsHumanoidRootPart = Name == "HumanoidRootPart"
			end
			if IsHumanoidRootPart then
				return Folder
			end
		end
	end
	return nil
end

local function hasFloatCurveKeys(Object)
	local X = Object:FindFirstChild("X")
	local Y = Object:FindFirstChild("Y")
	local Z = Object:FindFirstChild("Z")
	local IsFloatCurve = if X then X:IsA("FloatCurve") and #X:GetKeys() > 0 else false
	
	if not IsFloatCurve then
		IsFloatCurve = if Y then Y:IsA("FloatCurve") and #Y:GetKeys() > 0 else false
		
		if not IsFloatCurve then
			if Z then
				IsFloatCurve = Z:IsA("FloatCurve")
				
				if IsFloatCurve then
					return #Z:GetKeys() > 0
				end
			else
				IsFloatCurve = false
			end
		end
	end
	return IsFloatCurve
end

local _ = function(Vector3Curve)
	-- upvalues: hasFloatCurveKeys (copy)
	return if Vector3Curve and Vector3Curve:IsA("Vector3Curve") then hasFloatCurveKeys(Vector3Curve) else false
end

local _ = function(EulerRotationCurve)
	-- upvalues: hasFloatCurveKeys (copy)
	return if EulerRotationCurve and EulerRotationCurve:IsA("EulerRotationCurve") then hasFloatCurveKeys(EulerRotationCurve) else false
end

local function calculateAnimFramesAtOriginManual(Object)
	-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (copy), getBodyPartFolderRoot (copy), BodyPartsToParents (ref), AssetCalculatorModule (copy), hasFloatCurveKeys (copy), ConstantsModule (copy), createDefaultCharacter (copy), GetFFlagUGCValidateCurveAnimFinalFrameBugModule (copy), Amount (copy)
	local function getCurveTracks()
		-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (upval), getBodyPartFolderRoot (upval), Object (copy), BodyPartsToParents (upval), AssetCalculatorModule (upval), hasFloatCurveKeys (upval), ConstantsModule (upval)
		local t = {}
		local Descendants = nil
		
		if GetFFlagUGCValidateDuplicatesInAnimationModule() then
			local BodyPartFolderRoot = getBodyPartFolderRoot(Object)
			assert(BodyPartFolderRoot, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.")
			Descendants = BodyPartFolderRoot:GetDescendants()
			table.insert(Descendants, BodyPartFolderRoot)
		else
			Descendants = Object:GetDescendants()
		end
		for _, Folder in Descendants do
			if Folder:IsA("Folder") then
				if not BodyPartsToParents then
					BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
				end
				if BodyPartsToParents[Folder.Name] then
					local Position = Folder:FindFirstChild("Position")
					local Rotation = Folder:FindFirstChild("Rotation")
					local HasFloatCurveKeys = if Position and Position:IsA("Vector3Curve") then hasFloatCurveKeys(Position) else false
					local Position1 = if HasFloatCurveKeys then Position else nil
					local HasFloatCurveKeys1 = if Rotation and Rotation:IsA("EulerRotationCurve") then hasFloatCurveKeys(Rotation) else false
					t[Folder.Name] = {
						pos = Position1,
						rot = if HasFloatCurveKeys1 then Rotation else nil,
						faceControls = if Folder.Name == ConstantsModule.NAMED_R15_BODY_PARTS.Head then Folder:FindFirstChild("FaceControls") else nil
					}
				end
			end
		end
		return t
	end
	
	local function calculateCurveAnimLength(List): number
		local Largest = -1
		
		local function getMaxTimeFromFloatCurveChildren(FaceControls)
			-- upvalues: Largest (ref)
			if not FaceControls then return end
			for _, FloatCurve in FaceControls:GetChildren() do
				if FloatCurve:IsA("FloatCurve") then
					for _, key in FloatCurve:GetKeys() do
						Largest = math.max(Largest, key.Time)
					end
				end
			end
		end
		
		for _, value in List do
			getMaxTimeFromFloatCurveChildren(value.pos)
			getMaxTimeFromFloatCurveChildren(value.rot)
			getMaxTimeFromFloatCurveChildren(value.faceControls)
		end
		return Largest
	end
	
	local function calculateTransformsAtTime(Total, List)
		local t = {}
		
		for i, value in List do
			t[i] = (if value.rot then value.rot:GetRotationAtTime(Total) else CFrame.new()) + (if value.pos then Vector3.new(unpack(value.pos:GetValueAtTime(Total))) else vector.create(0, 0, 0))
		end
		return t
	end
	
	local function calculatePositionMagnitudeResultsAtTime(Total, List)
		local Magnitudes = {}
		
		for i, value in List do
			if value.pos then
				Magnitudes[i] = Vector3.new(unpack(value.pos:GetValueAtTime(Total))).Magnitude
			end
		end
		return Magnitudes
	end
	
	local DefaultCharacter = createDefaultCharacter(false)
	local t = {}
	
	for _, child in DefaultCharacter:GetChildren() do
		local Name = child.Name
		local IsHumanoidRootPart = true
		
		if not BodyPartsToParents then
			BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
		end
		if BodyPartsToParents[Name] == nil then
			IsHumanoidRootPart = Name == "HumanoidRootPart"
		end
		if IsHumanoidRootPart then
			t[child.Name] = child
		end
	end
	local CurveTracks = getCurveTracks()
	local CurveAnimLength: number = calculateCurveAnimLength(CurveTracks)
	local AllTransformsForFullBodies = {}
	local List = {}
	
	local function _(p12)
		-- upvalues: calculateTransformsAtTime (copy), CurveTracks (copy), AssetCalculatorModule (upval), t (copy), AllTransformsForFullBodies (copy), List (copy), calculatePositionMagnitudeResultsAtTime (copy)
		table.insert(AllTransformsForFullBodies, (AssetCalculatorModule.calculateAllTransformsForFullBody(t, (calculateTransformsAtTime(p12, CurveTracks)))))
		table.insert(List, (calculatePositionMagnitudeResultsAtTime(p12, CurveTracks)))
	end
	
	local Total = 0
	while Total <= CurveAnimLength do
		if GetFFlagUGCValidateCurveAnimFinalFrameBugModule() then
			table.insert(AllTransformsForFullBodies, (AssetCalculatorModule.calculateAllTransformsForFullBody(t, (calculateTransformsAtTime(Total, CurveTracks)))))
			table.insert(List, (calculatePositionMagnitudeResultsAtTime(Total, CurveTracks)))
		else
			table.insert(AllTransformsForFullBodies, (AssetCalculatorModule.calculateAllTransformsForFullBody(t, (calculateTransformsAtTime(Total, CurveTracks)))))
			table.insert(List, (calculatePositionMagnitudeResultsAtTime(Total, CurveTracks)))
		end
		Total += Amount
	end
	if GetFFlagUGCValidateCurveAnimFinalFrameBugModule() and CurveAnimLength >= 0 then
		table.insert(AllTransformsForFullBodies, (AssetCalculatorModule.calculateAllTransformsForFullBody(t, (calculateTransformsAtTime(CurveAnimLength, CurveTracks)))))
		table.insert(List, (calculatePositionMagnitudeResultsAtTime(CurveAnimLength, CurveTracks)))
	end
	DefaultCharacter:Destroy()
	
	return AllTransformsForFullBodies, CurveAnimLength, List, CurveTracks
end

function ValidateCurveAnimationModule.validateAnimationLength(p12, p13)
	-- upvalues: GetFFlagUGCValidateCurveAnimMinTimeFixModule (copy), GetFStringUGCValidateCurveAnimationMinLengthModule (copy), GetFStringUGCValidationMaxAnimationLengthModule (copy), GetFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (copy), reportFailure (copy), AnalyticsModule (copy)
	local AsNumberResult = if GetFFlagUGCValidateCurveAnimMinTimeFixModule() then GetFStringUGCValidateCurveAnimationMinLengthModule.asNumber() else 0
	
	return p12 > AsNumberResult and GetFStringUGCValidationMaxAnimationLengthModule.asNumber() >= p12 or (if GetFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then reportFailure(`CurveAnimation must be between {AsNumberResult} and {GetFStringUGCValidationMaxAnimationLengthModule.asString()} seconds long. Please fix the animation.`, AnalyticsModule.ErrorType.validateCurveAnimation_UnacceptableLength, p13) else reportFailure(`CurveAnimation must be between 0 and {GetFStringUGCValidationMaxAnimationLengthModule.asString()} seconds long. Please fix the animation.`, AnalyticsModule.ErrorType.validateCurveAnimation_UnacceptableLength, p13))
end

function ValidateCurveAnimationModule.validateBounds(List, p12, p13: number)
	-- upvalues: GetFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (copy), GetFStringUGCValidateAnimationHeightTolModule (copy), GetFStringUGCValidationMaxAnimationBoundsModule (copy), Amount (copy), reportFailure (copy), AnalyticsModule (copy), FailureReasonsAccumulatorModule (copy)
	local Smallest = 1e999
	local Largest = 0
	local AsNumberResult = nil
	local AsNumberResult1 = nil
	
	if GetFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		AsNumberResult = GetFStringUGCValidateAnimationHeightTolModule.asNumber()
		AsNumberResult1 = GetFStringUGCValidationMaxAnimationBoundsModule.asNumber()
	end
	for i, value in List do
		for i1, value1 in value do
			if not GetFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
				Largest = math.max(Largest, value1.Position.Magnitude)
				Smallest = math.min(Smallest, value1.Position.Y)
				continue
			end
			if value1.Position.Y < AsNumberResult then
				return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is at height %.2f studs from the HumanoidRootPart. Body parts cannot be lower than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(p13, (i - 1) * Amount), i1, value1.Position.Y, GetFStringUGCValidateAnimationHeightTolModule.asString()), AnalyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, p12)
			elseif AsNumberResult1 < value1.Position.Magnitude then
				return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is %.2f studs from the HumanoidRootPart. Body parts cannot be more than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(p13, (i - 1) * Amount), i1, value1.Position.Magnitude, GetFStringUGCValidationMaxAnimationBoundsModule.asString()), AnalyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, p12)
			end
		end
	end
	if GetFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		return true
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	NewFailureReasonsAccumulator:updateReasons(GetFStringUGCValidateAnimationHeightTolModule.asNumber() <= Smallest, {
		`Body parts in a CurveAnimation cannot be lower than {GetFStringUGCValidateAnimationHeightTolModule.asString()} studs from the HumanoidRootPart. Please fix the animation.`
	})
	NewFailureReasonsAccumulator:updateReasons(Largest <= GetFStringUGCValidationMaxAnimationBoundsModule.asNumber(), {
		`Body parts in a CurveAnimation cannot get more than {GetFStringUGCValidationMaxAnimationBoundsModule.asString()} studs from the HumanoidRootPart. Please fix the animation.`
	})
	
	if not NewFailureReasonsAccumulator:getFinalResults() then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, nil, p12)
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

function ValidateCurveAnimationModule.validateFrameDeltas(List, p14)
	-- upvalues: Amount (copy), GetFStringUGCValidationMaxAnimationDeltasModule (copy), GetFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule (copy), reportFailure (copy), AnalyticsModule (copy)
	local AmountRatio = Amount / 0.03333333333333333
	local ScaledAsNumberResult = GetFStringUGCValidationMaxAnimationDeltasModule.asNumber() * AmountRatio
	local ScaledAsNumberResult1 = if GetFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then GetFStringUGCValidationMaxAnimationDeltasModule.asNumber() * 30 else nil
	local t = {}
	
	for i, value in List do
		local Distance = nil
		for i1, value1 in value do
			local Entry = t[i1]
			
			if Entry then
				Distance = (value1.Position - Entry.Position).Magnitude
				
				if ScaledAsNumberResult < Distance then
					return if GetFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a speed of %.2f studs/second. %.2f is the maximum studs/second speed. Please fix the animation.", (i - 1) * Amount, i1, Distance / AmountRatio * 30, ScaledAsNumberResult1), AnalyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, p14) else reportFailure(`Body part {i1} in CurveAnimation moves more than {GetFStringUGCValidationMaxAnimationDeltasModule.asString()} studs between frames. Please fix the animation.`, AnalyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, p14)
				end
			end
		end
		t = value
	end
	return true
end

function ValidateCurveAnimationModule.validateFrameRotationDeltas(List, p15)
	-- upvalues: Amount (copy), GetFIntUGCValidateMaxAnimationFPSModule (copy), GetFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule (copy), reportFailure (copy), AnalyticsModule (copy)
	assert(math.abs(1 / Amount - GetFIntUGCValidateMaxAnimationFPSModule()) < 0.00001, "frameDelta should be calculated as 1 / getFIntUGCValidateMaxAnimationFPS()")
	local FIntUGCValidationMaxAnimationRotationSpeedPerSecondModule = GetFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule()
	local FIntUGCValidationMaxAnimationRotationSpeedPerSecondModuleRatio = FIntUGCValidationMaxAnimationRotationSpeedPerSecondModule / GetFIntUGCValidateMaxAnimationFPSModule()
	local t = {}
	
	for i, value in List do
		local Degrees = nil
		for i1, value1 in value do
			local Entry = t[i1]
			
			if Entry then
				Degrees = math.deg((math.abs((value1:AngleBetween(Entry)))))
				
				if FIntUGCValidationMaxAnimationRotationSpeedPerSecondModuleRatio < Degrees then
					return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a rotation speed of %.2f degrees/second. %.2f is the maximum degrees/second speed. Please fix the animation.", (i - 1) * Amount, i1, Degrees * GetFIntUGCValidateMaxAnimationFPSModule(), FIntUGCValidationMaxAnimationRotationSpeedPerSecondModule), AnalyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameRotationDelta, p15)
				end
			end
		end
		t = value
	end
	return true
end

function ValidateCurveAnimationModule.validateMinimumTransformations(List, p16)
	-- upvalues: reportFailure (copy), AnalyticsModule (copy)
	for _, value in List do
		if value.pos or value.rot then
			return true
		end
	end
	return reportFailure("CurveAnimation does not contain any joint manipulation.", AnalyticsModule.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, p16)
end

function ValidateCurveAnimationModule.validateContainsJointManipulation(Object, p17)
	-- upvalues: GetFFlagUGCValidateDuplicatesInAnimationModule (copy), getBodyPartFolderRoot (copy), BodyPartsToParents (ref), AssetCalculatorModule (copy), reportFailure (copy), AnalyticsModule (copy)
	local Descendants = nil
	if GetFFlagUGCValidateDuplicatesInAnimationModule() then
		local BodyPartFolderRoot = getBodyPartFolderRoot(Object)
		assert(BodyPartFolderRoot, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.")
		Descendants = BodyPartFolderRoot:GetDescendants()
		table.insert(Descendants, BodyPartFolderRoot)
	else
		Descendants = Object:GetDescendants()
	end
	for _, Folder in Descendants do
		if Folder:IsA("Folder") then
			if not BodyPartsToParents then
				BodyPartsToParents = AssetCalculatorModule.getBodyPartsToParents()
			end
			if BodyPartsToParents[Folder.Name] then
				local Position = Folder:FindFirstChild("Position")
				local Rotation = Folder:FindFirstChild("Rotation")
				
				if Position and Position:IsA("Vector3Curve") and Rotation and Rotation:IsA("EulerRotationCurve") then
					return true
				end
			end
		end
	end
	return reportFailure("CurveAnimation does not contain any joint manipulation.", AnalyticsModule.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, p17)
end

local _ = function(Text: string): boolean
	return #Text <= 30 and string.match(Text, "^[0-9]+$") ~= nil
end

function ValidateCurveAnimationModule.validateAllowedTags(Object, p18)
	-- upvalues: ValidateTagsModule (copy), CollectionService (copy), reportFailure (copy), AnalyticsModule (copy)
	local ValidateTagsModuleResult = nil
	local ValidateTagsModuleResult2 = nil
	for _, child in Object:GetChildren() do
		ValidateTagsModuleResult, ValidateTagsModuleResult2 = ValidateTagsModule(child, p18)
		
		if not ValidateTagsModuleResult then
			return ValidateTagsModuleResult, ValidateTagsModuleResult2
		end
	end
	local Tags = CollectionService:GetTags(Object)
	local CountTags = #Tags
	repeat
		if CountTags <= 0 then break end
		if CountTags <= 1 then
			local Text: string = Tags[1]
			
			if #Text <= 30 and string.match(Text, "^[0-9]+$") ~= nil then continue end
		end
		return reportFailure("CurveAnimation can only contain a single timestamp tag. Please remove all other tags.", AnalyticsModule.ErrorType.validateTags, p18)
	until true
	return true
end

function ValidateCurveAnimationModule.validateStructure(CurveAnimation, p19)
	-- upvalues: validateAnimationHierarchy (copy)
	return validateAnimationHierarchy(CurveAnimation, p19)
end

local function areNumbersGood(...): boolean
	local function _(p19): boolean
		return p19 ~= p19
	end
	
	local _ = function(p19): boolean
		return p19 == 1e999 or p19 == -1e999
	end
	
	for _, value in { ... } do
		if value ~= value then
			return false
		elseif value == 1e999 or value == -1e999 then
			return false
		end
	end
	return true
end

function ValidateCurveAnimationModule.validateData(Object, p19)
	-- upvalues: Amount (copy), GetFStringUGCValidateFrameDeltaKeyTimeTolModule (copy), GetFStringUGCValidationMaxAnimationLengthModule (copy), GetFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule (copy), GetFIntUGCValidateMaxTotalInternalMarkersModule (copy), reportFailure (copy), AnalyticsModule (copy), areNumbersGood (copy), GetFIntUGCValidateMaxMarkerCurveValueLengthModule (copy), GetFIntUGCValidateMaxAnimationFPSModule (copy)
	local ScaledAmount = Amount * GetFStringUGCValidateFrameDeltaKeyTimeTolModule.asNumber()
	local Ceiled = math.ceil(1 / ScaledAmount * GetFStringUGCValidationMaxAnimationLengthModule.asNumber())
	local Smallest = nil
	local Markers = nil
	
	for _, descendant in Object:GetDescendants() do
		if not descendant:IsA("MarkerCurve") then
			if descendant:IsA("FloatCurve") then
				local Keys = descendant:GetKeys()
				
				if Ceiled < #Keys then
					return reportFailure(`CurveAnimation contains Curves with too many keys. {Ceiled} is the maximum per Curve. Please fix the animation.`, AnalyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p19)
				end
				local Time = nil
				
				for _, key in Keys do
					if not key.Time or not areNumbersGood(key.Time) or not key.Value or not areNumbersGood(key.Value) then
						return reportFailure("CurveAnimation contains Curves with invalid Time or Value. Please fix the animation.", AnalyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p19)
					end
					if Time then
						if key.Time < Time + ScaledAmount then
							return reportFailure(`CurveAnimation contains Curve {if descendant.Parent.Parent then descendant.Parent.Parent.Name else "-"}.{descendant.Parent.Name}.{descendant.Name} with keys that are too close together in time for a maximum {GetFIntUGCValidateMaxAnimationFPSModule()} fps animation. Please fix the animation.`, AnalyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p19)
						end
					elseif key.Time < 0 then
						return reportFailure(`CurveAnimation contains Curve {if descendant.Parent.Parent then descendant.Parent.Parent.Name else "-"}.{descendant.Parent.Name}.{descendant.Name} with a key that has a negative time. Please fix the animation.`, AnalyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p19)
					end
					Time = key.Time
				end
			end
			continue
		end
		Markers = descendant:GetMarkers()
		
		if GetFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule() then
			Smallest = math.min(GetFIntUGCValidateMaxTotalInternalMarkersModule(), Ceiled)
			
			if Smallest < #Markers then
				return reportFailure(`CurveAnimation contains a MarkerCurve with {#Markers} Markers. {Smallest} is the maximum per MarkerCurve. Please fix the animation.`, AnalyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p19)
			end
		elseif Ceiled < #Markers then
			return reportFailure(`CurveAnimation contains MarkerCurve with too many markers. {Ceiled} is the maximum per MarkerCurve. Please fix the animation.`, AnalyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p19)
		end
		for _, marker in Markers do
			if not marker.Time or not areNumbersGood(marker.Time) or not marker.Value or GetFIntUGCValidateMaxMarkerCurveValueLengthModule() < #marker.Value then
				return reportFailure("CurveAnimation contains MarkerCurves with invalid Time or Value, or Value is too long. Please fix the animation.", AnalyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p19)
			end
		end
	end
	return true
end

function ValidateCurveAnimationModule.validateCalculatedData(List, List1, p20)
	-- upvalues: areNumbersGood (copy), reportFailure (copy), AnalyticsModule (copy)
	for _, value in List do
		for _, CF in value do
			if not areNumbersGood(CF:GetComponents()) then
				return reportFailure("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", AnalyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p20)
			end
		end
	end
	for _, value1 in List1 do
		for _, value2 in value1 do
			if not areNumbersGood(value2) then
				return reportFailure("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", AnalyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p20)
			end
		end
	end
	return true
end

function ValidateCurveAnimationModule.calculateAnimFramesAtOrigin(p21)
	-- upvalues: calculateAnimFramesAtOriginManual (copy)
	return calculateAnimFramesAtOriginManual(p21)
end

function ValidateCurveAnimationModule.validatePositionMagnitudes(List, p21)
	-- upvalues: ConstantsModule (copy), GetFStringUGCValidateMaxAnimationMovementPerPartModule (copy), reportFailure (copy), AnalyticsModule (copy)
	local AsNumberResults = {}
	
	for _, value in List do
		for i, value1 in value do
			if i ~= ConstantsModule.NAMED_R15_BODY_PARTS.LowerTorso then
				if not AsNumberResults[i] then
					AsNumberResults[i] = GetFStringUGCValidateMaxAnimationMovementPerPartModule.asNumber(i)
				end
				if AsNumberResults[i] < value1 then
					return reportFailure(`CurveAnimation contains positional separation of body parts. Only LowerTorso can change position. All other body parts can only change their orientation. {i} moves more than {AsNumberResults[i]} studs from its parent. Please fix the animation.`, AnalyticsModule.ErrorType.validateCurveAnimation_PositionalMovement, p21)
				end
			end
		end
	end
	return true
end

function ValidateCurveAnimationModule.validateFrames(p22, p23)
	-- upvalues: ValidateCurveAnimationModule (copy), FailureReasonsAccumulatorModule (copy), GetFFlagUGCValidateCurveAnimRotationSpeedModule (copy)
	local AnimFramesAtOrigin, AnimFramesAtOrigin2, AnimFramesAtOrigin3, AnimFramesAtOrigin4 = ValidateCurveAnimationModule.calculateAnimFramesAtOrigin(p22)
	local ValidateCalculatedDataResult, ValidateCalculatedDataResult2 = ValidateCurveAnimationModule.validateCalculatedData(AnimFramesAtOrigin, AnimFramesAtOrigin3, p23)
	
	if not ValidateCalculatedDataResult then
		return ValidateCalculatedDataResult, ValidateCalculatedDataResult2
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	NewFailureReasonsAccumulator:updateReasons(ValidateCurveAnimationModule.validateMinimumTransformations(AnimFramesAtOrigin4, p23))
	NewFailureReasonsAccumulator:updateReasons(ValidateCurveAnimationModule.validatePositionMagnitudes(AnimFramesAtOrigin3, p23))
	NewFailureReasonsAccumulator:updateReasons(ValidateCurveAnimationModule.validateAnimationLength(AnimFramesAtOrigin2, p23))
	NewFailureReasonsAccumulator:updateReasons(ValidateCurveAnimationModule.validateBounds(AnimFramesAtOrigin, p23, AnimFramesAtOrigin2))
	NewFailureReasonsAccumulator:updateReasons(ValidateCurveAnimationModule.validateFrameDeltas(AnimFramesAtOrigin, p23))
	
	if GetFFlagUGCValidateCurveAnimRotationSpeedModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateCurveAnimationModule.validateFrameRotationDeltas(AnimFramesAtOrigin, p23))
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

function ValidateCurveAnimationModule.validate(p22, p23)
	-- upvalues: ValidateCurveAnimationModule (copy), GetEngineFeatureEngineUGCValidatePropertiesSensibleModule (copy), ValidatePropertiesSensibleModule (copy), FailureReasonsAccumulatorModule (copy), GetFFlagUGCValidateMigrateSchemaPropertiesModule (copy), GetFFlagUGCValidationCombineEntrypointResultsModule (copy), ValidateAttributesModule (copy)
	local ValidateStructureResult, ValidateStructureResult2 = ValidateCurveAnimationModule.validateStructure(p22, p23)
	
	if not ValidateStructureResult then
		return ValidateStructureResult, ValidateStructureResult2
	end
	if GetEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local ValidateResult, ValidateResult2 = ValidatePropertiesSensibleModule.validate(p22, p23)
		
		if not ValidateResult then
			return false, ValidateResult2
		end
	end
	local ValidateDataResult, ValidateDataResult2 = ValidateCurveAnimationModule.validateData(p22, p23)
	
	if not ValidateDataResult then
		return ValidateDataResult, ValidateDataResult2
	end
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	
	if not GetFFlagUGCValidateMigrateSchemaPropertiesModule() or not GetFFlagUGCValidationCombineEntrypointResultsModule() then
		NewFailureReasonsAccumulator:updateReasons(ValidateAttributesModule(p22, p23))
	end
	NewFailureReasonsAccumulator:updateReasons(ValidateCurveAnimationModule.validateAllowedTags(p22, p23))
	NewFailureReasonsAccumulator:updateReasons(ValidateCurveAnimationModule.validateFrames(p22, p23))
	
	return NewFailureReasonsAccumulator:getFinalResults()
end

return ValidateCurveAnimationModule