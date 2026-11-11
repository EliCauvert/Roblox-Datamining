local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local Util = Parent.util
local _ = require(Util.Types)
local FloatEqualsModule = require(Util.floatEquals)
local GetExpectedPartSizeModule = require(Util.getExpectedPartSize)
local FailureReasonsAccumulatorModule = require(Util.FailureReasonsAccumulator)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local ValidateBodyBlockingTestsModule = {
	validateMeshMin = function(p1, Name)
		-- upvalues: FloatEqualsModule (copy)
		local Flag = true
		local v1 = ""
		
		for _, value in { "X", "Y", "Z" } do
			if FloatEqualsModule(p1[value], 0, 0.0001) then
				v1 = (if #v1 > 0 then v1 .. ". " else "") .. "Size on " .. value .. " axis is zero"
				Flag = false
			end
		end
		if Flag then
			return true
		else
			return false, {
				"Render mesh for " .. Name .. ": " .. v1 .. ". Increase the size of the mesh"
			}
		end
	end
}

function ValidateBodyBlockingTestsModule.validateInternal(Part, p2, p3)
	-- upvalues: FailureReasonsAccumulatorModule (copy), GetExpectedPartSizeModule (copy), ValidateBodyBlockingTestsModule (copy), AnalyticsModule (copy), R15plusUtilsModule (copy)
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local ValidateMeshMinResult, ValidateMeshMinResult2 = ValidateBodyBlockingTestsModule.validateMeshMin(GetExpectedPartSizeModule(Part, p2, true), Part.Name)
	NewFailureReasonsAccumulator:updateReasons(ValidateMeshMinResult, ValidateMeshMinResult2)
	
	if not ValidateMeshMinResult and p3 then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyBlockingTests_ZeroMeshSize, nil, p2)
	end
	if R15plusUtilsModule.checkFlagEnabledForAllowHrd() then
		for ChildName, value in R15plusUtilsModule.getNameWhitelistOfClassInSchema(R15plusUtilsModule.getAvatarBoneSchema(Part.Name), "Attachment") do
			if value and not Part:FindFirstChild(ChildName, true) then
				NewFailureReasonsAccumulator:updateReasons(false, { `Missing Required attachment {ChildName}` })
			end
		end
	end
	return NewFailureReasonsAccumulator:getFinalResults()
end

function ValidateBodyBlockingTestsModule.validateAll(List, p4): boolean
	-- upvalues: ValidateBodyBlockingTestsModule (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local Flag = true
	
	for _, Part in List do
		assert(Part:IsA("MeshPart"))
		
		if not ValidateBodyBlockingTestsModule.validateInternal(Part, p4, false) then
			Flag = false
			break
		end
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p4)
	
	return Flag
end

function ValidateBodyBlockingTestsModule.validate(Object, p5)
	-- upvalues: FailureReasonsAccumulatorModule (copy), ConstantsModule (copy), ValidateBodyBlockingTestsModule (copy), AnalyticsModule (copy)
	local CurrentTime = tick()
	local AssetTypeEnum = p5.assetTypeEnum
	local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
	local ASSETTYPE = ConstantsModule.ASSET_TYPE_INFO[AssetTypeEnum]
	
	if Enum.AssetType.DynamicHead == AssetTypeEnum then
		NewFailureReasonsAccumulator:updateReasons(ValidateBodyBlockingTestsModule.validateInternal(Object, p5, true))
	else
		for subPart in pairs(ASSETTYPE.subParts) do
			local Child = Object:FindFirstChild(subPart)
			assert(Child)
			NewFailureReasonsAccumulator:updateReasons(ValidateBodyBlockingTestsModule.validateInternal(Child, p5, true))
		end
	end
	AnalyticsModule.recordScriptTime(script.Name, CurrentTime, p5)
	
	return NewFailureReasonsAccumulator:getFinalResults()
end

return ValidateBodyBlockingTestsModule