local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local InputSize = FoundationModule.Enums.InputSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local config = {
	x = "icons/brands/x",
	facebook = "icons/brands/facebook",
	youtube = "icons/brands/youtube",
	twitch = "icons/brands/twitch",
	guilded = "icons/brands/guilded"
}
local list = {
	"facebook",
	"x",
	"youtube",
	"twitch",
	"guilded"
}

return function(p1) --[[ Line: 44 | Named "SocialLinks" ]]
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), list (copy), ReactModule (copy), Button (copy), config (copy), InputSize (copy), ButtonVariant (copy), View (copy), Text (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		socialLinks = TextKeysModule.SocialLinks,
		noSocialLink = TextKeysModule.NoSocialLink
	})
	local Elements = {}
	
	if p1.socialLinks then
		for LayoutOrder, value in ipairs(list) do
			local SocialLink = p1.socialLinks[value]
			
			if SocialLink and SocialLink.target then
				Elements[value] = ReactModule.createElement(Button, {
					Selectable = false,
					tag = "auto-y size-full-0 padding-left-small padding-right-small no-hover",
					LayoutOrder = LayoutOrder,
					text = SocialLink.target,
					icon = config[value],
					size = InputSize.Small,
					variant = ButtonVariant.Utility,
					onActivated = function() --[[ Line: 60 ]] end
				})
			end
		end
	end
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y gap-small align-x-left",
		LayoutOrder = p1.layoutOrder
	}, {
		SocialLinksTitle = ReactModule.createElement(Text, {
			LayoutOrder = 1,
			tag = "auto-y size-full-0 text-align-x-left text-heading-small",
			Text = UseLocalizationResult.socialLinks
		}),
		LinksContainer = if p1.socialLinks then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row wrap size-full-0 auto-xy gap-small align-x-left"
		}, Elements) else ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "auto-y size-full-0 text-align-x-left text-body-medium",
			Text = UseLocalizationResult.noSocialLink
		})
	})
end