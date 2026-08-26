local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local button = foundationModule.Button
local inputSize = foundationModule.Enums.InputSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local t = {
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

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), list (ref), reactModule (ref), button (ref), t (ref), inputSize (ref), buttonVariant (ref), view (ref), text (ref)
	local var1 = useLocalization({
		socialLinks = textKeysModule.SocialLinks,
		noSocialLink = textKeysModule.NoSocialLink
	})
	local t_1 = {}
	
	if p1.socialLinks then
		for i, v in ipairs(list) do
			local var2 = p1.socialLinks[v]
			
			if var2 and var2.target then
				t_1[v] = reactModule.createElement(button, {
					Selectable = false,
					tag = "auto-y size-full-0 padding-left-small padding-right-small no-hover",
					LayoutOrder = i,
					text = var2.target,
					icon = t[v],
					size = inputSize.Small,
					variant = buttonVariant.Utility,
					onActivated = function() end
				})
			end
		end
	end
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y gap-small align-x-left",
		LayoutOrder = p1.layoutOrder
	}, {
		SocialLinksTitle = reactModule.createElement(text, {
			LayoutOrder = 1,
			tag = "auto-y size-full-0 text-align-x-left text-heading-small",
			Text = var1.socialLinks
		}),
		LinksContainer = if p1.socialLinks then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row wrap size-full-0 auto-xy gap-small align-x-left"
		}, t_1) else reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "auto-y size-full-0 text-align-x-left text-body-medium",
			Text = var1.noSocialLink
		})
	})
end