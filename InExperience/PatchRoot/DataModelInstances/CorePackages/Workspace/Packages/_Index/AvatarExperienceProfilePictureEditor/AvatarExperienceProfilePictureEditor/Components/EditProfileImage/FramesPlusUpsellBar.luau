local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local parent = avatarExperienceProfilePictureEditor.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local view = foundationModule.View
local text = foundationModule.Text
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local textKeysModule = require(avatarExperienceProfilePictureEditor.Common.TextKeys)

return function(p0) --[[ line: 25 | named "FramesPlusUpsellBar" ]]
	-- upvalues: useTokens (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local var5 = useLocalization({
		unlockBanner = textKeysModule.ProfileFramesUnlockBanner,
		subscribe = textKeysModule.Subscribe
	})
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium",
		LayoutOrder = p0.layoutOrder
	}, {
		Content = reactModule.createElement(view, {
			tag = "row flex-between align-y-center gap-small size-full-0 auto-y"
		}, {
			Leading = reactModule.createElement(view, {
				tag = "row align-y-center fill gap-small auto-xy",
				LayoutOrder = 1
			}, {
				PlusIcon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = iconName.RobloxPlus,
					size = iconSize.Medium,
					style = useTokens().Color.Content.Emphasis
				}),
				Message = reactModule.createElement(text, {
					tag = "fill text-body-small text-align-x-left content-emphasis",
					LayoutOrder = 2,
					Text = var5.unlockBanner
				})
			}),
			Subscribe = reactModule.createElement(view, {
				tag = "auto-xy",
				LayoutOrder = 2,
				onActivated = p0.onSubscribeActivated
			}, {
				Label = reactModule.createElement(text, {
					tag = "auto-xy text-body-small content-default",
					RichText = true,
					Text = `<u>{var5.subscribe}</u>`
				})
			})
		})
	})
end