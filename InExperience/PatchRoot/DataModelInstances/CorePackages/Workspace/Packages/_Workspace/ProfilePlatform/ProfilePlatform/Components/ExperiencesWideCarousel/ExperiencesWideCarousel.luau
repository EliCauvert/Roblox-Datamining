local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local IXPService = game:GetService("IXPService")
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local collectionCarousel = require(parent.CollectionViews).CollectionCarousel
local collectionHeader = require(parent.CollectionViews).CollectionHeader
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local networkingGamesModule = require(profilePlatform.Networking.NetworkingGames)
local useSendItemImpressionsModule = require(profilePlatform.Hooks.useSendItemImpressions)
local formatExperienceDetailsForImpressionsModule = require(profilePlatform.Hooks.formatExperienceDetailsForImpressions)
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Common.Types)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactAnalyticsCommonGameEvents = require(parent.RoactServiceTags).RoactAnalyticsCommonGameEvents
local useNavigation = require(parent.Navigation).useNavigation
local openGameDetails = require(parent.GameDetail).OpenGameDetails
local appPage = require(parent.RobloxAppEnums).AppPage
local setGameVotes = require(parent.GameVotesRodux).GameVotes.SetGameVotes
local url = require(parent.Http).Url
local myRoduxNetworkingImplModule = require(profilePlatform.Networking.myRoduxNetworkingImpl)
local gameTileModule = require(parent.GameTile)
local gameTileView = gameTileModule.GameTileView
local gameTileViewConfig = gameTileModule.GameTileViewConfig
local gameStats = gameTileModule.GameStats
local formatExperienceThumbnail = gameTileModule.formatExperienceThumbnail
local useDesignTokens = require(parent.Style).useDesignTokens
local useTextSizeOffset = require(parent.UIBlox).Core.Style.useTextSizeOffset
local contentType = require(parent.UnifiedLogging).ContentType
local experiencesOnProfileIxpEnabled = game:DefineFastFlag("ExperiencesOnProfileIxpEnabled", false)
local experiencesOnProfileIxpLayer = game:DefineFastString("ExperiencesOnProfileIxpLayer", "")
local t = {}

local function chunkList(p0, p1) --[[ line: 67 ]]
	local t = {}
	local var21 = 1
	while var21 <= #p0 do
		local t_1 = {}
		
		for i = var21, math.min(var21 + p1 - 1, #p0) do
			table.insert(t_1, p0[i])
		end
		table.insert(t, t_1)
		var21 += p1
	end
	return t
end

local function _(p2, p3) --[[ line: 81 | named "formatVotePercent" ]]
	local maxValue = math.max(0, p2 or 0)
	local var24 = maxValue + math.max(0, p3 or 0)
	
	return if var24 == 0 then nil else tostring(math.floor(maxValue / var24 * 100 + 0.5)) .. "%"
end

local _ = function(p4, p5) --[[ line: 95 | named "getGameVotes" ]]
	-- upvalues: url (ref)
	return p4(string.format("%sv1/games/%s/votes", url.GAME_URL, p5), "GET")
end

return reactModule.memo(function(p6) --[[ line: 104 | named "ExperiencesWideCarousel" ]]
	-- upvalues: useDynamicSizeMarginModule (ref), useDesignTokens (ref), useTextSizeOffset (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), useDispatch (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), profilePlatform (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), useNavigation (ref), useSelector (ref), getDeepValueModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), t (ref), chunkList (ref), networkingGamesModule (ref), myRoduxNetworkingImplModule (ref), url (ref), setGameVotes (ref), formatExperienceDetailsForImpressionsModule (ref), useSendItemImpressionsModule (ref), contentType (ref), formatExperienceThumbnail (ref), gameStats (ref), gameTileView (ref), gameTileViewConfig (ref), appPage (ref), openGameDetails (ref), experiencesOnProfileIxpEnabled (ref), IXPService (ref), experiencesOnProfileIxpLayer (ref), collectionHeader (ref), collectionCarousel (ref)
	local var25, var26 = useDynamicSizeMarginModule()
	local var27 = useDesignTokens()
	local var28 = useTextSizeOffset()
	local var29 = useLocalization({ title = textKeysModule.Experiences })
	local var30, var31 = reactModule.useState(0)
	local var32, var33 = reactModule.useState(0)
	local var34, var35 = reactModule.useState(0)
	local var36 = useDispatch()
	local var37 = useProfileWrapperContextModule()
	local profileId = var37 and var37.profileId
	local var39 = useProfileAnalyticsContextModule()
	local eventNamesModule = require(profilePlatform.Analytics.EventNames)
	local var41 = useRoactService(roactAnalyticsCommonGameEvents)
	local var42 = useNavigation()
	local var43 = useSelector(function(p7) --[[ line: 123 ]]
		-- upvalues: getDeepValueModule (copy)
		return getDeepValueModule(p7, "GameVotes") or {}
	end)
	local experiences = (useProfileJsonComponentModule(enumsModule.Components.Experiences) or {}).experiences or {}
	local var45 = reactModule.useMemo(function() --[[ line: 129 ]]
		-- upvalues: experiences (ref)
		local t = {}
		
		for i, v in ipairs(experiences) do
			if v.universeId ~= nil then
				table.insert(t, tostring(v.universeId))
			end
		end
		return t
	end, { experiences })
	reactModule.useEffect(function() --[[ line: 139 ]]
		-- upvalues: var45 (ref)
		if #var45 == 0 then
			return
		end
	end, { var45 })
	local var46 = useSelector(function(p8) --[[ line: 145 ]]
		-- upvalues: getDeepValueModule (copy)
		return getDeepValueModule(p8, "ProfilePlatform.Games.byGameId") or {}
	end)
	local var47 = reactModule.useRef({ key = "", at = 0 })
	reactModule.useEffect(function() --[[ line: 154 ]]
		-- upvalues: var45 (ref), var47 (ref), t (copy), var46 (ref), chunkList (copy), var36 (ref), networkingGamesModule (copy), var43 (ref), myRoduxNetworkingImplModule (copy), url (copy), setGameVotes (copy)
		if #var45 == 0 then return end
		local processTime = os.clock()
		local joined = table.concat(var45, ",")
		local current = var47.current
		
		if joined == current.key and processTime - current.at < 2 then return end
		var47.current = { key = joined, at = processTime }
		local t_1 = {}
		
		for i, v in var45 do
			if not t[v] and var46[v] == nil then
				table.insert(t_1, v)
			end
		end
		for i_1, v_1 in chunkList(t_1, 10) do
			var36(networkingGamesModule.GetExperiencesDetails.API(v_1)):catch(function() --[[ line: 179 ]]
				-- upvalues: v_1 (ref), t (copy)
				for i, v in v_1 do
					t[v] = true
				end
			end)
		end
		for i_2 = 1, math.min(6, #var45) do
			local var58 = var45[i_2]
			
			if var43[var58] == nil then
				myRoduxNetworkingImplModule(string.format("%sv1/games/%s/votes", url.GAME_URL, var58), "GET"):andThen(function(p9) --[[ line: 192 ]]
					-- upvalues: var36 (copy), setGameVotes (copy), var58 (ref)
					local responseBody = p9.responseBody
					
					if responseBody ~= nil and responseBody.upVotes ~= nil and responseBody.downVotes ~= nil then
						var36(setGameVotes(var58, if responseBody.upVotes < 0 then 0 else responseBody.upVotes, if responseBody.downVotes < 0 then 0 else responseBody.downVotes))
					end
				end):catch(function() --[[ line: 204 ]] end)
			end
		end
	end, { var45, var46, var43 })
	local var48 = reactModule.useMemo(function() --[[ line: 209 ]]
		-- upvalues: var45 (ref), var46 (ref)
		local t = {}
		
		for i, v in var45 do
			local var60 = var46[v]
			
			if var60 then
				table.insert(t, var60)
			end
		end
		return t
	end, { var45, var46 })
	local var49 = useSendItemImpressionsModule(reactModule.useMemo(function() --[[ line: 221 ]]
		-- upvalues: formatExperienceDetailsForImpressionsModule (copy), var48 (ref)
		return formatExperienceDetailsForImpressionsModule(var48)
	end, { var48 }), 2, contentType.Game, 1, "ExperiencesWideCarousel")
	local var50 = reactModule.useCallback(function(p10, p11, p12, p13, p14, p15, p16) --[[ line: 236 ]]
		-- upvalues: var39 (ref), eventNamesModule (ref), profileId (ref)
		var39.fireAnalyticsEvent(eventNamesModule.ExperienceOpened, {
			row = 1,
			section = "Experiences",
			layoutType = "Wide",
			profileUserId = profileId,
			experienceId = p10,
			position = p11,
			ccu = p12 or 0,
			votePercentage = p13,
			upVotes = p14 or 0,
			downVotes = p15 or 0,
			visits = p16 or 0
		})
	end, { var39, profileId })
	local var51 = reactModule.useCallback(function(p17, p18, p19) --[[ line: 265 ]]
		-- upvalues: formatExperienceThumbnail (copy), reactModule (copy), gameStats (copy), var43 (ref), gameTileView (copy), gameTileViewConfig (copy), var50 (ref), var48 (ref), var41 (ref), appPage (copy), p6 (ref), var36 (ref), openGameDetails (copy), var42 (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p19,
			LayoutOrder = p18
		}, {
			Tile = reactModule.createElement(gameTileView, {
				isHovered = false,
				hidePlayButton = true,
				isContained = false,
				Size = UDim2.fromScale(1, 1),
				image = formatExperienceThumbnail(nil, p17.rootPlaceId),
				title = p17.name,
				imageAspectRatio = gameTileViewConfig.getImageAspectRatio("Wide"),
				footerMetadata = reactModule.createElement(gameStats, {
					isGridTile = true,
					gameTileLayoutType = "Wide",
					stats = {
						playerCount = p17.playing or 0,
						totalUpVotes = if var43[p17.experienceId] then var43[p17.experienceId].upVotes else 0,
						totalDownVotes = if var43[p17.experienceId] then var43[p17.experienceId].downVotes else 0
					}
				}),
				onActivated = function() --[[ line: 295 ]]
					-- upvalues: var43 (copy), p17 (ref), var50 (copy), p18 (ref), var48 (copy), var41 (copy), appPage (copy), p6 (copy), var36 (copy), openGameDetails (copy), var42 (copy)
					local var63
					local experienceId = var43[p17.experienceId]
					
					if experienceId then
						local maxValue = math.max(0, experienceId.upVotes or 0)
						local var62 = maxValue + math.max(0, experienceId.downVotes or 0)
						var63 = (if var62 == 0 then nil else tostring(math.floor(maxValue / var62 * 100 + 0.5)) .. "%") or nil
					end
					var50(p17.experienceId, p18, p17.playing, var63, if experienceId then experienceId.upVotes else 0, if experienceId then experienceId.downVotes else 0, 0)
					var41.reportOpenGameDetailFromProfile(p17.rootPlaceId, p18, #var48, p17.experienceId, appPage.ProfilePlatform, p6.layoutOrder, 1, nil)
					var36(openGameDetails(p17.experienceId, var42, { mountAsFullView = false, showBackButton = true }))
				end
			})
		}), "EXP_Tile"
	end, {
		var50, var30, var25, var36, var42, var41, p6.layoutOrder, var48, var43
	})
	local var52 = reactModule.useCallback(function(p20) --[[ line: 347 ]]
		-- upvalues: var34 (ref), var35 (ref), gameTileViewConfig (copy), var27 (ref), var28 (ref)
		if var34 ~= p20 then
			var35(p20)
		end
		return gameTileViewConfig.getTileHeight(var27, p20, "Wide", false, false, false, var28, nil, nil, nil, nil, nil)
	end, { var27, var28, var34 })
	local var53 = reactModule.useCallback(function(p21, p22) --[[ line: 369 ]]
		return math.max(1, (math.max(0, p21 - p22 * 2) - 12) / 2)
	end, {})
	reactModule.useEffect(function() --[[ line: 374 ]]
		-- upvalues: var30 (ref), var53 (ref), var25 (ref), var48 (ref), var33 (ref)
		if var30 <= 0 then
			return
		end
		var33(if #var48 > 2 then math.clamp(60 / (var53(var30, var25) + 12), 0, 0.5) else 0)
	end, { var30, var25, var48, var53 })
	reactModule.useEffect(function() --[[ line: 389 ]]
		-- upvalues: var48 (ref), var49 (ref)
		if #var48 > 0 then
			local t = {}
			
			for i = 1, math.min(2, #var48) do
				table.insert(t, i)
			end
			var49(t)
		end
	end, { var48, var49 })
	reactModule.useEffect(function() --[[ line: 401 ]]
		-- upvalues: var48 (ref), experiencesOnProfileIxpEnabled (copy), IXPService (copy), experiencesOnProfileIxpLayer (copy)
		if #var48 > 0 and experiencesOnProfileIxpEnabled then
			IXPService:LogFlagLinkedUserLayerExposure(experiencesOnProfileIxpLayer)
		end
	end, { var48 })
	
	return if #var48 == 0 then nil else reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p6.layoutOrder,
		[reactModule.Change.AbsoluteSize] = function(p23) --[[ line: 417 ]]
			-- upvalues: var26 (ref), var31 (ref)
			var26(p23)
			var31(p23.AbsoluteSize.X)
		end
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 16)
		}),
		Header = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var25),
				PaddingRight = UDim.new(0, var25)
			}),
			Content = reactModule.createElement(collectionHeader, { LayoutOrder = 1, hideButton = true, title = var29.title })
		}),
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 2,
			title = nil,
			numColumns = 2,
			columnGap = 12,
			items = var48,
			renderItem = var51,
			getItemHeight = var52,
			fractionalItemAmount = if #var48 > 2 then var32 else 0,
			sideMargin = var25
		})
	})
end)