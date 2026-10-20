local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local MediaSelectorModule = require(script.Parent.MediaSelector)
local _ = require(script.Parent.types)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Text (copy), MediaSelectorModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.createElement(View, { tag = "col size-full bg-surface-0" }, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = {
				["composition-content-header row align-y-center gap-small size-full-0 auto-y padding-y-medium"] = true
			}
		}, {
			Back = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = IconName.ChevronLargeLeft,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseRefResult (copy), p1 (copy)
					if UseRefResult.current then
						UseRefResult.current()
						
						return
					else
						p1.onClose()
					end
				end, { p1.onClose }),
				size = InputSize.Large,
				variant = ButtonVariant.Utility
			}),
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				Text = UseLocalizationFunction({ title = LocalizationStringsModule.MEDIA_SELECTION_TITLE }).title
			})
		}),
		Content = ReactModule.createElement(View, { LayoutOrder = 2, tag = { ["shrink size-full"] = true } }, {
			MediaSelector = ReactModule.createElement(MediaSelectorModule, {
				universeId = p1.universeId,
				onBack = p1.onClose,
				backHandlerRef = UseRefResult
			})
		})
	})
end