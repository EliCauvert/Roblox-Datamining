local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local MusicNote = require(Parent.BuilderIcons).Icon.MusicNote
local UseMusicInfoModule = require(MomentsCreationFlow.Hooks.useMusicInfo)

return function(p1) --[[ Line: 23 | Named "MusicChip" ]]
	-- upvalues: UseMusicInfoModule (copy), ReactModule (copy), View (copy), Icon (copy), MusicNote (copy), FoundationModule (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "align-x-center align-y-center auto-x bg-over-media-0 gap-medium padding-x-medium padding-y-xsmall radius-circle row size-0-800",
		LayoutOrder = 1,
		onActivated = p1.onActivated
	}, {
		Icon = ReactModule.createElement(Icon, {
			LayoutOrder = 1,
			name = MusicNote,
			size = FoundationModule.Enums.IconSize.Small
		}),
		MusicTitle = ReactModule.createElement(Text, {
			tag = "auto-xy content-action-standard text-align-x-left text-align-y-center text-caption-medium text-truncate-split",
			LayoutOrder = 2,
			sizeConstraint = { MaxSize = Vector2.new(100, 1e999) },
			Text = UseMusicInfoModule(p1.musicAssetId).Title
		})
	})
end