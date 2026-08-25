local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local musicNote = builderIconsModule.Icon.MusicNote
local useMusicInfoModule = require(momentsCreation.Hooks.useMusicInfo)

return function(p0)
	-- upvalues: useMusicInfoModule (ref), reactModule (ref), view (ref), icon (ref), musicNote (ref), foundationModule (ref), text (ref)
	local var5 = useMusicInfoModule(p0.musicAssetId)
	
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center gap-medium size-0-800 auto-x padding-x-medium padding-y-xsmall radius-circle bg-over-media-0",
		LayoutOrder = 1,
		onActivated = p0.onActivated
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = musicNote,
			size = foundationModule.Enums.IconSize.Small
		}),
		MusicTitle = reactModule.createElement(text, {
			tag = "auto-xy text-caption-medium text-align-x-left text-align-y-center text-truncate-split content-action-standard",
			LayoutOrder = 2,
			sizeConstraint = { MaxSize = Vector2.new(100, 1e999) },
			Text = if var5 then var5.Title else ""
		})
	})
end