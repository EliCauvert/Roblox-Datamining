local Parent = script:FindFirstAncestor("BuildExperience").Parent
local Players = game:GetService("Players")
local FoundationModule = require(Parent.Foundation)
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local List = FoundationModule.List
local Skeleton = FoundationModule.Skeleton
local View = FoundationModule.View
local RefreshScrollingFrame = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Components.RefreshScrollingFrame
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local BuildEmptyStateModule = require(script.Parent.Parent.BuildEmptyState.BuildEmptyState)
local MatchesSearchQueryModule = require(script.Parent.Parent.Parent.utils.matchesSearchQuery)
local PlaytestStatusIndicatorForPlaceModule = require(script.Parent.PlaytestStatusIndicatorForPlace)
local ChatConstantsModule = require(script.Parent.Parent.Parent.Chat.chatConstants)
local _ = require(script.Parent.Parent.Parent.Chat.chatTypes)
local GetBuildExperienceRefreshStoreModule = require(script.Parent.Parent.Parent.Stores.GetBuildExperienceRefreshStore)
local GetPlaytestLoadingStoreModule = require(script.Parent.Parent.Parent.Stores.GetPlaytestLoadingStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local GetSearchQueryStoreModule = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState

local function _(p1): string
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p1)
end

local _ = function(p1): string
	return if p1.privacyType == "Public" then "Public" else "Private"
end

local function requestHandleToPromise(More)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.new(function(Callback, Callback1)
		-- upvalues: More (copy)
		task.spawn(function()
			-- upvalues: More (upval), Callback (copy), Callback1 (copy)
			while More.state(false).status == "pending" do
				task.wait()
			end
			local StateResult = More.state(false)
			
			if StateResult.status == "succeeded" then
				Callback(StateResult.result)
				
				return
			else
				Callback1(StateResult.error)
			end
		end)
	end)
end

local _ = function(p1)
	local Roblox = p1._meta and p1._meta._roblox
	
	if Roblox == nil then
		return nil
	else
		local UniverseId = Roblox.universeId
		
		return if typeof(UniverseId) == "number" and UniverseId ~= 0 then UniverseId else nil
	end
end

local function buildExperienceMetadataByUniverseId(List)
	local t = {}
	
	for i, value in List do
		local Name = value.name
		
		if typeof(Name) == "string" and Name ~= "" and not value.isArchived then
			local CreatorName = value.creatorName
			t[i] = {
				placeId = value.rootPlaceId,
				experienceName = Name,
				creatorName = if typeof(CreatorName) == "string" and CreatorName ~= "" then CreatorName else nil,
				visibilityLabel = if value.privacyType == "Public" then "Public" else "Private",
				gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", i)
			}
		end
	end
	return t
end

local function buildSessionItems(List, UseMemoResult)
	local t = {}
	local List1 = {}
	
	for _, value in List do
		local SessionId = value.sessionId
		local Roblox = value._meta and value._meta._roblox
		local UniverseId = nil
		
		if Roblox == nil then
			UniverseId = nil
		else
			local UniverseId1 = Roblox.universeId
			UniverseId = if typeof(UniverseId1) == "number" and UniverseId1 ~= 0 then UniverseId1 else nil
		end
		if typeof(SessionId) == "string" and SessionId ~= "" and UniverseId ~= nil and not t[UniverseId] then
			t[UniverseId] = true
			local UseMemoResultEntry = if UseMemoResult then UseMemoResult[UniverseId] else nil
			table.insert(List1, {
				sessionId = SessionId,
				universeId = UniverseId,
				placeId = if UseMemoResultEntry then UseMemoResultEntry.placeId else nil,
				experienceName = if UseMemoResultEntry then UseMemoResultEntry.experienceName else value.title or `Universe {UniverseId}`,
				creatorName = if UseMemoResultEntry then UseMemoResultEntry.creatorName else nil,
				description = if UseMemoResultEntry then UseMemoResultEntry.visibilityLabel else "Private",
				gameIcon = if UseMemoResultEntry then UseMemoResultEntry.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", UniverseId)
			})
		end
	end
	return List1
end

local function renderLoadingExperienceSkeleton(p1, LayoutOrder, p2)
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium",
		LayoutOrder = LayoutOrder,
		Size = UDim2.new(1, 0, 0, p2.Size.Size_2000),
		testId = `MyCreationsTab.LoadingSkeleton.{p1}`
	}, {
		ThumbnailContainer = ReactModule.createElement(View, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p2.Size.Size_1400, p2.Size.Size_1400)
		}, {
			Thumbnail = ReactModule.createElement(Skeleton, { Size = UDim2.fromScale(1, 1), radius = Radius.Medium })
		}),
		Details = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col fill gap-small size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.72, 0, 0, p2.Size.Size_400),
				radius = Radius.Small
			}),
			Description = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.44, 0, 0, p2.Size.Size_250),
				radius = Radius.Small
			})
		})
	})
end

return function(Frame)
	-- upvalues: CreatorAgentChatModule (copy), UniverseConfigurationModule (copy), GetSearchQueryStoreModule (copy), GetPlaytestLoadingStoreModule (copy), GetBuildExperienceRefreshStoreModule (copy), UseTokensFunction (copy), UseSignalStateFunction (copy), ReactModule (copy), requestHandleToPromise (copy), SignalsModule (copy), buildExperienceMetadataByUniverseId (copy), buildSessionItems (copy), ChatConstantsModule (copy), Players (copy), PromiseModule (copy), renderLoadingExperienceSkeleton (copy), MatchesSearchQueryModule (copy), View (copy), List (copy), InputSize (copy), IconName (copy), BuildEmptyStateModule (copy), PlaytestStatusIndicatorForPlaceModule (copy), RefreshScrollingFrame (copy)
	local CreatorAgentChatStore = Frame.creatorAgentChatStore or CreatorAgentChatModule.getCreatorAgentChatStore()
	local ConfigurationStore = Frame.configurationStore or UniverseConfigurationModule.getUniverseConfigurationStore()
	local SearchQueryStore = Frame.searchQueryStore or GetSearchQueryStoreModule()
	local PlaytestLoadingStore = Frame.playtestLoadingStore or GetPlaytestLoadingStoreModule()
	local BuildExperienceRefreshStoreModule = GetBuildExperienceRefreshStoreModule()
	local UseTokensResult = UseTokensFunction()
	local UseDebouncedQueryResult = SearchQueryStore.useDebouncedQuery()
	local UseSignalStateResult = UseSignalStateFunction(BuildExperienceRefreshStoreModule.getRefreshTick)
	local SessionListStore = CreatorAgentChatStore.getSessionListStore()
	local UseSignalStateResult1 = UseSignalStateFunction(SessionListStore.getSessions)
	local UseSignalStateResult2 = UseSignalStateFunction(SessionListStore.getNextPageToken)
	local UseSignalStateResult3 = UseSignalStateFunction(SessionListStore.getStatus)
	local UseSignalStateResult4 = UseSignalStateFunction(SessionListStore.getLoadMoreStatus)
	local NotReady: string = if UseSignalStateResult3 == "pending" then "NotReady" elseif UseSignalStateResult3 == "succeeded" then "Ready" else "Failed"
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: requestHandleToPromise (upval), SessionListStore (copy)
		return requestHandleToPromise(SessionListStore.refresh())
	end, { SessionListStore })
	ReactModule.useEffect(function()
		-- upvalues: SessionListStore (copy)
		SessionListStore.refresh()
		
		return function() end
	end, { SessionListStore, UseSignalStateResult })
	local UseSignalStateResult5 = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UseSignalStateResult1 (copy), ConfigurationStore (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: UseSignalStateResult1 (upval), ConfigurationStore (upval)
			local DataResults = {}
			local t = {}
			
			for _, value in UseSignalStateResult1 do
				local Roblox = value._meta and value._meta._roblox
				local v1 = nil
				
				if Roblox == nil then
					v1 = nil
				else
					local UniverseId = Roblox.universeId
					v1 = if typeof(UniverseId) == "number" and UniverseId ~= 0 then UniverseId else nil
				end
				local v2 = v1 == nil or t[v1]
				local DataResult = nil
				
				if not v2 then
					t[v1] = true
					DataResult = ConfigurationStore.getAndFetchSummary(v1).data(p1)
					v2 = DataResult == nil
				end
				if not v2 then
					DataResults[v1] = DataResult
				end
			end
			return DataResults
		end)
	end, { ConfigurationStore, UseSignalStateResult1 })))
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: buildExperienceMetadataByUniverseId (upval), UseSignalStateResult5 (copy)
		return (buildExperienceMetadataByUniverseId(UseSignalStateResult5))
	end, { UseSignalStateResult5 })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: buildSessionItems (upval), UseSignalStateResult1 (copy), UseMemoResult (copy), UseSignalStateResult5 (copy)
		local List = {}
		
		for _, value in buildSessionItems(UseSignalStateResult1, UseMemoResult) do
			local UseSignalStateResultEntry = UseSignalStateResult5[value.universeId]
			
			if UseSignalStateResultEntry ~= nil and not UseSignalStateResultEntry.isArchived then
				table.insert(List, value)
			end
		end
		return List
	end, {
		UseSignalStateResult1,
		UseMemoResult,
		UseSignalStateResult5
	})
	local UseMemoResult2 = ReactModule.useMemo(function(): boolean
		-- upvalues: UseSignalStateResult1 (copy), UseSignalStateResult5 (copy)
		local t = {}
		
		for _, value in UseSignalStateResult1 do
			local Roblox = value._meta and value._meta._roblox
			local v1 = nil
			
			if Roblox == nil then
				v1 = nil
			else
				local UniverseId = Roblox.universeId
				v1 = if typeof(UniverseId) == "number" and UniverseId ~= 0 then UniverseId else nil
			end
			if v1 ~= nil and not t[v1] then
				t[v1] = true
				
				if UseSignalStateResult5[v1] == nil then
					return true
				end
			end
		end
		return false
	end, { UseSignalStateResult1, UseSignalStateResult5 })
	local IsReady: boolean = NotReady == "Ready" or #UseSignalStateResult1 > 0
	local IsPending = UseSignalStateResult4 == "pending"
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Frame (copy), ChatConstantsModule (upval), Players (upval)
		Frame.onOpenChat({
			isNewGameTarget = true,
			experienceName = ChatConstantsModule.BUILD_CHAT_PAGE_TITLE,
			creatorName = if Players.LocalPlayer then Players.LocalPlayer.Name else nil
		})
	end, { Frame.onOpenChat })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: SessionListStore (copy), PromiseModule (upval), requestHandleToPromise (upval)
		local More = SessionListStore.loadMore()
		
		return if More == nil then PromiseModule.resolve() else requestHandleToPromise(More)
	end, {
		IsPending,
		UseSignalStateResult2,
		NotReady,
		SessionListStore
	})
	local UseResult3 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseSignalStateResult2 (copy), IsPending (copy), NotReady (copy), UseResult2 (copy)
		local Y: number = ScrollFrame.AbsoluteCanvasSize.Y
		
		if UseSignalStateResult2 == nil or IsPending or NotReady ~= "Ready" or ScrollFrame.CanvasPosition.Y <= 0 or Y <= 0 or ScrollFrame.AbsoluteWindowSize.Y <= 0 then return end
		if math.max(0, Y - ScrollFrame.AbsoluteWindowSize.Y - 250) < ScrollFrame.CanvasPosition.Y then
			UseResult2()
		end
	end, { IsPending, UseResult2, UseSignalStateResult2, NotReady })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: IsPending (copy), renderLoadingExperienceSkeleton (upval), UseTokensResult (copy)
		return if IsPending then renderLoadingExperienceSkeleton(1, 1, UseTokensResult) else nil
	end, { IsPending, UseTokensResult })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UseDebouncedQueryResult (copy), UseMemoResult1 (copy), MatchesSearchQueryModule (upval)
		if UseDebouncedQueryResult == "" then
			return UseMemoResult1
		end
		local List = {}
		
		for _, value in UseMemoResult1 do
			if MatchesSearchQueryModule(value.experienceName, UseDebouncedQueryResult) then
				table.insert(List, value)
			end
		end
		return List
	end, { UseMemoResult1, UseDebouncedQueryResult })
	local config1 = nil
	
	if IsReady and not UseMemoResult2 and #UseMemoResult1 == 0 then
		config1 = {
			EmptyContent = ReactModule.createElement(View, {
				tag = "col size-full",
				padding = {
					top = UDim.new(0, UseTokensResult.Padding.Medium),
					bottom = UDim.new(0, UseTokensResult.Margin.Large)
				}
			}, {
				CreateList = ReactModule.createElement(List.Root, {
					LayoutOrder = 1,
					hasDivider = false,
					isContained = false,
					size = InputSize.Large
				}, {
					CreateRow = ReactModule.createElement(List.Item, {
						LayoutOrder = 1,
						title = "New game",
						description = "Build a game with AI",
						leading = IconName.PlusLarge,
						onActivated = UseResult1
					})
				}),
				EmptyState = ReactModule.createElement(View, {
					LayoutOrder = 2,
					tag = "col align-x-center align-y-center fill size-full-0 padding-large",
					testId = "MyCreationsTab.Empty"
				}, {
					Content = ReactModule.createElement(BuildEmptyStateModule)
				})
			})
		}
	else
		local config = {
			CreateRow = ReactModule.createElement(List.Item, {
				LayoutOrder = 1,
				title = "New game",
				description = "Build a game with AI",
				leading = IconName.PlusLarge,
				onActivated = UseResult1
			})
		}
		
		if IsReady and #UseMemoResult1 > 0 then
			for i, value in UseMemoResult3 do
				local ExperienceName = value.experienceName
				local GameIcon = value.gameIcon
				local PlaceId = value.placeId
				config["S" .. value.sessionId] = ReactModule.createElement(List.Item, {
					LayoutOrder = i + 1,
					leading = { iconName = GameIcon },
					title = ExperienceName,
					description = value.description,
					testId = `MyCreationsTab.ExperienceRow.{value.universeId}`,
					onActivated = function()
						-- upvalues: PlaceId (copy), PlaytestLoadingStore (copy), Frame (copy), value (copy), ExperienceName (copy), GameIcon (copy)
						if PlaceId ~= nil then
							PlaytestLoadingStore.clearCompletedStatusForPlaceId(PlaceId)
						end
						Frame.onOpenChat({
							universeId = value.universeId,
							placeId = PlaceId,
							sessionId = value.sessionId,
							experienceName = ExperienceName,
							creatorName = value.creatorName,
							gameIcon = GameIcon
						})
					end,
					trailing = ReactModule.createElement(View, { tag = "row align-y-center gap-small auto-xy" }, {
						Status = if PlaceId == nil then nil else ReactModule.createElement(PlaytestStatusIndicatorForPlaceModule, {
							LayoutOrder = 1,
							placeId = PlaceId,
							playtestLoadingStore = PlaytestLoadingStore
						})
					})
				})
			end
		elseif NotReady == "NotReady" or UseMemoResult2 then
			config[`Loading{1}`] = renderLoadingExperienceSkeleton(1, 2, UseTokensResult)
			config[`Loading{2}`] = renderLoadingExperienceSkeleton(2, 3, UseTokensResult)
		elseif NotReady == "Failed" then
			config.Error = ReactModule.createElement(List.Item, { LayoutOrder = 2, title = "Couldn't load experiences" })
		end
		config1 = {
			ExperienceList = ReactModule.createElement(List.Root, {
				hasDivider = false,
				isContained = { isContained = false, hasMargin = false },
				size = InputSize.Large
			}, config)
		}
	end
	return ReactModule.createElement(RefreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = UseResult,
		onCanvasPositionChangedCallback = UseResult3,
		onCanvasSizeChangedCallback = UseResult3,
		createFooter = UseResult4,
		scrollingElementProps = {
			LayoutOrder = Frame.LayoutOrder,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			CanvasSize = UDim2.new(1, 0, 1, 1),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			[ReactModule.Tag] = "fill"
		}
	}, {
		ContentBody = ReactModule.createElement(View, {
			tag = "composition-content-body col size-full-0 auto-y",
			testId = "MyCreationsTab.ContentBody"
		}, config1)
	})
end