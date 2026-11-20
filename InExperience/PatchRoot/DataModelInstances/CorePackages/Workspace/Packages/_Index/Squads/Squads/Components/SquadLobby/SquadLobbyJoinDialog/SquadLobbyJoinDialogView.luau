local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ConstantsModule = require(Squads.Common.Constants)
local Dialog = FoundationModule.Dialog
local AvatarSize = FoundationModule.Enums.AvatarSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local Orientation = FoundationModule.Enums.Orientation
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), DialogSize (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy), ButtonVariant (copy), ConstantsModule (copy), AvatarSize (copy), Orientation (copy)
	local UseTokensResult = UseTokensFunction()
	local Medium = if p1.isWideMode then DialogSize.Medium else DialogSize.Small
	local Element = if p1.gameImage then ReactModule.createElement(Dialog.HeroMedia, {
		aspectRatio = 1.7777777777777777,
		media = p1.gameImage,
		scaleType = Enum.ScaleType.Crop
	}) else nil
	local XLarge = if Medium == DialogSize.Medium then UseTokensResult.Padding.XLarge else UseTokensResult.Padding.Large
	local Medium1 = UseTokensResult.Padding.Medium
	local Element1 = if Element and p1.rating then ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", LayoutOrder = 1 }, {
		Media = ReactModule.createElement(FoundationModule.View, { tag = "col size-full-0 auto-y" }, Element),
		Rating = ReactModule.createElement(FoundationModule.View, {
			tag = "anchor-bottom-right auto-xy",
			ZIndex = 2,
			Position = UDim2.new(1, XLarge - Medium1, 1, -Medium1),
			testId = `{p1.testId}--rating`
		}, p1.rating)
	}) else nil
	local config = {
		text = p1.joinText,
		variant = ButtonVariant.Emphasis,
		onActivated = p1.onJoin
	}
	
	return ReactModule.createElement(FoundationModule.OverlayProvider, {
		DisplayOrder = ConstantsModule.SQUAD_LOBBY_MODAL_DISPLAY_ORDER
	}, {
		Dialog = ReactModule.createElement(Dialog.Root, {
			ref = p1.dialogRef,
			size = Medium,
			disablePortal = p1.disablePortal ~= nil and p1.disablePortal,
			hasBackdrop = p1.hasBackdrop == nil or p1.hasBackdrop,
			onClose = p1.onClose,
			testId = p1.testId
		}, {
			HeroMedia = Element1 or Element,
			Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
				Details = ReactModule.createElement(FoundationModule.View, { tag = "col gap-medium size-full-0 auto-y" }, {
					PlayerRow = ReactModule.createElement(FoundationModule.View, {
						tag = "row align-y-center gap-medium size-full-0 auto-y",
						LayoutOrder = 1
					}, {
						Avatar = ReactModule.createElement(FoundationModule.Avatar, {
							LayoutOrder = 1,
							userId = p1.userId,
							size = AvatarSize.Medium,
							testId = `{p1.testId}--avatar`
						}),
						TextColumn = ReactModule.createElement(FoundationModule.View, {
							tag = "col shrink gap-xxsmall size-full-0 auto-y",
							LayoutOrder = 2
						}, {
							PlayerName = if p1.playerName then ReactModule.createElement(FoundationModule.Text, {
								tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
								LayoutOrder = 1,
								Text = p1.playerName,
								testId = `{p1.testId}--player-name`
							}) else nil,
							PlayingRow = ReactModule.createElement(FoundationModule.View, {
								tag = "row align-y-center gap-xsmall size-full-0 auto-y",
								LayoutOrder = 2
							}, {
								IsPlaying = ReactModule.createElement(FoundationModule.Text, {
									tag = "auto-xy text-body-medium text-no-wrap content-default",
									LayoutOrder = 1,
									Text = p1.isPlayingText
								}),
								ExperienceName = ReactModule.createElement(FoundationModule.Text, {
									tag = "shrink auto-xy text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
									LayoutOrder = 2,
									Text = p1.experienceName,
									testId = `{p1.testId}--experience-name`
								})
							})
						})
					})
				})
			}),
			Actions = ReactModule.createElement(Dialog.Actions, {
				LayoutOrder = 3,
				orientation = Orientation.Vertical,
				actions = if p1.viewProfileText and p1.onViewProfile then {
					config,
					{
						text = p1.viewProfileText,
						variant = ButtonVariant.Standard,
						onActivated = p1.onViewProfile
					}
				} else { config }
			})
		})
	})
end