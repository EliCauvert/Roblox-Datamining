local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local mediaSelectorModule = require(script.Parent.MediaSelector)
local _ = require(script.Parent.types)

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), fFlagBuildDesktopReadinessModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), mediaSelectorModule (ref)
	local var1 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, { tag = "col size-full bg-surface-0" }, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = {
				["composition-content-header row align-y-center gap-small size-full-0 auto-y padding-y-medium"] = true,
				["padding-x-medium"] = not fFlagBuildDesktopReadinessModule
			}
		}, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = if fFlagBuildDesktopReadinessModule then iconName.ChevronLargeLeft else iconName.ArrowLargeLeft,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var1 (ref), p1 (ref)
					if var1.current then
						var1.current()
						
						return
					end
					p1.onClose()
				end, { p1.onClose }),
				size = if fFlagBuildDesktopReadinessModule then inputSize.Large else inputSize.Medium,
				variant = buttonVariant.Utility
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis",
				Text = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({ title = localizationStringsModule.MEDIA_SELECTION_TITLE }) else nil).title else localizationStringsModule.MEDIA_SELECTION_TITLE
			})
		}),
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = {
				["shrink size-full"] = true,
				["composition-content-body col gap-xlarge padding-large"] = not fFlagBuildDesktopReadinessModule
			}
		}, {
			MediaSelector = reactModule.createElement(mediaSelectorModule, {
				universeId = p1.universeId,
				onBack = p1.onClose,
				backHandlerRef = var1
			})
		})
	})
end