local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local mediaSelectorModule = require(script.Parent.MediaSelector)
local _ = require(script.Parent.types)

return function(p0) --[[ line: 26 | named "IconThumbnailsSheet" ]]
	-- upvalues: reactModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), mediaSelectorModule (ref)
	return reactModule.createElement(view, { tag = "col size-full bg-surface-0" }, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "composition-content-header row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-y-medium"
		}, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = iconName.ArrowLargeLeft,
				onActivated = p0.onClose,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}),
			Title = reactModule.createElement(text, {
				LayoutOrder = 2,
				Text = "Icon & Thumbnails",
				tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis"
			})
		}),
		Content = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "composition-content-body col shrink gap-xlarge size-full padding-large"
		}, {
			MediaSelector = reactModule.createElement(mediaSelectorModule, { universeId = p0.universeId, onBack = p0.onClose })
		})
	})
end