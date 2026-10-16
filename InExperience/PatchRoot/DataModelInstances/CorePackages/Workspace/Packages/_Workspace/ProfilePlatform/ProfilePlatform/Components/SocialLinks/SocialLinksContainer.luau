local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local SocialLinksCarouselModule = require(ProfilePlatform.Components.SocialLinks.SocialLinksCarousel)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local SocialMediaTypes = EnumsModule.SocialMediaTypes
local Images = require(Parent.UIBlox).App.ImageSet.Images
local config = {
	[SocialMediaTypes.Twitter] = Images["icons/brands/x"],
	[SocialMediaTypes.Facebook] = Images["icons/brands/facebook"],
	[SocialMediaTypes.Discord] = Images["icons/brands/discord"],
	[SocialMediaTypes.YouTube] = Images["icons/brands/youtube"],
	[SocialMediaTypes.Twitch] = Images["icons/brands/twitch"],
	[SocialMediaTypes.Guilded] = Images["icons/brands/guilded"],
	[SocialMediaTypes.X] = Images["icons/brands/x"]
}

return function(p1) --[[ Line: 31 ]]
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), config (copy), ReactModule (copy), SocialLinksCarouselModule (copy)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.SocialLinks)
	local UseLocalizationResult = UseLocalizationFunction({
		facebook = TextKeysModule.Facebook,
		twitter = TextKeysModule.X,
		youtube = TextKeysModule.YouTube,
		twitch = TextKeysModule.Twitch,
		guilded = TextKeysModule.Guilded,
		discord = TextKeysModule.Discord,
		x = TextKeysModule.X
	})
	
	local function v12(List) --[[ Line: 43 ]]
		-- upvalues: UseLocalizationResult (copy), config (upval)
		local List1 = {}
		
		for Key, value in pairs(List) do
			local UseLocalizationResultEntry = UseLocalizationResult[Key]
			local Entry = config[Key]
			
			if value and Entry then
				table.insert(List1, {
					key = Key,
					logo = config[Key],
					url = value.url,
					name = UseLocalizationResultEntry
				})
			end
		end
		return List1
	end
	
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 60 ]]
		-- upvalues: v12 (copy), UseProfileJsonComponentModuleResult (copy)
		return (v12(UseProfileJsonComponentModuleResult))
	end, {
		UseProfileJsonComponentModuleResult,
		UseLocalizationResult
	})
	
	return if #UseMemoResult > 0 then ReactModule.createElement(SocialLinksCarouselModule, {
		layoutOrder = p1.layoutOrder,
		items = UseMemoResult,
		title = p1.title
	}) else ReactModule.None
end