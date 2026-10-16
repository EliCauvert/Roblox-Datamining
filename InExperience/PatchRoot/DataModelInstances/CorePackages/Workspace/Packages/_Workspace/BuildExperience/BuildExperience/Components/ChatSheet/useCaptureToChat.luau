local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(Callback1, Callback) --[[ Line: 24 | Named "useCaptureToChat" ]]
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		addImages = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_TITLE
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 30 ]]
		-- upvalues: Callback (copy), UseLocalizationResult (copy), UseStateResult2 (copy), Callback1 (copy)
		Callback({
			toastAction = {
				text = UseLocalizationResult.addImages,
				onActivated = function(p1) --[[ Line: 34 ]]
					-- upvalues: UseStateResult2 (upval), Callback1 (upval)
					UseStateResult2(p1)
					Callback1()
				end
			}
		})
	end, { Callback1, Callback, UseLocalizationResult.addImages })
	
	return {
		captureToAttach = UseStateResult,
		onCaptureActivated = if Callback == nil then nil else UseResult,
		onCaptureAttached = ReactModule.useCallback(function() --[[ Line: 41 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {})
	}
end