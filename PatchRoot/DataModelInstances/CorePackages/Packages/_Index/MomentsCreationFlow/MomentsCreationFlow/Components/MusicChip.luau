-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:50 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local musicNote = builderIconsModule.Icon.MusicNote
local useMusicInfoModule = require(momentsCreationFlow.Hooks.useMusicInfo)

return function(p0) --[[ line: 23 | named "MusicChip" ]]
	-- upvalues: useMusicInfoModule (ref), reactModule (ref), view (ref), icon (ref), musicNote (ref), foundationModule (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "align-x-center align-y-center auto-x bg-over-media-0 gap-medium padding-x-medium padding-y-xsmall radius-circle row size-0-800",
		LayoutOrder = 1,
		onActivated = p0.onActivated
	}, {
		Icon = reactModule.createElement(icon, {
			LayoutOrder = 1,
			name = musicNote,
			size = foundationModule.Enums.IconSize.Small
		}),
		MusicTitle = reactModule.createElement(text, {
			tag = "auto-xy content-action-standard text-align-x-left text-align-y-center text-caption-medium text-truncate-split",
			LayoutOrder = 2,
			sizeConstraint = { MaxSize = Vector2.new(100, 1e999) },
			Text = useMusicInfoModule(p0.musicAssetId).Title
		})
	})
end