local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local text = foundationModule.Text
local view = foundationModule.View
local musicNote = builderIconsModule.Icon.MusicNote
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local fFlagMomentsCreationMusicChipRemoveButtonModule = require(momentsCreation.Flags.FFlagMomentsCreationMusicChipRemoveButton)
local useMusicInfoModule = require(momentsCreation.Hooks.useMusicInfo)

return function(p1)
	-- upvalues: useMusicInfoModule (ref), fFlagMomentsCreationMusicChipRemoveButtonModule (ref), useTokens (ref), reactModule (ref), view (ref), icon (ref), musicNote (ref), foundationModule (ref), text (ref), iconName (ref), iconSize (ref)
	local var1 = useMusicInfoModule(p1.musicAssetId)
	local var2 = if fFlagMomentsCreationMusicChipRemoveButtonModule then useTokens() else nil
	
	return reactModule.createElement(view, {
		LayoutOrder = 1,
		tag = if fFlagMomentsCreationMusicChipRemoveButtonModule then {
			["row align-x-center align-y-center gap-medium size-0-800 auto-x padding-y-xsmall radius-circle bg-over-media-0"] = true,
			["padding-x-medium"] = p1.onRemove == nil,
			["padding-left-medium padding-right-small"] = p1.onRemove ~= nil
		} else "row align-x-center align-y-center gap-medium size-0-800 auto-x padding-x-medium padding-y-xsmall radius-circle bg-over-media-0",
		onActivated = p1.onActivated
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
			Text = if var1 then var1.Title else ""
		}),
		RemoveButton = if fFlagMomentsCreationMusicChipRemoveButtonModule and p1.onRemove then reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "align-x-center align-y-center size-500-500 radius-circle",
			testId = "music-chip-remove-button",
			backgroundStyle = { Color3 = Color3.new(0, 0, 0) },
			onActivated = p1.onRemove,
			stroke = {
				Color = var2.Color.Stroke.Default.Color3,
				Transparency = var2.Color.Stroke.Default.Transparency,
				Thickness = var2.Stroke.Standard
			}
		}, {
			RemoveIcon = reactModule.createElement(icon, {
				testId = "music-chip-remove-button-icon",
				name = iconName.X,
				size = iconSize.XSmall,
				style = var2.Color.Content.Emphasis
			})
		}) else nil
	})
end