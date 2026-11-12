local DiscoveryAnalytics = script:FindFirstAncestor("DiscoveryAnalytics")
local Parent = DiscoveryAnalytics.Parent
local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")
local Context = require(DiscoveryAnalytics.Constants).Context
local ButtonClickModule = require(Parent.Analytics.buttonClick)
local GameDetailReferralModule = require(DiscoveryAnalytics.Events.gameDetailReferral)
local GamePlayIntentModule = require(DiscoveryAnalytics.Events.gamePlayIntent)
local JoinGameInPlacesListModule = require(DiscoveryAnalytics.Events.joinGameInPlacesList)
local OpenModalFromGameTileModule = require(DiscoveryAnalytics.Events.openModalFromGameTile)
local PeopleListInteractionV2Module = require(DiscoveryAnalytics.Events.peopleListInteractionV2)
local PeopleListViewGameDetailModule = require(DiscoveryAnalytics.Events.peopleListViewGameDetail)
local TouchSwipeModule = require(DiscoveryAnalytics.Events.touchSwipe)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local RobloxAppSessionizationModule = require(Parent.RobloxAppSessionization)
local SessionType = RobloxAppSessionizationModule.SessionType
local SetGamePlaySessionFunction = RobloxAppSessionizationModule.SetGamePlaySession
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagProfilePlatformFavoritesEnableGameDetailAnalytics = SharedFlagsModule.FFlagProfilePlatformFavoritesEnableGameDetailAnalytics
local FFlagProfilePlatformImproveGameDetailsAnalytics = SharedFlagsModule.FFlagProfilePlatformImproveGameDetailsAnalytics
local FFlagEnableTopSongsSort = SharedFlagsModule.FFlagEnableTopSongsSort
local FFlagLuaAppSduiHomePageSupport = SharedFlagsModule.FFlagLuaAppSduiHomePageSupport

return {
	get = function(p1, p2, p3)
		-- upvalues: AppPage (copy), FFlagEnableTopSongsSort (copy), FFlagLuaAppSduiHomePageSupport (copy), SetGamePlaySessionFunction (copy), SessionType (copy), LocalizationService (copy), GameDetailReferralModule (copy), FFlagProfilePlatformFavoritesEnableGameDetailAnalytics (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (copy), PeopleListInteractionV2Module (copy), PeopleListViewGameDetailModule (copy), Players (copy), Context (copy), GamePlayIntentModule (copy), JoinGameInPlacesListModule (copy), OpenModalFromGameTileModule (copy), ButtonClickModule (copy), TouchSwipeModule (copy)
		local config = {
			[AppPage.Home] = "home",
			[AppPage.Games] = "games",
			[AppPage.SearchPage] = "gameSearch",
			[AppPage.GameDetail] = "gameDetails",
			[AppPage.Chat] = "chat",
			[AppPage.SongDetail] = if FFlagEnableTopSongsSort then "songDetails" else nil,
			ChartsSortDetail = "games",
			HomeSortDetail = if FFlagLuaAppSduiHomePageSupport then "home" else nil
		}
		
		local function _(p4)
			-- upvalues: config (copy)
			local Entry = config[p4]
			
			return if Entry then Entry else p4
		end
		
		local _ = function()
			-- upvalues: SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval)
			SetGamePlaySessionFunction(p1, SessionType.StructuralIdentifier.GameDetailSource, false)
		end
		
		local _ = function()
			-- upvalues: SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval)
			SetGamePlaySessionFunction(p1, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
		end
		
		local function reportGameDetailReferralWithId(Pg, Pid, GameSetTypeId, GameSetTargetId, SortPos, Pos, Tis, IsAd, p4, UniverseId, NavigationUniverseId, AppliedFilters, p5, IsSdui, PositionInRow, RowNumber, RowOnPage, HeroUnitId, LoadSource, TileType, SortSubId, AnalyticsData, p6)
			-- upvalues: LocalizationService (upval), SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval), GameDetailReferralModule (upval), p3 (copy)
			local RobloxLocaleId = LocalizationService.RobloxLocaleId
			local P18 = p4 or ""
			SetGamePlaySessionFunction(p1, SessionType.StructuralIdentifier.GameDetailSource, false)
			GameDetailReferralModule(p3, Pg, {
				pg = Pg,
				tis = Tis,
				sortPos = SortPos,
				pid = Pid,
				ad = if IsAd then "yes" else "no",
				isAd = IsAd,
				nativeAdData = P18,
				universeId = UniverseId,
				navigationUniverseId = NavigationUniverseId,
				pos = Pos,
				gameSetTypeId = GameSetTypeId,
				gameSetTargetId = GameSetTargetId,
				locale = RobloxLocaleId,
				appliedFilters = AppliedFilters,
				topicDataPosition = p5 or Pos,
				isSdui = IsSdui,
				positionInRow = PositionInRow,
				rowNumber = RowNumber,
				rowOnPage = RowOnPage,
				heroUnitId = HeroUnitId,
				loadSource = LoadSource,
				tileType = TileType,
				sortSubId = SortSubId,
				analyticsData = AnalyticsData,
				seeAllFlag = p6 or 0
			})
		end
		
		local config1 = {
			reportSeeAllWithId = function(p4, GameSetTargetId, p5)
				-- upvalues: p3 (copy)
				p3:setRBXEventStream("SeeAll", "gamesPageInteraction", {
					aType = "touch",
					aValue = tostring(p4),
					gameSetTargetId = GameSetTargetId,
					pos = tonumber(p5)
				})
			end,
			reportFilterChangeWithId = function(p4, GameSetTargetId, p5)
				-- upvalues: p3 (copy)
				p3:setRBXEventStream("SFMenu", "gamesPageInteraction", {
					aType = "touch",
					aValue = tostring(p4),
					gameSetTargetId = GameSetTargetId,
					pos = tonumber(p5)
				})
			end,
			reportOpenGameDetailWithId = function(Pid, GameSetTypeId, GameSetTargetId, SortPos, Pos, Tis, IsAd, p4, UniverseId, p5, NavigationUniverseId, AppliedFilters, p6, IsSdui, PositionInRow, RowNumber, RowOnPage, HeroUnitId, LoadSource, TileType, SortSubId, AnalyticsData, p7)
				-- upvalues: reportGameDetailReferralWithId (copy), config (copy)
				local Entry = config[p5]
				reportGameDetailReferralWithId(if Entry then Entry else p5, Pid, GameSetTypeId, GameSetTargetId, SortPos, Pos, Tis, IsAd, p4 or "", UniverseId, NavigationUniverseId, AppliedFilters, p6, IsSdui, PositionInRow, RowNumber, RowOnPage, HeroUnitId, LoadSource, TileType, SortSubId, AnalyticsData, p7)
			end,
			reportOpenGameDetailFromGameDetail = function(Pid, Pos, Tis, p4, p5, UniverseId, p6, RefId)
				-- upvalues: config (copy), GameDetailReferralModule (upval), p3 (copy)
				local Entry = config[p6]
				local Entry1 = if Entry then Entry else p6
				GameDetailReferralModule(p3, Entry1, {
					sortPos = 0,
					src = "recommended",
					pg = Entry1,
					pos = Pos,
					tis = Tis,
					refId = RefId,
					pid = Pid,
					ad = if p4 then "yes" else "no",
					nativeAdData = p5 or "",
					universeId = UniverseId
				})
			end
		}
		
		if FFlagProfilePlatformFavoritesEnableGameDetailAnalytics then
			function config1.reportOpenGameDetailFromProfile(Pid, Pos, Tis, UniverseId, p4, SortPos, RowOnPage, p5)
				-- upvalues: config (copy), SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), GameDetailReferralModule (upval), p3 (copy)
				local Entry = config[p4]
				local Entry1 = if Entry then Entry else p4
				SetGamePlaySessionFunction(p1, SessionType.StructuralIdentifier.GameDetailSource, false)
				GameDetailReferralModule(p3, Entry1, {
					ad = "no",
					friendId = if FFlagProfilePlatformImproveGameDetailsAnalytics then p5 else nil,
					pg = Entry1,
					pid = Pid,
					pos = Pos,
					rowOnPage = RowOnPage,
					sortPos = SortPos,
					tis = Tis,
					universeId = UniverseId
				})
			end
		end
		if FFlagProfilePlatformImproveGameDetailsAnalytics then
			function config1.reportOpenGameDetailFromProfileContext(Pid, UniverseId, p4, FriendId, p5)
				-- upvalues: SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval), config (copy), GameDetailReferralModule (upval), p3 (copy)
				SetGamePlaySessionFunction(p1, SessionType.StructuralIdentifier.GameDetailSource, false)
				local Entry = config[p4]
				GameDetailReferralModule(p3, p5, {
					ad = "no",
					friendId = FriendId,
					pg = if Entry then Entry else p4,
					pid = Pid,
					universeId = UniverseId
				})
			end
		end
		function config1.reportOpenGameDetailFromSearch(Pid, Pos, Tis, p4, p5, UniverseId, p6, SortPos, GameSetTypeId, RowOnPage, p7, TileType, p8)
			-- upvalues: config (copy), SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval), GameDetailReferralModule (upval), p3 (copy)
			local Entry = config[p6]
			local Entry1 = if Entry then Entry else p6
			local P81 = p5 or ""
			SetGamePlaySessionFunction(p1, SessionType.StructuralIdentifier.GameDetailSource, false)
			local Entry2 = config[p6]
			GameDetailReferralModule(p3, Entry1, {
				pg = if Entry2 then Entry2 else p6,
				tis = Tis,
				pid = Pid,
				ad = if p4 then "yes" else "no",
				nativeAdData = P81,
				universeId = UniverseId,
				pos = Pos,
				sortPos = SortPos,
				gameSetTypeId = GameSetTypeId,
				rowOnPage = RowOnPage,
				topicDataPosition = p7 or Pos,
				tileType = TileType,
				seeAllFlag = p8 or 0
			})
		end
		
		function config1.reportOpenGameDetailFromPeopleList(FriendId, Position, AbsolutePosition, Pid, UniverseId, FromWhere, p4)
			-- upvalues: AppPage (upval), config (copy), SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval), GameDetailReferralModule (upval), p3 (copy)
			local Home = AppPage.Home
			local Entry = config[Home]
			local Entry1 = if Entry then Entry else Home
			SetGamePlaySessionFunction(p1, SessionType.StructuralIdentifier.GameDetailSource, false)
			GameDetailReferralModule(p3, p4, {
				pg = Entry1,
				friendId = FriendId,
				position = Position,
				absolutePosition = AbsolutePosition,
				pid = Pid,
				universeId = UniverseId,
				fromWhere = FromWhere
			})
		end
		
		function config1.reportOpenGameDetailFromChat(Pid, ConversationId, UniverseId, p4)
			-- upvalues: AppPage (upval), config (copy), SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval), GameDetailReferralModule (upval), p3 (copy)
			local Chat = AppPage.Chat
			local Entry = config[Chat]
			local Entry1 = if Entry then Entry else Chat
			SetGamePlaySessionFunction(p1, SessionType.StructuralIdentifier.GameDetailSource, false)
			GameDetailReferralModule(p3, p4, {
				pg = Entry1,
				pid = Pid,
				universeId = UniverseId,
				conversationId = ConversationId
			})
		end
		
		function config1.reportPeopleListInteraction(p4, p5, p6, p7, p8, p9)
			-- upvalues: PeopleListInteractionV2Module (upval), p2 (copy)
			PeopleListInteractionV2Module(p2.EventStream, p4, p5, p6, p8, p7, p9)
		end
		
		function config1.reportViewProfileFromPeopleList(p4, p5, p6, p7, p8)
			-- upvalues: PeopleListViewGameDetailModule (upval), p2 (copy)
			PeopleListViewGameDetailModule(p2.EventStream, p4, p5, p6, p7, p8)
		end
		
		function config1.reportPeopleListJoinGame(FriendId, Position, AbsolutePosition, PlaceId, RootPlaceId, GameInstanceId, InGameFriendCount, JoinAttemptId, Source)
			-- upvalues: SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval), Players (upval), p3 (copy), Context (upval), GamePlayIntentModule (upval)
			SetGamePlaySessionFunction(p1, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
			p3:setRBXEventStream("contactFriendFinder", "joinGameInPeopleList", {
				uid = tostring(Players.LocalPlayer.UserId),
				friendId = FriendId,
				position = Position,
				absolutePosition = AbsolutePosition,
				rootPlaceId = RootPlaceId,
				gameInstanceId = GameInstanceId,
				inGameFriendCount = InGameFriendCount,
				joinAttemptId = JoinAttemptId,
				source = Source
			})
			GamePlayIntentModule(p3, Context.PeopleListInHomePage, {
				placeId = PlaceId,
				rootPlaceId = RootPlaceId,
				joinAttemptId = JoinAttemptId,
				friendId = FriendId
			})
		end
		
		function config1.reportJoinGameInPlacesList(FriendId, PlaceId, RootPlaceId, p4, JoinAttemptId)
			-- upvalues: JoinGameInPlacesListModule (upval), p2 (copy), Context (upval), GamePlayIntentModule (upval), p3 (copy)
			JoinGameInPlacesListModule(p2.EventStream, FriendId, PlaceId, RootPlaceId, p4, JoinAttemptId)
			GamePlayIntentModule(p3, Context.GamePlayIntentInPlacesList, {
				placeId = PlaceId,
				rootPlaceId = RootPlaceId,
				joinAttemptId = JoinAttemptId,
				friendId = FriendId
			})
		end
		
		if FFlagEnableTopSongsSort then
			function config1.reportOpenGameDetailFromSongDetail(Pid, Pos, Tis, p4, p5, UniverseId, p6, RefSongId)
				-- upvalues: SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval), config (copy), GameDetailReferralModule (upval), p3 (copy)
				SetGamePlaySessionFunction(p1, SessionType.StructuralIdentifier.GameDetailSource, false)
				local Entry = config[p6]
				local Entry1 = if Entry then Entry else p6
				GameDetailReferralModule(p3, Entry1, {
					sortPos = 0,
					src = "songDetails",
					pg = Entry1,
					pos = Pos,
					tis = Tis,
					refSongId = RefSongId,
					pid = Pid,
					ad = if p4 then "yes" else "no",
					nativeAdData = p5 or "",
					universeId = UniverseId
				})
			end
		end
		function config1.reportOpenModalFromGameTileForPlacesList(p4)
			-- upvalues: OpenModalFromGameTileModule (upval), p2 (copy)
			OpenModalFromGameTileModule(p2.EventStream, p4)
		end
		
		function config1.reportButtonClicked(p4, p5)
			-- upvalues: ButtonClickModule (upval), p2 (copy)
			ButtonClickModule(p2.EventStream, p4, p5)
		end
		
		function config1.reportTouchSearchInsteadForPlayerNamed(p4, p5)
			-- upvalues: ButtonClickModule (upval), p2 (copy), config (copy)
			local Entry = config[p5]
			ButtonClickModule(p2.EventStream, if Entry then Entry else p5, "searchInsteadForPlayerNamed", p4)
		end
		
		function config1.reportTouchSwipe(p4, p5, p6, p7)
			-- upvalues: TouchSwipeModule (upval), p2 (copy)
			TouchSwipeModule(p2.EventStream, p4, p5, p6, p7)
		end
		
		return config1
	end
}