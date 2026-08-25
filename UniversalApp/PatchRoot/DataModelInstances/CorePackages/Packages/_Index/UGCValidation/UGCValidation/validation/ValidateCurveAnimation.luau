local collectionService = game:GetService("CollectionService")
local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local util = parent.util
local _ = require(util.Types)
local failureReasonsAccumulatorModule = require(util.FailureReasonsAccumulator)
local assetCalculatorModule = require(util.AssetCalculator)
local validation = parent.validation
local validateAttributesModule = require(validation.validateAttributes)
local validateTagsModule = require(validation.validateTags)
local validatePropertiesSensibleModule = require(validation.ValidatePropertiesSensible)
local flags = parent.flags
local getFStringUGCValidationMaxAnimationLengthModule = require(flags.GetFStringUGCValidationMaxAnimationLength)
local getFStringUGCValidationMaxAnimationBoundsModule = require(flags.GetFStringUGCValidationMaxAnimationBounds)
local getFStringUGCValidationMaxAnimationDeltasModule = require(flags.GetFStringUGCValidationMaxAnimationDeltas)
local getFFlagUGCValidateAddObjectValueToAcceptableTypesModule = require(flags.getFFlagUGCValidateAddObjectValueToAcceptableTypes)
local getFFlagUGCValidateDuplicatesInAnimationModule = require(flags.getFFlagUGCValidateDuplicatesInAnimation)
local getFFlagUGCValidateMaxTotalInstancesModule = require(flags.getFFlagUGCValidateMaxTotalInstances)
local getFIntUGCValidateMaxAnimationFPSModule = require(flags.getFIntUGCValidateMaxAnimationFPS)
local getFIntUGCValidateMaxMarkerCurveValueLengthModule = require(flags.getFIntUGCValidateMaxMarkerCurveValueLength)
local getFStringUGCValidateMaxAnimationMovementPerPartModule = require(flags.GetFStringUGCValidateMaxAnimationMovementPerPart)
local getFStringUGCValidateFrameDeltaKeyTimeTolModule = require(flags.GetFStringUGCValidateFrameDeltaKeyTimeTol)
local getEngineFeatureEngineUGCValidatePropertiesSensibleModule = require(parent.flags.getEngineFeatureEngineUGCValidatePropertiesSensible)
local getFStringUGCValidateAnimationHeightTolModule = require(flags.GetFStringUGCValidateAnimationHeightTol)
local getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule = require(flags.getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessage)
local getFFlagUGCValidateCurveAnimRotationSpeedModule = require(flags.getFFlagUGCValidateCurveAnimRotationSpeed)
local getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule = require(flags.getFIntUGCValidationMaxAnimationRotationSpeedPerSecond)
local getFFlagUGCValidateCurveAnimFinalFrameBugModule = require(flags.getFFlagUGCValidateCurveAnimFinalFrameBug)
local getFFlagUGCValidateCurveAnimMinTimeFixModule = require(flags.getFFlagUGCValidateCurveAnimMinTimeFix)
local getFStringUGCValidateCurveAnimationMinLengthModule = require(flags.GetFStringUGCValidateCurveAnimationMinLength)
local getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule = require(flags.getFFlagUGCValidateCurveAnimTimeErrorMessageFix)
local getFFlagUGCValidateRestrictNumMarkerCurvesModule = require(flags.getFFlagUGCValidateRestrictNumMarkerCurves)
local getFIntUGCValidateMaxTotalMarkerCurvesModule = require(flags.getFIntUGCValidateMaxTotalMarkerCurves)
local getFFlagUGCValidateRestrictNumFaceControlsModule = require(flags.getFFlagUGCValidateRestrictNumFaceControls)
local getFIntUGCValidateMaxTotalFaceControlsModule = require(flags.getFIntUGCValidateMaxTotalFaceControls)
local getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule = require(flags.getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurves)
local getFIntUGCValidateMaxTotalInternalMarkersModule = require(flags.getFIntUGCValidateMaxTotalInternalMarkers)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(flags.getFFlagUGCValidateMigrateSchemaProperties)
local t = {}

local function reportFailure(p0, p1, p2)
	-- upvalues: analyticsModule (ref)
	analyticsModule.reportFailure(p1, nil, p2)
	
	return false, { p0 }
end

local var37 = nil

local function _()
	-- upvalues: var37 (write), assetCalculatorModule (ref)
	if not var37 then
		var37 = assetCalculatorModule.getBodyPartsToParents()
	end
	return var37
end

local _ = function(p3)
	-- upvalues: var37 (write), assetCalculatorModule (ref)
	local isHumanoidRootPart = true
	
	if not var37 then
		var37 = assetCalculatorModule.getBodyPartsToParents()
	end
	if var37[p3] == nil then
		isHumanoidRootPart = p3 == "HumanoidRootPart"
	end
	return isHumanoidRootPart
end

local function areChildrenAcceptable(p4, p5)
	if not p4 then
		return true
	end
	local function findAndRemoveMatching(p6)
		-- upvalues: p5 (ref)
		for i, v in p5 do
			if v.ClassName == p6.ClassName and v.Name == p6.Name then
				table.remove(p5, i)
				
				return true
			end
		end
		return false
	end
	
	for i, v in p4:GetChildren() do
		if not findAndRemoveMatching(v) then
			return false
		end
	end
	return true
end

local function calculateAcceptableChildBodyPartFolders(p7)
	-- upvalues: var37 (write), assetCalculatorModule (ref)
	local t = {}
	
	if not var37 then
		var37 = assetCalculatorModule.getBodyPartsToParents()
	end
	for i, v in var37 do
		if v == p7 then
			table.insert(t, { ClassName = "Folder", Name = i })
		end
	end
	return t
end

local function calculateAcceptableBodyPartFolderChildrenArray(p8, p9)
	-- upvalues: calculateAcceptableChildBodyPartFolders (ref)
	local var57 = calculateAcceptableChildBodyPartFolders(p8.Name)
	
	if p8.Name == "HumanoidRootPart" then
		return var57
	end
	table.insert(var57, { ClassName = "Vector3Curve", Name = "Position" })
	table.insert(var57, {
		Name = "Rotation",
		ClassName = if p9 then "EulerRotationCurve" else "RotationCurve"
	})
	
	if p8.Name == "Head" then
		table.insert(var57, { ClassName = "Folder", Name = "FaceControls" })
		
		return var57
	end
	return var57
end

local function calculateAcceptableCurveChildrenArray()
	return {
		{ ClassName = "FloatCurve", Name = "X" },
		{ ClassName = "FloatCurve", Name = "Y" },
		{ ClassName = "FloatCurve", Name = "Z" }
	}
end

local _ = function(p10)
	return if p10 then #p10:GetChildren() < #p10:GetDescendants() else false
end

local function validateBodyPartFolderChildren(p11)
	-- upvalues: calculateAcceptableBodyPartFolderChildrenArray (ref), areChildrenAcceptable (ref), calculateAcceptableCurveChildrenArray (ref), getFFlagUGCValidateRestrictNumFaceControlsModule (ref), getFIntUGCValidateMaxTotalFaceControlsModule (ref)
	if not areChildrenAcceptable(p11, calculateAcceptableBodyPartFolderChildrenArray(p11, true)) then
		return false
	elseif not areChildrenAcceptable(p11:FindFirstChild("Position"), calculateAcceptableCurveChildrenArray()) then
		return false
	elseif not areChildrenAcceptable(p11:FindFirstChild("Rotation"), calculateAcceptableCurveChildrenArray()) then
		return false
	end
	local faceControls = p11:FindFirstChild("FaceControls")
	
	if faceControls then
		local children = faceControls:GetChildren()
		
		if getFFlagUGCValidateRestrictNumFaceControlsModule() and getFIntUGCValidateMaxTotalFaceControlsModule() < #children then
			return false
		end
		for i, v in children do
			if not v:IsA("FloatCurve") then
				return false
			end
		end
	end
	local position = p11:FindFirstChild("Position")
	
	if if not position then false else #position:GetChildren() < #position:GetDescendants() then
		return false
	end
	local rotation = p11:FindFirstChild("Rotation")
	
	return if if not rotation then false else #rotation:GetChildren() < #rotation:GetDescendants() then false elseif not faceControls then false else #faceControls:GetChildren() < #faceControls:GetDescendants()
end

local _ = function(p12, p13)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), validateBodyPartFolderChildren (ref), reportFailure (ref), analyticsModule (ref), var37 (write), assetCalculatorModule (ref)
	local function validateBodyPartFolderInternal(p14)
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), p13 (ref), validateBodyPartFolderInternal (ref), var37 (copy), assetCalculatorModule (copy)
		local var64
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			if not validateBodyPartFolderChildren(p14) then
				return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p14.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p13)
			end
			for i, v in p14:GetChildren() do
				if v:IsA("Folder") and v.Name ~= "FaceControls" then
					var64, var65 = validateBodyPartFolderInternal(v)
					
					if not var64 then
						return false, var65
					end
				end
			end
			return true
		else
			for i, v in p14:GetChildren() do
				if v:IsA("Folder") then
					if v.Name ~= "HumanoidRootPart" then
						if not var37 then
							var37 = assetCalculatorModule.getBodyPartsToParents()
						end
						var64 = var37[v.Name]
						
						if var64 then
							return var64 == p14.Name and validateBodyPartFolderInternal(v)
						end
					end
					return false
				end
			end
			return true
		end
	end
	
	local name = p12.Name
	local isHumanoidRootPart = true
	
	if not var37 then
		var37 = assetCalculatorModule.getBodyPartsToParents()
	end
	if var37[name] == nil then
		isHumanoidRootPart = name == "HumanoidRootPart"
	end
	return if isHumanoidRootPart then validateBodyPartFolderInternal(p12) else true
end

local function validateSingleBodyRoot(p15, p16)
	-- upvalues: var37 (write), assetCalculatorModule (ref), reportFailure (ref), analyticsModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref)
	local var66 = 0
	
	for i, v in p15:GetChildren() do
		if v:IsA("Folder") then
			local name = v.Name
			local isHumanoidRootPart = true
			
			if not var37 then
				var37 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var37[name] == nil then
				isHumanoidRootPart = name == "HumanoidRootPart"
			end
			if isHumanoidRootPart then
				var66 += 1
				
				if var66 > 1 then
					return reportFailure("CurveAnimation contains more than one body part or HumanoidRootPart Folder children. Please ensure there is only one child Folder named after a body part or HumanoidRootPart.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p16)
				end
			end
		end
	end
	return if getFFlagUGCValidateDuplicatesInAnimationModule() and var66 == 0 then reportFailure("CurveAnimation contains zero body part or HumanoidRootPart Folder children. Please ensure there is one (and only one) child Folder named after a body part or HumanoidRootPart.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p16) else true
end

function t.validateMarkerCurves(p17, p18)
	-- upvalues: getFIntUGCValidateMaxTotalMarkerCurvesModule (ref), reportFailure (ref), analyticsModule (ref)
	local var68 = getFIntUGCValidateMaxTotalMarkerCurvesModule()
	local var69 = 0
	
	for i, v in p17:GetDescendants() do
		if v:IsA("MarkerCurve") then
			var69 += 1
			
			if var68 < var69 then
				return reportFailure(`CurveAnimation contains more than {var68} MarkerCurve(s). Please ensure there is no more than {var68} MarkerCurve descendant(s).`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p18)
			end
		end
	end
	return true
end

function t.validateSingleAnimationRigData(p19, p20)
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	local var70 = 0
	
	for i, v in p19:GetChildren() do
		if v:IsA("AnimationRigData") then
			var70 += 1
			
			if var70 > 1 then
				return reportFailure("CurveAnimation contains more than one AnimationRigData children. Please ensure there is only one AnimationRigData child.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p20)
			end
		end
	end
	return if var70 == 0 then reportFailure("CurveAnimation contains zero AnimationRigData children. Please ensure there is one (and only one) AnimationRigData children.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p20) else true
end

function t.validateAnimationRigDataInternals(p21, p22)
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	for i, v in p21:GetChildren() do
		if v:IsA("AnimationRigData") and not v:IsValidR15() then
			return reportFailure("AnimationRigData failed internal validation. Please ensure the AnimationRigData is set up correctly.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectAnimationRigData, p22)
		end
	end
	return true
end

local _ = function(p23, p24)
	-- upvalues: t (ref)
	local var71, var72 = t.validateSingleAnimationRigData(p23, p24)
	
	if not var71 then
		return false, var72
	end
	local var73, var74 = t.validateAnimationRigDataInternals(p23, p24)
	
	if var73 then
		return true
	end
	return false, var74
end

local function validateScripts(p25, p26)
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	for i, v in p25:GetDescendants() do
		if v:IsA("Script") or v:IsA("ModuleScript") then
			return reportFailure("CurveAnimation hierarchy contains Scripts, LocalScripts, or ModuleScripts. Please remove them.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p26)
		end
	end
	return true
end

local list = {
	"MarkerCurve", "AnimationRigData", "Folder", "Vector3Curve",
	"EulerRotationCurve", "FloatCurve"
}

if getFFlagUGCValidateAddObjectValueToAcceptableTypesModule() then
	table.insert(list, "ObjectValue")
end
local function validateExtraInstances(p27, p28)
	-- upvalues: list (ref), reportFailure (ref), analyticsModule (ref)
	local var75
	for i, v in p27:GetDescendants() do
		var75 = false
		
		for i_1, v_1 in list do
			if v:IsA(v_1) then
				var75 = true
				break
			end
		end
		if not var75 then
			return reportFailure(`CurveAnimation hierarchy can only contain {table.concat(list, ", ")}. Please remove any other Instance types.`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p28)
		end
	end
	return true
end

function t.validateExtraInstancesUnitTest(p29, p30)
	-- upvalues: validateExtraInstances (ref)
	return validateExtraInstances(p29, p30)
end

function t.validateScriptsUnitTest(p31, p32)
	-- upvalues: validateScripts (ref)
	return validateScripts(p31, p32)
end

local function validateAnimationHierarchy(p33, p34)
	-- upvalues: analyticsModule (ref), getFFlagUGCValidateMaxTotalInstancesModule (ref), reportFailure (ref), validateSingleBodyRoot (ref), t (ref), getFFlagUGCValidateRestrictNumMarkerCurvesModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref), var37 (write), assetCalculatorModule (ref), validateBodyPartFolderChildren (ref), failureReasonsAccumulatorModule (ref), validateScripts (ref), validateExtraInstances (ref)
	if not p33:IsA("CurveAnimation") then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, p34)
		
		return false, {
			"Referenced Animation is not a CurveAnimation. Please ensure the animation is uploaded correctly."
		}
	end
	local count = #p33:GetDescendants()
	
	if getFFlagUGCValidateMaxTotalInstancesModule() < count then
		return reportFailure(`CurveAnimation has {count} descendants. Maximum allowed is {getFFlagUGCValidateMaxTotalInstancesModule()}. Please reduce the number of descendants.`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
	end
	local var77, var78 = validateSingleBodyRoot(p33, p34)
	
	if not var77 then
		return false, var78
	end
	local var81, var82
	local var79, var80 = t.validateSingleAnimationRigData(p33, p34)
	
	if var79 then
		local var83, var84 = t.validateAnimationRigDataInternals(p33, p34)
		local var85 = var84
		
		if var83 then
			var81 = true
			var82 = nil
		else
			var81 = false
			var82 = var85
		end
	else
		var81 = false
		var82 = var80
	end
	local var86 = var82
	
	if not var81 then
		return false, var86
	elseif getFFlagUGCValidateRestrictNumMarkerCurvesModule() then
		local var87, var88 = t.validateMarkerCurves(p33, p34)
		local var89 = var88
		
		if not var87 then
			return false, var89
		end
	end
	local var95
	for i, v in p33:GetChildren() do
		if v:IsA("MarkerCurve") or v:IsA("AnimationRigData") then
			if getFFlagUGCValidateDuplicatesInAnimationModule() and #v:GetChildren() > 0 then
				return reportFailure("CurveAnimation child MarkerCurves and AnimationRigData cannot have children", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
			end
		end
		if v:IsA("Folder") then
			if not getFFlagUGCValidateDuplicatesInAnimationModule() then
				local validateBodyPartFolderInternal = nil
				
				local function name(p35)
					-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), validateBodyPartFolderInternal (ref), name (ref), var37 (copy), assetCalculatorModule (copy)
					local var64
					if getFFlagUGCValidateDuplicatesInAnimationModule() then
						if not validateBodyPartFolderChildren(p35) then
							return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p35.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, validateBodyPartFolderInternal)
						end
						for i, v in p35:GetChildren() do
							if v:IsA("Folder") and v.Name ~= "FaceControls" then
								var64, var65 = name(v)
								
								if not var64 then
									return false, var65
								end
							end
						end
						return true
					else
						for i, v in p35:GetChildren() do
							if v:IsA("Folder") then
								if v.Name ~= "HumanoidRootPart" then
									if not var37 then
										var37 = assetCalculatorModule.getBodyPartsToParents()
									end
									var64 = var37[v.Name]
									
									if var64 then
										return var64 == p35.Name and name(v)
									end
								end
								return false
							end
						end
						return true
					end
				end
				
				local name_1 = v.Name
				local validateBodyPartFolderInternal = true
				
				if not var37 then
					var37 = assetCalculatorModule.getBodyPartsToParents()
				end
				if var37[name_1] == nil then
					local validateBodyPartFolderInternal = name_1 == "HumanoidRootPart"
				end
				if not (not validateBodyPartFolderInternal or name(v)) then
					return reportFailure("CurveAnimation contains child body part Folder " .. v.Name .. " which has an invalid hierarchy", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
				end
			end
			local name = v.Name
			local var91 = true
			
			if not var37 then
				var37 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var37[name] == nil then
				var91 = name == "HumanoidRootPart"
			end
			if var91 then
				local function validateBodyPartFolderInternal(p36)
					-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), p34 (ref), validateBodyPartFolderInternal (ref), var37 (copy), assetCalculatorModule (copy)
					local var64
					if getFFlagUGCValidateDuplicatesInAnimationModule() then
						if not validateBodyPartFolderChildren(p36) then
							return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p36.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
						end
						for i, v in p36:GetChildren() do
							if v:IsA("Folder") and v.Name ~= "FaceControls" then
								var64, var65 = validateBodyPartFolderInternal(v)
								
								if not var64 then
									return false, var65
								end
							end
						end
						return true
					else
						for i, v in p36:GetChildren() do
							if v:IsA("Folder") then
								if v.Name ~= "HumanoidRootPart" then
									if not var37 then
										var37 = assetCalculatorModule.getBodyPartsToParents()
									end
									var64 = var37[v.Name]
									
									if var64 then
										return var64 == p36.Name and validateBodyPartFolderInternal(v)
									end
								end
								return false
							end
						end
						return true
					end
				end
				
				local name_1 = v.Name
				local var93 = true
				
				if not var37 then
					var37 = assetCalculatorModule.getBodyPartsToParents()
				end
				if var37[name_1] == nil then
					var93 = name_1 == "HumanoidRootPart"
				end
				if var93 then
					var93, var94 = validateBodyPartFolderInternal(v)
					var91 = var93
					name = var94
				else
					var91 = true
					name = nil
				end
				var95 = name
				
				if not var91 then
					return false, var95
				end
			end
			return reportFailure("CurveAnimation contains unexpected child: " .. v.Name, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
		end
		return reportFailure("CurveAnimation contains unexpected child: " .. v.Name, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
	end
	local var90 = failureReasonsAccumulatorModule.new()
	var90:updateReasons(validateScripts(p33, p34))
	var90:updateReasons(validateExtraInstances(p33, p34))
	
	return var90:getFinalResults()
end

local function createDefaultCharacter(p37)
	-- upvalues: playersService (ref)
	local var96 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	
	for i, v in var96:GetDescendants() do
		if v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("MeshPart") then
			v.Transparency = 1
			v.CanCollide = false
		elseif v:IsA("Motor6D") and p37 then
			v:Destroy()
		end
	end
	return var96
end

local var49 = 1 / getFIntUGCValidateMaxAnimationFPSModule()

local function getBodyPartFolderRoot(p38)
	-- upvalues: var37 (write), assetCalculatorModule (ref)
	for i, v in p38:GetChildren() do
		if v:IsA("Folder") then
			local name = v.Name
			local isHumanoidRootPart = true
			
			if not var37 then
				var37 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var37[name] == nil then
				isHumanoidRootPart = name == "HumanoidRootPart"
			end
			if isHumanoidRootPart then
				return v
			end
		end
	end
	return nil
end

local function hasFloatCurveKeys(p39)
	local floatCurve
	local x = p39:FindFirstChild("X")
	local y = p39:FindFirstChild("Y")
	local z = p39:FindFirstChild("Z")
	
	if x then
		floatCurve = x:IsA("FloatCurve")
		
		if floatCurve then
			floatCurve = #x:GetKeys() > 0
			floatCurve = nil
		end
	else
		floatCurve = false
	end
	if not floatCurve then
		if y then
			floatCurve = y:IsA("FloatCurve")
			
			if floatCurve then
				floatCurve = #y:GetKeys() > 0
				floatCurve = nil
			end
		else
			floatCurve = false
		end
		if not floatCurve then
			if z then
				floatCurve = z:IsA("FloatCurve")
				
				return floatCurve and #z:GetKeys() > 0
			end
			floatCurve = false
		end
	end
end

local _ = function(p40)
	-- upvalues: hasFloatCurveKeys (ref)
	return if p40 then if p40:IsA("Vector3Curve") then hasFloatCurveKeys(p40) else false else false
end

local _ = function(p41)
	-- upvalues: hasFloatCurveKeys (ref)
	return if p41 then if p41:IsA("EulerRotationCurve") then hasFloatCurveKeys(p41) else false else false
end

local function calculateAnimFramesAtOriginManual(p42)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), getBodyPartFolderRoot (ref), var37 (write), assetCalculatorModule (ref), hasFloatCurveKeys (ref), constantsModule (ref), createDefaultCharacter (ref), getFFlagUGCValidateCurveAnimFinalFrameBugModule (ref), var49 (ref)
	local function getCurveTracks()
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), getBodyPartFolderRoot (copy), p42 (ref), var37 (copy), assetCalculatorModule (copy), hasFloatCurveKeys (copy), constantsModule (copy)
		local descendants
		local t = {}
		local _ = nil
		
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			local var116 = getBodyPartFolderRoot(p42)
			assert(var116, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.")
			descendants = var116:GetDescendants()
			table.insert(descendants, var116)
		else
			descendants = p42:GetDescendants()
		end
		for i, v in descendants do
			if v:IsA("Folder") then
				if not var37 then
					var37 = assetCalculatorModule.getBodyPartsToParents()
				end
				if var37[v.Name] then
					local position = v:FindFirstChild("Position")
					local rotation = v:FindFirstChild("Rotation")
					t[v.Name] = {
						pos = if if not position then false elseif not position:IsA("Vector3Curve") then false else hasFloatCurveKeys(position) then position else nil,
						rot = if if not rotation then false elseif not rotation:IsA("EulerRotationCurve") then false else hasFloatCurveKeys(rotation) then rotation else nil,
						faceControls = if v.Name == constantsModule.NAMED_R15_BODY_PARTS.Head then v:FindFirstChild("FaceControls") else nil
					}
				end
			end
		end
		return t
	end
	
	local function calculateCurveAnimLength(p43)
		local var120 = -1
		
		local function getMaxTimeFromFloatCurveChildren(a)
			-- upvalues: var120 (write)
			if not a then return end
			for i, v in a:GetChildren() do
				if v:IsA("FloatCurve") then
					for i_1, v_1 in v:GetKeys() do
						var120 = math.max(var120, v_1.Time)
					end
				end
			end
		end
		
		for i, v in p43 do
			getMaxTimeFromFloatCurveChildren(v.pos)
			getMaxTimeFromFloatCurveChildren(v.rot)
			getMaxTimeFromFloatCurveChildren(v.faceControls)
		end
		return var120
	end
	
	local function calculateTransformsAtTime(p44, p45)
		local t = {}
		
		for i, v in p45 do
			t[i] = (if v.rot then v.rot:GetRotationAtTime(p44) else CFrame.new()) + (if v.pos then Vector3.new(unpack(v.pos:GetValueAtTime(p44))) else Vector3.new(0, 0, 0))
		end
		return t
	end
	
	local function calculatePositionMagnitudeResultsAtTime(p46, p47)
		local t = {}
		
		for i, v in p47 do
			if v.pos then
				t[i] = Vector3.new(unpack(v.pos:GetValueAtTime(p46))).Magnitude
			end
		end
		return t
	end
	
	local var106 = createDefaultCharacter(false)
	local t = {}
	
	for i, v in var106:GetChildren() do
		local name = v.Name
		local isHumanoidRootPart = true
		
		if not var37 then
			var37 = assetCalculatorModule.getBodyPartsToParents()
		end
		if var37[name] == nil then
			isHumanoidRootPart = name == "HumanoidRootPart"
		end
		if isHumanoidRootPart then
			t[v.Name] = v
		end
	end
	local var108 = getCurveTracks()
	local var109 = calculateCurveAnimLength(var108)
	local t_1 = {}
	local t_2 = {}
	
	local function _(p48)
		-- upvalues: calculateTransformsAtTime (ref), var108 (ref), assetCalculatorModule (copy), t (ref), t_1 (ref), t_2 (ref), calculatePositionMagnitudeResultsAtTime (ref)
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(p48, var108)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(p48, var108))
	end
	
	local var112 = 0
	while var112 <= var109 do
		if getFFlagUGCValidateCurveAnimFinalFrameBugModule() then
			local var113 = var112
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var113, var108)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var113, var108))
		else
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var112, var108)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var112, var108))
		end
		var112 += var49
	end
	if getFFlagUGCValidateCurveAnimFinalFrameBugModule() and var109 >= 0 then
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var109, var108)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var109, var108))
	end
	var106:Destroy()
	
	return t_1, var109, t_2, var108
end

function t.validateAnimationLength(p49, p50)
	-- upvalues: getFFlagUGCValidateCurveAnimMinTimeFixModule (ref), getFStringUGCValidateCurveAnimationMinLengthModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (ref), reportFailure (ref), analyticsModule (ref)
	local var124 = if getFFlagUGCValidateCurveAnimMinTimeFixModule() then getFStringUGCValidateCurveAnimationMinLengthModule.asNumber() else 0
	
	return if not (p49 > var124 and getFStringUGCValidationMaxAnimationLengthModule.asNumber() >= p49) then if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then reportFailure(`CurveAnimation must be between {var124} and {getFStringUGCValidationMaxAnimationLengthModule.asString()} seconds long. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableLength, p50) else reportFailure(`CurveAnimation must be between 0 and {getFStringUGCValidationMaxAnimationLengthModule.asString()} seconds long. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableLength, p50) else true
end

function t.validateBounds(p51, p52, p53)
	-- upvalues: getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (ref), getFStringUGCValidateAnimationHeightTolModule (ref), getFStringUGCValidationMaxAnimationBoundsModule (ref), var49 (ref), reportFailure (ref), analyticsModule (ref), failureReasonsAccumulatorModule (ref)
	local var125 = 1e999
	local var126 = 0
	local var127 = nil
	local var128 = nil
	
	if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		var127 = getFStringUGCValidateAnimationHeightTolModule.asNumber()
		var128 = getFStringUGCValidationMaxAnimationBoundsModule.asNumber()
	end
	for i, v in p51 do
		for i_1, v_1 in v do
			if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
				if v_1.Position.Y >= var127 then
					if var128 < v_1.Position.Magnitude then
						return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is %.2f studs from the HumanoidRootPart. Body parts cannot be more than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(p53, (i - 1) * var49), i_1, v_1.Position.Magnitude, getFStringUGCValidationMaxAnimationBoundsModule.asString()), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, p52)
					end
				end
				return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is at height %.2f studs from the HumanoidRootPart. Body parts cannot be lower than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(p53, (i - 1) * var49), i_1, v_1.Position.Y, getFStringUGCValidateAnimationHeightTolModule.asString()), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, p52)
			else
				var126 = math.max(var126, v_1.Position.Magnitude)
				var125 = math.min(var125, v_1.Position.Y)
			end
		end
	end
	if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		return true
	end
	local var129 = failureReasonsAccumulatorModule.new()
	var129:updateReasons(getFStringUGCValidateAnimationHeightTolModule.asNumber() <= var125, {
		`Body parts in a CurveAnimation cannot be lower than {getFStringUGCValidateAnimationHeightTolModule.asString()} studs from the HumanoidRootPart. Please fix the animation.`
	})
	var129:updateReasons(var126 <= getFStringUGCValidationMaxAnimationBoundsModule.asNumber(), {
		`Body parts in a CurveAnimation cannot get more than {getFStringUGCValidationMaxAnimationBoundsModule.asString()} studs from the HumanoidRootPart. Please fix the animation.`
	})
	
	if not var129:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, nil, p52)
	end
	return var129:getFinalResults()
end

function t.validateFrameDeltas(p54, p55)
	-- upvalues: var49 (ref), getFStringUGCValidationMaxAnimationDeltasModule (ref), getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule (ref), reportFailure (ref), analyticsModule (ref)
	local magnitude
	local var130 = var49 / 0.033333333333
	local var131 = getFStringUGCValidationMaxAnimationDeltasModule.asNumber() * var130
	local var132 = if getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then getFStringUGCValidationMaxAnimationDeltasModule.asNumber() * 30 else nil
	local t = {}
	
	for i, v in p54 do
		for i_1, v_1 in v do
			local var134 = t[i_1]
			
			if var134 then
				magnitude = (v_1.Position - var134.Position).Magnitude
				
				if var131 < magnitude then
					return if getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a speed of %.2f studs/second. %.2f is the maximum studs/second speed. Please fix the animation.", (i - 1) * var49, i_1, magnitude / var130 * 30, var132), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, p55) else reportFailure(`Body part {i_1} in CurveAnimation moves more than {getFStringUGCValidationMaxAnimationDeltasModule.asString()} studs between frames. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, p55)
				end
			end
		end
		t = v
	end
	return true
end

function t.validateFrameRotationDeltas(p56, p57)
	-- upvalues: var49 (ref), getFIntUGCValidateMaxAnimationFPSModule (ref), getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule (ref), reportFailure (ref), analyticsModule (ref)
	assert(math.abs(1 / var49 - getFIntUGCValidateMaxAnimationFPSModule()) < 0.00001, "frameDelta should be calculated as 1 / getFIntUGCValidateMaxAnimationFPS()")
	local var135 = getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule()
	local var136 = var135 / getFIntUGCValidateMaxAnimationFPSModule()
	local t = {}
	
	for i, v in p56 do
		for i_1, v_1 in v do
			local var138 = t[i_1]
			
			if var138 then
				local degrees = math.deg(math.abs(v_1:AngleBetween(var138)))
				
				if var136 < degrees then
					return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a rotation speed of %.2f degrees/second. %.2f is the maximum degrees/second speed. Please fix the animation.", (i - 1) * var49, i_1, degrees * getFIntUGCValidateMaxAnimationFPSModule(), var135), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameRotationDelta, p57)
				end
			end
		end
		t = v
	end
	return true
end

function t.validateMinimumTransformations(a, b)
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	for i, v in a do
		if v.pos or v.rot then
			return true
		end
	end
	return reportFailure("CurveAnimation does not contain any joint manipulation.", analyticsModule.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, b)
end

function t.validateContainsJointManipulation(p58, p59)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), getBodyPartFolderRoot (ref), var37 (write), assetCalculatorModule (ref), reportFailure (ref), analyticsModule (ref)
	local descendants
	local _ = nil
	
	if getFFlagUGCValidateDuplicatesInAnimationModule() then
		local var140 = getBodyPartFolderRoot(p58)
		assert(var140, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.")
		descendants = var140:GetDescendants()
		table.insert(descendants, var140)
	else
		descendants = p58:GetDescendants()
	end
	for i, v in descendants do
		if v:IsA("Folder") then
			if not var37 then
				var37 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var37[v.Name] then
				local position = v:FindFirstChild("Position")
				local rotation = v:FindFirstChild("Rotation")
				
				if position and position:IsA("Vector3Curve") and (rotation and rotation:IsA("EulerRotationCurve")) then
					return true
				end
			end
		end
	end
	return reportFailure("CurveAnimation does not contain any joint manipulation.", analyticsModule.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, p59)
end

local _ = function(p60)
	return if #p60 > 30 then false else string.match(p60, "^[0-9]+$") ~= nil
end

function t.validateAllowedTags(p61, p62)
	-- upvalues: validateTagsModule (ref), collectionService (ref), reportFailure (ref), analyticsModule (ref)
	for i, v in p61:GetChildren() do
		local var147, var148 = validateTagsModule(v, p62)
		
		if not var147 then
			return var147, var148
		end
	end
	local var144 = collectionService:GetTags(p61)
	local var144Count = #var144
	
	if var144Count > 0 then
		if var144Count <= 1 then
			local var146 = var144[1]
			
			return if if #var146 > 30 then false else string.match(var146, "^[0-9]+$") ~= nil then true else reportFailure("CurveAnimation can only contain a single timestamp tag. Please remove all other tags.", analyticsModule.ErrorType.validateTags, p62)
		end
	end
end

function t.validateStructure(p63, p64)
	-- upvalues: validateAnimationHierarchy (ref)
	return validateAnimationHierarchy(p63, p64)
end

local function areNumbersGood(...)
	local function _(p65)
		return p65 ~= p65
	end
	
	local _ = function(p66)
		return if p66 ~= 1e999 then p66 == -1e999 else true
	end
	
	for i, v in { ... } do
		if v == v then
			if if v ~= 1e999 then v == -1e999 else true then
				return false
			end
		end
		return false
	end
	return true
end

function t.validateData(p67, p68)
	-- upvalues: var49 (ref), getFStringUGCValidateFrameDeltaKeyTimeTolModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule (ref), getFIntUGCValidateMaxTotalInternalMarkersModule (ref), reportFailure (ref), analyticsModule (ref), areNumbersGood (ref), getFIntUGCValidateMaxMarkerCurveValueLengthModule (ref), getFIntUGCValidateMaxAnimationFPSModule (ref)
	local markers, minValue
	local var149 = var49 * getFStringUGCValidateFrameDeltaKeyTimeTolModule.asNumber()
	local ceiled = math.ceil(1 / var149 * getFStringUGCValidationMaxAnimationLengthModule.asNumber())
	
	for i, v in p67:GetDescendants() do
		if not v:IsA("MarkerCurve") then
			if v:IsA("FloatCurve") then
				markers = v:GetKeys()
				
				if ceiled >= #markers then
					minValue = nil
					
					for v_1, v_1 in markers do
						if v_1.Time and areNumbersGood(v_1.Time) and (v_1.Value and areNumbersGood(v_1.Value)) then
							if minValue then
								if v_1.Time >= minValue + var149 then
									minValue = v_1.Time
									continue
								end
								return reportFailure(`CurveAnimation contains Curve {if v.Parent.Parent then v.Parent.Parent.Name else "-"}.{v.Parent.Name}.{v.Name} with keys that are too close together in time for a maximum {getFIntUGCValidateMaxAnimationFPSModule()} fps animation. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p68)
							elseif v_1.Time >= 0 then
							end
							return reportFailure(`CurveAnimation contains Curve {if v.Parent.Parent then v.Parent.Parent.Name else "-"}.{v.Parent.Name}.{v.Name} with a key that has a negative time. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p68)
						end
						return reportFailure("CurveAnimation contains Curves with invalid Time or Value. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p68)
					end
				end
				return reportFailure(`CurveAnimation contains Curves with too many keys. {ceiled} is the maximum per Curve. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p68)
			end
		end
		markers = v:GetMarkers()
		
		if getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule() then
			minValue = math.min(getFIntUGCValidateMaxTotalInternalMarkersModule(), ceiled)
			
			if minValue >= #markers then
				for i_1, v_1 in markers do
					if not v_1.Time or not areNumbersGood(v_1.Time) or (not v_1.Value or getFIntUGCValidateMaxMarkerCurveValueLengthModule() < #v_1.Value) then
						return reportFailure("CurveAnimation contains MarkerCurves with invalid Time or Value, or Value is too long. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p68)
					end
				end
			end
			return reportFailure(`CurveAnimation contains a MarkerCurve with {#markers} Markers. {minValue} is the maximum per MarkerCurve. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p68)
		elseif ceiled >= #markers then
		end
		return reportFailure(`CurveAnimation contains MarkerCurve with too many markers. {ceiled} is the maximum per MarkerCurve. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p68)
	end
	return true
end

function t.validateCalculatedData(p69, p70, p71)
	-- upvalues: areNumbersGood (ref), reportFailure (ref), analyticsModule (ref)
	for i, v in p69 do
		for i_2, v_2 in v do
			if not areNumbersGood(v_2:GetComponents()) then
				return reportFailure("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p71)
			end
		end
	end
	for i, v_1 in p70 do
		for i_2, v_2 in v_1 do
			if not areNumbersGood(v_2) then
				return reportFailure("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p71)
			end
		end
	end
	return true
end

function t.calculateAnimFramesAtOrigin(p72)
	-- upvalues: calculateAnimFramesAtOriginManual (ref)
	return calculateAnimFramesAtOriginManual(p72)
end

function t.validatePositionMagnitudes(p73, p74)
	-- upvalues: constantsModule (ref), getFStringUGCValidateMaxAnimationMovementPerPartModule (ref), reportFailure (ref), analyticsModule (ref)
	local t = {}
	
	for i, v in p73 do
		for i_1, v_1 in v do
			if i_1 ~= constantsModule.NAMED_R15_BODY_PARTS.LowerTorso then
				if not t[i_1] then
					t[i_1] = getFStringUGCValidateMaxAnimationMovementPerPartModule.asNumber(i_1)
				end
				if t[i_1] < v_1 then
					return reportFailure(`CurveAnimation contains positional separation of body parts. Only LowerTorso can change position. All other body parts can only change their orientation. {i_1} moves more than {t[i_1]} studs from its parent. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_PositionalMovement, p74)
				end
			end
		end
	end
	return true
end

function t.validateFrames(p75, p76)
	-- upvalues: t (ref), failureReasonsAccumulatorModule (ref), getFFlagUGCValidateCurveAnimRotationSpeedModule (ref)
	local var154, var155, var156, var157 = t.calculateAnimFramesAtOrigin(p75)
	local var158, var159 = t.validateCalculatedData(var154, var156, p76)
	
	if not var158 then
		return var158, var159
	end
	local var160 = failureReasonsAccumulatorModule.new()
	var160:updateReasons(t.validateMinimumTransformations(var157, p76))
	var160:updateReasons(t.validatePositionMagnitudes(var156, p76))
	var160:updateReasons(t.validateAnimationLength(var155, p76))
	var160:updateReasons(t.validateBounds(var154, p76, var155))
	var160:updateReasons(t.validateFrameDeltas(var154, p76))
	
	if getFFlagUGCValidateCurveAnimRotationSpeedModule() then
		var160:updateReasons(t.validateFrameRotationDeltas(var154, p76))
	end
	return var160:getFinalResults()
end

function t.validate(p77, p78)
	-- upvalues: t (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), failureReasonsAccumulatorModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateAttributesModule (ref)
	local var161, var162 = t.validateStructure(p77, p78)
	
	if not var161 then
		return var161, var162
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var163, var164 = validatePropertiesSensibleModule.validate(p77, p78)
		
		if not var163 then
			return false, var164
		end
	end
	local var165, var166 = t.validateData(p77, p78)
	
	if not var165 then
		return var165, var166
	end
	local var167 = failureReasonsAccumulatorModule.new()
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var167:updateReasons(validateAttributesModule(p77, p78))
	end
	var167:updateReasons(t.validateAllowedTags(p77, p78))
	var167:updateReasons(t.validateFrames(p77, p78))
	
	return var167:getFinalResults()
end

return t