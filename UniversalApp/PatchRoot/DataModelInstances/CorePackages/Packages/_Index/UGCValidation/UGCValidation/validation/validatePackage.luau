local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateAssetCreatorModule = require(parent.validation.validateAssetCreator)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local _ = require(parent.util.Types)

return function(p0) --[[ line: 12 | named "validatePackage" ]]
	-- upvalues: validateSingleInstanceModule (ref), parseContentIdsModule (ref), constantsModule (ref), analyticsModule (ref), validateAssetCreatorModule (ref)
	assert(p0.instances ~= nil, "instances required in validationContext for validatePackage")
	local instances = p0.instances
	local restrictedUserIds = p0.restrictedUserIds
	local var5, var6 = validateSingleInstanceModule(instances, p0)
	
	if not var5 then
		return var5, var6
	end
	local var7 = instances[1]
	local t = {}
	local t_1 = {}
	
	if not restrictedUserIds or #restrictedUserIds == 0 then
		return true
	elseif parseContentIdsModule.parseWithErrorCheck(t, t_1, var7, constantsModule.PACKAGE_CONTENT_ID_FIELDS, nil, p0) then
		return validateAssetCreatorModule(t_1, p0)
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validatePackage_FailedToParse, nil, p0)
	
	return false, {
		string.format("Failed to parse package data for model '%s'. Make sure the packageId is valid and try again.", var7:GetFullName())
	}
end