local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateAssetCreatorModule = require(parent.validation.validateAssetCreator)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local _ = require(parent.util.Types)

return function(p1)
	-- upvalues: validateSingleInstanceModule (ref), parseContentIdsModule (ref), constantsModule (ref), analyticsModule (ref), validateAssetCreatorModule (ref)
	assert(p1.instances ~= nil, "instances required in validationContext for validatePackage")
	local instances = p1.instances
	local restrictedUserIds = p1.restrictedUserIds
	local var1, var2 = validateSingleInstanceModule(instances, p1)
	
	if not var1 then
		return var1, var2
	end
	local var3 = instances[1]
	local t = {}
	local t_1 = {}
	
	if not restrictedUserIds or #restrictedUserIds == 0 then
		return true
	elseif parseContentIdsModule.parseWithErrorCheck(t, t_1, var3, constantsModule.PACKAGE_CONTENT_ID_FIELDS, nil, p1) then
		return validateAssetCreatorModule(t_1, p1)
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validatePackage_FailedToParse, nil, p1)
	
	return false, {
		string.format("Failed to parse package data for model '%s'. Make sure the packageId is valid and try again.", var3:GetFullName())
	}
end