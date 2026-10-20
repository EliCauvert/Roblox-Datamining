local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local MusicNote = require(Parent.BuilderIcons).Icon.MusicNote
local UseMusicInfoModule = require(MomentsCreation.Hooks.useMusicInfo)

return function(p1)
	-- upvalues: UseMusicInfoModule (copy), ReactModule (copy), View (copy), Icon (copy), MusicNote (copy), FoundationModule (copy), Text (copy)
	local UseMusicInfoModuleResult = UseMusicInfoModule(p1.musicAssetId)
	
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center gap-medium size-0-800 auto-x padding-x-medium padding-y-xsmall radius-circle bg-over-media-0",
		LayoutOrder = 1,
		onActivated = p1.onActivated
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = MusicNote,
			size = FoundationModule.Enums.IconSize.Small
		}),
		MusicTitle = ReactModule.createElement(Text, {
			tag = "auto-xy text-caption-medium text-align-x-left text-align-y-center text-truncate-split content-action-standard",
			LayoutOrder = 2,
			sizeConstraint = { MaxSize = Vector2.new(100, 1e999) },
			Text = UseMusicInfoModuleResult and UseMusicInfoModuleResult.Title or ""
		})
	})
end