local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local FetchAllDesiredDataModule = require(Parent.validationSystem.dataFetchModules.FetchAllDesiredData)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = {},
	expectedFailures = {},
	run = function(p1, p2) --[[ Line: 15 ]]
		-- upvalues: FetchAllDesiredDataModule (copy), ErrorSourceStringsModule (copy)
		local CurveAnimations = p2.curveAnimations
		
		if not CurveAnimations or CurveAnimations == FetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_FetchFailed)
			
			return
		end
		if #CurveAnimations == 0 then
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_NotCurveAnimation)
			
			return
		end
		local CurveAnimComputedFrames = p2.curveAnimComputedFrames
		
		if not CurveAnimComputedFrames or CurveAnimComputedFrames == FetchAllDesiredDataModule.DATA_FETCH_FAILURE then
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_FetchFailed)
			
			return
		end
	end
}