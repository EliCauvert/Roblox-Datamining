local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local constantsModule = require(parent.Constants)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local boundsCalculatorModule = require(parent.util.BoundsCalculator)
local boundsDataUtilsModule = require(parent.util.BoundsDataUtils)
local meshSpaceUtilsModule = require(parent.util.MeshSpaceUtils)
local prettyPrintVector3Module = require(parent.util.prettyPrintVector3)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getAttachmentCFrameInPartSpaceModule = require(parent.util.getAttachmentCFrameInPartSpace)
local getFStringUGCValidationAttachmentErrorLinkModule = require(parent.flags.getFStringUGCValidationAttachmentErrorLink)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadEnum,
		validationEnumsModule.SharedDataMember.consumerConfig
	},
	conditionalData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {}
}

local function validateInMeshSpace(p0, p1, p2, p3, p4) --[[ line: 34 ]]
	-- upvalues: getAttachmentCFrameInPartSpaceModule (ref), boundsDataUtilsModule (ref), errorSourceStringsModule (ref), meshSpaceUtilsModule (ref), prettyPrintVector3Module (ref), getFStringUGCValidationAttachmentErrorLinkModule (ref)
	local var13 = p3.cframe * getAttachmentCFrameInPartSpaceModule(p0)
	local var14 = boundsDataUtilsModule.calculateBoundsCenters(p3.boundsData)
	local var15 = boundsDataUtilsModule.calculateBoundsDimensions(p3.boundsData)
	
	if not var14 or not var15 then
		p4:fail(errorSourceStringsModule.Keys.AttachmentBoundsCalculationFailed, { AttachmentName = p0.Name, PartName = p1.Name })
		
		return
	end
	local var16 = (var13.Position - var14) / (var15 / 2)
	local min = p2.min
	local max = p2.max
	
	for i, v in { "X", "Y", "Z" } do
		if var16[v] < min[v] or max[v] < var16[v] then
			local var17 = meshSpaceUtilsModule.clampAttachmentToBounds(p0, p3, p2, 0.001)
			local var18, var19 = meshSpaceUtilsModule.calculateAcceptableBoundsLocalSpace(p2, p3, var15, var14)
			local position = var18.Position
			local var20, var21, var22 = var18.Rotation:ToOrientation()
			p4:fail(errorSourceStringsModule.Keys.AttachmentOutOfBounds, {
				AttachmentName = p0.Name,
				PartName = p1.Name,
				CurrentPosition = prettyPrintVector3Module(p0.CFrame.Position, 3),
				ClosestValidPosition = prettyPrintVector3Module(var17.Position, 3),
				BoundsPosition = prettyPrintVector3Module(position, 3),
				BoundsOrientation = prettyPrintVector3Module(Vector3.new(math.deg(var20), math.deg(var21), math.deg(var22)), 3),
				BoundsSize = prettyPrintVector3Module(var19, 3),
				HelpLink = getFStringUGCValidationAttachmentErrorLinkModule()
			})
			
			return
		end
	end
end

local function checkAll(p5, p6, p7, p8) --[[ line: 91 ]]
	-- upvalues: r15plusUtilsModule (ref), validateInMeshSpace (ref)
	local name = p5:FindFirstChild(p6.rigAttachmentToParent.name, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	
	if not name then return end
	validateInMeshSpace(name, p5, p6.rigAttachmentToParent.bounds, p7, p8)
	
	for i, v in pairs(p6.otherAttachments) do
		local var24 = p5:FindFirstChild(i, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		
		if var24 then
			validateInMeshSpace(var24, p5, v.bounds, p7, p8)
		end
	end
end

function t.run(p9, p10) --[[ line: 125 ]]
	-- upvalues: constantsModule (ref), validationEnumsModule (ref), boundsCalculatorModule (ref), errorSourceStringsModule (ref), checkAll (ref)
	local rootInstance = p10.rootInstance
	local assetType = p10.uploadEnum.assetType
	local var25 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if not var25 then return end
	local t = {}
	
	if p10.renderMeshesData then
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			local name = p10.renderMeshesData[v.Name]
			
			if name and name.editable then
				t[v] = { MeshId = { created = false, instance = name.editable } }
			end
		end
	end
	local var28, _, var29 = boundsCalculatorModule.calculateIndividualAssetPartsData(rootInstance, {
		assetTypeEnum = assetType,
		isServer = p10.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
		editableMeshes = t
	})
	
	if not var28 then
		p9:fail(errorSourceStringsModule.Keys.AttachmentBoundsAssetCalculationFailed, { InstancePath = rootInstance:GetFullName() })
		
		return
	elseif Enum.AssetType.DynamicHead == assetType then
		local name = var29[rootInstance.Name]
		
		if name then
			checkAll(rootInstance, var25.subParts.Head, name, p9)
			
			return
		end
	else
		for i, v in pairs(var25.subParts) do
			local var30 = rootInstance:FindFirstChild(i)
			
			if var30 then
				local var31 = var29[i]
				
				if var31 then
					checkAll(var30, v, var31, p9)
				end
			end
		end
	end
end

return t