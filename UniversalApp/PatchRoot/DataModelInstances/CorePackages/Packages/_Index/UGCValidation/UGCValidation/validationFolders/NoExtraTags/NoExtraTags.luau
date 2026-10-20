local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local CollectionService = game:GetService("CollectionService")
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateNoExtraTagsRequireHsrAssetsModule = require(Parent.flags.getFFlagUGCValidateNoExtraTagsRequireHsrAssets)

local function collectTaggedPaths(RootInstance, List)
	-- upvalues: CollectionService (copy)
	local Descendants = RootInstance:GetDescendants()
	table.insert(Descendants, RootInstance)
	
	for _, descendant in Descendants do
		if #CollectionService:GetTags(descendant) > 0 then
			table.insert(List, descendant:GetFullName())
		end
	end
end

return {
	categories = require(Parent.Constants).AllAssetUploadCategories,
	requiredData = if GetFFlagUGCValidateNoExtraTagsRequireHsrAssetsModule() then {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.hsrAssets
	} else { ValidationEnumsModule.SharedDataMember.rootInstance },
	expectedFailures = {
		"Asset_EF_TaggedJacket",
		"Bundle_EF_BodyWithLLLTagged.LeftLeg"
	},
	run = function(p1, p2)
		-- upvalues: collectTaggedPaths (copy), GetFFlagUGCValidateNoExtraTagsRequireHsrAssetsModule (copy), ErrorSourceStringsModule (copy)
		local List = {}
		collectTaggedPaths(p2.rootInstance, List)
		
		if GetFFlagUGCValidateNoExtraTagsRequireHsrAssetsModule() then
			for _, hsrAsset in p2.hsrAssets do
				for _, value in hsrAsset do
					collectTaggedPaths(value, List)
				end
			end
		else
			local HsrAssets = p2.hsrAssets
			
			if type(HsrAssets) == "table" then
				for _, hsrAsset1 in HsrAssets do
					if type(hsrAsset1) == "table" then
						for _, value1 in hsrAsset1 do
							collectTaggedPaths(value1, List)
						end
					end
				end
			end
		end
		if #List > 0 then
			p1:fail(ErrorSourceStringsModule.Keys.InstanceTagsFound, { ProblematicDescendantPaths = table.concat(List, ", ") })
		end
	end
}