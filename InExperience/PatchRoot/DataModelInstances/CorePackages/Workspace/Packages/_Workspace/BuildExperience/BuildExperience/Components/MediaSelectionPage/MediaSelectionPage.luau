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
local mediaSelectorModule = require(script.Parent.MediaSelector)
local _ = require(script.Parent.types)

return function(p0) --[[ line: 30 | named "IconThumbnailsSheet" ]]
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), reactModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), mediaSelectorModule (ref)
	local var6 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, { tag = "col size-full bg-surface-0" }, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "composition-content-header row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-y-medium"
		}, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = iconName.ArrowLargeLeft,
				onActivated = reactModule.useCallback(function() --[[ line: 39 ]]
					-- upvalues: var6 (ref), p0 (ref)
					if var6.current then
						var6.current()
						
						return
					end
					p0.onClose()
				end, { p0.onClose }),
				size = inputSize.Medium,
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
			tag = "composition-content-body col shrink gap-xlarge size-full padding-large"
		}, {
			MediaSelector = reactModule.createElement(mediaSelectorModule, {
				universeId = p0.universeId,
				onBack = p0.onClose,
				backHandlerRef = var6
			})
		})
	})
end