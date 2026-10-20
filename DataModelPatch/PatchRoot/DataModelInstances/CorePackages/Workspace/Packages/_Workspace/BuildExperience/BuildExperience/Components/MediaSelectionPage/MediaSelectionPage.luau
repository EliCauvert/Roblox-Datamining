local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local MediaSelectorModule = require(script.Parent.MediaSelector)
local _ = require(script.Parent.types)

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Text (copy), MediaSelectorModule (copy)
	return ReactModule.createElement(View, { tag = "col size-full bg-surface-0" }, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "composition-content-header row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-y-medium"
		}, {
			Back = ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = IconName.ArrowLargeLeft,
				onActivated = p1.onClose,
				size = InputSize.Medium,
				variant = ButtonVariant.Utility
			}),
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				Text = "Icon & Thumbnails",
				tag = "fill auto-y text-heading-medium text-align-x-left text-truncate-end content-emphasis"
			})
		}),
		Content = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "composition-content-body col shrink gap-xlarge size-full padding-large"
		}, {
			MediaSelector = ReactModule.createElement(MediaSelectorModule, { universeId = p1.universeId, onBack = p1.onClose })
		})
	})
end