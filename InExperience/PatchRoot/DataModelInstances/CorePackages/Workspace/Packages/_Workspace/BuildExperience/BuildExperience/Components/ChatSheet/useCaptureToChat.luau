local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local useLocalization = localizationModule.Hooks.useLocalization

return function(p1, p2)
	-- upvalues: reactModule (ref), useLocalization (ref), localizationStringsModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = useLocalization({
		addImages = localizationStringsModule.CHAT_CAPTURE_GALLERY_TITLE
	})
	
	return {
		captureToAttach = var1,
		onCaptureActivated = if p2 ~= nil then nil else reactModule.useCallback(function()
			-- upvalues: p2 (ref), var3 (ref), var2 (ref), p1 (ref)
			p2({
				toastAction = {
					text = var3.addImages,
					onActivated = function(p3)
						-- upvalues: var2 (copy), p1 (copy)
						var2(p3)
						p1()
					end
				}
			})
		end, { p1, p2, var3.addImages }),
		onCaptureAttached = reactModule.useCallback(function()
			-- upvalues: var2 (ref)
			var2(nil)
		end, {})
	}
end