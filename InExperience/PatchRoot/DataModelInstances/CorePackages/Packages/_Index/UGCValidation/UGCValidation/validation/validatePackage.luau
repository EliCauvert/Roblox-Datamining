local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local ValidateAssetCreatorModule = require(Parent.validation.validateAssetCreator)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local _ = require(Parent.util.Types)

return function(p1)
	-- upvalues: ValidateSingleInstanceModule (copy), ParseContentIdsModule (copy), ConstantsModule (copy), AnalyticsModule (copy), ValidateAssetCreatorModule (copy)
	assert(p1.instances ~= nil, "instances required in validationContext for validatePackage")
	local Instances = p1.instances
	local RestrictedUserIds = p1.restrictedUserIds
	local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(Instances, p1)
	
	if not ValidateSingleInstanceModuleResult then
		return ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2
	end
	local InstancesEntry = Instances[1]
	local t = {}
	local t1 = {}
	
	if not RestrictedUserIds or #RestrictedUserIds == 0 then
		return true
	elseif ParseContentIdsModule.parseWithErrorCheck(t, t1, InstancesEntry, ConstantsModule.PACKAGE_CONTENT_ID_FIELDS, nil, p1) then
		return ValidateAssetCreatorModule(t1, p1)
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validatePackage_FailedToParse, nil, p1)
		
		return false, {
			string.format("Failed to parse package data for model '%s'. Make sure the packageId is valid and try again.", InstancesEntry:GetFullName())
		}
	end
end