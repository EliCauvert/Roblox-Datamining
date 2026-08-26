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

local function validateInMeshSpace(p1, p2, p3, p4, p5, p6)
	-- upvalues: getAttachmentCFrameInPartSpaceModule (ref), boundsDataUtilsModule (ref), errorSourceStringsModule (ref), meshSpaceUtilsModule (ref), getFFlagUGCValidateAttachmentBoundsErrorMessageModule (ref), prettyPrintVector3Module (ref), getFStringUGCValidationAttachmentErrorLinkModule (ref)
	local var1 = p4.cframe * getAttachmentCFrameInPartSpaceModule(p1)
	local var2 = boundsDataUtilsModule.calculateBoundsCenters(p4.boundsData)
	local var3 = boundsDataUtilsModule.calculateBoundsDimensions(p4.boundsData)
	
	if not var2 or not var3 then
		p5:fail(errorSourceStringsModule.Keys.AttachmentBoundsCalculationFailed, { AttachmentName = p1.Name, PartName = p2.Name })
		
		return
	end
	local var4 = (var1.Position - var2) / (var3 / 2)
	local min = p3.min
	local max = p3.max
	
	for i, v in { "X", "Y", "Z" } do
		if var4[v] < min[v] or max[v] < var4[v] then
			local var5 = meshSpaceUtilsModule.clampAttachmentToBounds(p1, p4, p3, 0.001)
			local var6, var7 = meshSpaceUtilsModule.calculateAcceptableBoundsLocalSpace(p3, p4, var3, var2)
			local position = var6.Position
			local var8, var9, var10 = var6.Rotation:ToOrientation()
			local vector3 = Vector3.new(math.deg(var8), math.deg(var9), math.deg(var10))
			
			if getFFlagUGCValidateAttachmentBoundsErrorMessageModule() then
				p5:fail(if p6 then errorSourceStringsModule.Keys.RigAttachmentOutOfBounds else errorSourceStringsModule.Keys.AccessoryAttachmentOutOfBounds, {
					AttachmentName = p1.Name,
					PartName = p2.Name,
					CurrentPosition = prettyPrintVector3Module(p1.CFrame.Position, 3),
					ClosestValidPosition = prettyPrintVector3Module(var5.Position, 3),
					HelpLink = getFStringUGCValidationAttachmentErrorLinkModule()
				})
				
				return
			end
			p5:fail(errorSourceStringsModule.Keys.AttachmentOutOfBounds, {
				AttachmentName = p1.Name,
				PartName = p2.Name,
				CurrentPosition = prettyPrintVector3Module(p1.CFrame.Position, 3),
				ClosestValidPosition = prettyPrintVector3Module(var5.Position, 3),
				BoundsPosition = prettyPrintVector3Module(position, 3),
				BoundsOrientation = prettyPrintVector3Module(vector3, 3),
				BoundsSize = prettyPrintVector3Module(var7, 3),
				HelpLink = getFStringUGCValidationAttachmentErrorLinkModule()
			})
			
			return
		end
	end
end

local function checkAll(p7, p8, p9, p10)
	-- upvalues: r15plusUtilsModule (ref), validateInMeshSpace (ref)
	local name = p7:FindFirstChild(p8.rigAttachmentToParent.name, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
	
	if not name then return end
	validateInMeshSpace(name, p7, p8.rigAttachmentToParent.bounds, p9, p10, true)
	
	for i, v in pairs(p8.otherAttachments) do
		local var11 = p7:FindFirstChild(i, r15plusUtilsModule.checkFlagEnabledForAllowHrd())
		
		if var11 then
			validateInMeshSpace(var11, p7, v.bounds, p9, p10, string.find(i, "RigAttachment$") ~= nil)
		end
	end
end

function t.run(p11, p12)
	-- upvalues: constantsModule (ref), validationEnumsModule (ref), boundsCalculatorModule (ref), errorSourceStringsModule (ref), checkAll (ref)
	local rootInstance = p12.rootInstance
	local assetType = p12.uploadEnum.assetType
	local var12 = constantsModule.ASSET_TYPE_INFO[assetType]
	
	if not var12 then return end
	local t = {}
	
	if p12.renderMeshesData then
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, rootInstance)
		
		for i, v in descendants do
			local name = p12.renderMeshesData[v.Name]
			
			if name and name.editable then
				t[v] = { MeshId = { created = false, instance = name.editable } }
			end
		end
	end
	local var13, _, var14 = boundsCalculatorModule.calculateIndividualAssetPartsData(rootInstance, {
		assetTypeEnum = assetType,
		isServer = p12.consumerConfig.consumerEnv == validationEnumsModule.ConsumerEnv.Backend,
		editableMeshes = t
	})
	
	if not var13 then
		p11:fail(errorSourceStringsModule.Keys.AttachmentBoundsAssetCalculationFailed, { InstancePath = rootInstance:GetFullName() })
		
		return
	elseif Enum.AssetType.DynamicHead == assetType then
		local name = var14[rootInstance.Name]
		
		if name then
			checkAll(rootInstance, var12.subParts.Head, name, p11)
			
			return
		end
	else
		for i, v in pairs(var12.subParts) do
			local var15 = rootInstance:FindFirstChild(i)
			
			if var15 then
				local var16 = var14[i]
				
				if var16 then
					checkAll(var15, v, var16, p11)
				end
			end
		end
	end
end

return t