local CollectionService = game:GetService("CollectionService")
local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateMigrateCurveAnimModule = require(Parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local CurveAnimTagsValidModule = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(CurveAnimTagsValidModule.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
CurveAnimTagsValidModule.requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations }
CurveAnimTagsValidModule.fflag = GetFFlagUGCValidateMigrateCurveAnimModule
CurveAnimTagsValidModule.expectedFailures = {}
CurveAnimTagsValidModule.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function _(Text: string): boolean
	return #Text <= 30 and string.match(Text, "^[0-9]+$") ~= nil
end

function CurveAnimTagsValidModule.run(p1, p2)
	-- upvalues: CollectionService (copy), ErrorSourceStringsModule (copy)
	for _, curveAnimation in p2.curveAnimations do
		local List = nil
		for _, child in curveAnimation:GetChildren() do
			local Descendants = child:GetDescendants()
			table.insert(Descendants, child)
			List = {}
			
			for _, descendant in Descendants do
				if #CollectionService:GetTags(descendant) > 0 then
					table.insert(List, descendant:GetFullName())
				end
			end
			if #List > 0 then
				p1:fail(ErrorSourceStringsModule.Keys.InstanceTagsFound, { ProblematicDescendantPaths = table.concat(List, ", ") })
				break
			end
		end
		local Tags = CollectionService:GetTags(curveAnimation)
		local CountTags = #Tags
		
		if CountTags > 0 then
			if CountTags <= 1 then
				local Text: string = Tags[1]
				
				if #Text <= 30 and string.match(Text, "^[0-9]+$") ~= nil then
					continue
				end
			end
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_InvalidTags)
			break
		end
	end
end

return CurveAnimTagsValidModule