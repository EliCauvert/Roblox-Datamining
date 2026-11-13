local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceLocalizeCaptureShowMoreModule = require(BuildExperience.Flags.FFlagBuildExperienceLocalizeCaptureShowMore)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization

return function(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), FFlagBuildExperienceLocalizeCaptureShowMoreModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.captureSource.getCaptures)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(p1.captureSource.getIsFinished)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseLocalizationResult = if FFlagBuildExperienceLocalizeCaptureShowMoreModule then UseLocalizationFunction({
		showMore = LocalizationStringsModule.MEDIA_SELECTION_SHOW_MORE
	}) else nil
	
	return {
		captures = UseSignalStateResult,
		selectedCapture = UseStateResult,
		previewContent = ReactModule.useMemo(function()
			-- upvalues: UseStateResult (copy)
			return if UseStateResult == nil or typeof(UseStateResult) ~= "Object" then nil else Content.fromObject(UseStateResult)
		end, { UseStateResult }),
		isFinished = UseSignalStateResult1,
		onCaptureSelected = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p2)
		end, {}),
		onConfirm = ReactModule.useCallback(function()
			-- upvalues: UseStateResult (copy), p1 (copy)
			if UseStateResult ~= nil then
				p1.onCaptureConfirmed(UseStateResult)
			end
		end, { UseStateResult, p1.onCaptureConfirmed }),
		onShowMore = p1.captureSource.fetchMore,
		showMoreText = if FFlagBuildExperienceLocalizeCaptureShowMoreModule then UseLocalizationResult.showMore else nil
	}
end