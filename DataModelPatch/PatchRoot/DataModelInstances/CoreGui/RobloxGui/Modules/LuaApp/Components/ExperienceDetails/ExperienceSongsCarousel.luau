local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local HttpService = game:GetService("HttpService")
local SongCollectionCarousel = require(CorePackages.Workspace.Packages.SongDetails).SongCollectionCarousel
local UseExperienceSongsFunction = require(CorePackages.Workspace.Packages.ExperienceSongsRodux).useExperienceSongs
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local FFlagSongCarouselPropUpdate = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSongCarouselPropUpdate

return function(p1)
	-- upvalues: UseExperienceSongsFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), HttpService (copy), SongCollectionCarousel (copy), FFlagSongCarouselPropUpdate (copy), AppPage (copy)
	local UseExperienceSongsResult = UseExperienceSongsFunction(p1.universeId)
	local UseLocalizationResult = UseLocalizationFunction({
		featuredSongsHeader = {
			"Feature.GameDetails.Heading.FeaturedSongs",
			experienceName = p1.universeTitle
		}
	})
	local SongIds = UseExperienceSongsResult.songIds
	local Text = "GameDetails_" .. tostring(p1.universeId) .. tostring(ReactModule.useRef(HttpService:GenerateGUID()).current)
	
	return if #SongIds == 0 then nil else ReactModule.createElement(SongCollectionCarousel, {
		songIds = SongIds,
		title = UseLocalizationResult.featuredSongsHeader,
		impressionsTag = Text,
		collectionOrder = if FFlagSongCarouselPropUpdate then p1.collectionOrder else nil,
		layoutOrder = if FFlagSongCarouselPropUpdate then nil else p1.collectionOrder,
		pageContext = AppPage.ExperienceDetail,
		referralId = p1.universeId,
		fractionalItemAmount = p1.fractionalItemAmount,
		clipsDescendants = p1.clipsDescendants
	})
end