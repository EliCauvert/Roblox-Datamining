local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local AssetCalculatorModule = require(Parent.util.AssetCalculator)
local GetFStringUGCValidationMaxCageDistanceModule = require(Parent.flags.GetFStringUGCValidationMaxCageDistance)

return {
	categories = { ValidationEnumsModule.UploadCategory.FULL_BODY },
	requiredData = {
		ValidationEnumsModule.SharedDataMember.renderMeshesData,
		ValidationEnumsModule.SharedDataMember.outerCagesData
	},
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: AssetCalculatorModule (copy), UGCValidationService (copy), GetFStringUGCValidationMaxCageDistanceModule (copy), ErrorSourceStringsModule (copy)
		local t = {}
		
		for _, child in p2.rootInstance:GetChildren() do
			t[child.Name] = child
		end
		if next(t) == nil then return end
		local AllTransformsForFullBody = AssetCalculatorModule.calculateAllTransformsForFullBody(t)
		local List = {}
		
		for Name, value in t do
			local RenderMeshes = p2.renderMeshesData[Name]
			local OuterCages = p2.outerCagesData[Name]
			
			if RenderMeshes ~= nil and OuterCages ~= nil then
				table.insert(List, {
					renderMesh = RenderMeshes.editable,
					outerCage = OuterCages.editable,
					renderMeshTransform = AllTransformsForFullBody[Name],
					outerCageLocalTransform = OuterCages.origin,
					scale = value.Size / RenderMeshes.originalSize,
					name = Name
				})
			end
		end
		if #List == 0 then return end
		local BodyMaxCageDistance, BodyMaxCageDistance2 = UGCValidationService:CalculateBodyMaxCageDistance(List)
		
		if GetFStringUGCValidationMaxCageDistanceModule.asNumber() < BodyMaxCageDistance then
			p1:fail(ErrorSourceStringsModule.Keys.BodyPartCageDistanceValid_TooFar, {
				partName = BodyMaxCageDistance2,
				distance = string.format("%.2f", BodyMaxCageDistance),
				maxDistance = GetFStringUGCValidationMaxCageDistanceModule.asString()
			})
		end
	end
}