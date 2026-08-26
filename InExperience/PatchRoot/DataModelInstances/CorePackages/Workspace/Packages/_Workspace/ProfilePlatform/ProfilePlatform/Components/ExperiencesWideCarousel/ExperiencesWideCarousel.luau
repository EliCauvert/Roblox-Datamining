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

local function chunkList(p1, p2)
	local t = {}
	local var1 = 1
	while var1 <= #p1 do
		local t_1 = {}
		
		for i = var1, math.min(var1 + p2 - 1, #p1) do
			table.insert(t_1, p1[i])
		end
		table.insert(t, t_1)
		var1 += p2
	end
	return t
end

local function _(p3, p4)
	local maxValue = math.max(0, p3 or 0)
	local var2 = maxValue + math.max(0, p4 or 0)
	
	return if var2 == 0 then nil else tostring(math.floor(maxValue / var2 * 100 + 0.5)) .. "%"
end

local _ = function(p3, p4)
	-- upvalues: url (ref)
	return p3(string.format("%sv1/games/%s/votes", url.GAME_URL, p4), "GET")
end

return reactModule.memo(function(p3)
	-- upvalues: useDynamicSizeMarginModule (ref), useDesignTokens (ref), useTextSizeOffset (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), useDispatch (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), profilePlatform (ref), useRoactService (ref), roactAnalyticsCommonGameEvents (ref), useNavigation (ref), useSelector (ref), getDeepValueModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), t (ref), chunkList (ref), networkingGamesModule (ref), myRoduxNetworkingImplModule (ref), url (ref), setGameVotes (ref), formatExperienceDetailsForImpressionsModule (ref), useSendItemImpressionsModule (ref), contentType (ref), formatExperienceThumbnail (ref), gameStats (ref), gameTileView (ref), gameTileViewConfig (ref), appPage (ref), openGameDetails (ref), experiencesOnProfileIxpEnabled (ref), IXPService (ref), experiencesOnProfileIxpLayer (ref), collectionHeader (ref), collectionCarousel (ref)
	local var2, var3 = useDynamicSizeMarginModule()
	local var4 = useDesignTokens()
	local var5 = useTextSizeOffset()
	local var6 = useLocalization({ title = textKeysModule.Experiences })
	local var7, var8 = reactModule.useState(0)
	local var9, var10 = reactModule.useState(0)
	local var11, var12 = reactModule.useState(0)
	local var13 = useDispatch()
	local var14 = useProfileWrapperContextModule()
	local profileId = var14 and var14.profileId
	local var15 = useProfileAnalyticsContextModule()
	local eventNamesModule = require(profilePlatform.Analytics.EventNames)
	local var16 = useRoactService(roactAnalyticsCommonGameEvents)
	local var17 = useNavigation()
	local var18 = useSelector(function(p4)
		-- upvalues: getDeepValueModule (copy)
		return getDeepValueModule(p4, "GameVotes") or {}
	end)
	local experiences = (useProfileJsonComponentModule(enumsModule.Components.Experiences) or {}).experiences or {}
	local var19 = reactModule.useMemo(function()
		-- upvalues: experiences (ref)
		local t = {}
		
		for i, v in ipairs(experiences) do
			if v.universeId ~= nil then
				table.insert(t, tostring(v.universeId))
			end
		end
		return t
	end, { experiences })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref)
		if #var19 == 0 then
			return
		end
	end, { var19 })
	local var20 = useSelector(function(p4)
		-- upvalues: getDeepValueModule (copy)
		return getDeepValueModule(p4, "ProfilePlatform.Games.byGameId") or {}
	end)
	local var21 = reactModule.useRef({ key = "", at = 0 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var21 (ref), t (copy), var20 (ref), chunkList (copy), var13 (ref), networkingGamesModule (copy), var18 (ref), myRoduxNetworkingImplModule (copy), url (copy), setGameVotes (copy)
		if #var19 == 0 then return end
		local processTime = os.clock()
		local joined = table.concat(var19, ",")
		local current = var21.current
		
		if joined == current.key and processTime - current.at < 2 then return end
		var21.current = { key = joined, at = processTime }
		local t_1 = {}
		
		for i, v in var19 do
			if not t[v] and var20[v] == nil then
				table.insert(t_1, v)
			end
		end
		for i_1, v_1 in chunkList(t_1, 10) do
			var13(networkingGamesModule.GetExperiencesDetails.API(v_1)):catch(function()
				-- upvalues: v_1 (ref), t (copy)
				for i, v in v_1 do
					t[v] = true
				end
			end)
		end
		for i_2 = 1, math.min(6, #var19) do
			local var22 = var19[i_2]
			
			if var18[var22] == nil then
				myRoduxNetworkingImplModule(string.format("%sv1/games/%s/votes", url.GAME_URL, var22), "GET"):andThen(function(p4)
					-- upvalues: var13 (copy), setGameVotes (copy), var22 (ref)
					local responseBody = p4.responseBody
					
					if responseBody ~= nil and responseBody.upVotes ~= nil and responseBody.downVotes ~= nil then
						var13(setGameVotes(var22, if responseBody.upVotes < 0 then 0 else responseBody.upVotes, if responseBody.downVotes < 0 then 0 else responseBody.downVotes))
					end
				end):catch(function() end)
			end
		end
	end, { var19, var20, var18 })
	local var23 = reactModule.useMemo(function()
		-- upvalues: var19 (ref), var20 (ref)
		local t = {}
		
		for i, v in var19 do
			local var24 = var20[v]
			
			if var24 then
				table.insert(t, var24)
			end
		end
		return t
	end, { var19, var20 })
	local var25 = useSendItemImpressionsModule(reactModule.useMemo(function()
		-- upvalues: formatExperienceDetailsForImpressionsModule (copy), var23 (ref)
		return formatExperienceDetailsForImpressionsModule(var23)
	end, { var23 }), 2, contentType.Game, 1, "ExperiencesWideCarousel")
	local var26 = reactModule.useCallback(function(p4, p5, p6, p7, p8, p9, p10)
		-- upvalues: var15 (ref), eventNamesModule (ref), profileId (ref)
		var15.fireAnalyticsEvent(eventNamesModule.ExperienceOpened, {
			row = 1,
			section = "Experiences",
			layoutType = "Wide",
			profileUserId = profileId,
			experienceId = p4,
			position = p5,
			ccu = p6 or 0,
			votePercentage = p7,
			upVotes = p8 or 0,
			downVotes = p9 or 0,
			visits = p10 or 0
		})
	end, { var15, profileId })
	local var27 = reactModule.useCallback(function(p4, p5, p6)
		-- upvalues: formatExperienceThumbnail (copy), reactModule (copy), gameStats (copy), var18 (ref), gameTileView (copy), gameTileViewConfig (copy), var26 (ref), var23 (ref), var16 (ref), appPage (copy), p3 (ref), var13 (ref), openGameDetails (copy), var17 (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = p6,
			LayoutOrder = p5
		}, {
			Tile = reactModule.createElement(gameTileView, {
				isHovered = false,
				hidePlayButton = true,
				isContained = false,
				Size = UDim2.fromScale(1, 1),
				image = formatExperienceThumbnail(nil, p4.rootPlaceId),
				title = p4.name,
				imageAspectRatio = gameTileViewConfig.getImageAspectRatio("Wide"),
				footerMetadata = reactModule.createElement(gameStats, {
					isGridTile = true,
					gameTileLayoutType = "Wide",
					stats = {
						playerCount = p4.playing or 0,
						totalUpVotes = if var18[p4.experienceId] then var18[p4.experienceId].upVotes else 0,
						totalDownVotes = if var18[p4.experienceId] then var18[p4.experienceId].downVotes else 0
					}
				}),
				onActivated = function()
					-- upvalues: var18 (copy), p4 (ref), var26 (copy), p5 (ref), var23 (copy), var16 (copy), appPage (copy), p3 (copy), var13 (copy), openGameDetails (copy), var17 (copy)
					local var28
					local experienceId = var18[p4.experienceId]
					
					if experienceId then
						local maxValue = math.max(0, experienceId.upVotes or 0)
						local var29 = maxValue + math.max(0, experienceId.downVotes or 0)
						var28 = (if var29 == 0 then nil else tostring(math.floor(maxValue / var29 * 100 + 0.5)) .. "%") or nil
					end
					var26(p4.experienceId, p5, p4.playing, var28, if experienceId then experienceId.upVotes else 0, if experienceId then experienceId.downVotes else 0, 0)
					var16.reportOpenGameDetailFromProfile(p4.rootPlaceId, p5, #var23, p4.experienceId, appPage.ProfilePlatform, p3.layoutOrder, 1, nil)
					var13(openGameDetails(p4.experienceId, var17, { mountAsFullView = false, showBackButton = true }))
				end
			})
		}), "EXP_Tile"
	end, {
		var26, var7, var2, var13, var17, var16, p3.layoutOrder, var23, var18
	})
	local var28 = reactModule.useCallback(function(p4)
		-- upvalues: var11 (ref), var12 (ref), gameTileViewConfig (copy), var4 (ref), var5 (ref)
		if var11 ~= p4 then
			var12(p4)
		end
		return gameTileViewConfig.getTileHeight(var4, p4, "Wide", false, false, false, var5, nil, nil, nil, nil, nil)
	end, { var4, var5, var11 })
	local var29 = reactModule.useCallback(function(p4, p5)
		return math.max(1, (math.max(0, p4 - p5 * 2) - 12) / 2)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var29 (ref), var2 (ref), var23 (ref), var10 (ref)
		if var7 <= 0 then
			return
		end
		var10(if #var23 > 2 then math.clamp(60 / (var29(var7, var2) + 12), 0, 0.5) else 0)
	end, { var7, var2, var23, var29 })
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), var25 (ref)
		if #var23 > 0 then
			local t = {}
			
			for i = 1, math.min(2, #var23) do
				table.insert(t, i)
			end
			var25(t)
		end
	end, { var23, var25 })
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), experiencesOnProfileIxpEnabled (copy), IXPService (copy), experiencesOnProfileIxpLayer (copy)
		if #var23 > 0 and experiencesOnProfileIxpEnabled then
			IXPService:LogFlagLinkedUserLayerExposure(experiencesOnProfileIxpLayer)
		end
	end, { var23 })
	
	return if #var23 == 0 then nil else reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		LayoutOrder = p3.layoutOrder,
		[reactModule.Change.AbsoluteSize] = function(p4)
			-- upvalues: var3 (ref), var8 (ref)
			var3(p4)
			var8(p4.AbsoluteSize.X)
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
				PaddingLeft = UDim.new(0, var2),
				PaddingRight = UDim.new(0, var2)
			}),
			Content = reactModule.createElement(collectionHeader, { LayoutOrder = 1, hideButton = true, title = var6.title })
		}),
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 2,
			title = nil,
			numColumns = 2,
			columnGap = 12,
			items = var23,
			renderItem = var27,
			getItemHeight = var28,
			fractionalItemAmount = if #var23 > 2 then var9 else 0,
			sideMargin = var2
		})
	})
end)