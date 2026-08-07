-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:42 2026 Pacific Standard Time.

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
local getFFlagUGCValidationCombineEntrypointResultsModule = require(flags.getFFlagUGCValidationCombineEntrypointResults)
local t = {}

local function reportFailure(p0, p1, p2) --[[ line: 66 ]]
	-- upvalues: analyticsModule (ref)
	analyticsModule.reportFailure(p1, nil, p2)
	
	return false, { p0 }
end

local var38 = nil

local function _() --[[ line: 79 | named "getBodyPartToParentMap" ]]
	-- upvalues: var38 (write), assetCalculatorModule (ref)
	if not var38 then
		var38 = assetCalculatorModule.getBodyPartsToParents()
	end
	return var38
end

local _ = function(p3) --[[ line: 87 | named "isBodyPartFolderNameValid" ]]
	-- upvalues: var38 (write), assetCalculatorModule (ref)
	local isHumanoidRootPart = true
	
	if not var38 then
		var38 = assetCalculatorModule.getBodyPartsToParents()
	end
	if var38[p3] == nil then
		isHumanoidRootPart = p3 == "HumanoidRootPart"
	end
	return isHumanoidRootPart
end

local function areChildrenAcceptable(p4, p5) --[[ line: 91 ]]
	if not p4 then
		return true
	end
	local function findAndRemoveMatching(p6) --[[ line: 96 ]]
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

local function calculateAcceptableChildBodyPartFolders(p7) --[[ line: 116 ]]
	-- upvalues: var38 (write), assetCalculatorModule (ref)
	local t = {}
	
	if not var38 then
		var38 = assetCalculatorModule.getBodyPartsToParents()
	end
	for i, v in var38 do
		if v == p7 then
			table.insert(t, { ClassName = "Folder", Name = i })
		end
	end
	return t
end

local function calculateAcceptableBodyPartFolderChildrenArray(p8, p9) --[[ line: 130 ]]
	-- upvalues: calculateAcceptableChildBodyPartFolders (ref)
	local var58 = calculateAcceptableChildBodyPartFolders(p8.Name)
	
	if p8.Name == "HumanoidRootPart" then
		return var58
	end
	table.insert(var58, { ClassName = "Vector3Curve", Name = "Position" })
	table.insert(var58, {
		Name = "Rotation",
		ClassName = if p9 then "EulerRotationCurve" else "RotationCurve"
	})
	
	if p8.Name == "Head" then
		table.insert(var58, { ClassName = "Folder", Name = "FaceControls" })
		
		return var58
	end
	return var58
end

local function calculateAcceptableCurveChildrenArray() --[[ line: 161 ]]
	return {
		{ ClassName = "FloatCurve", Name = "X" },
		{ ClassName = "FloatCurve", Name = "Y" },
		{ ClassName = "FloatCurve", Name = "Z" }
	}
end

local _ = function(p10) --[[ line: 178 | named "containsGrandChildren" ]]
	return if p10 then #p10:GetChildren() < #p10:GetDescendants() else false
end

local function validateBodyPartFolderChildren(p11) --[[ line: 185 ]]
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

local _ = function(p12, p13) --[[ line: 236 | named "validateCurveAnimationBodyPartFolder" ]]
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), validateBodyPartFolderChildren (ref), reportFailure (ref), analyticsModule (ref), var38 (write), assetCalculatorModule (ref)
	local function validateBodyPartFolderInternal(p14) --[[ line: 240 ]]
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), p13 (ref), validateBodyPartFolderInternal (ref), var38 (copy), assetCalculatorModule (copy)
		local var65
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			if not validateBodyPartFolderChildren(p14) then
				return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p14.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p13)
			end
			for i, v in p14:GetChildren() do
				if v:IsA("Folder") and v.Name ~= "FaceControls" then
					var65, var66 = validateBodyPartFolderInternal(v)
					
					if not var65 then
						return false, var66
					end
				end
			end
			return true
		else
			for i, v in p14:GetChildren() do
				if v:IsA("Folder") then
					if v.Name ~= "HumanoidRootPart" then
						if not var38 then
							var38 = assetCalculatorModule.getBodyPartsToParents()
						end
						var65 = var38[v.Name]
						
						if var65 then
							return var65 == p14.Name and validateBodyPartFolderInternal(v)
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
	
	if not var38 then
		var38 = assetCalculatorModule.getBodyPartsToParents()
	end
	if var38[name] == nil then
		isHumanoidRootPart = name == "HumanoidRootPart"
	end
	return if isHumanoidRootPart then validateBodyPartFolderInternal(p12) else true
end

local function validateSingleBodyRoot(p15, p16) --[[ line: 289 ]]
	-- upvalues: var38 (write), assetCalculatorModule (ref), reportFailure (ref), analyticsModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref)
	local var67 = 0
	
	for i, v in p15:GetChildren() do
		if v:IsA("Folder") then
			local name = v.Name
			local isHumanoidRootPart = true
			
			if not var38 then
				var38 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var38[name] == nil then
				isHumanoidRootPart = name == "HumanoidRootPart"
			end
			if isHumanoidRootPart then
				var67 += 1
				
				if var67 > 1 then
					return reportFailure("CurveAnimation contains more than one body part or HumanoidRootPart Folder children. Please ensure there is only one child Folder named after a body part or HumanoidRootPart.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p16)
				end
			end
		end
	end
	return if getFFlagUGCValidateDuplicatesInAnimationModule() and var67 == 0 then reportFailure("CurveAnimation contains zero body part or HumanoidRootPart Folder children. Please ensure there is one (and only one) child Folder named after a body part or HumanoidRootPart.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p16) else true
end

function t.validateMarkerCurves(p17, p18) --[[ line: 319 ]]
	-- upvalues: getFIntUGCValidateMaxTotalMarkerCurvesModule (ref), reportFailure (ref), analyticsModule (ref)
	local var69 = getFIntUGCValidateMaxTotalMarkerCurvesModule()
	local var70 = 0
	
	for i, v in p17:GetDescendants() do
		if v:IsA("MarkerCurve") then
			var70 += 1
			
			if var69 < var70 then
				return reportFailure(`CurveAnimation contains more than {var69} MarkerCurve(s). Please ensure there is no more than {var69} MarkerCurve descendant(s).`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p18)
			end
		end
	end
	return true
end

function t.validateSingleAnimationRigData(p19, p20) --[[ line: 341 ]]
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	local var71 = 0
	
	for i, v in p19:GetChildren() do
		if v:IsA("AnimationRigData") then
			var71 += 1
			
			if var71 > 1 then
				return reportFailure("CurveAnimation contains more than one AnimationRigData children. Please ensure there is only one AnimationRigData child.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p20)
			end
		end
	end
	return if var71 == 0 then reportFailure("CurveAnimation contains zero AnimationRigData children. Please ensure there is one (and only one) AnimationRigData children.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p20) else true
end

function t.validateAnimationRigDataInternals(p21, p22) --[[ line: 369 ]]
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	for i, v in p21:GetChildren() do
		if v:IsA("AnimationRigData") and not v:IsValidR15() then
			return reportFailure("AnimationRigData failed internal validation. Please ensure the AnimationRigData is set up correctly.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectAnimationRigData, p22)
		end
	end
	return true
end

local _ = function(p23, p24) --[[ line: 389 | named "validateAnimationRigData" ]]
	-- upvalues: t (ref)
	local var72, var73 = t.validateSingleAnimationRigData(p23, p24)
	
	if not var72 then
		return false, var73
	end
	local var74, var75 = t.validateAnimationRigDataInternals(p23, p24)
	
	if var74 then
		return true
	end
	return false, var75
end

local function validateScripts(p25, p26) --[[ line: 405 ]]
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
local function validateExtraInstances(p27, p28) --[[ line: 434 ]]
	-- upvalues: list (ref), reportFailure (ref), analyticsModule (ref)
	local var76
	for i, v in p27:GetDescendants() do
		var76 = false
		
		for i_1, v_1 in list do
			if v:IsA(v_1) then
				var76 = true
				break
			end
		end
		if not var76 then
			return reportFailure(`CurveAnimation hierarchy can only contain {table.concat(list, ", ")}. Please remove any other Instance types.`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p28)
		end
	end
	return true
end

function t.validateExtraInstancesUnitTest(p29, p30) --[[ line: 458 ]]
	-- upvalues: validateExtraInstances (ref)
	return validateExtraInstances(p29, p30)
end

function t.validateScriptsUnitTest(p31, p32) --[[ line: 465 ]]
	-- upvalues: validateScripts (ref)
	return validateScripts(p31, p32)
end

local function validateAnimationHierarchy(p33, p34) --[[ line: 474 ]]
	-- upvalues: analyticsModule (ref), getFFlagUGCValidateMaxTotalInstancesModule (ref), reportFailure (ref), validateSingleBodyRoot (ref), t (ref), getFFlagUGCValidateRestrictNumMarkerCurvesModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref), var38 (write), assetCalculatorModule (ref), validateBodyPartFolderChildren (ref), failureReasonsAccumulatorModule (ref), validateScripts (ref), validateExtraInstances (ref)
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
	local var78, var79 = validateSingleBodyRoot(p33, p34)
	
	if not var78 then
		return false, var79
	end
	local var82, var83
	local var80, var81 = t.validateSingleAnimationRigData(p33, p34)
	
	if var80 then
		local var84, var85 = t.validateAnimationRigDataInternals(p33, p34)
		local var86 = var85
		
		if var84 then
			var82 = true
			var83 = nil
		else
			var82 = false
			var83 = var86
		end
	else
		var82 = false
		var83 = var81
	end
	local var87 = var83
	
	if not var82 then
		return false, var87
	elseif getFFlagUGCValidateRestrictNumMarkerCurvesModule() then
		local var88, var89 = t.validateMarkerCurves(p33, p34)
		local var90 = var89
		
		if not var88 then
			return false, var90
		end
	end
	local var96
	for i, v in p33:GetChildren() do
		if v:IsA("MarkerCurve") or v:IsA("AnimationRigData") then
			if getFFlagUGCValidateDuplicatesInAnimationModule() and #v:GetChildren() > 0 then
				return reportFailure("CurveAnimation child MarkerCurves and AnimationRigData cannot have children", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
			end
		end
		if v:IsA("Folder") then
			if not getFFlagUGCValidateDuplicatesInAnimationModule() then
				local validateBodyPartFolderInternal = nil
				
				local function name(p35) --[[ line: 240 | named "validateBodyPartFolderInternal" ]]
					-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), validateBodyPartFolderInternal (ref), name (ref), var38 (copy), assetCalculatorModule (copy)
					local var65
					if getFFlagUGCValidateDuplicatesInAnimationModule() then
						if not validateBodyPartFolderChildren(p35) then
							return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p35.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, validateBodyPartFolderInternal)
						end
						for i, v in p35:GetChildren() do
							if v:IsA("Folder") and v.Name ~= "FaceControls" then
								var65, var66 = name(v)
								
								if not var65 then
									return false, var66
								end
							end
						end
						return true
					else
						for i, v in p35:GetChildren() do
							if v:IsA("Folder") then
								if v.Name ~= "HumanoidRootPart" then
									if not var38 then
										var38 = assetCalculatorModule.getBodyPartsToParents()
									end
									var65 = var38[v.Name]
									
									if var65 then
										return var65 == p35.Name and name(v)
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
				
				if not var38 then
					var38 = assetCalculatorModule.getBodyPartsToParents()
				end
				if var38[name_1] == nil then
					local validateBodyPartFolderInternal = name_1 == "HumanoidRootPart"
				end
				if not (not validateBodyPartFolderInternal or name(v)) then
					return reportFailure("CurveAnimation contains child body part Folder " .. v.Name .. " which has an invalid hierarchy", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
				end
			end
			local name = v.Name
			local var92 = true
			
			if not var38 then
				var38 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var38[name] == nil then
				var92 = name == "HumanoidRootPart"
			end
			if var92 then
				local function validateBodyPartFolderInternal(p36) --[[ line: 240 ]]
					-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), p34 (ref), validateBodyPartFolderInternal (ref), var38 (copy), assetCalculatorModule (copy)
					local var65
					if getFFlagUGCValidateDuplicatesInAnimationModule() then
						if not validateBodyPartFolderChildren(p36) then
							return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p36.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
						end
						for i, v in p36:GetChildren() do
							if v:IsA("Folder") and v.Name ~= "FaceControls" then
								var65, var66 = validateBodyPartFolderInternal(v)
								
								if not var65 then
									return false, var66
								end
							end
						end
						return true
					else
						for i, v in p36:GetChildren() do
							if v:IsA("Folder") then
								if v.Name ~= "HumanoidRootPart" then
									if not var38 then
										var38 = assetCalculatorModule.getBodyPartsToParents()
									end
									var65 = var38[v.Name]
									
									if var65 then
										return var65 == p36.Name and validateBodyPartFolderInternal(v)
									end
								end
								return false
							end
						end
						return true
					end
				end
				
				local name_1 = v.Name
				local var94 = true
				
				if not var38 then
					var38 = assetCalculatorModule.getBodyPartsToParents()
				end
				if var38[name_1] == nil then
					var94 = name_1 == "HumanoidRootPart"
				end
				if var94 then
					var94, var95 = validateBodyPartFolderInternal(v)
					var92 = var94
					name = var95
				else
					var92 = true
					name = nil
				end
				var96 = name
				
				if not var92 then
					return false, var96
				end
			end
			return reportFailure("CurveAnimation contains unexpected child: " .. v.Name, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
		end
		return reportFailure("CurveAnimation contains unexpected child: " .. v.Name, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p34)
	end
	local var91 = failureReasonsAccumulatorModule.new()
	var91:updateReasons(validateScripts(p33, p34))
	var91:updateReasons(validateExtraInstances(p33, p34))
	
	return var91:getFinalResults()
end

local function createDefaultCharacter(p37) --[[ line: 572 ]]
	-- upvalues: playersService (ref)
	local var97 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	
	for i, v in var97:GetDescendants() do
		if v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("MeshPart") then
			v.Transparency = 1
			v.CanCollide = false
		elseif v:IsA("Motor6D") and p37 then
			v:Destroy()
		end
	end
	return var97
end

local var50 = 1 / getFIntUGCValidateMaxAnimationFPSModule()

local function getBodyPartFolderRoot(p38) --[[ line: 606 ]]
	-- upvalues: var38 (write), assetCalculatorModule (ref)
	for i, v in p38:GetChildren() do
		if v:IsA("Folder") then
			local name = v.Name
			local isHumanoidRootPart = true
			
			if not var38 then
				var38 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var38[name] == nil then
				isHumanoidRootPart = name == "HumanoidRootPart"
			end
			if isHumanoidRootPart then
				return v
			end
		end
	end
	return nil
end

local function hasFloatCurveKeys(p39) --[[ line: 615 ]]
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

local _ = function(p40) --[[ line: 625 | named "hasPositionKeys" ]]
	-- upvalues: hasFloatCurveKeys (ref)
	return if p40 then if p40:IsA("Vector3Curve") then hasFloatCurveKeys(p40) else false else false
end

local _ = function(p41) --[[ line: 636 | named "hasRotationKeys" ]]
	-- upvalues: hasFloatCurveKeys (ref)
	return if p41 then if p41:IsA("EulerRotationCurve") then hasFloatCurveKeys(p41) else false else false
end

local function calculateAnimFramesAtOriginManual(p42) --[[ line: 648 ]]
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), getBodyPartFolderRoot (ref), var38 (write), assetCalculatorModule (ref), hasFloatCurveKeys (ref), constantsModule (ref), createDefaultCharacter (ref), getFFlagUGCValidateCurveAnimFinalFrameBugModule (ref), var50 (ref)
	local function getCurveTracks() --[[ line: 651 ]]
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), getBodyPartFolderRoot (copy), p42 (ref), var38 (copy), assetCalculatorModule (copy), hasFloatCurveKeys (copy), constantsModule (copy)
		local descendants
		local t = {}
		local _ = nil
		
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			local var117 = getBodyPartFolderRoot(p42)
			assert(var117, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.")
			descendants = var117:GetDescendants()
			table.insert(descendants, var117)
		else
			descendants = p42:GetDescendants()
		end
		for i, v in descendants do
			if v:IsA("Folder") then
				if not var38 then
					var38 = assetCalculatorModule.getBodyPartsToParents()
				end
				if var38[v.Name] then
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
	
	local function calculateCurveAnimLength(p43) --[[ line: 684 ]]
		local var121 = -1
		
		local function getMaxTimeFromFloatCurveChildren(a) --[[ line: 687 ]]
			-- upvalues: var121 (write)
			if not a then return end
			for i, v in a:GetChildren() do
				if v:IsA("FloatCurve") then
					for i_1, v_1 in v:GetKeys() do
						var121 = math.max(var121, v_1.Time)
					end
				end
			end
		end
		
		for i, v in p43 do
			getMaxTimeFromFloatCurveChildren(v.pos)
			getMaxTimeFromFloatCurveChildren(v.rot)
			getMaxTimeFromFloatCurveChildren(v.faceControls)
		end
		return var121
	end
	
	local function calculateTransformsAtTime(p44, p45) --[[ line: 710 ]]
		local t = {}
		
		for i, v in p45 do
			t[i] = (if v.rot then v.rot:GetRotationAtTime(p44) else CFrame.new()) + (if v.pos then Vector3.new(unpack(v.pos:GetValueAtTime(p44))) else Vector3.new(0, 0, 0))
		end
		return t
	end
	
	local function calculatePositionMagnitudeResultsAtTime(p46, p47) --[[ line: 720 ]]
		local t = {}
		
		for i, v in p47 do
			if v.pos then
				t[i] = Vector3.new(unpack(v.pos:GetValueAtTime(p46))).Magnitude
			end
		end
		return t
	end
	
	local var107 = createDefaultCharacter(false)
	local t = {}
	
	for i, v in var107:GetChildren() do
		local name = v.Name
		local isHumanoidRootPart = true
		
		if not var38 then
			var38 = assetCalculatorModule.getBodyPartsToParents()
		end
		if var38[name] == nil then
			isHumanoidRootPart = name == "HumanoidRootPart"
		end
		if isHumanoidRootPart then
			t[v.Name] = v
		end
	end
	local var109 = getCurveTracks()
	local var110 = calculateCurveAnimLength(var109)
	local t_1 = {}
	local t_2 = {}
	
	local function _(p48) --[[ line: 746 | named "addData" ]]
		-- upvalues: calculateTransformsAtTime (ref), var109 (ref), assetCalculatorModule (copy), t (ref), t_1 (ref), t_2 (ref), calculatePositionMagnitudeResultsAtTime (ref)
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(p48, var109)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(p48, var109))
	end
	
	local var113 = 0
	while var113 <= var110 do
		if getFFlagUGCValidateCurveAnimFinalFrameBugModule() then
			local var114 = var113
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var114, var109)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var114, var109))
		else
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var113, var109)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var113, var109))
		end
		var113 += var50
	end
	if getFFlagUGCValidateCurveAnimFinalFrameBugModule() and var110 >= 0 then
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var110, var109)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var110, var109))
	end
	var107:Destroy()
	
	return t_1, var110, t_2, var109
end

function t.validateAnimationLength(p49, p50) --[[ line: 779 ]]
	-- upvalues: getFFlagUGCValidateCurveAnimMinTimeFixModule (ref), getFStringUGCValidateCurveAnimationMinLengthModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (ref), reportFailure (ref), analyticsModule (ref)
	local var125 = if getFFlagUGCValidateCurveAnimMinTimeFixModule() then getFStringUGCValidateCurveAnimationMinLengthModule.asNumber() else 0
	
	return if not (p49 > var125 and getFStringUGCValidationMaxAnimationLengthModule.asNumber() >= p49) then if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then reportFailure(`CurveAnimation must be between {var125} and {getFStringUGCValidationMaxAnimationLengthModule.asString()} seconds long. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableLength, p50) else reportFailure(`CurveAnimation must be between 0 and {getFStringUGCValidationMaxAnimationLengthModule.asString()} seconds long. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableLength, p50) else true
end

function t.validateBounds(p51, p52, p53) --[[ line: 806 ]]
	-- upvalues: getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (ref), getFStringUGCValidateAnimationHeightTolModule (ref), getFStringUGCValidationMaxAnimationBoundsModule (ref), var50 (ref), reportFailure (ref), analyticsModule (ref), failureReasonsAccumulatorModule (ref)
	local var126 = 1e999
	local var127 = 0
	local var128 = nil
	local var129 = nil
	
	if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		var128 = getFStringUGCValidateAnimationHeightTolModule.asNumber()
		var129 = getFStringUGCValidationMaxAnimationBoundsModule.asNumber()
	end
	for i, v in p51 do
		for i_1, v_1 in v do
			if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
				if v_1.Position.Y >= var128 then
					if var129 < v_1.Position.Magnitude then
						return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is %.2f studs from the HumanoidRootPart. Body parts cannot be more than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(p53, (i - 1) * var50), i_1, v_1.Position.Magnitude, getFStringUGCValidationMaxAnimationBoundsModule.asString()), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, p52)
					end
				end
				return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is at height %.2f studs from the HumanoidRootPart. Body parts cannot be lower than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(p53, (i - 1) * var50), i_1, v_1.Position.Y, getFStringUGCValidateAnimationHeightTolModule.asString()), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, p52)
			else
				var127 = math.max(var127, v_1.Position.Magnitude)
				var126 = math.min(var126, v_1.Position.Y)
			end
		end
	end
	if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		return true
	end
	local var130 = failureReasonsAccumulatorModule.new()
	var130:updateReasons(getFStringUGCValidateAnimationHeightTolModule.asNumber() <= var126, {
		`Body parts in a CurveAnimation cannot be lower than {getFStringUGCValidateAnimationHeightTolModule.asString()} studs from the HumanoidRootPart. Please fix the animation.`
	})
	var130:updateReasons(var127 <= getFStringUGCValidationMaxAnimationBoundsModule.asNumber(), {
		`Body parts in a CurveAnimation cannot get more than {getFStringUGCValidationMaxAnimationBoundsModule.asString()} studs from the HumanoidRootPart. Please fix the animation.`
	})
	
	if not var130:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, nil, p52)
	end
	return var130:getFinalResults()
end

function t.validateFrameDeltas(p54, p55) --[[ line: 884 ]]
	-- upvalues: var50 (ref), getFStringUGCValidationMaxAnimationDeltasModule (ref), getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule (ref), reportFailure (ref), analyticsModule (ref)
	local magnitude
	local var131 = var50 / 0.033333333333
	local var132 = getFStringUGCValidationMaxAnimationDeltasModule.asNumber() * var131
	local var133 = if getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then getFStringUGCValidationMaxAnimationDeltasModule.asNumber() * 30 else nil
	local t = {}
	
	for i, v in p54 do
		for i_1, v_1 in v do
			local var135 = t[i_1]
			
			if var135 then
				magnitude = (v_1.Position - var135.Position).Magnitude
				
				if var132 < magnitude then
					return if getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a speed of %.2f studs/second. %.2f is the maximum studs/second speed. Please fix the animation.", (i - 1) * var50, i_1, magnitude / var131 * 30, var133), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, p55) else reportFailure(`Body part {i_1} in CurveAnimation moves more than {getFStringUGCValidationMaxAnimationDeltasModule.asString()} studs between frames. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, p55)
				end
			end
		end
		t = v
	end
	return true
end

function t.validateFrameRotationDeltas(p56, p57) --[[ line: 942 ]]
	-- upvalues: var50 (ref), getFIntUGCValidateMaxAnimationFPSModule (ref), getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule (ref), reportFailure (ref), analyticsModule (ref)
	assert(math.abs(1 / var50 - getFIntUGCValidateMaxAnimationFPSModule()) < 0.00001, "frameDelta should be calculated as 1 / getFIntUGCValidateMaxAnimationFPS()")
	local var136 = getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule()
	local var137 = var136 / getFIntUGCValidateMaxAnimationFPSModule()
	local t = {}
	
	for i, v in p56 do
		for i_1, v_1 in v do
			local var139 = t[i_1]
			
			if var139 then
				local degrees = math.deg(math.abs(v_1:AngleBetween(var139)))
				
				if var137 < degrees then
					return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a rotation speed of %.2f degrees/second. %.2f is the maximum degrees/second speed. Please fix the animation.", (i - 1) * var50, i_1, degrees * getFIntUGCValidateMaxAnimationFPSModule(), var136), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameRotationDelta, p57)
				end
			end
		end
		t = v
	end
	return true
end

function t.validateMinimumTransformations(a, b) --[[ line: 991 ]]
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	for i, v in a do
		if v.pos or v.rot then
			return true
		end
	end
	return reportFailure("CurveAnimation does not contain any joint manipulation.", analyticsModule.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, b)
end

function t.validateContainsJointManipulation(p58, p59) --[[ line: 1008 ]]
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), getBodyPartFolderRoot (ref), var38 (write), assetCalculatorModule (ref), reportFailure (ref), analyticsModule (ref)
	local descendants
	local _ = nil
	
	if getFFlagUGCValidateDuplicatesInAnimationModule() then
		local var141 = getBodyPartFolderRoot(p58)
		assert(var141, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.")
		descendants = var141:GetDescendants()
		table.insert(descendants, var141)
	else
		descendants = p58:GetDescendants()
	end
	for i, v in descendants do
		if v:IsA("Folder") then
			if not var38 then
				var38 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var38[v.Name] then
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

local _ = function(p60) --[[ line: 1045 | named "isTimeStamp" ]]
	return if #p60 > 30 then false else string.match(p60, "^[0-9]+$") ~= nil
end

function t.validateAllowedTags(p61, p62) --[[ line: 1053 ]]
	-- upvalues: validateTagsModule (ref), collectionService (ref), reportFailure (ref), analyticsModule (ref)
	for i, v in p61:GetChildren() do
		local var148, var149 = validateTagsModule(v, p62)
		
		if not var148 then
			return var148, var149
		end
	end
	local var145 = collectionService:GetTags(p61)
	local var145Count = #var145
	
	if var145Count > 0 then
		if var145Count <= 1 then
			local var147 = var145[1]
			
			return if if #var147 > 30 then false else string.match(var147, "^[0-9]+$") ~= nil then true else reportFailure("CurveAnimation can only contain a single timestamp tag. Please remove all other tags.", analyticsModule.ErrorType.validateTags, p62)
		end
	end
end

function t.validateStructure(p63, p64) --[[ line: 1080 ]]
	-- upvalues: validateAnimationHierarchy (ref)
	return validateAnimationHierarchy(p63, p64)
end

local function areNumbersGood(...) --[[ line: 1087 ]]
	local function _(p65) --[[ line: 1088 | named "isNaN" ]]
		return p65 ~= p65
	end
	
	local _ = function(p66) --[[ line: 1092 | named "isInfinite" ]]
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

function t.validateData(p67, p68) --[[ line: 1107 ]]
	-- upvalues: var50 (ref), getFStringUGCValidateFrameDeltaKeyTimeTolModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule (ref), getFIntUGCValidateMaxTotalInternalMarkersModule (ref), reportFailure (ref), analyticsModule (ref), areNumbersGood (ref), getFIntUGCValidateMaxMarkerCurveValueLengthModule (ref), getFIntUGCValidateMaxAnimationFPSModule (ref)
	local markers, minValue
	local var150 = var50 * getFStringUGCValidateFrameDeltaKeyTimeTolModule.asNumber()
	local ceiled = math.ceil(1 / var150 * getFStringUGCValidationMaxAnimationLengthModule.asNumber())
	
	for i, v in p67:GetDescendants() do
		if not v:IsA("MarkerCurve") then
			if v:IsA("FloatCurve") then
				markers = v:GetKeys()
				
				if ceiled >= #markers then
					minValue = nil
					
					for v_1, v_1 in markers do
						if v_1.Time and areNumbersGood(v_1.Time) and (v_1.Value and areNumbersGood(v_1.Value)) then
							if minValue then
								if v_1.Time >= minValue + var150 then
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

function t.validateCalculatedData(p69, p70, p71) --[[ line: 1201 ]]
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

function t.calculateAnimFramesAtOrigin(p72) --[[ line: 1232 ]]
	-- upvalues: calculateAnimFramesAtOriginManual (ref)
	return calculateAnimFramesAtOriginManual(p72)
end

function t.validatePositionMagnitudes(p73, p74) --[[ line: 1238 ]]
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

function t.validateFrames(p75, p76) --[[ line: 1266 ]]
	-- upvalues: t (ref), failureReasonsAccumulatorModule (ref), getFFlagUGCValidateCurveAnimRotationSpeedModule (ref)
	local var155, var156, var157, var158 = t.calculateAnimFramesAtOrigin(p75)
	local var159, var160 = t.validateCalculatedData(var155, var157, p76)
	
	if not var159 then
		return var159, var160
	end
	local var161 = failureReasonsAccumulatorModule.new()
	var161:updateReasons(t.validateMinimumTransformations(var158, p76))
	var161:updateReasons(t.validatePositionMagnitudes(var157, p76))
	var161:updateReasons(t.validateAnimationLength(var156, p76))
	var161:updateReasons(t.validateBounds(var155, p76, var156))
	var161:updateReasons(t.validateFrameDeltas(var155, p76))
	
	if getFFlagUGCValidateCurveAnimRotationSpeedModule() then
		var161:updateReasons(t.validateFrameRotationDeltas(var155, p76))
	end
	return var161:getFinalResults()
end

function t.validate(p77, p78) --[[ line: 1297 ]]
	-- upvalues: t (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), failureReasonsAccumulatorModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidationCombineEntrypointResultsModule (ref), validateAttributesModule (ref)
	local var162, var163 = t.validateStructure(p77, p78)
	
	if not var162 then
		return var162, var163
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var164, var165 = validatePropertiesSensibleModule.validate(p77, p78)
		
		if not var164 then
			return false, var165
		end
	end
	local var166, var167 = t.validateData(p77, p78)
	
	if not var166 then
		return var166, var167
	end
	local var168 = failureReasonsAccumulatorModule.new()
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() or not getFFlagUGCValidationCombineEntrypointResultsModule() then
		var168:updateReasons(validateAttributesModule(p77, p78))
	end
	var168:updateReasons(t.validateAllowedTags(p77, p78))
	var168:updateReasons(t.validateFrames(p77, p78))
	
	return var168:getFinalResults()
end

return t