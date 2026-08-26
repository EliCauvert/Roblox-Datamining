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
	local function findAndRemoveMatching(p3)
		-- upvalues: p2 (ref)
		for i, v in p2 do
			if v.ClassName == p3.ClassName and v.Name == p3.Name then
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

local function calculateAcceptableChildBodyPartFolders(p4)
	-- upvalues: var1 (write), assetCalculatorModule (ref)
	local t = {}
	
	if not var1 then
		var1 = assetCalculatorModule.getBodyPartsToParents()
	end
	for i, v in var1 do
		if v == p4 then
			table.insert(t, { ClassName = "Folder", Name = i })
		end
	end
	return t
end

local function calculateAcceptableBodyPartFolderChildrenArray(p5, p6)
	-- upvalues: calculateAcceptableChildBodyPartFolders (ref)
	local var2 = calculateAcceptableChildBodyPartFolders(p5.Name)
	
	if p5.Name == "HumanoidRootPart" then
		return var2
	end
	table.insert(var2, { ClassName = "Vector3Curve", Name = "Position" })
	table.insert(var2, {
		Name = "Rotation",
		ClassName = if p6 then "EulerRotationCurve" else "RotationCurve"
	})
	
	if p5.Name == "Head" then
		table.insert(var2, { ClassName = "Folder", Name = "FaceControls" })
		
		return var2
	end
	return var2
end

local function calculateAcceptableCurveChildrenArray()
	return {
		{ ClassName = "FloatCurve", Name = "X" },
		{ ClassName = "FloatCurve", Name = "Y" },
		{ ClassName = "FloatCurve", Name = "Z" }
	}
end

local _ = function(p5)
	return if p5 then #p5:GetChildren() < #p5:GetDescendants() else false
end

local function validateBodyPartFolderChildren(p5)
	-- upvalues: calculateAcceptableBodyPartFolderChildrenArray (ref), areChildrenAcceptable (ref), calculateAcceptableCurveChildrenArray (ref), getFFlagUGCValidateRestrictNumFaceControlsModule (ref), getFIntUGCValidateMaxTotalFaceControlsModule (ref)
	if not areChildrenAcceptable(p5, calculateAcceptableBodyPartFolderChildrenArray(p5, true)) then
		return false
	elseif not areChildrenAcceptable(p5:FindFirstChild("Position"), calculateAcceptableCurveChildrenArray()) then
		return false
	elseif not areChildrenAcceptable(p5:FindFirstChild("Rotation"), calculateAcceptableCurveChildrenArray()) then
		return false
	end
	local faceControls = p5:FindFirstChild("FaceControls")
	
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
	local position = p5:FindFirstChild("Position")
	
	if if not position then false else #position:GetChildren() < #position:GetDescendants() then
		return false
	end
	local rotation = p5:FindFirstChild("Rotation")
	
	return if if not rotation then false else #rotation:GetChildren() < #rotation:GetDescendants() then false elseif not faceControls then false else #faceControls:GetChildren() < #faceControls:GetDescendants()
end

local _ = function(p6, p7)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), validateBodyPartFolderChildren (ref), reportFailure (ref), analyticsModule (ref), var1 (write), assetCalculatorModule (ref)
	local function validateBodyPartFolderInternal(p8)
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), p7 (ref), validateBodyPartFolderInternal (ref), var1 (copy), assetCalculatorModule (copy)
		local var2
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			if not validateBodyPartFolderChildren(p8) then
				return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p8.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p7)
			end
			for i, v in p8:GetChildren() do
				if v:IsA("Folder") and v.Name ~= "FaceControls" then
					var2, var65 = validateBodyPartFolderInternal(v)
					
					if not var2 then
						return false, var65
					end
				end
			end
			return true
		else
			for i, v in p8:GetChildren() do
				if v:IsA("Folder") then
					if v.Name ~= "HumanoidRootPart" then
						if not var1 then
							var1 = assetCalculatorModule.getBodyPartsToParents()
						end
						var2 = var1[v.Name]
						
						if var2 then
							return var2 == p8.Name and validateBodyPartFolderInternal(v)
						end
					end
					return false
				end
			end
			return true
		end
	end
	
	local name = p6.Name
	local isHumanoidRootPart = true
	
	if not var1 then
		var1 = assetCalculatorModule.getBodyPartsToParents()
	end
	if var1[name] == nil then
		isHumanoidRootPart = name == "HumanoidRootPart"
	end
	return if isHumanoidRootPart then validateBodyPartFolderInternal(p6) else true
end

local function validateSingleBodyRoot(p9, p10)
	-- upvalues: var1 (write), assetCalculatorModule (ref), reportFailure (ref), analyticsModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref)
	local var3 = 0
	
	for i, v in p9:GetChildren() do
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
				var3 += 1
				
				if var3 > 1 then
					return reportFailure("CurveAnimation contains more than one body part or HumanoidRootPart Folder children. Please ensure there is only one child Folder named after a body part or HumanoidRootPart.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p10)
				end
			end
		end
	end
	return if getFFlagUGCValidateDuplicatesInAnimationModule() and var3 == 0 then reportFailure("CurveAnimation contains zero body part or HumanoidRootPart Folder children. Please ensure there is one (and only one) child Folder named after a body part or HumanoidRootPart.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p10) else true
end

function t.validateMarkerCurves(p11, p12)
	-- upvalues: getFIntUGCValidateMaxTotalMarkerCurvesModule (ref), reportFailure (ref), analyticsModule (ref)
	local var4 = getFIntUGCValidateMaxTotalMarkerCurvesModule()
	local var5 = 0
	
	for i, v in p11:GetDescendants() do
		if v:IsA("MarkerCurve") then
			var5 += 1
			
			if var4 < var5 then
				return reportFailure(`CurveAnimation contains more than {var4} MarkerCurve(s). Please ensure there is no more than {var4} MarkerCurve descendant(s).`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p12)
			end
		end
	end
	return true
end

function t.validateSingleAnimationRigData(p13, p14)
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	local var6 = 0
	
	for i, v in p13:GetChildren() do
		if v:IsA("AnimationRigData") then
			var6 += 1
			
			if var6 > 1 then
				return reportFailure("CurveAnimation contains more than one AnimationRigData children. Please ensure there is only one AnimationRigData child.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p14)
			end
		end
	end
	return if var6 == 0 then reportFailure("CurveAnimation contains zero AnimationRigData children. Please ensure there is one (and only one) AnimationRigData children.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p14) else true
end

function t.validateAnimationRigDataInternals(p15, p16)
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	for i, v in p15:GetChildren() do
		if v:IsA("AnimationRigData") and not v:IsValidR15() then
			return reportFailure("AnimationRigData failed internal validation. Please ensure the AnimationRigData is set up correctly.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectAnimationRigData, p16)
		end
	end
	return true
end

local _ = function(p17, p18)
	-- upvalues: t (ref)
	local var7, var8 = t.validateSingleAnimationRigData(p17, p18)
	
	if not var7 then
		return false, var8
	end
	local var9, var10 = t.validateAnimationRigDataInternals(p17, p18)
	
	if var9 then
		return true
	end
	return false, var10
end

local function validateScripts(p17, p18)
	-- upvalues: reportFailure (ref), analyticsModule (ref)
	for i, v in p17:GetDescendants() do
		if v:IsA("Script") or v:IsA("ModuleScript") then
			return reportFailure("CurveAnimation hierarchy contains Scripts, LocalScripts, or ModuleScripts. Please remove them.", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p18)
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
local function validateExtraInstances(p19, p20)
	-- upvalues: list (ref), reportFailure (ref), analyticsModule (ref)
	local var7
	for i, v in p19:GetDescendants() do
		var7 = false
		
		for i_1, v_1 in list do
			if v:IsA(v_1) then
				var7 = true
				break
			end
		end
		if not var7 then
			return reportFailure(`CurveAnimation hierarchy can only contain {table.concat(list, ", ")}. Please remove any other Instance types.`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p20)
		end
	end
	return true
end

function t.validateExtraInstancesUnitTest(p21, p22)
	-- upvalues: validateExtraInstances (ref)
	return validateExtraInstances(p21, p22)
end

function t.validateScriptsUnitTest(p21, p22)
	-- upvalues: validateScripts (ref)
	return validateScripts(p21, p22)
end

local function validateAnimationHierarchy(p21, p22)
	-- upvalues: analyticsModule (ref), getFFlagUGCValidateMaxTotalInstancesModule (ref), reportFailure (ref), validateSingleBodyRoot (ref), t (ref), getFFlagUGCValidateRestrictNumMarkerCurvesModule (ref), getFFlagUGCValidateDuplicatesInAnimationModule (ref), var1 (write), assetCalculatorModule (ref), validateBodyPartFolderChildren (ref), failureReasonsAccumulatorModule (ref), validateScripts (ref), validateExtraInstances (ref)
	if not p21:IsA("CurveAnimation") then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, nil, p22)
		
		return false, {
			"Referenced Animation is not a CurveAnimation. Please ensure the animation is uploaded correctly."
		}
	end
	local count = #p21:GetDescendants()
	
	if getFFlagUGCValidateMaxTotalInstancesModule() < count then
		return reportFailure(`CurveAnimation has {count} descendants. Maximum allowed is {getFFlagUGCValidateMaxTotalInstancesModule()}. Please reduce the number of descendants.`, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p22)
	end
	local var8, var9 = validateSingleBodyRoot(p21, p22)
	
	if not var8 then
		return false, var9
	end
	local var10, var11
	local var12, var13 = t.validateSingleAnimationRigData(p21, p22)
	
	if var12 then
		local var14, var15 = t.validateAnimationRigDataInternals(p21, p22)
		local var16 = var15
		
		if var14 then
			var10 = true
			var11 = nil
		else
			var10 = false
			var11 = var16
		end
	else
		var10 = false
		var11 = var13
	end
	local var17 = var11
	
	if not var10 then
		return false, var17
	elseif getFFlagUGCValidateRestrictNumMarkerCurvesModule() then
		local var18, var19 = t.validateMarkerCurves(p21, p22)
		local var20 = var19
		
		if not var18 then
			return false, var20
		end
	end
	local var21
	for i, v in p21:GetChildren() do
		if v:IsA("MarkerCurve") or v:IsA("AnimationRigData") then
			if getFFlagUGCValidateDuplicatesInAnimationModule() and #v:GetChildren() > 0 then
				return reportFailure("CurveAnimation child MarkerCurves and AnimationRigData cannot have children", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p22)
			end
		end
		if v:IsA("Folder") then
			if not getFFlagUGCValidateDuplicatesInAnimationModule() then
				local validateBodyPartFolderInternal = nil
				
				local function name(p23)
					-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), validateBodyPartFolderInternal (ref), name (ref), var1 (copy), assetCalculatorModule (copy)
					local var22
					if getFFlagUGCValidateDuplicatesInAnimationModule() then
						if not validateBodyPartFolderChildren(p23) then
							return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p23.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, validateBodyPartFolderInternal)
						end
						for i, v in p23:GetChildren() do
							if v:IsA("Folder") and v.Name ~= "FaceControls" then
								var22, var65 = name(v)
								
								if not var22 then
									return false, var65
								end
							end
						end
						return true
					else
						for i, v in p23:GetChildren() do
							if v:IsA("Folder") then
								if v.Name ~= "HumanoidRootPart" then
									if not var1 then
										var1 = assetCalculatorModule.getBodyPartsToParents()
									end
									var22 = var1[v.Name]
									
									if var22 then
										return var22 == p23.Name and name(v)
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
					return reportFailure("CurveAnimation contains child body part Folder " .. v.Name .. " which has an invalid hierarchy", analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p22)
				end
			end
			local name = v.Name
			local var23 = true
			
			if not var1 then
				var1 = assetCalculatorModule.getBodyPartsToParents()
			end
			if var1[name] == nil then
				var23 = name == "HumanoidRootPart"
			end
			if var23 then
				local function validateBodyPartFolderInternal(p24)
					-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), validateBodyPartFolderChildren (copy), reportFailure (copy), analyticsModule (copy), p22 (ref), validateBodyPartFolderInternal (ref), var1 (copy), assetCalculatorModule (copy)
					local var24
					if getFFlagUGCValidateDuplicatesInAnimationModule() then
						if not validateBodyPartFolderChildren(p24) then
							return reportFailure(string.format("CurveAnimation contains body part Folder %s which has an invalid hierarchy (it has children that are not allowed or set-up incorrectly)", p24.Name), analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p22)
						end
						for i, v in p24:GetChildren() do
							if v:IsA("Folder") and v.Name ~= "FaceControls" then
								var24, var65 = validateBodyPartFolderInternal(v)
								
								if not var24 then
									return false, var65
								end
							end
						end
						return true
					else
						for i, v in p24:GetChildren() do
							if v:IsA("Folder") then
								if v.Name ~= "HumanoidRootPart" then
									if not var1 then
										var1 = assetCalculatorModule.getBodyPartsToParents()
									end
									var24 = var1[v.Name]
									
									if var24 then
										return var24 == p24.Name and validateBodyPartFolderInternal(v)
									end
								end
								return false
							end
						end
						return true
					end
				end
				
				local name_1 = v.Name
				local var25 = true
				
				if not var1 then
					var1 = assetCalculatorModule.getBodyPartsToParents()
				end
				if var1[name_1] == nil then
					var25 = name_1 == "HumanoidRootPart"
				end
				if var25 then
					var25, var94 = validateBodyPartFolderInternal(v)
					var23 = var25
					name = var94
				else
					var23 = true
					name = nil
				end
				var21 = name
				
				if not var23 then
					return false, var21
				end
			end
			return reportFailure("CurveAnimation contains unexpected child: " .. v.Name, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p22)
		end
		return reportFailure("CurveAnimation contains unexpected child: " .. v.Name, analyticsModule.ErrorType.validateCurveAnimation_AnimationHierarchyIsIncorrect, p22)
	end
	local var24 = failureReasonsAccumulatorModule.new()
	var24:updateReasons(validateScripts(p21, p22))
	var24:updateReasons(validateExtraInstances(p21, p22))
	
	return var24:getFinalResults()
end

local function createDefaultCharacter(p23)
	-- upvalues: playersService (ref)
	local var22 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else game.Players:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15)
	
	for i, v in var22:GetDescendants() do
		if v:IsA("Decal") then
			v.Transparency = 1
		elseif v:IsA("MeshPart") then
			v.Transparency = 1
			v.CanCollide = false
		elseif v:IsA("Motor6D") and p23 then
			v:Destroy()
		end
	end
	return var22
end

local var23 = 1 / getFIntUGCValidateMaxAnimationFPSModule()

local function getBodyPartFolderRoot(p24)
	-- upvalues: var1 (write), assetCalculatorModule (ref)
	for i, v in p24:GetChildren() do
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

local function hasFloatCurveKeys(p25)
	local floatCurve
	local x = p25:FindFirstChild("X")
	local y = p25:FindFirstChild("Y")
	local z = p25:FindFirstChild("Z")
	
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

local _ = function(p25)
	-- upvalues: hasFloatCurveKeys (ref)
	return if p25 then if p25:IsA("Vector3Curve") then hasFloatCurveKeys(p25) else false else false
end

local _ = function(p25)
	-- upvalues: hasFloatCurveKeys (ref)
	return if p25 then if p25:IsA("EulerRotationCurve") then hasFloatCurveKeys(p25) else false else false
end

local function calculateAnimFramesAtOriginManual(p25)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), getBodyPartFolderRoot (ref), var1 (write), assetCalculatorModule (ref), hasFloatCurveKeys (ref), constantsModule (ref), createDefaultCharacter (ref), getFFlagUGCValidateCurveAnimFinalFrameBugModule (ref), var23 (ref)
	local function getCurveTracks()
		-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (copy), getBodyPartFolderRoot (copy), p25 (ref), var1 (copy), assetCalculatorModule (copy), hasFloatCurveKeys (copy), constantsModule (copy)
		local descendants
		local t = {}
		local _ = nil
		
		if getFFlagUGCValidateDuplicatesInAnimationModule() then
			local var24 = getBodyPartFolderRoot(p25)
			assert(var24, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.")
			descendants = var24:GetDescendants()
			table.insert(descendants, var24)
		else
			descendants = p25:GetDescendants()
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
	
	local function calculateCurveAnimLength(p26)
		local var25 = -1
		
		local function getMaxTimeFromFloatCurveChildren(a)
			-- upvalues: var25 (write)
			if not a then return end
			for i, v in a:GetChildren() do
				if v:IsA("FloatCurve") then
					for i_1, v_1 in v:GetKeys() do
						var25 = math.max(var25, v_1.Time)
					end
				end
			end
		end
		
		for i, v in p26 do
			getMaxTimeFromFloatCurveChildren(v.pos)
			getMaxTimeFromFloatCurveChildren(v.rot)
			getMaxTimeFromFloatCurveChildren(v.faceControls)
		end
		return var25
	end
	
	local function calculateTransformsAtTime(p27, p28)
		local t = {}
		
		for i, v in p28 do
			t[i] = (if v.rot then v.rot:GetRotationAtTime(p27) else CFrame.new()) + (if v.pos then Vector3.new(unpack(v.pos:GetValueAtTime(p27))) else Vector3.new(0, 0, 0))
		end
		return t
	end
	
	local function calculatePositionMagnitudeResultsAtTime(p29, p30)
		local t = {}
		
		for i, v in p30 do
			if v.pos then
				t[i] = Vector3.new(unpack(v.pos:GetValueAtTime(p29))).Magnitude
			end
		end
		return t
	end
	
	local var26 = createDefaultCharacter(false)
	local t = {}
	
	for i, v in var26:GetChildren() do
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
	local var27 = getCurveTracks()
	local var28 = calculateCurveAnimLength(var27)
	local t_1 = {}
	local t_2 = {}
	
	local function _(p31)
		-- upvalues: calculateTransformsAtTime (ref), var27 (ref), assetCalculatorModule (copy), t (ref), t_1 (ref), t_2 (ref), calculatePositionMagnitudeResultsAtTime (ref)
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(p31, var27)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(p31, var27))
	end
	
	local var29 = 0
	while var29 <= var28 do
		if getFFlagUGCValidateCurveAnimFinalFrameBugModule() then
			local var30 = var29
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var30, var27)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var30, var27))
		else
			table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var29, var27)))
			table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var29, var27))
		end
		var29 += var23
	end
	if getFFlagUGCValidateCurveAnimFinalFrameBugModule() and var28 >= 0 then
		table.insert(t_1, assetCalculatorModule.calculateAllTransformsForFullBody(t, calculateTransformsAtTime(var28, var27)))
		table.insert(t_2, calculatePositionMagnitudeResultsAtTime(var28, var27))
	end
	var26:Destroy()
	
	return t_1, var28, t_2, var27
end

function t.validateAnimationLength(p31, p32)
	-- upvalues: getFFlagUGCValidateCurveAnimMinTimeFixModule (ref), getFStringUGCValidateCurveAnimationMinLengthModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (ref), reportFailure (ref), analyticsModule (ref)
	local var31 = if getFFlagUGCValidateCurveAnimMinTimeFixModule() then getFStringUGCValidateCurveAnimationMinLengthModule.asNumber() else 0
	
	return if not (p31 > var31 and getFStringUGCValidationMaxAnimationLengthModule.asNumber() >= p31) then if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then reportFailure(`CurveAnimation must be between {var31} and {getFStringUGCValidationMaxAnimationLengthModule.asString()} seconds long. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableLength, p32) else reportFailure(`CurveAnimation must be between 0 and {getFStringUGCValidationMaxAnimationLengthModule.asString()} seconds long. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableLength, p32) else true
end

function t.validateBounds(p31, p32, p33)
	-- upvalues: getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule (ref), getFStringUGCValidateAnimationHeightTolModule (ref), getFStringUGCValidationMaxAnimationBoundsModule (ref), var23 (ref), reportFailure (ref), analyticsModule (ref), failureReasonsAccumulatorModule (ref)
	local var31 = 1e999
	local var32 = 0
	local var33 = nil
	local var34 = nil
	
	if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		var33 = getFStringUGCValidateAnimationHeightTolModule.asNumber()
		var34 = getFStringUGCValidationMaxAnimationBoundsModule.asNumber()
	end
	for i, v in p31 do
		for i_1, v_1 in v do
			if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
				if v_1.Position.Y >= var33 then
					if var34 < v_1.Position.Magnitude then
						return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is %.2f studs from the HumanoidRootPart. Body parts cannot be more than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(p33, (i - 1) * var23), i_1, v_1.Position.Magnitude, getFStringUGCValidationMaxAnimationBoundsModule.asString()), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, p32)
					end
				end
				return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is at height %.2f studs from the HumanoidRootPart. Body parts cannot be lower than %s studs from the HumanoidRootPart. Please fix the animation.", math.min(p33, (i - 1) * var23), i_1, v_1.Position.Y, getFStringUGCValidateAnimationHeightTolModule.asString()), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, p32)
			else
				var32 = math.max(var32, v_1.Position.Magnitude)
				var31 = math.min(var31, v_1.Position.Y)
			end
		end
	end
	if getFFlagUGCValidateCurveAnimTimeErrorMessageFixModule() then
		return true
	end
	local var35 = failureReasonsAccumulatorModule.new()
	var35:updateReasons(getFStringUGCValidateAnimationHeightTolModule.asNumber() <= var31, {
		`Body parts in a CurveAnimation cannot be lower than {getFStringUGCValidateAnimationHeightTolModule.asString()} studs from the HumanoidRootPart. Please fix the animation.`
	})
	var35:updateReasons(var32 <= getFStringUGCValidationMaxAnimationBoundsModule.asNumber(), {
		`Body parts in a CurveAnimation cannot get more than {getFStringUGCValidationMaxAnimationBoundsModule.asString()} studs from the HumanoidRootPart. Please fix the animation.`
	})
	
	if not var35:getFinalResults() then
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateCurveAnimation_UnacceptableSizeBounds, nil, p32)
	end
	return var35:getFinalResults()
end

function t.validateFrameDeltas(p34, p35)
	-- upvalues: var23 (ref), getFStringUGCValidationMaxAnimationDeltasModule (ref), getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule (ref), reportFailure (ref), analyticsModule (ref)
	local magnitude
	local var36 = var23 / 0.033333333333
	local var37 = getFStringUGCValidationMaxAnimationDeltasModule.asNumber() * var36
	local var38 = if getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then getFStringUGCValidationMaxAnimationDeltasModule.asNumber() * 30 else nil
	local t = {}
	
	for i, v in p34 do
		for i_1, v_1 in v do
			local var39 = t[i_1]
			
			if var39 then
				magnitude = (v_1.Position - var39.Position).Magnitude
				
				if var37 < magnitude then
					return if getFFlagUGCValidateFixCurveAnimFrameTimeErrorMessageModule() then reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a speed of %.2f studs/second. %.2f is the maximum studs/second speed. Please fix the animation.", (i - 1) * var23, i_1, magnitude / var36 * 30, var38), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, p35) else reportFailure(`Body part {i_1} in CurveAnimation moves more than {getFStringUGCValidationMaxAnimationDeltasModule.asString()} studs between frames. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameDelta, p35)
				end
			end
		end
		t = v
	end
	return true
end

function t.validateFrameRotationDeltas(p36, p37)
	-- upvalues: var23 (ref), getFIntUGCValidateMaxAnimationFPSModule (ref), getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule (ref), reportFailure (ref), analyticsModule (ref)
	assert(math.abs(1 / var23 - getFIntUGCValidateMaxAnimationFPSModule()) < 0.00001, "frameDelta should be calculated as 1 / getFIntUGCValidateMaxAnimationFPS()")
	local var40 = getFIntUGCValidationMaxAnimationRotationSpeedPerSecondModule()
	local var41 = var40 / getFIntUGCValidateMaxAnimationFPSModule()
	local t = {}
	
	for i, v in p36 do
		for i_1, v_1 in v do
			local var42 = t[i_1]
			
			if var42 then
				local degrees = math.deg(math.abs(v_1:AngleBetween(var42)))
				
				if var41 < degrees then
					return reportFailure(string.format("In CurveAnimation at time %.2f seconds, body part %s is moving at a rotation speed of %.2f degrees/second. %.2f is the maximum degrees/second speed. Please fix the animation.", (i - 1) * var23, i_1, degrees * getFIntUGCValidateMaxAnimationFPSModule(), var40), analyticsModule.ErrorType.validateCurveAnimation_UnacceptableFrameRotationDelta, p37)
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

function t.validateContainsJointManipulation(p38, p39)
	-- upvalues: getFFlagUGCValidateDuplicatesInAnimationModule (ref), getBodyPartFolderRoot (ref), var1 (write), assetCalculatorModule (ref), reportFailure (ref), analyticsModule (ref)
	local descendants
	local _ = nil
	
	if getFFlagUGCValidateDuplicatesInAnimationModule() then
		local var43 = getBodyPartFolderRoot(p38)
		assert(var43, "ValidateCurveAnimation.validateStructure() ensures CurveAnimation has one and only one body part Folder child or HumanoidRootPart child.")
		descendants = var43:GetDescendants()
		table.insert(descendants, var43)
	else
		descendants = p38:GetDescendants()
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
	return reportFailure("CurveAnimation does not contain any joint manipulation.", analyticsModule.ErrorType.validateCurveAnimation_AnimationContainsNoJointManipulation, p39)
end

local _ = function(p40)
	return if #p40 > 30 then false else string.match(p40, "^[0-9]+$") ~= nil
end

function t.validateAllowedTags(p40, p41)
	-- upvalues: validateTagsModule (ref), collectionService (ref), reportFailure (ref), analyticsModule (ref)
	for i, v in p40:GetChildren() do
		local var44, var45 = validateTagsModule(v, p41)
		
		if not var44 then
			return var44, var45
		end
	end
	local var46 = collectionService:GetTags(p40)
	local var144Count = #var46
	
	if var144Count > 0 then
		if var144Count <= 1 then
			local var47 = var46[1]
			
			return if if #var47 > 30 then false else string.match(var47, "^[0-9]+$") ~= nil then true else reportFailure("CurveAnimation can only contain a single timestamp tag. Please remove all other tags.", analyticsModule.ErrorType.validateTags, p41)
		end
	end
end

function t.validateStructure(p42, p43)
	-- upvalues: validateAnimationHierarchy (ref)
	return validateAnimationHierarchy(p42, p43)
end

local function areNumbersGood(...)
	local function _(p42)
		return p42 ~= p42
	end
	
	local _ = function(p42)
		return if p42 ~= 1e999 then p42 == -1e999 else true
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

function t.validateData(p42, p43)
	-- upvalues: var23 (ref), getFStringUGCValidateFrameDeltaKeyTimeTolModule (ref), getFStringUGCValidationMaxAnimationLengthModule (ref), getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule (ref), getFIntUGCValidateMaxTotalInternalMarkersModule (ref), reportFailure (ref), analyticsModule (ref), areNumbersGood (ref), getFIntUGCValidateMaxMarkerCurveValueLengthModule (ref), getFIntUGCValidateMaxAnimationFPSModule (ref)
	local markers, minValue
	local var48 = var23 * getFStringUGCValidateFrameDeltaKeyTimeTolModule.asNumber()
	local ceiled = math.ceil(1 / var48 * getFStringUGCValidationMaxAnimationLengthModule.asNumber())
	
	for i, v in p42:GetDescendants() do
		if not v:IsA("MarkerCurve") then
			if v:IsA("FloatCurve") then
				markers = v:GetKeys()
				
				if ceiled >= #markers then
					minValue = nil
					
					for v_1, v_1 in markers do
						if v_1.Time and areNumbersGood(v_1.Time) and (v_1.Value and areNumbersGood(v_1.Value)) then
							if minValue then
								if v_1.Time >= minValue + var48 then
									minValue = v_1.Time
									continue
								end
								return reportFailure(`CurveAnimation contains Curve {if v.Parent.Parent then v.Parent.Parent.Name else "-"}.{v.Parent.Name}.{v.Name} with keys that are too close together in time for a maximum {getFIntUGCValidateMaxAnimationFPSModule()} fps animation. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p43)
							elseif v_1.Time >= 0 then
							end
							return reportFailure(`CurveAnimation contains Curve {if v.Parent.Parent then v.Parent.Parent.Name else "-"}.{v.Parent.Name}.{v.Name} with a key that has a negative time. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p43)
						end
						return reportFailure("CurveAnimation contains Curves with invalid Time or Value. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p43)
					end
				end
				return reportFailure(`CurveAnimation contains Curves with too many keys. {ceiled} is the maximum per Curve. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p43)
			end
		end
		markers = v:GetMarkers()
		
		if getFFlagUGCValidateRestrictNumMarkersInsideMarkerCurvesModule() then
			minValue = math.min(getFIntUGCValidateMaxTotalInternalMarkersModule(), ceiled)
			
			if minValue >= #markers then
				for i_1, v_1 in markers do
					if not v_1.Time or not areNumbersGood(v_1.Time) or (not v_1.Value or getFIntUGCValidateMaxMarkerCurveValueLengthModule() < #v_1.Value) then
						return reportFailure("CurveAnimation contains MarkerCurves with invalid Time or Value, or Value is too long. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p43)
					end
				end
			end
			return reportFailure(`CurveAnimation contains a MarkerCurve with {#markers} Markers. {minValue} is the maximum per MarkerCurve. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p43)
		elseif ceiled >= #markers then
		end
		return reportFailure(`CurveAnimation contains MarkerCurve with too many markers. {ceiled} is the maximum per MarkerCurve. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p43)
	end
	return true
end

function t.validateCalculatedData(p44, p45, p46)
	-- upvalues: areNumbersGood (ref), reportFailure (ref), analyticsModule (ref)
	for i, v in p44 do
		for i_2, v_2 in v do
			if not areNumbersGood(v_2:GetComponents()) then
				return reportFailure("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p46)
			end
		end
	end
	for i, v_1 in p45 do
		for i_2, v_2 in v_1 do
			if not areNumbersGood(v_2) then
				return reportFailure("CurveAnimation contains Curves with invalid numerical data. Please fix the animation.", analyticsModule.ErrorType.validateCurveAnimation_IncorrectNumericalData, p46)
			end
		end
	end
	return true
end

function t.calculateAnimFramesAtOrigin(p47)
	-- upvalues: calculateAnimFramesAtOriginManual (ref)
	return calculateAnimFramesAtOriginManual(p47)
end

function t.validatePositionMagnitudes(p47, p48)
	-- upvalues: constantsModule (ref), getFStringUGCValidateMaxAnimationMovementPerPartModule (ref), reportFailure (ref), analyticsModule (ref)
	local t = {}
	
	for i, v in p47 do
		for i_1, v_1 in v do
			if i_1 ~= constantsModule.NAMED_R15_BODY_PARTS.LowerTorso then
				if not t[i_1] then
					t[i_1] = getFStringUGCValidateMaxAnimationMovementPerPartModule.asNumber(i_1)
				end
				if t[i_1] < v_1 then
					return reportFailure(`CurveAnimation contains positional separation of body parts. Only LowerTorso can change position. All other body parts can only change their orientation. {i_1} moves more than {t[i_1]} studs from its parent. Please fix the animation.`, analyticsModule.ErrorType.validateCurveAnimation_PositionalMovement, p48)
				end
			end
		end
	end
	return true
end

function t.validateFrames(p49, p50)
	-- upvalues: t (ref), failureReasonsAccumulatorModule (ref), getFFlagUGCValidateCurveAnimRotationSpeedModule (ref)
	local var49, var50, var51, var52 = t.calculateAnimFramesAtOrigin(p49)
	local var53, var54 = t.validateCalculatedData(var49, var51, p50)
	
	if not var53 then
		return var53, var54
	end
	local var55 = failureReasonsAccumulatorModule.new()
	var55:updateReasons(t.validateMinimumTransformations(var52, p50))
	var55:updateReasons(t.validatePositionMagnitudes(var51, p50))
	var55:updateReasons(t.validateAnimationLength(var50, p50))
	var55:updateReasons(t.validateBounds(var49, p50, var50))
	var55:updateReasons(t.validateFrameDeltas(var49, p50))
	
	if getFFlagUGCValidateCurveAnimRotationSpeedModule() then
		var55:updateReasons(t.validateFrameRotationDeltas(var49, p50))
	end
	return var55:getFinalResults()
end

function t.validate(p49, p50)
	-- upvalues: t (ref), getEngineFeatureEngineUGCValidatePropertiesSensibleModule (ref), validatePropertiesSensibleModule (ref), failureReasonsAccumulatorModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), validateAttributesModule (ref)
	local var49, var50 = t.validateStructure(p49, p50)
	
	if not var49 then
		return var49, var50
	elseif getEngineFeatureEngineUGCValidatePropertiesSensibleModule() then
		local var51, var52 = validatePropertiesSensibleModule.validate(p49, p50)
		
		if not var51 then
			return false, var52
		end
	end
	local var53, var54 = t.validateData(p49, p50)
	
	if not var53 then
		return var53, var54
	end
	local var55 = failureReasonsAccumulatorModule.new()
	
	if not getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		var55:updateReasons(validateAttributesModule(p49, p50))
	end
	var55:updateReasons(t.validateAllowedTags(p49, p50))
	var55:updateReasons(t.validateFrames(p49, p50))
	
	return var55:getFinalResults()
end

return t