local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local PromiseModule = require(CorePackages.Packages.Promise)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local UserProfilesModule = require(CorePackages.Workspace.Packages.UserProfiles)
local GetFFlagSuggestedCalleeBugFixEnabledFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagSuggestedCalleeBugFixEnabled
local UseApolloClientFunction = require(CorePackages.Packages.ApolloClient).useApolloClient
local ContactList = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList
local DependenciesModule = require(ContactList.dependencies)
local Foundation = DependenciesModule.Foundation
local IconSize = Foundation.Enums.IconSize
local Loading = Foundation.Loading
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local FindFriendsFromUserId = DependenciesModule.NetworkingFriends.FindFriendsFromUserId
local SearchFriendsByQuery = DependenciesModule.NetworkingFriends.SearchFriendsByQuery
local GetSuggestedCallees = DependenciesModule.NetworkingCall.GetSuggestedCallees
local UseStyleFunction = DependenciesModule.UIBlox.Core.Style.useStyle
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local FriendListItemModule = require(ContactList.Components.FriendList.FriendListItem)
local SectionHeaderModule = require(ContactList.Components.FriendList.SectionHeader)
local NoItemViewModule = require(ContactList.Components.ContactListCommon.NoItemView)
local ConstantsModule = require(ContactList.Components.ContactListCommon.Constants)
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserId = LocalPlayer and LocalPlayer.UserId or 0

return function(p1)
	-- upvalues: UseApolloClientFunction (copy), UseAnalyticsModule (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), RetrievalStatus (copy), GetFFlagSuggestedCalleeBugFixEnabledFunction (copy), GetSuggestedCallees (copy), UseSelectorFunction (copy), UserId (copy), HttpService (copy), EventNamesEnumModule (copy), FindFriendsFromUserId (copy), SearchFriendsByQuery (copy), PromiseModule (copy), CryoModule (copy), UserProfilesModule (copy), NoItemViewModule (copy), ConstantsModule (copy), SectionHeaderModule (copy), BlockingUtilityModule (copy), FriendListItemModule (copy), Loading (copy), IconSize (copy), RoactModule (copy), ExternalEventConnection (copy), UserInputService (copy)
	local UseApolloClientResult = UseApolloClientFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local Theme = UseStyleFunction().Theme
	local UseLocalizationResult = UseLocalizationFunction({
		genericErrorLabel = "Feature.Call.Error.Description.Generic",
		noFriendsLabel = "Feature.Call.Description.NoFriendsFound",
		addFriendsLabel = "Feature.Call.Prompt.AddFriends",
		suggestedFriendsTitle = "Feature.Call.Label.Suggested",
		suggestedFriendsDescription = "Feature.Call.Description.SuggestedFriends",
		friendsTitle = "Feature.Call.Label.Friends",
		friendsDescription = "Feature.Call.Description.Friends"
	})
	local UseRefResult = ReactModule.useRef(true)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(RetrievalStatus.Fetching)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local UseRefResult3 = ReactModule.useRef("")
	local UseMemoResult = nil
	UseMemoResult = if GetFFlagSuggestedCalleeBugFixEnabledFunction() then ReactModule.useMemo(function()
		-- upvalues: UseDispatchResult (copy), GetSuggestedCallees (upval)
		return UseDispatchResult(GetSuggestedCallees.API()):catch(function() end)
	end, {}) else ReactModule.useRef(UseDispatchResult(GetSuggestedCallees.API()):catch(function() end))
	local UseMemoResult1 = ReactModule.useMemo(function(): string
		-- upvalues: p1 (copy)
		return string.gsub(p1.searchText, "%s+", "")
	end, { p1.searchText })
	local UseResult = ReactModule.useCallback(function(p2, Cursor)
		-- upvalues: UserId (upval), UseRefResult (copy), UseStateResult2 (copy), RetrievalStatus (upval), UseRefResult3 (copy), HttpService (upval), UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), UseMemoResult1 (copy), UseDispatchResult (copy), FindFriendsFromUserId (upval), SearchFriendsByQuery (upval), PromiseModule (upval), GetFFlagSuggestedCalleeBugFixEnabledFunction (upval), UseMemoResult (ref), CryoModule (upval), UseApolloClientResult (copy), UserProfilesModule (upval), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		if UserId then
			UseRefResult.current = true
			UseStateResult2(RetrievalStatus.Fetching)
			local v1: number = if UseRefResult3.current == "" then 0 else 0.5
			local Guid = HttpService:GenerateGUID(false)
			UseRefResult3.current = Guid
			
			local function v58()
				-- upvalues: UseRefResult3 (upval), Guid (copy), UseAnalyticsModuleResult (upval), EventNamesEnumModule (upval), UseMemoResult1 (upval), UseDispatchResult (upval), FindFriendsFromUserId (upval), UserId (upval), Cursor (copy), SearchFriendsByQuery (upval), PromiseModule (upval), GetFFlagSuggestedCalleeBugFixEnabledFunction (upval), UseMemoResult (upval), p2 (copy), CryoModule (upval), UseApolloClientResult (upval), UserProfilesModule (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval), UseStateResult2 (upval), RetrievalStatus (upval)
				if UseRefResult3.current == Guid then
					UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookSearchAttempted, {
						eventTimestampMs = os.time() * 1000,
						searchQueryString = UseMemoResult1
					})
					PromiseModule.all({
						UseDispatchResult(if UseMemoResult1 == "" then FindFriendsFromUserId.API(UserId, { userSort = "CombinedName", limit = 20, cursor = Cursor }) else SearchFriendsByQuery.API(UserId, {
							userSort = "CombinedName",
							limit = 20,
							cursor = Cursor,
							query = UseMemoResult1
						})),
						if GetFFlagSuggestedCalleeBugFixEnabledFunction() then UseMemoResult else UseMemoResult.current
					}):andThen(function(Entry)
						-- upvalues: UseRefResult3 (upval), Guid (upval), UseAnalyticsModuleResult (upval), EventNamesEnumModule (upval), UseMemoResult1 (upval), p2 (upval), CryoModule (upval), UseApolloClientResult (upval), UserProfilesModule (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval), UseStateResult2 (upval), RetrievalStatus (upval)
						if UseRefResult3.current ~= Guid then return end
						local Entry1 = Entry[1]
						local Entry2 = Entry[2]
						UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookSearchFinished, {
							eventTimestampMs = os.time() * 1000,
							searchQueryString = UseMemoResult1,
							searchResultCount = #Entry1.responseBody.PageItems
						})
						local List = {}
						
						for _, value in ipairs(p2) do
							table.insert(List, value)
						end
						for _, pageItem in ipairs(Entry1.responseBody.PageItems) do
							table.insert(List, pageItem)
						end
						local MapResult = CryoModule.List.map(List, function(p3): string
							return (tostring(p3.id))
						end)
						
						if UseMemoResult1 == "" and Entry2 ~= nil then
							for _, suggestedCallee in ipairs(Entry2.responseBody.suggestedCallees) do
								table.insert(MapResult, (tostring(suggestedCallee.userId)))
							end
						end
						UseApolloClientResult:query({
							query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds,
							variables = { userIds = MapResult }
						}):andThen(function()
							-- upvalues: UseRefResult3 (upval), Guid (upval), UseStateResult2_2 (upval), List (copy), UseStateResult2_3 (upval), Entry1 (copy), UseStateResult2 (upval), RetrievalStatus (upval)
							if UseRefResult3.current == Guid then
								UseStateResult2_2(List)
								UseStateResult2_3(Entry1.responseBody.NextCursor)
								UseStateResult2(RetrievalStatus.Done)
								
								return
							end
						end):catch(function(_)
							-- upvalues: UseRefResult3 (upval), Guid (upval), UseStateResult2 (upval), RetrievalStatus (upval)
							if UseRefResult3.current == Guid then
								UseStateResult2(RetrievalStatus.Failed)
								
								return
							end
						end)
					end, function()
						-- upvalues: UseRefResult3 (upval), Guid (upval), UseStateResult2 (upval), RetrievalStatus (upval)
						if UseRefResult3.current == Guid then
							UseStateResult2(RetrievalStatus.Failed)
							
							return
						end
					end)
					
					return
				end
			end
			
			if v1 == 0 then
				v58()
				
				return
			end
			delay(v1, v58)
		end
	end, {
		UseMemoResult1,
		UseSelectorFunction(function(p3)
			return p3.LastRemovedFriend.lastRemovedFriendId
		end),
		if GetFFlagSuggestedCalleeBugFixEnabledFunction() then UseMemoResult else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		UseResult({}, "")
		
		return function()
			-- upvalues: UseStateResult2_2 (upval), UseStateResult2_3 (upval)
			UseStateResult2_2({})
			UseStateResult2_3(nil)
		end
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), RetrievalStatus (upval), UseRefResult (copy)
		if UseStateResult ~= RetrievalStatus.Fetching then
			UseRefResult.current = false
		end
	end, { UseStateResult })
	local UseSelectorResult = UseSelectorFunction(ReactModule.useCallback(function(p3)
		return p3.Call.suggestedCallees.suggestedCallees
	end, {}), function(List, p3): boolean
		if #List ~= #p3 then
			return false
		end
		for i, value in ipairs(List) do
			if value.userId ~= p3[i].userId then
				return false
			end
		end
		return true
	end) or {}
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), RetrievalStatus (upval), UseLocalizationResult (copy), p1 (copy), ReactModule (upval), NoItemViewModule (upval), UseResult (copy), UseStateResult3 (copy), UseStateResult4 (copy)
		return ReactModule.createElement(NoItemViewModule, {
			isCallButtonEnabled = false,
			isImageEnabled = UseStateResult ~= RetrievalStatus.Failed,
			imageName = if p1.searchText == "" then "icons/graphic/findfriends_xlarge" else "icons/status/oof_xlarge",
			isFailedButtonEnabled = UseStateResult == RetrievalStatus.Failed,
			onFailedButtonActivated = function()
				-- upvalues: UseResult (upval), UseStateResult3 (upval), UseStateResult4 (upval)
				UseResult(UseStateResult3, UseStateResult4)
			end,
			onCallButtonActivated = function() end,
			messageText = if UseStateResult == RetrievalStatus.Failed then UseLocalizationResult.genericErrorLabel elseif p1.searchText == "" then UseLocalizationResult.addFriendsLabel else UseLocalizationResult.noFriendsLabel
		})
	end, {
		p1.searchText, UseStateResult3, UseResult,
		UseLocalizationResult.addFriendsLabel, UseLocalizationResult.genericErrorLabel,
		UseLocalizationResult.noFriendsLabel, UseStateResult4, UseStateResult
	})
	local UseResult1 = ReactModule.useCallback(function(p4)
		-- upvalues: UseRefResult2 (copy)
		UseRefResult2.current = p4.Position.Y
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p4)
		-- upvalues: UseRefResult2 (copy), ConstantsModule (upval), UseRefResult1 (copy), UseStateResult2_1 (copy)
		if ConstantsModule.TOUCH_SLOP < p4.Position.Y - UseRefResult2.current and UseRefResult1.current and UseRefResult1.current.CanvasPosition.Y == 0 then
			UseStateResult2_1(true)
		end
	end, {})
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = ReactModule.useMemo(function()
			-- upvalues: CryoModule (upval), UseStateResult3 (copy), UseSelectorResult (copy)
			return CryoModule.List.map(CryoModule.List.join(UseStateResult3, UseSelectorResult), function(p4): string
				return (tostring(p4.id or p4.userId))
			end)
		end),
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseSelectorResult (copy), UseMemoResult1 (copy), SectionHeaderModule (upval), UseLocalizationResult (copy), BlockingUtilityModule (upval), UseUserProfilesFetchResult (copy), UserProfilesModule (upval), FriendListItemModule (upval), p1 (copy), UseStateResult3 (copy), UseStateResult4 (copy), UseStateResult (copy), RetrievalStatus (upval), UseMemoResult2 (copy), ConstantsModule (upval), Loading (upval), IconSize (upval)
		local Elements = {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		
		if #UseSelectorResult ~= 0 and UseMemoResult1 == "" then
			Elements[#Elements + 1] = ReactModule.createElement(SectionHeaderModule, {
				name = UseLocalizationResult.suggestedFriendsTitle,
				description = UseLocalizationResult.suggestedFriendsDescription,
				layoutOrder = #Elements + 1
			})
			local List = {}
			
			for _, value in ipairs(UseSelectorResult) do
				if not BlockingUtilityModule:IsPlayerBlockedByUserId(value.userId) then
					table.insert(List, value)
				end
			end
			for ItemListIndex, value1 in ipairs(List) do
				local CombinedNameFromId = ""
				local UsernameFromId = ""
				
				if UseUserProfilesFetchResult.data then
					CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, value1.userId)
					UsernameFromId = UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, value1.userId)
				end
				Elements[#Elements + 1] = ReactModule.createElement(FriendListItemModule, {
					isSuggestedUser = true,
					userId = value1.userId,
					combinedName = CombinedNameFromId,
					userName = UsernameFromId,
					userPresenceType = value1.userPresenceType,
					lastLocation = value1.lastLocation,
					dismissCallback = p1.dismissCallback,
					layoutOrder = #Elements + 1,
					showDivider = ItemListIndex ~= #List,
					itemListIndex = ItemListIndex
				})
			end
		end
		if #UseStateResult3 ~= 0 then
			Elements[#Elements + 1] = ReactModule.createElement(SectionHeaderModule, {
				name = UseLocalizationResult.friendsTitle,
				description = UseLocalizationResult.friendsDescription,
				layoutOrder = #Elements + 1
			})
		end
		local List = {}
		
		for _, value2 in ipairs(UseStateResult3) do
			if not BlockingUtilityModule:IsPlayerBlockedByUserId(value2.id) then
				table.insert(List, value2)
			end
		end
		for ItemListIndex1, value3 in ipairs(List) do
			local CombinedNameFromId = ""
			local UsernameFromId = ""
			
			if UseUserProfilesFetchResult.data then
				CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, value3.id)
				UsernameFromId = UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, value3.id)
			end
			Elements[#Elements + 1] = ReactModule.createElement(FriendListItemModule, {
				isSuggestedUser = false,
				userId = value3.id,
				combinedName = CombinedNameFromId,
				userName = UsernameFromId,
				dismissCallback = p1.dismissCallback,
				layoutOrder = #Elements + 1,
				showDivider = ItemListIndex1 ~= #List,
				searchQueryString = UseMemoResult1,
				itemListIndex = ItemListIndex1
			})
		end
		if UseStateResult4 ~= nil then
			local LayoutOrder = #Elements + 1
			
			if UseStateResult == RetrievalStatus.Failed then
				Elements[LayoutOrder] = UseMemoResult2
				
				return Elements
			end
			Elements[LayoutOrder] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ConstantsModule.ITEM_HEIGHT),
				LayoutOrder = LayoutOrder
			}, {
				LoadingSpinner = ReactModule.createElement(Loading, {
					size = IconSize.Large,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		end
		return Elements
	end, {
		UseStateResult3, UseStateResult4, UseMemoResult2, UseStateResult,
		UseUserProfilesFetchResult.data, UseSelectorResult, UseMemoResult1,
		UseLocalizationResult.friendsDescription, UseLocalizationResult.friendsTitle,
		UseLocalizationResult.suggestedFriendsDescription,
		UseLocalizationResult.suggestedFriendsTitle
	})
	local UseResult4 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseRefResult (copy), UseStateResult (copy), RetrievalStatus (upval), UseStateResult4 (copy), UseResult (copy), UseStateResult3 (copy)
		if not UseRefResult.current and UseStateResult ~= RetrievalStatus.Failed and UseStateResult4 ~= nil and ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteSize.Y - 50 <= ScrollFrame.CanvasPosition.Y then
			UseResult(UseStateResult3, UseStateResult4)
		end
	end, {
		UseStateResult3,
		UseResult,
		UseStateResult4,
		UseStateResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult3 (copy), ConstantsModule (upval), UseRefResult1 (copy), UseResult4 (copy)
		local ScaledITEMHEIGHT = (#UseMemoResult3 - 1) * ConstantsModule.ITEM_HEIGHT
		
		if UseRefResult1.current and ScaledITEMHEIGHT <= UseRefResult1.current.AbsoluteSize.Y then
			UseResult4(UseRefResult1.current)
		end
	end, { UseMemoResult3, UseResult4 })
	
	return if #UseStateResult3 == 0 and UseStateResult == RetrievalStatus.Fetching then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, ConstantsModule.ITEM_HEIGHT)
	}, {
		LoadingSpinner = ReactModule.createElement(Loading, {
			size = IconSize.Large,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		})
	}) elseif #UseStateResult3 == 0 then UseMemoResult2 else RoactModule.createFragment({
		FriendsScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			ElasticBehavior = Enum.ElasticBehavior.Never,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = not UseStateResult1 and p1.scrollingEnabled,
			ScrollBarImageColor3 = Theme.UIEmphasis.Color,
			ScrollBarImageTransparency = Theme.UIEmphasis.Transparency,
			ScrollBarThickness = 4,
			ref = UseRefResult1,
			[ReactModule.Change.CanvasPosition] = UseResult4
		}, UseMemoResult3),
		TouchStartedUserInputConnection = p1.isSmallScreen and (p1.scrollingEnabled and ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService.TouchStarted,
			callback = UseResult1
		})),
		TouchMovedUserInputConnection = p1.isSmallScreen and (p1.scrollingEnabled and ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService.TouchMoved,
			callback = UseResult2
		})),
		TouchEndedUserInputConnection = p1.isSmallScreen and (p1.scrollingEnabled and ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService.TouchEnded,
			callback = UseResult3
		}))
	})
end