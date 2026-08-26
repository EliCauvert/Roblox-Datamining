local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local fetchAllDesiredDataModule = require(parent.validationSystem.dataFetchModules.FetchAllDesiredData)
local getFFlagUGCValidateMigrateCurveAnimModule = require(parent.flags.getFFlagUGCValidateMigrateCurveAnim)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = {}
t.fflag = getFFlagUGCValidateMigrateCurveAnimModule
t.expectedFailures = {}

function t.run(p1, p2)
	-- upvalues: fetchAllDesiredDataModule (ref), errorSourceStringsModule (ref)
	local curveAnimations = p2.curveAnimations
	
	if not curveAnimations or curveAnimations == fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
		p1:fail(errorSourceStringsModule.Keys.CurveAnim_FetchFailed)
		
		return
	elseif #curveAnimations == 0 then
		p1:fail(errorSourceStringsModule.Keys.CurveAnim_NotCurveAnimation)
		
		return
	end
	local curveAnimComputedFrames = p2.curveAnimComputedFrames
	
	if curveAnimComputedFrames and curveAnimComputedFrames ~= fetchAllDesiredDataModule.DATA_FETCH_FAILURE then
		return
	end
	p1:fail(errorSourceStringsModule.Keys.CurveAnim_FetchFailed)
end

return t