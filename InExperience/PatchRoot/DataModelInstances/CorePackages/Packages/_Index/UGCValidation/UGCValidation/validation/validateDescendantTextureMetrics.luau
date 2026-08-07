local parent = script.Parent.Parent
local _ = require(parent.util.Types)
local constantsModule = require(parent.Constants)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local validateTextureSizeModule = require(parent.validation.validateTextureSize)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local getEditableImageFromContextModule = require(parent.util.getEditableImageFromContext)
local getFFlagUGCValidateBodyAssetTextureLimitsModule = require(parent.flags.getFFlagUGCValidateBodyAssetTextureLimits)

return function(p0, p1) --[[ line: 20 | named "validateDescendantTextureMetrics" ]]
	-- upvalues: failureReasonsAccumulatorModule (ref), parseContentIdsModule (ref), constantsModule (ref), getEditableImageFromContextModule (ref), getFFlagUGCValidateBodyAssetTextureLimitsModule (ref), constantsInterfaceModule (ref), validateTextureSizeModule (ref)
	local var7 = failureReasonsAccumulatorModule.new()
	local t = {}
	
	for i, v in parseContentIdsModule.parse(p0, constantsModule.TEXTURE_CONTENT_ID_FIELDS, p1) do
		local t_1 = {
			fullName = v.instance:GetFullName(),
			fieldName = v.fieldName,
			contentId = v.instance[v.fieldName]
		}
		local var10, var11 = getEditableImageFromContextModule(v.instance, v.fieldName, p1)
		
		if var10 then
			t_1.editableImage = var11
			
			if not t[v.id] then
				var7:updateReasons(validateTextureSizeModule(t_1, nil, p1, if getFFlagUGCValidateBodyAssetTextureLimitsModule() then constantsInterfaceModule.getTextureLimit(p1.assetTypeEnum, v.instance, v.fieldName) else nil))
				
				if v.id then
					t[v.id] = true
				end
			end
		end
		return false, { "Failed to load texture data" }
	end
	return var7:getFinalResults()
end