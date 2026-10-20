local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local Text = FoundationModule.Text
local View = FoundationModule.View
local MusicNote = require(Parent.BuilderIcons).Icon.MusicNote
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagMomentsCreationMusicChipRemoveButtonModule = require(MomentsCreation.Flags.FFlagMomentsCreationMusicChipRemoveButton)
local UseMusicInfoModule = require(MomentsCreation.Hooks.useMusicInfo)

return function(p1)
	-- upvalues: UseMusicInfoModule (copy), FFlagMomentsCreationMusicChipRemoveButtonModule (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), MusicNote (copy), FoundationModule (copy), Text (copy), IconName (copy), IconSize (copy)
	local UseMusicInfoModuleResult = UseMusicInfoModule(p1.musicAssetId)
	local UseTokensResult = if FFlagMomentsCreationMusicChipRemoveButtonModule then UseTokensFunction() else nil
	
	return ReactModule.createElement(View, {
		LayoutOrder = 1,
		tag = if FFlagMomentsCreationMusicChipRemoveButtonModule then {
			["row align-x-center align-y-center gap-medium size-0-800 auto-x padding-y-xsmall radius-circle bg-over-media-0"] = true,
			["padding-x-medium"] = p1.onRemove == nil,
			["padding-left-medium padding-right-small"] = p1.onRemove ~= nil
		} else "row align-x-center align-y-center gap-medium size-0-800 auto-x padding-x-medium padding-y-xsmall radius-circle bg-over-media-0",
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
		}),
		RemoveButton = if FFlagMomentsCreationMusicChipRemoveButtonModule and p1.onRemove then ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "align-x-center align-y-center size-500-500 radius-circle",
			testId = "music-chip-remove-button",
			backgroundStyle = { Color3 = Color3.new(0, 0, 0) },
			onActivated = p1.onRemove,
			stroke = {
				Color = UseTokensResult.Color.Stroke.Default.Color3,
				Transparency = UseTokensResult.Color.Stroke.Default.Transparency,
				Thickness = UseTokensResult.Stroke.Standard
			}
		}, {
			RemoveIcon = ReactModule.createElement(Icon, {
				testId = "music-chip-remove-button-icon",
				name = IconName.X,
				size = IconSize.XSmall,
				style = UseTokensResult.Color.Content.Emphasis
			})
		}) else nil
	})
end