local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FFlagBuildExperienceInGameShellComposer = require(Parent.SharedFlags).FFlagBuildExperienceInGameShellComposer
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(Callback, Callback1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), FFlagBuildExperienceInGameShellComposer (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseLocalizationResult = UseLocalizationFunction({
		addImages = LocalizationStringsModule.CHAT_CAPTURE_GALLERY_TITLE
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: Callback1 (copy), UseLocalizationResult (copy), UseStateResult2 (copy), Callback (copy)
		Callback1({
			toastAction = {
				text = UseLocalizationResult.addImages,
				onActivated = function(p1)
					-- upvalues: UseStateResult2 (upval), Callback (upval)
					UseStateResult2(p1)
					Callback()
				end
			}
		})
	end, { Callback, Callback1, UseLocalizationResult.addImages })
	local config = {
		captureToAttach = UseStateResult,
		onCaptureActivated = if Callback1 == nil then nil else UseResult,
		onCaptureAttached = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(nil)
		end, {})
	}
	
	if FFlagBuildExperienceInGameShellComposer then
		local UseResult1 = ReactModule.useCallback(function()
			-- upvalues: Callback1 (copy), UseLocalizationResult (copy), UseStateResult2 (copy)
			Callback1({
				toastAction = {
					autoActivate = true,
					text = UseLocalizationResult.addImages,
					onActivated = UseStateResult2
				}
			})
		end, { Callback1, UseLocalizationResult.addImages })
		
		if Callback1 ~= nil then
			config.onAutoAttachCaptureActivated = UseResult1
		end
	end
	return config
end