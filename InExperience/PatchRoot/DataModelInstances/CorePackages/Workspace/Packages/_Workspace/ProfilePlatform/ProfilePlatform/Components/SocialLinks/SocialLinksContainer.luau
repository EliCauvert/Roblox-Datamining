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

return function(p0) --[[ line: 31 ]]
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), useLocalization (ref), textKeysModule (ref), t (ref), reactModule (ref), socialLinksCarouselModule (ref)
	local var8 = useProfileJsonComponentModule(enumsModule.Components.SocialLinks)
	local var9 = useLocalization({
		facebook = textKeysModule.Facebook,
		twitter = textKeysModule.X,
		youtube = textKeysModule.YouTube,
		twitch = textKeysModule.Twitch,
		guilded = textKeysModule.Guilded,
		discord = textKeysModule.Discord,
		x = textKeysModule.X
	})
	
	local var10 = function(p1) --[[ line: 43 ]]
		-- upvalues: var9 (ref), t (copy)
		local t_1 = {}
		
		for i, v in pairs(p1) do
			local var13 = var9[i]
			
			if v and t[i] then
				table.insert(t_1, { key = i, logo = t[i], url = v.url, name = var13 })
			end
		end
		return t_1
	end
	
	local var11 = reactModule.useMemo(function() --[[ line: 60 ]]
		-- upvalues: var10 (ref), var8 (ref)
		return var10(var8)
	end, { var8, var9 })
	
	return if #var11 > 0 then reactModule.createElement(socialLinksCarouselModule, {
		layoutOrder = p0.layoutOrder,
		items = var11,
		title = p0.title
	}) else reactModule.None
end