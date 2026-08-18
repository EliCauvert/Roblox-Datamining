local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local mediaSelectorModule = require(script.Parent.MediaSelector)
local _ = require(script.Parent.types)

return function(p0) --[[ line: 26 | named "IconThumbnailsSheet" ]]
	-- upvalues: reactModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), localizationStringsModule (ref), mediaSelectorModule (ref)
	local var5 = reactModule.useRef(nil)
	
	return reactModule.createElement(view, { tag = "col size-full bg-surface-0" }, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "composition-content-header row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-y-medium"
		}, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = iconName.ArrowLargeLeft,
				onActivated = reactModule.useCallback(function() --[[ line: 29 ]]
					-- upvalues: var5 (ref), p0 (ref)
					if var5.current then
						var5.current()
						
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
				Text = localizationStringsModule.MEDIA_SELECTION_TITLE
			})
		}),
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "composition-content-body col shrink gap-xlarge size-full padding-large"
		}, {
			MediaSelector = reactModule.createElement(mediaSelectorModule, {
				universeId = p0.universeId,
				onBack = p0.onClose,
				backHandlerRef = var5
			})
		})
	})
end