local parent = script:FindFirstAncestor("BuildExperience").Parent
local playersService = game:GetService("Players")
local foundationModule = require(parent.Foundation)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local universeCreateModule = require(parent.DataHydration.UniverseCreate)
local universeSearchModule = require(parent.DataHydration.UniverseSearch)
local list = foundationModule.List
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local refreshScrollingFrame = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Components.RefreshScrollingFrame
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local buildEmptyStateModule = require(script.Parent.Parent.BuildEmptyState.BuildEmptyState)
local getDefaultTemplatePlaceIdModule = require(script.Parent.Parent.Parent.utils.getDefaultTemplatePlaceId)
local matchesSearchQueryModule = require(script.Parent.Parent.Parent.utils.matchesSearchQuery)
local playtestStatusIndicatorForPlaceModule = require(script.Parent.PlaytestStatusIndicatorForPlace)
local chatConstantsModule = require(script.Parent.Parent.Parent.Chat.chatConstants)
local _ = require(script.Parent.Parent.Parent.Chat.chatTypes)
local getBuildExperienceRefreshStoreModule = require(script.Parent.Parent.Parent.Stores.GetBuildExperienceRefreshStore)
local getPlaytestLoadingStoreModule = require(script.Parent.Parent.Parent.Stores.GetPlaytestLoadingStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetPlaytestLoadingStore.createPlaytestLoadingStore)
local getSearchQueryStoreModule = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore)
local _ = require(script.Parent.Parent.Parent.Stores.GetSearchQueryStore.createSearchQueryStore)
local useSignalState = signalsReactModule.useSignalState

local function _(p0) --[[ line: 90 | named "thumbForUniverseId" ]]
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p0)
end

local _ = function(p1) --[[ line: 94 | named "privacyLabelForExperience" ]]
	return if p1.privacyType == "Public" then "Public" else "Private"
end

local _ = function(p2) --[[ line: 101 | named "requestHandleToPromise" ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p3, p4) --[[ line: 102 ]]
		-- upvalues: p2 (ref)
		task.spawn(function() --[[ line: 103 ]]
			-- upvalues: p2 (copy), p3 (ref), p4 (ref)
			while p2.state(false).status == "pending" do
				task.wait()
			end
			local var21 = p2.state(false)
			
			if var21.status == "succeeded" then
				p3(var21.result)
				
				return
			end
			p4(var21.error)
		end)
	end)
end

local _ = function(p5) --[[ line: 118 | named "getSessionUniverseId" ]]
	local roblox = p5._meta and p5._meta._roblox
	
	if roblox == nil then
		return nil
	end
	local universeId = roblox.universeId
	
	return if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
end

local function buildExperienceMetadataByUniverseId(p6) --[[ line: 130 ]]
	local t = {}
	
	for i, v in p6 do
		local name = v.name
		
		if typeof(name) == "string" and name ~= "" and not v.isArchived then
			local creatorName = v.creatorName
			t[v.id] = {
				placeId = v.rootPlaceId,
				experienceName = name,
				creatorName = if typeof(creatorName) == "string" and creatorName ~= "" then creatorName else nil,
				visibilityLabel = if v.privacyType == "Public" then "Public" else "Private",
				gameIcon = string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", v.id)
			}
		end
	end
	return t
end

local function buildSessionItems(p7, p8) --[[ line: 151 ]]
	local t = {}
	local t_1 = {}
	local var26 = p8 ~= nil and next(p8) ~= nil
	
	for i, v in p7 do
		local var28
		local sessionId = v.sessionId
		local roblox = v._meta and v._meta._roblox
		
		if roblox == nil then
			var28 = nil
		else
			local universeId = roblox.universeId
			var28 = if typeof(universeId) == "number" and universeId ~= 0 then universeId else nil
		end
		if typeof(sessionId) == "string" and sessionId ~= "" and (var28 ~= nil and not t[var28]) then
			t[var28] = true
			local var29 = if p8 then p8[var28] else nil
			
			if not var26 or var29 ~= nil then
				table.insert(t_1, {
					sessionId = sessionId,
					universeId = var28,
					placeId = if var29 then var29.placeId else nil,
					experienceName = if var29 then var29.experienceName else v.title or `Universe {var28}`,
					creatorName = if var29 then var29.creatorName else nil,
					description = if var29 then var29.visibilityLabel else "Private",
					gameIcon = if var29 then var29.gameIcon else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", var28)
				})
			end
		end
	end
	return t_1
end

local function renderLoadingExperienceSkeleton(p9, p10, p11) --[[ line: 190 ]]
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium padding-x-xxlarge",
		LayoutOrder = p10,
		Size = UDim2.new(1, 0, 0, p11.Size.Size_1900),
		testId = `MyCreationsTab.LoadingSkeleton.{p9}`
	}, {
		ThumbnailContainer = reactModule.createElement(view, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(p11.Size.Size_1100, p11.Size.Size_1100)
		}, {
			Thumbnail = reactModule.createElement(skeleton, { Size = UDim2.fromScale(1, 1), radius = radius.Medium })
		}),
		Details = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col fill gap-small size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.72, 0, 0, p11.Size.Size_350),
				radius = radius.Small
			}),
			Description = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.44, 0, 0, p11.Size.Size_250),
				radius = radius.Small
			})
		})
	})
end

return function(p12) --[[ line: 228 | named "MyCreationsTab" ]]
	-- upvalues: creatorAgentChatModule (ref), universeSearchModule (ref), universeCreateModule (ref), universeConfigurationModule (ref), getSearchQueryStoreModule (ref), getPlaytestLoadingStoreModule (ref), getBuildExperienceRefreshStoreModule (ref), playersService (ref), useTokens (ref), useSignalState (ref), reactModule (ref), promiseModule (ref), buildExperienceMetadataByUniverseId (ref), buildSessionItems (ref), getDefaultTemplatePlaceIdModule (ref), chatConstantsModule (ref), matchesSearchQueryModule (ref), view (ref), list (ref), inputSize (ref), iconName (ref), buildEmptyStateModule (ref), playtestStatusIndicatorForPlaceModule (ref), renderLoadingExperienceSkeleton (ref), refreshScrollingFrame (ref)
	local creatorAgentChatStore = p12.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()
	local searchStore = p12.searchStore or universeSearchModule.getUniverseSearchStore()
	local createStore = p12.createStore or universeCreateModule.getUniverseCreateStore()
	local configurationStore = p12.configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
	local searchQueryStore = p12.searchQueryStore or getSearchQueryStoreModule()
	local playtestLoadingStore = p12.playtestLoadingStore or getPlaytestLoadingStoreModule()
	local var36 = getBuildExperienceRefreshStoreModule()
	local userId = p12.userId or (if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
	local var38 = useTokens()
	local var39 = searchQueryStore.useDebouncedQuery()
	local var40 = useSignalState(var36.getRefreshTick)
	local var41, var42 = reactModule.useState(0)
	local var43, var44 = reactModule.useState(false)
	local var45, var46 = reactModule.useState(nil)
	local var47 = reactModule.useRef(nil)
	local var48 = reactModule.useCallback(function() --[[ line: 248 ]]
		-- upvalues: searchStore (ref), var42 (ref)
		searchStore.invalidateAll()
		var42(function(p13) --[[ line: 250 ]]
			return p13 + 1
		end)
	end, { searchStore })
	local var49 = reactModule.useCallback(function() --[[ line: 255 ]]
		-- upvalues: promiseModule (copy), var47 (ref), var48 (ref)
		return promiseModule.new(function(p14, p15) --[[ line: 256 ]]
			-- upvalues: var47 (copy), var48 (copy)
			var47.current = { resolve = p14, reject = p15 }
			var48()
		end)
	end, { var48 })
	local var50 = useSignalState(reactModule.useMemo(function() --[[ line: 266 ]]
		-- upvalues: var41 (ref), var40 (ref), creatorAgentChatStore (ref)
		return creatorAgentChatStore.sessionList()
	end, { creatorAgentChatStore, var41, var40 }).state)
	local var51 = if var50.status == "pending" then "NotReady" elseif var50.status == "succeeded" then "Ready" else "Failed"
	local var52 = reactModule.useMemo(function() --[[ line: 278 ]]
		-- upvalues: var41 (ref), var40 (ref), searchStore (ref), userId (ref)
		return searchStore.getAndFetchSearch({
			creatorType = "User",
			surface = "CreatorHubCreations",
			isArchived = false,
			sortParam = "LastUpdated",
			sortOrder = "Desc",
			pageIndex = 0,
			pageSize = 50,
			creatorTargetId = userId
		})
	end, { searchStore, userId, var41, var40 })
	local var53 = useSignalState(var52.status)
	local var54 = useSignalState(var52.data)
	local var55 = reactModule.useMemo(function() --[[ line: 296 ]]
		-- upvalues: var53 (ref), var54 (ref), buildExperienceMetadataByUniverseId (copy)
		return if var53 == "Ready" and var54 ~= nil and var54.data ~= nil then buildExperienceMetadataByUniverseId(var54.data) else nil
	end, { var53, var54 })
	reactModule.useEffect(function() --[[ line: 305 ]]
		-- upvalues: var50 (ref), var46 (ref), buildSessionItems (copy), var55 (ref), var47 (ref)
		if var50.status == "succeeded" and var50.result ~= nil then
			var46(buildSessionItems(var50.result.sessions or {}, var55))
		end
		local current = var47.current
		
		if current ~= nil and var50.status ~= "pending" then
			var47.current = nil
			
			if var50.status == "succeeded" then
				current.resolve()
			else
				current.reject(var50.status)
			end
		end
		return function() --[[ line: 323 ]] end
	end, { var50, var55 })
	local var56 = nil
	
	if var50.status == "succeeded" and var50.result ~= nil then
		var56 = buildSessionItems(var50.result.sessions or {}, var55)
	end
	local t_1
	local var56_1 = var56 or (var45 or {})
	local var58 = if var56 == nil then var45 ~= nil else true
	local isNotNotReady = var53 ~= "NotReady"
	local var60 = reactModule.useCallback(function() --[[ line: 339 ]]
		-- upvalues: var43 (ref), var44 (ref), createStore (ref), getDefaultTemplatePlaceIdModule (copy), configurationStore (ref), chatConstantsModule (copy), playersService (copy), p12 (ref), var48 (ref), creatorAgentChatStore (ref), promiseModule (copy)
		if var43 then
			return
		end
		var44(true)
		createStore.createUniverse({
			isPublish = true,
			templatePlaceId = getDefaultTemplatePlaceIdModule()
		}):andThen(function(p16) --[[ line: 349 ]]
			-- upvalues: configurationStore (copy), chatConstantsModule (copy), playersService (copy), p12 (copy), var48 (copy), creatorAgentChatStore (copy), promiseModule (copy)
			configurationStore.patchConfiguration(p16.universeId, { audiences = { 1 } })
			configurationStore.setTeamCreate(p16.universeId, true)
			local rootPlaceId = p16.rootPlaceId
			local t = {
				isNewGameTarget = true,
				universeId = p16.universeId,
				placeId = rootPlaceId,
				experienceName = chatConstantsModule.BUILD_CHAT_PAGE_TITLE,
				creatorName = if playersService.LocalPlayer then playersService.LocalPlayer.Name else nil
			}
			
			if rootPlaceId == nil then
				p12.onOpenChat(t)
				var48()
				
				return nil
			end
			local var65 = creatorAgentChatStore.sessionNew({
				project = { universeId = p16.universeId, placeId = rootPlaceId }
			})
			
			return promiseModule.new(function(p19, p20) --[[ line: 102 ]]
				-- upvalues: var65 (ref)
				task.spawn(function() --[[ line: 103 ]]
					-- upvalues: var65 (copy), p19 (ref), p20 (ref)
					while true do
						while var65.state(false).status == "pending" do
							task.wait()
						end
						local var21 = var65.state(false)
						
						if var21.status == "succeeded" then
							p19(var21.result)
							
							return
						end
						p20(var21.error)
					end
				end)
			end):andThen(function(p18) --[[ line: 374 ]]
				-- upvalues: t (ref), p12 (copy)
				if typeof(p18) == "table" and typeof(p18.sessionId) == "string" then
					t.sessionId = p18.sessionId
				end
				p12.onOpenChat(t)
			end):catch(function(p17) --[[ line: 383 ]]
				-- upvalues: p12 (copy), t (ref)
				warn(`[BuildExperience] session/new failed after create: {tostring(p17)}`)
				p12.onOpenChat(t)
			end):finally(function() --[[ line: 387 ]]
				-- upvalues: var48 (copy)
				var48()
			end)
		end):catch(function() --[[ line: 391 ]] end):finally(function() --[[ line: 392 ]]
			-- upvalues: var44 (copy)
			var44(false)
		end)
	end, {
		createStore, creatorAgentChatStore, configurationStore, var43, p12.onOpenChat,
		var48
	})
	local var61 = reactModule.useMemo(function() --[[ line: 399 ]]
		-- upvalues: var39 (ref), var56_1 (ref), matchesSearchQueryModule (copy)
		if var39 == "" then
			return var56_1
		end
		local t = {}
		
		for i, v in var56_1 do
			if matchesSearchQueryModule(v.experienceName, var39) then
				table.insert(t, v)
			end
		end
		return t
	end, { var56_1, var39 })
	local _ = nil
	
	if var58 and isNotNotReady and #var56_1 == 0 then
		t_1 = {
			EmptyContent = reactModule.createElement(view, {
				tag = "col size-full",
				padding = {
					top = UDim.new(0, var38.Padding.Medium),
					bottom = UDim.new(0, var38.Margin.Large)
				}
			}, {
				CreateList = reactModule.createElement(list.Root, {
					LayoutOrder = 1,
					hasDivider = false,
					isContained = false,
					size = inputSize.Medium
				}, {
					CreateRow = reactModule.createElement(list.Item, {
						LayoutOrder = 1,
						description = "Clone a baseplate template",
						leading = iconName.PlusLarge,
						title = if var43 then "Creating\226\128\166" else "Create new game",
						onActivated = if var43 then nil else var60
					})
				}),
				EmptyState = reactModule.createElement(view, {
					LayoutOrder = 2,
					tag = "col align-x-center align-y-center fill size-full-0 padding-large",
					testId = "MyCreationsTab.Empty"
				}, {
					Content = reactModule.createElement(buildEmptyStateModule)
				})
			})
		}
	else
		local t = {
			CreateRow = reactModule.createElement(list.Item, {
				LayoutOrder = 1,
				description = "Clone a baseplate template",
				leading = iconName.PlusLarge,
				title = if var43 then "Creating\226\128\166" else "Create new game",
				onActivated = if var43 then nil else var60
			})
		}
		
		if var58 and #var56_1 > 0 then
			for i, v in var61 do
				local experienceName = v.experienceName
				local gameIcon = v.gameIcon
				local placeId = v.placeId
				t["S" .. v.sessionId] = reactModule.createElement(list.Item, {
					LayoutOrder = i + 1,
					leading = { iconName = gameIcon },
					title = experienceName,
					description = v.description,
					testId = `MyCreationsTab.ExperienceRow.{v.universeId}`,
					onActivated = function() --[[ line: 469 ]]
						-- upvalues: placeId (ref), playtestLoadingStore (ref), p12 (ref), v (ref), experienceName (ref), gameIcon (ref)
						if placeId ~= nil then
							playtestLoadingStore.clearCompletedStatusForPlaceId(placeId)
						end
						p12.onOpenChat({
							universeId = v.universeId,
							placeId = placeId,
							sessionId = v.sessionId,
							experienceName = experienceName,
							creatorName = v.creatorName,
							gameIcon = gameIcon
						})
					end,
					trailing = reactModule.createElement(view, { tag = "row align-y-center gap-small auto-xy" }, {
						Status = if placeId ~= nil then nil else reactModule.createElement(playtestStatusIndicatorForPlaceModule, {
							LayoutOrder = 1,
							placeId = placeId,
							playtestLoadingStore = playtestLoadingStore
						})
					})
				})
			end
		elseif var51 == "NotReady" or var53 == "NotReady" then
			t[`Loading{1}`] = renderLoadingExperienceSkeleton(1, 2, var38)
			t[`Loading{2}`] = renderLoadingExperienceSkeleton(2, 3, var38)
		elseif var51 == "Failed" or var53 == "Failed" then
			t.Error = reactModule.createElement(list.Item, { LayoutOrder = 2, title = "Couldn't load experiences" })
		end
		t_1 = {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var38.Padding.Medium),
				PaddingBottom = UDim.new(0, var38.Margin.Large)
			}),
			ExperienceList = reactModule.createElement(list.Root, {
				hasDivider = false,
				isContained = false,
				size = inputSize.Medium
			}, t)
		}
	end
	return reactModule.createElement(refreshScrollingFrame, {
		usesBuilderIcon = true,
		refresh = var49,
		scrollingElementProps = {
			ZIndex = 1,
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			LayoutOrder = p12.LayoutOrder,
			Size = UDim2.fromScale(1, 1),
			CanvasSize = UDim2.new(1, 0, 1, 1),
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			ScrollingDirection = Enum.ScrollingDirection.Y
		}
	}, t_1)
end