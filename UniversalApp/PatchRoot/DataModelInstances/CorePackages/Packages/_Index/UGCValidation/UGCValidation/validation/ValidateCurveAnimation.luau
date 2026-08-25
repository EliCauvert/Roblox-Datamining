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

local function reportFailure(p1, p2, p3)
	-- upvalues: analyticsModule (ref)
	analyticsModule.reportFailure(p2, nil, p3)
	
	return false, { p1 }
end

local var1 = nil

local function _()
	-- upvalues: var1 (write), assetCalculatorModule (ref)
	if not var1 then
		var1 = assetCalculatorModule.getBodyPartsToParents()
	end
	return var1
end

local _ = function(p1)
	-- upvalues: var1 (write), assetCalculatorModule (ref)
	local isHumanoidRootPart = true
	
	if not var1 then
		var1 = assetCalculatorModule.getBodyPartsToParents()
	end
	if var1[p1] == nil then
		isHumanoidRootPart = p1 == "HumanoidRootPart"
	end
	return isHumanoidRootPart
end

local function areChildrenAcceptable(p1, p2)
	if not p1 then
		return true
	end
	local function findAndRemoveMatching(p1)
		-- upvalues: p2 (ref)
		for i, v in p2 do
			if v.ClassName == p1.ClassName and v.Name == p1.Name then
				table.remove(p2, i)
				
				return true
			end
		end
		return false
	end
	
	for i, v in p1:GetChildren() do
		if not findAndRemoveMatching(v) then
			return false
		end
	end
	return true
end

local function calculateAcceptableChildBodyPartFolders(p1)
	-- upvalues: var1 (write), assetCalculatorModule (ref)
	local t = {}
	
	if not var1 then
		var1 = assetCalculatorModule.getBodyPartsToParents()
	end
	for i, v in var1 do
		if v == p1 then
			table.insert(t, { ClassName = "Folder", Name = i })
		end
	end
	return t
end

local function calculateAcceptableBodyPartFolderChildrenArray(p1, p2)
	-- upvalues: calculateAcceptableChildBodyPartFolders (ref)
	local var1 = calculateAcceptableChildBodyPartFolders(p1.Name)
	
	if p1.Name == "HumanoidRootPart" then
		return var1
	end
	table.insert(var1, { ClassName = "Vector3Curve", Name = "Position" })
	table.insert(var1, {
		Name = "Rotation",
		ClassName = if p2 then "EulerRotationCurve" else "RotationCurve"
	})
	
	if p1.Name == "Head" then
		table.insert(var1, { ClassName = "Folder", Name = "FaceControls" })
		
		return var1
	end
	return var1
end

local function calculateAcceptableCurveChildrenArray()
	return {
		{ ClassName = "FloatCurve", Name = "X" },
		{ ClassName = "FloatCurve", Name = "Y" },
		{ ClassName = "FloatCurve", Name = "Z" }
	}
end

local _ = function(p1)
	return if p1 then #p1:GetChildren() < #p1:GetDescendants() else false
end

local function validateBodyPartFolderChildren(p1)
	-- upvalues: calculateAcceptableBodyPartFolderChildrenArray (ref), areChildrenAcceptable (ref), calculateAcceptableCurveChildrenArray (ref), getFFlagUGCValidateRestrictNumFaceControlsModule (ref), getFIntUGCValidateMaxTotalFaceControlsModule (ref)
	if not areChildrenAcceptable(p1, calculateAcceptableBodyPartFolderChildrenArray(p1, true)) then
		return false
	elseif not areChildrenAcceptable(p1:FindFirstChild("Position"), calculateAcceptableCurveChildrenArray()) then
		return false
	elseif not areChildrenAcceptable(p1:FindFirstChild("Rotation"), calculateAcceptableCurveChildrenArray()) then
		return false
	end
	local faceControls = p1:FindFirstChild("FaceControls")
	
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
	local position = p1:FindFirstChild("Position")
	
	if if not position then false else #position:GetChildren() < #position:GetDescendants() then
		return false
	end
	local rotation = p1:FindFirstChild("Rotation")
	
	return if if not rotation then false else #rotation:GetChildren() < #rotation:GetDescendants() then false elseif not faceControls then false else #faceControls:GetChildren() < #faceControls:GetDescendants()
end

local _ = function(p1, p2)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), validateBodyPartFolderChildren (ref), reportFailure (ref), analyticsModule (ref), var1 (write), assetCalculatorModule (ref)
	local function validateBodyPartFolderInternal(p1)
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), p2 (ref), validateBodyPartFolderInternal (ref), var1 (copy), assetCalculatorModule (copy)
		local var1
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			if not validateBodyPartFolderChildren(p1) then
				return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p1.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
			end
			for i, v in p1:GetChildren() do
				if v:IsA("Folder") and v.Name ~= "FaceControls" then
					var1, var65 = validateBodyPartFolderInternal(v)
					
					if not var1 then
						return false, var65
					end
				end
			end
			return true
		else
			for i, v in p1:GetChildren() do
				if v:IsA("Folder") then
					if v.Name ~= "HumanoidRootPart" then
						if not var1 then
							var1 = assetCalculatorModule.getBodyPartsToParents()
						end
						var1 = var1[v.Name]
						
						if var1 then
							return var1 == p1.Name and validateBodyPartFolderInternal(v)
						end
					end
					return false
				end
			end
			return true
		end
	end
	
	local name = p1.Name
	local isHumanoidRootPart = true
	
	if not var1 then
		var1 = assetCalculatorModule.getBodyPartsToParents()
	end
	if var1[name] == nil then
		isHumanoidRootPart = name == "HumanoidRootPart"
	end
	return if isHumanoidRootPart then validateBodyPartFolderInternal(p1) else true
end

local function validateSingleBodyRoot(p1, p2)
	-- upvalues: var1 (write), assetCalculatorModule (ref), reportFailure (ref), analyticsModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref)
	local var1 = 0
	
	for i, v in p1:GetChildren() do
		if v:IsA("Folder") then
			local name = v.Name
			local isHumanoidRootPart = true
			
			if not var1 then
				var1 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var1[name] == nil then
				isHumanoidRootPart = name == "HumanoidRootPart"
			end
			if isHumanoidRootPart then
				var1 += 1
				
				if var1 > 1 then
					return reportFailure("CurveAnimation contains more than one body part or HumanoidRootPart Folder children. Please ensure there is only one child Folder named after a body part or HumanoidRootPart.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
				end
			end
		end
	end
	return if getFFlagUGCValidateDuplicatesInAnimationModule() and var1 == 0 then reportFailure("CurveAnimation contains zero body part or HumanoidRootPart Folder children. Please ensure there is one (and only one) child Folder named after a body part or HumanoidRootPart.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2) else true
end

function t.validateMarkerCurves(p1, p2)
	-- upvalues: getFIntUGCValidateMaxTotalMarkerCurvesModule (ref), reportFailure (ref), analyticsModule (ref)
	local var1 = getFIntUGCValidateMaxTotalMarkerCurvesModule()
	local var2 = 0
	
	for i, v in p1:GetDescendants() do
		if v:IsA("MarkerCurve") then
			var2 += 1
			
			if var1 < var2 then
				return reportFailure(`CurveAnimation contains more than {var1} MarkerCurve(s). Please ensure there is no more than {var1} MarkerCurve descendant(s).`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
			end
		end
	end
	return true
end

function t.validateSingleAnimationRigData(p1, p2)
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	local var1 = 0
	
	for i, v in p1:GetChildren() do
		if v:IsA("AnimationRigData") then
			var1 += 1
			
			if var1 > 1 then
				return reportFailure("CurveAnimation contains more than one AnimationRigData children. Please ensure there is only one AnimationRigData child.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
			end
		end
	end
	return if var1 == 0 then reportFailure("CurveAnimation contains zero AnimationRigData children. Please ensure there is one (and only one) AnimationRigData children.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2) else true
end

function t.validateAnimationRigDataInternals(p1, p2)
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	for i, v in p1:GetChildren() do
		if v:IsA("AnimationRigData") and not v:IsValidR15() then
			return reportFailure("AnimationRigData failed internal validation. Please ensure the AnimationRigData is set up correctly.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectAnimationRigData, p2)
		end
	end
	return true
end

local _ = function(p1, p2)
	-- upvalues: t (ref)
	local var1, var2 = t.validateSingleAnimationRigData(p1, p2)
	
	if not var1 then
		return false, var2
	end
	local var3, var4 = t.validateAnimationRigDataInternals(p1, p2)
	
	if var3 then
		return true
	end
	return false, var4
end

local function validateScripts(p1, p2)
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	for i, v in p1:GetDescendants() do
		if v:IsA("Script") or v:IsA("ModuleScript") then
			return reportFailure("CurveAnimation hierarchy contains Scripts, LocalScripts, or ModuleScripts. Please remove them.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
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
local function validateExtraInstances(p1, p2)
	-- upvalues: list (ref), reportFailure (ref), analyticsModule (ref)
	local var1
	for i, v in p1:GetDescendants() do
		var1 = false
		
		for i_1, v_1 in list do
			if v:IsA(v_1) then
				var1 = true
				break
			end
		end
		if not var1 then
			return reportFailure(`CurveAnimation hierarchy can only contain {table.concat(list, ", ")}. Please remove any other Instance types.`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
		end
	end
	return true
end

function t.validateExtraInstancesUnitTest(p1, p2)
	-- upvalues: validateExtraInstances (ref)
	return validateExtraInstances(p1, p2)
end

function t.validateScriptsUnitTest(p1, p2)
	-- upvalues: validateScripts (ref)
	return validateScripts(p1, p2)
end

local function validateAnimationHierarchy(p1, p2)
	-- upvalues: analyticsModule (ref), getFFlagUGCValidateMaxTotalInstancesModule (ref), reportFailure (ref), validateSingleBodyRoot (ref), t (ref), getFFlagUGCValidateRestrictNumMarkerCurvesModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref), var1 (write), assetCalculatorModule (ref), validateBodyPartFolderChildren (ref), failureReasonsAccumulatorModule (ref), validateScripts (ref), validateExtraInstances (ref)
	if not p1:IsA("CurveAnimation") then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, p2)
		
		return false, {
			"Referenced Animation is not a CurveAnimation. Please ensure the animation is uploaded correctly."
		}
	end
	local count = #p1:GetDescendants()
	
	if getFFlagUGCValidateMaxTotalInstancesModule() < count then
		return reportFailure(`CurveAnimation has {count} descendants. Maximum allowed is {getFFlagUGCValidateMaxTotalInstancesModule()}. Please reduce the number of descendants.`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
	end
	local var1, var2 = validateSingleBodyRoot(p1, p2)
	
	if not var1 then
		return false, var2
	end
	local var3, var4
	local var5, var6 = t.validateSingleAnimationRigData(p1, p2)
	
	if var5 then
		local var7, var8 = t.validateAnimationRigDataInternals(p1, p2)
		local var9 = var8
		
		if var7 then
			var3 = true
			var4 = nil
		else
			var3 = false
			var4 = var9
		end
	else
		var3 = false
		var4 = var6
	end
	local var10 = var4
	
	if not var3 then
		return false, var10
	elseif getFFlagUGCValidateRestrictNumMarkerCurvesModule() then
		local var11, var12 = t.validateMarkerCurves(p1, p2)
		local var13 = var12
		
		if not var11 then
			return false, var13
		end
	end
	local var14
	for i, v in p1:GetChildren() do
		if v:IsA("MarkerCurve") or v:IsA("AnimationRigData") then
			if getFFlagUGCValidateDuplicatesInAnimationModule() and #v:GetChildren() > 0 then
				return reportFailure("CurveAnimation child MarkerCurves and AnimationRigData cannot have children", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
			end
		end
		if v:IsA("Folder") then
			if not getFFlagUGCValidateDuplicatesInAnimationModule() then
				local validateBodyPartFolderInternal = nil
				
				local function name(p1)
					-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), validateBodyPartFolderInternal (ref), name (ref), var1 (copy), assetCalculatorModule (copy)
					local var1
					if getFFlagUGCValidateDuplicatesInAnimationModule() then
						if not validateBodyPartFolderChildren(p1) then
							return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p1.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, validateBodyPartFolderInternal)
						end
						for i, v in p1:GetChildren() do
							if v:IsA("Folder") and v.Name ~= "FaceControls" then
								var1, var65 = name(v)
								
								if not var1 then
									return false, var65
								end
							end
						end
						return true
					else
						for i, v in p1:GetChildren() do
							if v:IsA("Folder") then
								if v.Name ~= "HumanoidRootPart" then
									if not var1 then
										var1 = assetCalculatorModule.getBodyPartsToParents()
									end
									var1 = var1[v.Name]
									
									if var1 then
										return var1 == p1.Name and name(v)
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
				
				if not var1 then
					var1 = assetCalculatorModule.getBodyPartsToParents()
				end
				if var1[name_1] == nil then
					local validateBodyPartFolderInternal = name_1 == "HumanoidRootPart"
				end
				if not (not validateBodyPartFolderInternal or name(v)) then
					return reportFailure("CurveAnimation contains child body part Folder " .. v.Name .. " which has an invalid hierarchy", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
				end
			end
			local name = v.Name
			local var2 = true
			
			if not var1 then
				var1 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var1[name] == nil then
				var2 = name == "HumanoidRootPart"
			end
			if var2 then
				local function validateBodyPartFolderInternal(p1)
					-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), p2 (ref), validateBodyPartFolderInternal (ref), var1 (copy), assetCalculatorModule (copy)
					local var1
					if getFFlagUGCValidateDuplicatesInAnimationModule() then
						if not validateBodyPartFolderChildren(p1) then
							return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p1.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
						end
						for i, v in p1:GetChildren() do
							if v:IsA("Folder") and v.Name ~= "FaceControls" then
								var1, var65 = validateBodyPartFolderInternal(v)
								
								if not var1 then
									return false, var65
								end
							end
						end
						return true
					else
						for i, v in p1:GetChildren() do
							if v:IsA("Folder") then
								if v.Name ~= "HumanoidRootPart" then
									if not var1 then
										var1 = assetCalculatorModule.getBodyPartsToParents()
									end
									var1 = var1[v.Name]
									
									if var1 then
										return var1 == p1.Name and validateBodyPartFolderInternal(v)
									end
								end
								return false
							end
						end
						return true
					end
				end
				
				local name_1 = v.Name
				local var2 = true
				
				if not var1 then
					var1 = assetCalculatorModule.getBodyPartsToParents()
				end
				if var1[name_1] == nil then
					var2 = name_1 == "HumanoidRootPart"
				end
				if var2 then
					var2, var94 = validateBodyPartFolderInternal(v)
					var2 = var2
					name = var94
				else
					var2 = true
					name = nil
				end
				var14 = name
				
				if not var2 then
					return false, var14
				end
			end
			return reportFailure("CurveAnimation contains unexpected child: " .. v.Name, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
		end
		return reportFailure("CurveAnimation contains unexpected child: " .. v.Name, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p2)
	end
	local var3 = failureReasonsAccumulatorModule.new()
	var3:updateReasons(validateScripts(p1, p2))
	var3:updateReasons(validateExtraInstances(p1, p2))
	
	return var3:getFinalResults()
end

local function createDefaultCharacter(p1)
	-- upvalues: playersService (ref)
	local var1 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	
	for i, v in var1:GetDescendants() do
		if v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("MeshPart") then
			v.Transparency = 1
			v.CanCollide = false
		elseif v:IsA("Motor6D") and p1 then
			v:Destroy()
		end
	end
	return var1
end

local var2 = 1 / getFIntUGCValidateMaxAnimationFPSModule()

local function getBodyPartFolderRoot(p1)
	-- upvalues: var1 (write), assetCalculatorModule (ref)
	for i, v in p1:GetChildren() do
		if v:IsA("Folder") then
			local name = v.Name
			local isHumanoidRootPart = true
			
			if not var1 then
				var1 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var1[name] == nil then
				isHumanoidRootPart = name == "HumanoidRootPart"
			end
			if isHumanoidRootPart then
				return v
			end
		end
	end
	return nil
end

local function hasFloatCurveKeys(p1)
	local floatCurve
	local x = p1:FindFirstChild("X")
	local y = p1:FindFirstChild("Y")
	local z = p1:FindFirstChild("Z")
	
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

local _ = function(p1)
	-- upvalues: hasFloatCurveKeys (ref)
	return if p1 then if p1:IsA("Vector3Curve") then hasFloatCurveKeys(p1) else false else false
end

local _ = function(p1)
	-- upvalues: hasFloatCurveKeys (ref)
	return if p1 then if p1:IsA("EulerRotationCurve") then hasFloatCurveKeys(p1) else false else false
end

local function calculateAnimFramesAtOriginManual(p1)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), getBodyPartFolderRoot (ref), var1 (write), assetCalculatorModule (ref), hasFloatCurveKeys (ref), constantsModule (ref), createDefaultCharacter (ref), getFFlagUGCValidateCurveAnimFinalFrameBugModule (ref), var2 (ref)
	local function getCurveTracks()
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), getBodyPartFolderRoot (copy), p1 (ref), var1 (copy), assetCalculatorModule (copy), hasFloatCurveKeys (copy), constantsModule (copy)
		local descendants
		local t = {}
		local _ = nil
		
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			local var1 = getBodyPartFolderRoot(p1)
			assert(var1, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.")
			descendants = var1:GetDescendants()
			table.insert(descendants, var1)
		else
			descendants = p1:GetDescendants()
		end
		for i, v in descendants do
			if v:IsA("Folder") then
				if not var1 then
					var1 = assetCalculatorModule.getBodyPartsToParents()
				end
				if var1[v.Name] then
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
	
	local function calculateCurveAnimLength(p1)
		local var1 = -1
		
		local function getMaxTimeFromFloatCurveChildren(a)
			-- upvalues: var1 (write)
			if not a then return end
			for i, v in a:GetChildren() do
				if v:IsA("FloatCurve") then
					for i_1, v_1 in v:GetKeys() do
						var1 = math.max(var1, v_1.Time)
					end
				end
			end
		end
		
		for i, v in p1 do
			getMaxTimeFromFloatCurveChildren(v.pos)
			getMaxTimeFromFloatCurveChildren(v.rot)
			getMaxTimeFromFloatCurveChildren(v.faceControls)
		end
		return var1
	end
	
	local function calculateTransformsAtTime(p1, p2)
		local t = {}
		
		for i, v in p2 do
			t[i] = (if v.rot then v.rot:GetRotationAtTime(p1) else CFrame.new()) + (if v.pos then Vector3.new(unpack(v.pos:GetValueAtTime(p1))) else Vector3.new(0, 0, 0))
		end
		return t
	end
	
	local function calculatePositionMagnitudeResultsAtTime(p1, p2)
		local t = {}
		
		for i, v in p2 do
			if v.pos then
				t[i] = Vector3.new(unpack(v.pos:GetValueAtTime(p1))).Magnitude
			end
		end
		return t
	end
	
	local var1 = createDefaultCharacter(false)
	local t = {}
	
	for i, v in var1:GetChildren() do
		local name = v.Name
		local isHumanoidRootPart = true
		
		if not var1 then
			var1 = assetCalculatorModule.getBodyPartsToParents()
		end
		if var1[name] == nil then
			isHumanoidRootPart = name == "HumanoidRootPart"
		end
		if isHumanoidRootPart then
			t[v.Name] = v
		end
	end
	local var2 = getCurveTracks()
	local var3 = calculateCurveAnimLength(var2)
	local t_1 = {}
	local t_2 = {}
	
	local function _(p1)
		-- upvalues: calculateTransformsAtTime (ref), var2 (ref), assetCalculatorModule (copy), t (ref), t_1 (ref), t_2 (ref), calculatePositionMagnitudeResultsAtTime (ref)
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(p1, var2)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(p1, var2))
	end
	
	local var4 = 0
	while var4 <= var3 do
		if getFFlagUGCValidateCurveAnimFinalFrameBugModule() then
			local var5 = var4
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var5, var2)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var5, var2))
		else
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var4, var2)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var4, var2))
		end
		var4 += var2
	end
	if getFFlagUGCValidateCurveAnimFinalFrameBugModule() and var3 >= 0 then
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var3, var2)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var3, var2))
	end
	var1:Destroy()
	
	return t_1, var3, t_2, var2
end

function t.validateAnimationLength(p1, p2)
	-- upvalues: getFFlagUGCValidateCurveAnimMinTimeFixModule (ref), getFStringUGCValidateCurveAnimationMinLengthModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (ref), reportFailure (ref), analyticsModule (ref)
	local var1 = if getFFlagUGCValidateCurveAnimMinTimeFixModule() then getFStringUGCValidateCurveAnimationMinLengthModule.asNumber() else 0
	
	return if not (p1 > var1 and getFStringUGCValidationMaxAnimationLengthModule.asNumber() >= p1) then if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then reportFailure(`CurveAnimation must be between {var1} and {getFStringUGCValidationMaxAnimationLengthModule.asString()} seconds long. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableLength, p2) else reportFailure(`CurveAnimation must be between 0 and {getFStringUGCValidationMaxAnimationLengthModule.asString()} seconds long. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableLength, p2) else true
end

function t.validateBounds(p1, p2, p3)
	-- upvalues: getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (ref), getFStringUGCValidateAnimationHeightTolModule (ref), getFStringUGCValidationMaxAnimationBoundsModule (ref), var2 (ref), reportFailure (ref), analyticsModule (ref), failureReasonsAccumulatorModule (ref)
	local var1 = 1e999
	local var2 = 0
	local var3 = nil
	local var4 = nil
	
	if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		var3 = getFStringUGCValidateAnimationHeightTolModule.asNumber()
		var4 = getFStringUGCValidationMaxAnimationBoundsModule.asNumber()
	end
	for i, v in p1 do
		for i_1, v_1 in v do
			if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
				if v_1.Position.Y >= var3 then
					if var4 < v_1.Position.Magnitude then
						return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is %.2f studs from the HumanoidRootPart. Body parts cannot be more than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(p3, (i - 1) * var2), i_1, v_1.Position.Magnitude, getFStringUGCValidationMaxAnimationBoundsModule.asString()), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, p2)
					end
				end
				return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is at height %.2f studs from the HumanoidRootPart. Body parts cannot be lower than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(p3, (i - 1) * var2), i_1, v_1.Position.Y, getFStringUGCValidateAnimationHeightTolModule.asString()), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, p2)
			else
				var2 = math.max(var2, v_1.Position.Magnitude)
				var1 = math.min(var1, v_1.Position.Y)
			end
		end
	end
	if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		return true
	end
	local var5 = failureReasonsAccumulatorModule.new()
	var5:updateReasons(getFStringUGCValidateAnimationHeightTolModule.asNumber() <= var1, {
		`Body parts in a CurveAnimation cannot be lower than {getFStringUGCValidateAnimationHeightTolModule.asString()} studs from the HumanoidRootPart. Please fix the animation.`
	})
	var5:updateReasons(var2 <= getFStringUGCValidationMaxAnimationBoundsModule.asNumber(), {
		`Body parts in a CurveAnimation cannot get more than {getFStringUGCValidationMaxAnimationBoundsModule.asString()} studs from the HumanoidRootPart. Please fix the animation.`
	})
	
	if not var5:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, nil, p2)
	end
	return var5:getFinalResults()
end

function t.validateFrameDeltas(p1, p2)
	-- upvalues: var2 (ref), getFStringUGCValidationMaxAnimationDeltasModule (ref), getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule (ref), reportFailure (ref), analyticsModule (ref)
	local magnitude
	local var1 = var2 / 0.033333333333
	local var2 = getFStringUGCValidationMaxAnimationDeltasModule.asNumber() * var1
	local var3 = if getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then getFStringUGCValidationMaxAnimationDeltasModule.asNumber() * 30 else nil
	local t = {}
	
	for i, v in p1 do
		for i_1, v_1 in v do
			local var4 = t[i_1]
			
			if var4 then
				magnitude = (v_1.Position - var4.Position).Magnitude
				
				if var2 < magnitude then
					return if getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a speed of %.2f studs/second. %.2f is the maximum studs/second speed. Please fix the animation.", (i - 1) * var2, i_1, magnitude / var1 * 30, var3), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, p2) else reportFailure(`Body part {i_1} in CurveAnimation moves more than {getFStringUGCValidationMaxAnimationDeltasModule.asString()} studs between frames. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, p2)
				end
			end
		end
		t = v
	end
	return true
end

function t.validateFrameRotationDeltas(p1, p2)
	-- upvalues: var2 (ref), getFIntUGCValidateMaxAnimationFPSModule (ref), getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule (ref), reportFailure (ref), analyticsModule (ref)
	assert(math.abs(1 / var2 - getFIntUGCValidateMaxAnimationFPSModule()) < 0.00001, "frameDelta should be calculated as 1 / getFIntUGCValidateMaxAnimationFPS()")
	local var1 = getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule()
	local var2 = var1 / getFIntUGCValidateMaxAnimationFPSModule()
	local t = {}
	
	for i, v in p1 do
		for i_1, v_1 in v do
			local var3 = t[i_1]
			
			if var3 then
				local degrees = math.deg(math.abs(v_1:AngleBetween(var3)))
				
				if var2 < degrees then
					return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a rotation speed of %.2f degrees/second. %.2f is the maximum degrees/second speed. Please fix the animation.", (i - 1) * var2, i_1, degrees * getFIntUGCValidateMaxAnimationFPSModule(), var1), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameRotationDelta, p2)
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

function t.validateContainsJointManipulation(p1, p2)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), getBodyPartFolderRoot (ref), var1 (write), assetCalculatorModule (ref), reportFailure (ref), analyticsModule (ref)
	local descendants
	local _ = nil
	
	if getFFlagUGCValidateDuplicatesInAnimationModule() then
		local var1 = getBodyPartFolderRoot(p1)
		assert(var1, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.")
		descendants = var1:GetDescendants()
		table.insert(descendants, var1)
	else
		descendants = p1:GetDescendants()
	end
	for i, v in descendants do
		if v:IsA("Folder") then
			if not var1 then
				var1 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var1[v.Name] then
				local position = v:FindFirstChild("Position")
				local rotation = v:FindFirstChild("Rotation")
				
				if position and position:IsA("Vector3Curve") and (rotation and rotation:IsA("EulerRotationCurve")) then
					return true
				end
			end
		end
	end
	return reportFailure("CurveAnimation does not contain any joint manipulation.", analyticsModule.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, p2)
end

local _ = function(p1)
	return if #p1 > 30 then false else string.match(p1, "^[0-9]+$") ~= nil
end

function t.validateAllowedTags(p1, p2)
	-- upvalues: validateTagsModule (ref), collectionService (ref), reportFailure (ref), analyticsModule (ref)
	for i, v in p1:GetChildren() do
		local var1, var2 = validateTagsModule(v, p2)
		
		if not var1 then
			return var1, var2
		end
	end
	local var3 = collectionService:GetTags(p1)
	local var144Count = #var3
	
	if var144Count > 0 then
		if var144Count <= 1 then
			local var4 = var3[1]
			
			return if if #var4 > 30 then false else string.match(var4, "^[0-9]+$") ~= nil then true else reportFailure("CurveAnimation can only contain a single timestamp tag. Please remove all other tags.", analyticsModule.ErrorType.validateTags, p2)
		end
	end
end

function t.validateStructure(p1, p2)
	-- upvalues: validateAnimationHierarchy (ref)
	return validateAnimationHierarchy(p1, p2)
end

local function areNumbersGood(...)
	local function _(p1)
		return p1 ~= p1
	end
	
	local _ = function(p1)
		return if p1 ~= 1e999 then p1 == -1e999 else true
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

function t.validateData(p1, p2)
	-- upvalues: var2 (ref), getFStringUGCValidateFrameDeltaKeyTimeTolModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule (ref), getFIntUGCValidateMaxTotalInternalMarkersModule (ref), reportFailure (ref), analyticsModule (ref), areNumbersGood (ref), getFIntUGCValidateMaxMarkerCurveValueLengthModule (ref), getFIntUGCValidateMaxAnimationFPSModule (ref)
	local markers, minValue
	local var1 = var2 * getFStringUGCValidateFrameDeltaKeyTimeTolModule.asNumber()
	local ceiled = math.ceil(1 / var1 * getFStringUGCValidationMaxAnimationLengthModule.asNumber())
	
	for i, v in p1:GetDescendants() do
		if not v:IsA("MarkerCurve") then
			if v:IsA("FloatCurve") then
				markers = v:GetKeys()
				
				if ceiled >= #markers then
					minValue = nil
					
					for v_1, v_1 in markers do
						if v_1.Time and areNumbersGood(v_1.Time) and (v_1.Value and areNumbersGood(v_1.Value)) then
							if minValue then
								if v_1.Time >= minValue + var1 then
									minValue = v_1.Time
									continue
								end
								return reportFailure(`CurveAnimation contains Curve {if v.Parent.Parent then v.Parent.Parent.Name else "-"}.{v.Parent.Name}.{v.Name} with keys that are too close together in time for a maximum {getFIntUGCValidateMaxAnimationFPSModule()} fps animation. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p2)
							elseif v_1.Time >= 0 then
							end
							return reportFailure(`CurveAnimation contains Curve {if v.Parent.Parent then v.Parent.Parent.Name else "-"}.{v.Parent.Name}.{v.Name} with a key that has a negative time. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p2)
						end
						return reportFailure("CurveAnimation contains Curves with invalid Time or Value. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p2)
					end
				end
				return reportFailure(`CurveAnimation contains Curves with too many keys. {ceiled} is the maximum per Curve. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p2)
			end
		end
		markers = v:GetMarkers()
		
		if getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule() then
			minValue = math.min(getFIntUGCValidateMaxTotalInternalMarkersModule(), ceiled)
			
			if minValue >= #markers then
				for i_1, v_1 in markers do
					if not v_1.Time or not areNumbersGood(v_1.Time) or (not v_1.Value or getFIntUGCValidateMaxMarkerCurveValueLengthModule() < #v_1.Value) then
						return reportFailure("CurveAnimation contains MarkerCurves with invalid Time or Value, or Value is too long. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p2)
					end
				end
			end
			return reportFailure(`CurveAnimation contains a MarkerCurve with {#markers} Markers. {minValue} is the maximum per MarkerCurve. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p2)
		elseif ceiled >= #markers then
		end
		return reportFailure(`CurveAnimation contains MarkerCurve with too many markers. {ceiled} is the maximum per MarkerCurve. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p2)
	end
	return true
end

function t.validateCalculatedData(p1, p2, p3)
	-- upvalues: areNumbersGood (ref), reportFailure (ref), analyticsModule (ref)
	for i, v in p1 do
		for i_2, v_2 in v do
			if not areNumbersGood(v_2:GetComponents()) then
				return reportFailure("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p3)
			end
		end
	end
	for i, v_1 in p2 do
		for i_2, v_2 in v_1 do
			if not areNumbersGood(v_2) then
				return reportFailure("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p3)
			end
		end
	end
	return true
end

function t.calculateAnimFramesAtOrigin(p1)
	-- upvalues: calculateAnimFramesAtOriginManual (ref)
	return calculateAnimFramesAtOriginManual(p1)
end

function t.validatePositionMagnitudes(p1, p2)
	-- upvalues: constantsModule (ref), getFStringUGCValidateMaxAnimationMovementPerPartModule (ref), reportFailure (ref), analyticsModule (ref)
	local t = {}
	
	for i, v in p1 do
		for i_1, v_1 in v do
			if i_1 ~= constantsModule.NAMED_R15_BODY_PARTS.LowerTorso then
				if not t[i_1] then
					t[i_1] = getFStringUGCValidateMaxAnimationMovementPerPartModule.asNumber(i_1)
				end
				if t[i_1] < v_1 then
					return reportFailure(`CurveAnimation contains positional separation of body parts. Only LowerTorso can change position. All other body parts can only change their orientation. {i_1} moves more than {t[i_1]} studs from its parent. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_PositionalMovement, p2)
				end
			end
		end
	end
	return true
end

function t.validateFrames(p1, p2)
	-- upvalues: t (ref), failureReasonsAccumulatorModule (ref), getFFlagUGCValidateCurveAnimRotationSpeedModule (ref)
	local var1, var2, var3, var4 = t.calculateAnimFramesAtOrigin(p1)
	local var5, var6 = t.validateCalculatedData(var1, var3, p2)
	
	if not var5 then
		return var5, var6
	end
	local var7 = failureReasonsAccumulatorModule.new()
	var7:updateReasons(t.validateMinimumTransformations(var4, p2))
	var7:updateReasons(t.validatePositionMagnitudes(var3, p2))
	var7:updateReasons(t.validateAnimationLength(var2, p2))
	var7:updateReasons(t.validateBounds(var1, p2, var2))
	var7:updateReasons(t.validateFrameDeltas(var1, p2))
	
	if getFFlagUGCValidateCurveAnimRotationSpeedModule() then
		var7:updateReasons(t.validateFrameRotationDeltas(var1, p2))
	end
	return var7:getFinalResults()
end

function t.validate(p1, p2)
	-- upvalues: t (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), failureReasonsAccumulatorModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateAttributesModule (ref)
	local var1, var2 = t.validateStructure(p1, p2)
	
	if not var1 then
		return var1, var2
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var3, var4 = validatePropertiesSensibleModule.validate(p1, p2)
		
		if not var3 then
			return false, var4
		end
	end
	local var5, var6 = t.validateData(p1, p2)
	
	if not var5 then
		return var5, var6
	end
	local var7 = failureReasonsAccumulatorModule.new()
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var7:updateReasons(validateAttributesModule(p1, p2))
	end
	var7:updateReasons(t.validateAllowedTags(p1, p2))
	var7:updateReasons(t.validateFrames(p1, p2))
	
	return var7:getFinalResults()
end

return t