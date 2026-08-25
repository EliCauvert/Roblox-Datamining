local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Constants)
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local collectionService = game:GetService("CollectionService")
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)
local getFFlagUGCValidateNoExtraTagsRequireHsrAssetsModule = require(parent.flags.getFFlagUGCValidateNoExtraTagsRequireHsrAssets)
local t = {
	categories = constantsModule.AllAssetUploadCategories,
	requiredData = if getFFlagUGCValidateMigrateSchemaPropertiesModule() and getFFlagUGCValidateNoExtraTagsRequireHsrAssetsModule() then {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.hsrAssets
	} else { validationEnumsModule.SharedDataMember.rootInstance },
	expectedFailures = {
		"Asset_EF_TaggedJacket",
		"Bundle_EF_BodyWithLLLTagged.LeftLeg"
	}
}

local function collectTaggedPaths(p0, p1)
	-- upvalues: collectionService (ref)
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	
	for i, v in descendants do
		if #collectionService:GetTags(v) > 0 then
			table.insert(p1, v:GetFullName())
		end
	end
end

function t.run(p2, p3)
	-- upvalues: collectTaggedPaths (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref), getFFlagUGCValidateNoExtraTagsRequireHsrAssetsModule (ref), errorSourceStringsModule (ref)
	local t = {}
	collectTaggedPaths(p3.rootInstance, t)
	
	if getFFlagUGCValidateMigrateSchemaPropertiesModule() then
		if getFFlagUGCValidateNoExtraTagsRequireHsrAssetsModule() then
			for i, v in p3.hsrAssets do
				for i_1, v_1 in v do
					collectTaggedPaths(v_1, t)
				end
			end
		else
			local hsrAssets = p3.hsrAssets
			
			if type(hsrAssets) == "table" then
				for i, v in hsrAssets do
					if type(v) == "table" then
						for i_1, v_1 in v do
							collectTaggedPaths(v_1, t)
						end
					end
				end
			end
		end
	end
	if #t > 0 then
		p2:fail(errorSourceStringsModule.Keys.InstanceTagsFound, { ProblematicDescendantPaths = table.concat(t, ", ") })
	end
end

return t