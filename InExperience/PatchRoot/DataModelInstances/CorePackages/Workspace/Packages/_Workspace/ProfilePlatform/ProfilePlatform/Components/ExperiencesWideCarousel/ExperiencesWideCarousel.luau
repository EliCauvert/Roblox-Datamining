local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local IXPService = game:GetService("IXPService")
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local CollectionCarousel = require(Parent.CollectionViews).CollectionCarousel
local CollectionHeader = require(Parent.CollectionViews).CollectionHeader
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local NetworkingGamesModule = require(ProfilePlatform.Networking.NetworkingGames)
local UseSendItemImpressionsModule = require(ProfilePlatform.Hooks.useSendItemImpressions)
local FormatExperienceDetailsForImpressionsModule = require(ProfilePlatform.Hooks.formatExperienceDetailsForImpressions)
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Common.Types)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactAnalyticsCommonGameEvents = require(Parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local OpenGameDetailsFunction = require(Parent.GameDetail).OpenGameDetails
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SetGameVotesFunction = require(Parent.GameVotesRodux).GameVotes.SetGameVotes
local Url = require(Parent.Http).Url
local MyRoduxNetworkingImplModule = require(ProfilePlatform.Networking.myRoduxNetworkingImpl)
local GameTileModule = require(Parent.GameTile)
local GameTileView = GameTileModule.GameTileView
local GameTileViewConfig = GameTileModule.GameTileViewConfig
local GameStats = GameTileModule.GameStats
local FormatExperienceThumbnailFunction = GameTileModule.formatExperienceThumbnail
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseTextSizeOffsetFunction = require(Parent.UIBlox).Core.Style.useTextSizeOffset
local ContentType = require(Parent.UnifiedLogging).ContentType
local ExperiencesOnProfileIxpEnabled = game:DefineFastFlag("ExperiencesOnProfileIxpEnabled", false)
local ExperiencesOnProfileIxpLayer = game:DefineFastString("ExperiencesOnProfileIxpLayer", "")
local t = {}

local function chunkList(p1, Amount: number) --[[ Line: 67 ]]
	local List = {}
	local Total = 1
	while Total <= #p1 do
		local List1 = {}
		
		for i = Total, math.min(Total + Amount - 1, #p1) do
			table.insert(List1, p1[i])
		end
		table.insert(List, List1)
		Total += Amount
	end
	return List
end

local function _(p2, p3) --[[ Line: 81 | Named "formatVotePercent" ]]
	local Largest = math.max(0, p2 or 0)
	local NewLargest = Largest + math.max(0, p3 or 0)
	
	return if NewLargest == 0 then nil else tostring((math.floor(Largest / NewLargest * 100 + 0.5))) .. "%"
end

local _ = function(Callback, p2) --[[ Line: 95 | Named "getGameVotes" ]]
	-- upvalues: Url (copy)
	return Callback(string.format("%sv1/games/%s/votes", Url.GAME_URL, p2), "GET")
end

return ReactModule.memo(function(p2) --[[ Line: 104 | Named "ExperiencesWideCarousel" ]]
	-- upvalues: UseDynamicSizeMarginModule (copy), UseDesignTokensFunction (copy), UseTextSizeOffsetFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), UseDispatchFunction (copy), UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), ProfilePlatform (copy), UseRoactServiceFunction (copy), RoactAnalyticsCommonGameEvents (copy), UseNavigationFunction (copy), UseSelectorFunction (copy), GetDeepValueModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), t (copy), chunkList (copy), NetworkingGamesModule (copy), MyRoduxNetworkingImplModule (copy), Url (copy), SetGameVotesFunction (copy), FormatExperienceDetailsForImpressionsModule (copy), UseSendItemImpressionsModule (copy), ContentType (copy), FormatExperienceThumbnailFunction (copy), GameStats (copy), GameTileView (copy), GameTileViewConfig (copy), AppPage (copy), OpenGameDetailsFunction (copy), ExperiencesOnProfileIxpEnabled (copy), IXPService (copy), ExperiencesOnProfileIxpLayer (copy), CollectionHeader (copy), CollectionCarousel (copy)
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseLocalizationResult = UseLocalizationFunction({ title = TextKeysModule.Experiences })
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseDispatchResult = UseDispatchFunction()
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local ProfileId = UseProfileWrapperContextModuleResult and UseProfileWrapperContextModuleResult.profileId
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalyticsCommonGameEvents)
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(function(p3) --[[ Line: 123 ]]
		-- upvalues: GetDeepValueModule (upval)
		return GetDeepValueModule(p3, "GameVotes") or {}
	end)
	local Experiences = (UseProfileJsonComponentModule(EnumsModule.Components.Experiences) or {}).experiences or {}
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 129 ]]
		-- upvalues: Experiences (copy)
		local List = {}
		
		for _, experience in ipairs(Experiences) do
			if experience.universeId ~= nil then
				table.insert(List, (tostring(experience.universeId)))
			end
		end
		return List
	end, { Experiences })
	ReactModule.useEffect(function() --[[ Line: 139 ]]
		-- upvalues: UseMemoResult (copy)
		if #UseMemoResult == 0 then return end
	end, { UseMemoResult })
	local UseSelectorResult1 = UseSelectorFunction(function(p3) --[[ Line: 145 ]]
		-- upvalues: GetDeepValueModule (upval)
		return GetDeepValueModule(p3, "ProfilePlatform.Games.byGameId") or {}
	end)
	local UseRefResult = ReactModule.useRef({ key = "", at = 0 })
	ReactModule.useEffect(function() --[[ Line: 154 ]]
		-- upvalues: UseMemoResult (copy), UseRefResult (copy), t (upval), UseSelectorResult1 (copy), chunkList (upval), UseDispatchResult (copy), NetworkingGamesModule (upval), UseSelectorResult (copy), MyRoduxNetworkingImplModule (upval), Url (upval), SetGameVotesFunction (upval)
		if #UseMemoResult == 0 then return end
		local ClockTime = os.clock()
		local Joined = table.concat(UseMemoResult, ",")
		local Current = UseRefResult.current
		
		if Joined == Current.key and ClockTime - Current.at < 2 then return end
		UseRefResult.current = { key = Joined, at = ClockTime }
		local List = {}
		
		for _, value in UseMemoResult do
			if not t[value] and UseSelectorResult1[value] == nil then
				table.insert(List, value)
			end
		end
		for _, value1 in chunkList(List, 10) do
			UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API(value1)):catch(function() --[[ Line: 179 ]]
				-- upvalues: value1 (copy), t (upval)
				for _, value in value1 do
					t[value] = true
				end
			end)
		end
		for i = 1, math.min(6, #UseMemoResult) do
			local UseMemoResultEntry = UseMemoResult[i]
			
			if UseSelectorResult[UseMemoResultEntry] == nil then
				MyRoduxNetworkingImplModule(string.format("%sv1/games/%s/votes", Url.GAME_URL, UseMemoResultEntry), "GET"):andThen(function(Result) --[[ Line: 192 ]]
					-- upvalues: UseDispatchResult (upval), SetGameVotesFunction (upval), UseMemoResultEntry (copy)
					local ResponseBody = Result.responseBody
					
					if ResponseBody ~= nil and ResponseBody.upVotes ~= nil and ResponseBody.downVotes ~= nil then
						UseDispatchResult(SetGameVotesFunction(UseMemoResultEntry, if ResponseBody.upVotes < 0 then 0 else ResponseBody.upVotes, if ResponseBody.downVotes < 0 then 0 else ResponseBody.downVotes))
					end
				end):catch(function() --[[ Line: 204 ]] end)
			end
		end
	end, { UseMemoResult, UseSelectorResult1, UseSelectorResult })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 209 ]]
		-- upvalues: UseMemoResult (copy), UseSelectorResult1 (copy)
		local List = {}
		
		for _, value in UseMemoResult do
			local UseSelectorResultEntry = UseSelectorResult1[value]
			
			if UseSelectorResultEntry then
				table.insert(List, UseSelectorResultEntry)
			end
		end
		return List
	end, { UseMemoResult, UseSelectorResult1 })
	local ExperiencesWideCarousel = UseSendItemImpressionsModule(ReactModule.useMemo(function() --[[ Line: 221 ]]
		-- upvalues: FormatExperienceDetailsForImpressionsModule (upval), UseMemoResult1 (copy)
		return FormatExperienceDetailsForImpressionsModule(UseMemoResult1)
	end, { UseMemoResult1 }), 2, ContentType.Game, 1, "ExperiencesWideCarousel")
	local UseResult = ReactModule.useCallback(function(ExperienceId, Position, p3, VotePercentage, p4, p5, p6) --[[ Line: 236 ]]
		-- upvalues: UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (copy), ProfileId (copy)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ExperienceOpened, {
			row = 1,
			section = "Experiences",
			layoutType = "Wide",
			profileUserId = ProfileId,
			experienceId = ExperienceId,
			position = Position,
			ccu = p3 or 0,
			votePercentage = VotePercentage,
			upVotes = p4 or 0,
			downVotes = p5 or 0,
			visits = p6 or 0
		})
	end, { UseProfileAnalyticsContextModuleResult, ProfileId })
	local UseResult1 = ReactModule.useCallback(function(p3, LayoutOrder, Size) --[[ Line: 265 ]]
		-- upvalues: FormatExperienceThumbnailFunction (upval), ReactModule (upval), GameStats (upval), UseSelectorResult (copy), GameTileView (upval), GameTileViewConfig (upval), UseResult (copy), UseMemoResult1 (copy), UseRoactServiceResult (copy), AppPage (upval), p2 (copy), UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseNavigationResult (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = Size,
			LayoutOrder = LayoutOrder
		}, {
			Tile = ReactModule.createElement(GameTileView, {
				isHovered = false,
				hidePlayButton = true,
				isContained = false,
				Size = UDim2.fromScale(1, 1),
				image = FormatExperienceThumbnailFunction(nil, p3.rootPlaceId),
				title = p3.name,
				imageAspectRatio = GameTileViewConfig.getImageAspectRatio("Wide"),
				footerMetadata = ReactModule.createElement(GameStats, {
					isGridTile = true,
					gameTileLayoutType = "Wide",
					stats = {
						playerCount = p3.playing or 0,
						totalUpVotes = UseSelectorResult[p3.experienceId] and UseSelectorResult[p3.experienceId].upVotes or 0,
						totalDownVotes = UseSelectorResult[p3.experienceId] and UseSelectorResult[p3.experienceId].downVotes or 0
					}
				}),
				onActivated = function() --[[ Line: 295 ]]
					-- upvalues: UseSelectorResult (upval), p3 (copy), UseResult (upval), LayoutOrder (copy), UseMemoResult1 (upval), UseRoactServiceResult (upval), AppPage (upval), p2 (upval), UseDispatchResult (upval), OpenGameDetailsFunction (upval), UseNavigationResult (upval)
					local UseSelectorResultEntry = UseSelectorResult[p3.experienceId]
					local Text = nil
					
					if UseSelectorResultEntry then
						local Largest = math.max(0, UseSelectorResultEntry.upVotes or 0)
						local NewLargest = Largest + math.max(0, UseSelectorResultEntry.downVotes or 0)
						Text = (if NewLargest == 0 then nil else tostring((math.floor(Largest / NewLargest * 100 + 0.5))) .. "%") or nil
					else
						Text = nil
					end
					UseResult(p3.experienceId, LayoutOrder, p3.playing, Text, UseSelectorResultEntry and UseSelectorResultEntry.upVotes or 0, UseSelectorResultEntry and UseSelectorResultEntry.downVotes or 0, 0)
					UseRoactServiceResult.reportOpenGameDetailFromProfile(p3.rootPlaceId, LayoutOrder, #UseMemoResult1, p3.experienceId, AppPage.ProfilePlatform, p2.layoutOrder, 1, nil)
					UseDispatchResult(OpenGameDetailsFunction(p3.experienceId, UseNavigationResult, { mountAsFullView = false, showBackButton = true }))
				end
			})
		}), "EXP_Tile"
	end, {
		UseResult, UseStateResult, UseDynamicSizeMarginModuleResult, UseDispatchResult,
		UseNavigationResult, UseRoactServiceResult, p2.layoutOrder, UseMemoResult1,
		UseSelectorResult
	})
	local UseResult2 = ReactModule.useCallback(function(p3) --[[ Line: 347 ]]
		-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy), GameTileViewConfig (upval), UseDesignTokensResult (copy), UseTextSizeOffsetResult (copy)
		if UseStateResult3 ~= p3 then
			UseStateResult2_2(p3)
		end
		return (GameTileViewConfig.getTileHeight(UseDesignTokensResult, p3, "Wide", false, false, false, UseTextSizeOffsetResult, nil, nil, nil, nil, nil))
	end, {
		UseDesignTokensResult,
		UseTextSizeOffsetResult,
		UseStateResult3
	})
	local UseResult3 = ReactModule.useCallback(function(p3, p4: number): number --[[ Line: 369 ]]
		return (math.max(1, (math.max(0, p3 - p4 * 2) - 12) / 2))
	end, {})
	ReactModule.useEffect(function() --[[ Line: 374 ]]
		-- upvalues: UseStateResult (copy), UseResult3 (copy), UseDynamicSizeMarginModuleResult (copy), UseMemoResult1 (copy), UseStateResult2_1 (copy)
		if UseStateResult > 0 then
			local UseResultResult: number = UseResult3(UseStateResult, UseDynamicSizeMarginModuleResult)
			UseStateResult2_1(if #UseMemoResult1 > 2 then math.clamp(60 / (UseResultResult + 12), 0, 0.5) else 0)
			
			return
		end
	end, {
		UseStateResult,
		UseDynamicSizeMarginModuleResult,
		UseMemoResult1,
		UseResult3
	})
	ReactModule.useEffect(function() --[[ Line: 389 ]]
		-- upvalues: UseMemoResult1 (copy), ExperiencesWideCarousel (copy)
		if #UseMemoResult1 > 0 then
			local List = {}
			
			for i = 1, math.min(2, #UseMemoResult1) do
				table.insert(List, i)
			end
			ExperiencesWideCarousel(List)
		end
	end, { UseMemoResult1, ExperiencesWideCarousel })
	ReactModule.useEffect(function() --[[ Line: 401 ]]
		-- upvalues: UseMemoResult1 (copy), ExperiencesOnProfileIxpEnabled (upval), IXPService (upval), ExperiencesOnProfileIxpLayer (upval)
		if #UseMemoResult1 > 0 and ExperiencesOnProfileIxpEnabled then
			IXPService:LogFlagLinkedUserLayerExposure(ExperiencesOnProfileIxpLayer)
		end
	end, { UseMemoResult1 })
	
	return if #UseMemoResult1 == 0 then nil else ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p2.layoutOrder,
		[ReactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 417 ]]
			-- upvalues: UseDynamicSizeMarginModuleResult2 (copy), UseStateResult2 (copy)
			UseDynamicSizeMarginModuleResult2(Frame)
			UseStateResult2(Frame.AbsoluteSize.X)
		end
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 16)
		}),
		Header = ReactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIPadding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, UseDynamicSizeMarginModuleResult),
				PaddingRight = UDim.new(0, UseDynamicSizeMarginModuleResult)
			}),
			Content = ReactModule.createElement(CollectionHeader, {
				LayoutOrder = 1,
				hideButton = true,
				title = UseLocalizationResult.title
			})
		}),
		CollectionCarousel = ReactModule.createElement(CollectionCarousel, {
			LayoutOrder = 2,
			title = nil,
			numColumns = 2,
			columnGap = 12,
			items = UseMemoResult1,
			renderItem = UseResult1,
			getItemHeight = UseResult2,
			fractionalItemAmount = #UseMemoResult1 > 2 and UseStateResult1 or 0,
			sideMargin = UseDynamicSizeMarginModuleResult
		})
	})
end)