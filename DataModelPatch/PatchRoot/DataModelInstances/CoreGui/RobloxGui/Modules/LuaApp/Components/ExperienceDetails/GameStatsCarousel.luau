local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local LocalizationModule = require(CorePackages.Workspace.Packages.Localization)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseAbbreviatedNumberLocalizationFunction = LocalizationModule.Hooks.useAbbreviatedNumberLocalization
local UsePlayerCountTextFunction = require(CorePackages.Workspace.Packages.GameTile).usePlayerCountText
local InfoCarousel = require(CorePackages.Workspace.Packages.AppBlox).InfoCarousel
local UseGameInfosSelectorFunction = require(CorePackages.Workspace.Packages.GameInfosRodux).useGameInfosSelector
local Images = require(CorePackages.Packages.UIBlox).App.ImageSet.Images
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), UseSelectorFunction (copy), Images (copy), FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), UseGameInfosSelectorFunction (copy), UsePlayerCountTextFunction (copy), UseAbbreviatedNumberLocalizationFunction (copy), ReactModule (copy), InfoCarousel (copy)
	local ShowIcons = Frame.showIcons or false
	local List = {}
	
	local function _(HeaderText, BodyText, Icon, OnActivated)
		-- upvalues: List (copy)
		if HeaderText and BodyText then
			table.insert(List, {
				headerText = HeaderText,
				bodyText = BodyText,
				icon = Icon,
				onActivated = OnActivated
			})
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		rating = "Feature.GameDetails.Label.Rating",
		active = "Feature.GameDetails.Label.Playing",
		visits = "Feature.GameDetails.Label.Visits",
		maturity = "Feature.GameDetails.Label.Maturity",
		unavailable = "Feature.GameDetails.Label.Unavailable",
		age = "Feature.GameDetails.Label.Age"
	})
	local UseSelectorResult = UseSelectorFunction(function(p1): string
		-- upvalues: Frame (copy)
		local GameVote = p1.GameVotes[Frame.universeId]
		
		if GameVote then
			local UpVotes = GameVote.upVotes
			local DownVotes = GameVote.downVotes
			
			if UpVotes and DownVotes then
				local NewUpVotes = UpVotes + DownVotes
				
				if NewUpVotes > 0 then
					return math.floor(UpVotes / NewUpVotes * 100) .. "%"
				end
			end
		end
		return "--"
	end)
	local Rating = UseLocalizationResult.rating
	local IconsStatusGamesRatingSmall = if ShowIcons then Images["icons/status/games/rating_small"] else nil
	
	if Rating and UseSelectorResult then
		table.insert(List, {
			onActivated = nil,
			headerText = Rating,
			bodyText = UseSelectorResult,
			icon = IconsStatusGamesRatingSmall
		})
	end
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), Frame (copy)
		return if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and Frame.shouldHydrateLegacyIxp then p1.GameDetailsV2[Frame.universeId] else p1.GameDetails[Frame.universeId]
	end)
	local UseGameInfosSelectorResult = UseGameInfosSelectorFunction(Frame.universeId)
	local UsePlayerCountTextResult = UsePlayerCountTextFunction(UseSelectorResult1 and UseSelectorResult1.playing or UseGameInfosSelectorResult and UseGameInfosSelectorResult.playerCount)
	local Active = UseLocalizationResult.active
	local IconsStatusGamesPeoplePlayingSmall = if ShowIcons then Images["icons/status/games/people-playing_small"] else nil
	
	if Active and UsePlayerCountTextResult then
		table.insert(List, {
			onActivated = nil,
			headerText = Active,
			bodyText = UsePlayerCountTextResult,
			icon = IconsStatusGamesPeoplePlayingSmall
		})
	end
	local UseSelectorResult2 = UseSelectorFunction(function(p1)
		-- upvalues: Frame (copy)
		local AgeRecommendation = p1.AgeRecommendations[Frame.universeId]
		
		return AgeRecommendation and AgeRecommendation.summary
	end)
	local MinimumAgeDisplay = if UseSelectorResult2 and UseSelectorResult2.ageRecommendation then UseSelectorResult2.ageRecommendation.minimumAgeDisplay else nil
	local UseSelectorResult21 = UseSelectorFunction(function(p1)
		return p1.AgeRecommendationHeaders.headerDisplayNameShort
	end)
	local UseSelectorResult3 = if UseSelectorResult21 then UseSelectorResult21 else UseLocalizationResult.maturity
	local DisplayName = if UseSelectorResult2 and UseSelectorResult2.ageRecommendation then UseSelectorResult2.ageRecommendation.displayName else UseLocalizationResult.unavailable
	local UseAbbreviatedNumberLocalizationResult = UseAbbreviatedNumberLocalizationFunction(UseSelectorResult1 and UseSelectorResult1.visits) or "--"
	
	if MinimumAgeDisplay and MinimumAgeDisplay ~= "" then
		local Age = UseLocalizationResult.age
		
		if Age and MinimumAgeDisplay then
			table.insert(List, {
				icon = nil,
				onActivated = nil,
				headerText = Age,
				bodyText = MinimumAgeDisplay
			})
		end
		if UseSelectorResult3 and DisplayName then
			table.insert(List, {
				icon = nil,
				onActivated = nil,
				headerText = UseSelectorResult3,
				bodyText = DisplayName
			})
		end
		local Visits1 = UseLocalizationResult.visits
		local IconsStatusGamesSessionsSmall1 = if ShowIcons then Images["icons/status/games/sessions_small"] else nil
		
		if Visits1 and UseAbbreviatedNumberLocalizationResult then
			table.insert(List, {
				onActivated = nil,
				headerText = Visits1,
				bodyText = UseAbbreviatedNumberLocalizationResult,
				icon = IconsStatusGamesSessionsSmall1
			})
		end
	else
		local Visits = UseLocalizationResult.visits
		local IconsStatusGamesSessionsSmall = if ShowIcons then Images["icons/status/games/sessions_small"] else nil
		
		if Visits and UseAbbreviatedNumberLocalizationResult then
			table.insert(List, {
				onActivated = nil,
				headerText = Visits,
				bodyText = UseAbbreviatedNumberLocalizationResult,
				icon = IconsStatusGamesSessionsSmall
			})
		end
		if UseSelectorResult3 and DisplayName then
			table.insert(List, {
				icon = nil,
				onActivated = nil,
				headerText = UseSelectorResult3,
				bodyText = DisplayName
			})
		end
	end
	return ReactModule.createElement(InfoCarousel, { LayoutOrder = Frame.LayoutOrder, data = List })
end