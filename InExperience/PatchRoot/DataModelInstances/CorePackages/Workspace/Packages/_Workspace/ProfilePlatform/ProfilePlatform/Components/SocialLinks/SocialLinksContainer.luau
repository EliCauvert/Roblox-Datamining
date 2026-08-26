local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local socialLinksCarouselModule = require(profilePlatform.Components.SocialLinks.SocialLinksCarousel)
local enumsModule = require(profilePlatform.Common.Enums)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local socialMediaTypes = enumsModule.SocialMediaTypes
local images = UIBloxModule.App.ImageSet.Images
local t = {
	[socialMediaTypes.Twitter] = images["icons/brands/x"],
	[socialMediaTypes.Facebook] = images["icons/brands/facebook"],
	[socialMediaTypes.Discord] = images["icons/brands/discord"],
	[socialMediaTypes.YouTube] = images["icons/brands/youtube"],
	[socialMediaTypes.Twitch] = images["icons/brands/twitch"],
	[socialMediaTypes.Guilded] = images["icons/brands/guilded"],
	[socialMediaTypes.X] = images["icons/brands/x"]
}

return function(p1)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), useLocalization (ref), textKeysModule (ref), t (ref), reactModule (ref), socialLinksCarouselModule (ref)
	local var1 = useProfileJsonComponentModule(enumsModule.Components.SocialLinks)
	local var2 = useLocalization({
		facebook = textKeysModule.Facebook,
		twitter = textKeysModule.X,
		youtube = textKeysModule.YouTube,
		twitch = textKeysModule.Twitch,
		guilded = textKeysModule.Guilded,
		discord = textKeysModule.Discord,
		x = textKeysModule.X
	})
	
	local var3 = function(p2)
		-- upvalues: var2 (ref), t (copy)
		local t_1 = {}
		
		for i, v in pairs(p2) do
			local var4 = var2[i]
			
			if v and t[i] then
				table.insert(t_1, { key = i, logo = t[i], url = v.url, name = var4 })
			end
		end
		return t_1
	end
	
	local var5 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var1 (ref)
		return var3(var1)
	end, { var1, var2 })
	
	return if #var5 > 0 then reactModule.createElement(socialLinksCarouselModule, {
		layoutOrder = p1.layoutOrder,
		items = var5,
		title = p1.title
	}) else reactModule.None
end