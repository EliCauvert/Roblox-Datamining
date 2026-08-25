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
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFStringUGCValidationAttachmentErrorLinkModule = require(parent.flags.getFStringUGCValidationAttachmentErrorLink)
local getFFlagUGCValidateAttachmentBoundsErrorMessageModule = require(parent.flags.getFFlagUGCValidateAttachmentBoundsErrorMessage)
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
	fflag = getFFlagUGCValidateMigrateSchemaPropertiesModule,
	expectedFailures = {}
}

local function validateInMeshSpace(p0, p1, p2, p3, p4, p5)
	-- upvalues: getAttachmentCFrameInPartSpaceModule (ref), boundsDataUtilsModule (ref), errorSourceStringsModule (ref), meshSpaceUtilsModule (ref), getFFlagUGCValidateAttachmentBoundsErrorMessageModule (ref), prettyPrintVector3Module (ref), getFStringUGCValidationAttachmentErrorLinkModule (ref)
	local var15 = p3.cframe * getAttachmentCFrameInPartSpaceModule(p0)
	local var16 = boundsDataUtilsModule.calculateBoundsCenters(p3.boundsData)
	local var17 = boundsDataUtilsModule.calculateBoundsDimensions(p3.boundsData)
	
	if not var16 or not var17 then
		p4:fail(errorSourceStringsModule.Keys.AttachmentBoundsCalculationFailed, { AttachmentName = p0.Name, PartName = p1.Name })
		
		return
	end
	local var18 = (var15.Position - var16) / (var17 / 2)
	local min = p2.min
	local max = p2.max
	
	for i, v in { "X", "Y", "Z" } do
		if var18[v] < min[v] or max[v] < var18[v] then
			local var19 = meshSpaceUtilsModule.clampAttachmentToBounds(p0, p3, p2, 0.001)
			local var20, var21 = meshSpaceUtilsModule.calculateAcceptableBoundsLocalSpace(p2, p3, var17, var16)
			local position = var20.Position
			local var22, var23, var24 = var20.Rotation:ToOrientation()
			local vector3 = Vector3.new(math.deg(var22), math.deg(var23), math.deg(var24))
			
			if getFFlagUGCValidateAttachmentBoundsErrorMessageModule() then
				p4:fail(if p5 then errorSourceStringsModule.Keys.RigAttachmentOutOfBounds else errorSourceStringsModule.Keys.AccessoryAttachmentOutOfBounds, {
					AttachmentName = p0.Name,
					PartName = p1.Name,
					CurrentPosition = prettyPrintVector3Module(p0.CFrame.Position, 3),
					ClosestValidPosition = prettyPrintVector3Module(var19.Position, 3),
					HelpLink = getFStringUGCValidationAttachmentErrorLinkModule()
				})
				
				return
			end
			p4:fail(errorSourceStringsModule.Keys.AttachmentOutOfBounds, {
				AttachmentName = p0.Name,
				PartName = p1.Name,
				CurrentPosition = prettyPrintVector3Module(p0.CFrame.Position, 3),
				ClosestValidPosition = prettyPrintVector3Module(var19.Position, 3),
				BoundsPosition = prettyPrintVector3Module(position, 3),
				BoundsOrientation = prettyPrintVector3Module(vector3, 3),
				BoundsSize = prettyPrintVector3Module(var21, 3),
				HelpLink = getFStringUGCValidationAttachmentErrorLinkModule()
			})
			
			return
		end
	end
end

local function checkAll(p6, p7, p8, p9)
	-- upvalues: r15plusUtilsModule (ref), validateInMeshSpace (ref)
	local name = p6:FindFirstChild(p7.rigAttachmentToParent.name, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	
	if not name then return end
	validateInMeshSpace(name, p6, p7.rigAttachmentToParent.bounds, p8, p9, true)
	
	for i, v in pairs(p7.otherAttachments) do
		local var27 = p6:FindFirstChild(i, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		
		if var27 then
			validateInMeshSpace(var27, p6, v.bounds, p8, p9, string.find(i, "RigAttachment$") ~= nil)
		end
	end
end

function t.run(p10, p11)
	-- upvalues: constantsModule (ref), validationEnumsModule (ref), boundsCalculatorModule (ref), errorSourceStringsModule (ref), checkAll (ref)
	local rootInstance = p11.rootInstance
	local assetType = p11.uploadEnum.assetType
	local var28 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if not var28 then return end
	local t = {}
	
	if p11.renderMeshesData then
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			local name = p11.renderMeshesData[v.Name]
			
			if name and name.editable then
				t[v] = { MeshId = { created = false, instance = name.editable } }
			end
		end
	end
	local var31, _, var32 = boundsCalculatorModule.calculateIndividualAssetPartsData(rootInstance, {
		assetTypeEnum = assetType,
		isServer = p11.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
		editableMeshes = t
	})
	
	if not var31 then
		p10:fail(errorSourceStringsModule.Keys.AttachmentBoundsAssetCalculationFailed, { InstancePath = rootInstance:GetFullName() })
		
		return
	elseif Enum.AssetType.DynamicHead == assetType then
		local name = var32[rootInstance.Name]
		
		if name then
			checkAll(rootInstance, var28.subParts.Head, name, p10)
			
			return
		end
	else
		for i, v in pairs(var28.subParts) do
			local var33 = rootInstance:FindFirstChild(i)
			
			if var33 then
				local var34 = var32[i]
				
				if var34 then
					checkAll(var33, v, var34, p10)
				end
			end
		end
	end
end

return t