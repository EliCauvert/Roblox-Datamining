local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local apolloClientModule = require(corePackagesService.Packages.ApolloClient)
local cryoModule = require(corePackagesService.Packages.Cryo)
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local promiseModule = require(corePackagesService.Packages.Promise)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local retrievalStatus = require(corePackagesService.Workspace.Packages.Http).Enum.RetrievalStatus
local userProfilesModule = require(corePackagesService.Workspace.Packages.UserProfiles)
local getFFlagSuggestedCalleeBugFixEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagSuggestedCalleeBugFixEnabled
local useApolloClient = apolloClientModule.useApolloClient
local contactList = coreGuiService:WaitForChild("RobloxGui").Modules.ContactList
local dependenciesModule = require(contactList.dependencies)
local UIBlox = dependenciesModule.UIBlox
local foundation = dependenciesModule.Foundation
local iconSize = foundation.Enums.IconSize
local loading = foundation.Loading
local useSelector = dependenciesModule.Hooks.useSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local useLocalization = dependenciesModule.Hooks.useLocalization
local findFriendsFromUserId = dependenciesModule.NetworkingFriends.FindFriendsFromUserId
local searchFriendsByQuery = dependenciesModule.NetworkingFriends.SearchFriendsByQuery
local getSuggestedCallees = dependenciesModule.NetworkingCall.GetSuggestedCallees
local useStyle = UIBlox.Core.Style.useStyle
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local friendListItemModule = require(contactList.Components.FriendList.FriendListItem)
local sectionHeaderModule = require(contactList.Components.FriendList.SectionHeader)
local noItemViewModule = require(contactList.Components.ContactListCommon.NoItemView)
local constantsModule = require(contactList.Components.ContactListCommon.Constants)
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local localPlayer = game:GetService("Players").LocalPlayer
local var18 = if localPlayer then localPlayer.UserId else 0

return function(p0) --[[ line: 62 | named "FriendListContainer" ]]
	-- upvalues: useApolloClient (ref), useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useLocalization (ref), reactModule (ref), retrievalStatus (ref), getFFlagSuggestedCalleeBugFixEnabled (ref), getSuggestedCallees (ref), useSelector (ref), var18 (ref), httpService (ref), eventNamesEnumModule (ref), findFriendsFromUserId (ref), searchFriendsByQuery (ref), promiseModule (ref), cryoModule (ref), userProfilesModule (ref), noItemViewModule (ref), constantsModule (ref), sectionHeaderModule (ref), blockingUtilityModule (ref), friendListItemModule (ref), loading (ref), iconSize (ref), roactModule (ref), externalEventConnection (ref), userInputService (ref)
	local var19 = useApolloClient()
	local var20 = useAnalyticsModule()
	local var21 = useDispatch()
	local theme = useStyle().Theme
	local var22 = useLocalization({
		genericErrorLabel = "Feature.Call.Error.Description.Generic",
		noFriendsLabel = "Feature.Call.Description.NoFriendsFound",
		addFriendsLabel = "Feature.Call.Prompt.AddFriends",
		suggestedFriendsTitle = "Feature.Call.Label.Suggested",
		suggestedFriendsDescription = "Feature.Call.Description.SuggestedFriends",
		friendsTitle = "Feature.Call.Label.Friends",
		friendsDescription = "Feature.Call.Description.Friends"
	})
	local var23 = reactModule.useRef(true)
	local var24 = reactModule.useRef(nil)
	local var25 = reactModule.useRef(0)
	local var26, var27 = reactModule.useState(retrievalStatus.Fetching)
	local var28, var29 = reactModule.useState(false)
	local var30, var31 = reactModule.useState({})
	local var32, var33 = reactModule.useState(nil)
	local var34 = reactModule.useRef("")
	local var35 = if getFFlagSuggestedCalleeBugFixEnabled() then reactModule.useMemo(function() --[[ line: 93 ]]
		-- upvalues: var21 (ref), getSuggestedCallees (copy)
		return var21(getSuggestedCallees.API()):catch(function() --[[ line: 94 ]] end)
	end, {}) else reactModule.useRef(var21(getSuggestedCallees.API()):catch(function() --[[ line: 97 ]] end))
	local var36 = reactModule.useMemo(function() --[[ line: 100 ]]
		-- upvalues: p0 (ref)
		return string.gsub(p0.searchText, "%s+", "")
	end, { p0.searchText })
	local var37 = reactModule.useCallback(function(p1, p2) --[[ line: 110 ]]
		-- upvalues: var18 (copy), var23 (ref), var27 (ref), retrievalStatus (copy), var34 (ref), httpService (copy), var20 (ref), eventNamesEnumModule (copy), var36 (ref), var21 (ref), findFriendsFromUserId (copy), searchFriendsByQuery (copy), promiseModule (copy), getFFlagSuggestedCalleeBugFixEnabled (copy), var35 (write), cryoModule (copy), var19 (ref), userProfilesModule (copy), var31 (ref), var33 (ref)
		if var18 then
			var23.current = true
			var27(retrievalStatus.Fetching)
			local var46 = if var34.current == "" then 0 else 0.5
			local var47 = httpService:GenerateGUID(false)
			var34.current = var47
			
			local var48 = function() --[[ line: 119 ]]
				-- upvalues: var34 (copy), var47 (ref), var20 (copy), eventNamesEnumModule (copy), var36 (copy), var21 (copy), findFriendsFromUserId (copy), var18 (copy), p2 (ref), searchFriendsByQuery (copy), promiseModule (copy), getFFlagSuggestedCalleeBugFixEnabled (copy), var35 (copy), p1 (ref), cryoModule (copy), var19 (copy), userProfilesModule (copy), var31 (copy), var33 (copy), var27 (copy), retrievalStatus (copy)
				if var34.current == var47 then
					var20.fireEvent(eventNamesEnumModule.PhoneBookSearchAttempted, {
						eventTimestampMs = os.time() * 1000,
						searchQueryString = var36
					})
					promiseModule.all({
						var21(if var36 == "" then findFriendsFromUserId.API(var18, { userSort = "CombinedName", limit = 20, cursor = p2 }) else searchFriendsByQuery.API(var18, {
							userSort = "CombinedName",
							limit = 20,
							cursor = p2,
							query = var36
						})),
						if getFFlagSuggestedCalleeBugFixEnabled() then var35 else var35.current
					}):andThen(function(p3) --[[ line: 147 ]]
						-- upvalues: var34 (copy), var47 (copy), var20 (copy), eventNamesEnumModule (copy), var36 (copy), p1 (copy), cryoModule (copy), var19 (copy), userProfilesModule (copy), var31 (copy), var33 (copy), var27 (copy), retrievalStatus (copy)
						if var34.current ~= var47 then return end
						local var49 = p3[1]
						local var50 = p3[2]
						var20.fireEvent(eventNamesEnumModule.PhoneBookSearchFinished, {
							eventTimestampMs = os.time() * 1000,
							searchQueryString = var36,
							searchResultCount = #var49.responseBody.PageItems
						})
						local t = {}
						
						for i, v in ipairs(p1) do
							table.insert(t, v)
						end
						for i, v_1 in ipairs(var49.responseBody.PageItems) do
							table.insert(t, v_1)
						end
						local var52 = cryoModule.List.map(t, function(p4) --[[ line: 169 ]]
							return tostring(p4.id)
						end)
						
						if var36 == "" and var50 ~= nil then
							for i_2, v_2 in ipairs(var50.responseBody.suggestedCallees) do
								table.insert(var52, tostring(v_2.userId))
							end
						end
						var19:query({
							query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds,
							variables = { userIds = var52 }
						}):andThen(function() --[[ line: 188 ]]
							-- upvalues: var34 (copy), var47 (copy), var31 (copy), t (ref), var33 (copy), var49 (ref), var27 (copy), retrievalStatus (copy)
							if var34.current == var47 then
								var31(t)
								var33(var49.responseBody.NextCursor)
								var27(retrievalStatus.Done)
								
								return
							end
						end):catch(function(_) --[[ line: 197 ]]
							-- upvalues: var34 (copy), var47 (copy), var27 (copy), retrievalStatus (copy)
							if var34.current == var47 then
								var27(retrievalStatus.Failed)
								
								return
							end
						end)
					end, function() --[[ line: 203 ]]
						-- upvalues: var34 (copy), var47 (copy), var27 (copy), retrievalStatus (copy)
						if var34.current == var47 then
							var27(retrievalStatus.Failed)
							
							return
						end
					end)
					
					return
				end
			end
			
			if var46 == 0 then
				var48()
				
				return
			end
			delay(var46, var48)
		end
	end, {
		var36,
		useSelector(function(p5) --[[ line: 104 ]]
			return p5.LastRemovedFriend.lastRemovedFriendId
		end),
		if getFFlagSuggestedCalleeBugFixEnabled() then var35 else nil
	})
	reactModule.useEffect(function() --[[ line: 223 ]]
		-- upvalues: var37 (ref), var31 (ref), var33 (ref)
		var37({}, "")
		
		return function() --[[ line: 226 ]]
			-- upvalues: var31 (copy), var33 (copy)
			var31({})
			var33(nil)
		end
	end, { var37 })
	reactModule.useEffect(function() --[[ line: 233 ]]
		-- upvalues: var26 (ref), retrievalStatus (copy), var23 (ref)
		if var26 ~= retrievalStatus.Fetching then
			var23.current = false
		end
	end, { var26 })
	local var38 = useSelector(reactModule.useCallback(function(p6) --[[ line: 239 ]]
		return p6.Call.suggestedCallees.suggestedCallees
	end, {}), function(p7, p8) --[[ line: 245 ]]
		if #p7 ~= #p8 then
			return false
		end
		for i, v in ipairs(p7) do
			if v.userId ~= p8[i].userId then
				return false
			end
		end
		return true
	end) or {}
	local var39 = reactModule.useMemo(function() --[[ line: 261 ]]
		-- upvalues: var26 (ref), retrievalStatus (copy), var22 (ref), p0 (ref), reactModule (copy), noItemViewModule (copy), var37 (ref), var30 (ref), var32 (ref)
		return reactModule.createElement(noItemViewModule, {
			isCallButtonEnabled = false,
			isImageEnabled = var26 ~= retrievalStatus.Failed,
			imageName = if p0.searchText == "" then "icons/graphic/findfriends_xlarge" else "icons/status/oof_xlarge",
			isFailedButtonEnabled = var26 == retrievalStatus.Failed,
			onFailedButtonActivated = function() --[[ line: 277 ]]
				-- upvalues: var37 (copy), var30 (copy), var32 (copy)
				var37(var30, var32)
			end,
			onCallButtonActivated = function() --[[ line: 281 ]] end,
			messageText = if var26 == retrievalStatus.Failed then var22.genericErrorLabel elseif p0.searchText ~= "" then var22.addFriendsLabel else var22.noFriendsLabel
		})
	end, {
		p0.searchText, var30, var37, var22.addFriendsLabel, var22.genericErrorLabel,
		var22.noFriendsLabel, var32, var26
	})
	local var40 = reactModule.useCallback(function(p9) --[[ line: 295 ]]
		-- upvalues: var25 (ref)
		var25.current = p9.Position.Y
	end, {})
	local var41 = reactModule.useCallback(function(p10) --[[ line: 299 ]]
		-- upvalues: var25 (ref), constantsModule (copy), var24 (ref), var29 (ref)
		if constantsModule.TOUCH_SLOP < p10.Position.Y - var25.current and var24.current and var24.current.CanvasPosition.Y == 0 then
			var29(true)
		end
	end, {})
	local var42 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = reactModule.useMemo(function() --[[ line: 313 ]]
			-- upvalues: cryoModule (copy), var30 (ref), var38 (ref)
			return cryoModule.List.map(cryoModule.List.join(var30, var38), function(p11) --[[ line: 315 ]]
				return tostring(p11.id or p11.userId)
			end)
		end),
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var43 = reactModule.useCallback(function() --[[ line: 325 ]]
		-- upvalues: var29 (ref)
		var29(false)
	end, {})
	local var44 = reactModule.useMemo(function() --[[ line: 329 ]]
		-- upvalues: reactModule (copy), var38 (ref), var36 (ref), sectionHeaderModule (copy), var22 (ref), blockingUtilityModule (copy), var42 (ref), userProfilesModule (copy), friendListItemModule (copy), p0 (ref), var30 (ref), var32 (ref), var26 (ref), retrievalStatus (copy), var39 (ref), constantsModule (copy), loading (copy), iconSize (copy)
		local t = {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		
		if #var38 ~= 0 and var36 == "" then
			t[#t + 1] = reactModule.createElement(sectionHeaderModule, {
				name = var22.suggestedFriendsTitle,
				description = var22.suggestedFriendsDescription,
				layoutOrder = #t + 1
			})
			local t_1 = {}
			
			for i, v in ipairs(var38) do
				if not blockingUtilityModule:IsPlayerBlockedByUserId(v.userId) then
					table.insert(t_1, v)
				end
			end
			for i_1, v_1 in ipairs(t_1) do
				local var55 = ""
				local var56 = ""
				
				if var42.data then
					var55 = userProfilesModule.Selectors.getCombinedNameFromId(var42.data, v_1.userId)
					var56 = userProfilesModule.Selectors.getUsernameFromId(var42.data, v_1.userId)
				end
				t[#t + 1] = reactModule.createElement(friendListItemModule, {
					isSuggestedUser = true,
					userId = v_1.userId,
					combinedName = var55,
					userName = var56,
					userPresenceType = v_1.userPresenceType,
					lastLocation = v_1.lastLocation,
					dismissCallback = p0.dismissCallback,
					layoutOrder = #t + 1,
					showDivider = i_1 ~= #t_1,
					itemListIndex = i_1
				})
			end
		end
		if #var30 ~= 0 then
			t[#t + 1] = reactModule.createElement(sectionHeaderModule, {
				name = var22.friendsTitle,
				description = var22.friendsDescription,
				layoutOrder = #t + 1
			})
		end
		local t_1 = {}
		
		for i, v in ipairs(var30) do
			if not blockingUtilityModule:IsPlayerBlockedByUserId(v.id) then
				table.insert(t_1, v)
			end
		end
		for i_1, v_1 in ipairs(t_1) do
			local var59 = ""
			local var60 = ""
			
			if var42.data then
				var59 = userProfilesModule.Selectors.getCombinedNameFromId(var42.data, v_1.id)
				var60 = userProfilesModule.Selectors.getUsernameFromId(var42.data, v_1.id)
			end
			t[#t + 1] = reactModule.createElement(friendListItemModule, {
				isSuggestedUser = false,
				userId = v_1.id,
				combinedName = var59,
				userName = var60,
				dismissCallback = p0.dismissCallback,
				layoutOrder = #t + 1,
				showDivider = i_1 ~= #t_1,
				searchQueryString = var36,
				itemListIndex = i_1
			})
		end
		if var32 ~= nil then
			local var58 = #t + 1
			
			if var26 == retrievalStatus.Failed then
				t[var58] = var39
				
				return t
			end
			t[var58] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, constantsModule.ITEM_HEIGHT),
				LayoutOrder = var58
			}, {
				LoadingSpinner = reactModule.createElement(loading, {
					size = iconSize.Large,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		end
		return t
	end, {
		var30, var32, var39, var26, var42.data, var38, var36, var22.friendsDescription,
		var22.friendsTitle, var22.suggestedFriendsDescription,
		var22.suggestedFriendsTitle
	})
	local var45 = reactModule.useCallback(function(p12) --[[ line: 450 ]]
		-- upvalues: var23 (ref), var26 (ref), retrievalStatus (copy), var32 (ref), var37 (ref), var30 (ref)
		if not var23.current and var26 ~= retrievalStatus.Failed and (var32 ~= nil and p12.AbsoluteCanvasSize.Y - p12.AbsoluteSize.Y - 50 <= p12.CanvasPosition.Y) then
			var37(var30, var32)
		end
	end, { var30, var37, var32, var26 })
	reactModule.useEffect(function() --[[ line: 461 ]]
		-- upvalues: var44 (ref), constantsModule (copy), var24 (ref), var45 (ref)
		if var24.current and (#var44 - 1) * constantsModule.ITEM_HEIGHT <= var24.current.AbsoluteSize.Y then
			var45(var24.current)
		end
	end, { var44, var45 })
	
	return if #var30 == 0 and var26 == retrievalStatus.Fetching then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constantsModule.ITEM_HEIGHT)
	}, {
		LoadingSpinner = reactModule.createElement(loading, {
			size = iconSize.Large,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		})
	}) elseif #var30 == 0 then var39 else roactModule.createFragment({
		FriendsScrollingFrame = reactModule.createElement("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = theme.BackgroundDefault.Color,
			BackgroundTransparency = theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			ElasticBehavior = Enum.ElasticBehavior.Never,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = not var28 and p0.scrollingEnabled,
			ScrollBarImageColor3 = theme.UIEmphasis.Color,
			ScrollBarImageTransparency = theme.UIEmphasis.Transparency,
			ScrollBarThickness = 4,
			ref = var24,
			[reactModule.Change.CanvasPosition] = var45
		}, var44),
		TouchStartedUserInputConnection = p0.isSmallScreen and (p0.scrollingEnabled and reactModule.createElement(externalEventConnection, { event = userInputService.TouchStarted, callback = var40 })),
		TouchMovedUserInputConnection = p0.isSmallScreen and (p0.scrollingEnabled and reactModule.createElement(externalEventConnection, { event = userInputService.TouchMoved, callback = var41 })),
		TouchEndedUserInputConnection = p0.isSmallScreen and (p0.scrollingEnabled and reactModule.createElement(externalEventConnection, { event = userInputService.TouchEnded, callback = var43 }))
	})
end