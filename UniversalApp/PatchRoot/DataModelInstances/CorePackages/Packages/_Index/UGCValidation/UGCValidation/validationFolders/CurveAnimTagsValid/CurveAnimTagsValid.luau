local collectionService = game:GetService("CollectionService")
local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function _(p0)
	return if #p0 > 30 then false else string.match(p0, "^[0-9]+$") ~= nil
end

function t.run(p1, p2)
	-- upvalues: collectionService (ref), errorSourceStringsModule (ref)
	for i, v in p2.curveAnimations do
		for i_1, v_1 in v:GetChildren() do
			local descendants = v_1:GetDescendants()
			table.insert(descendants, v_1)
			local t = {}
			
			for i_2, v_2 in descendants do
				if #collectionService:GetTags(v_2) > 0 then
					table.insert(t, v_2:GetFullName())
				end
			end
			if #t > 0 then
				p1:fail(errorSourceStringsModule.Keys.InstanceTagsFound, { ProblematicDescendantPaths = table.concat(t, ", ") })
				
				return
			end
		end
		local var5 = collectionService:GetTags(v)
		local var5Count = #var5
		
		if var5Count > 0 then
			if var5Count <= 1 then
				i_1 = var5[1]
				
				if not (if #i_1 > 30 then false else string.match(i_1, "^[0-9]+$") ~= nil) then
					p1:fail(errorSourceStringsModule.Keys.CurveAnim_InvalidTags)
					
					return
				end
			end
		end
	end
end

return t