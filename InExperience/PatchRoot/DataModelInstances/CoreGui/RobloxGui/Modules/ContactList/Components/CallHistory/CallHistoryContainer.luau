local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local apolloClientModule = require(corePackagesService.Packages.ApolloClient)
local cryoModule = require(corePackagesService.Packages.Cryo)
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local externalEventConnection = require(corePackagesService.Workspace.Packages.RoactUtils).ExternalEventConnection
local retrievalStatus = require(corePackagesService.Workspace.Packages.Http).Enum.RetrievalStatus
local userProfilesModule = require(corePackagesService.Workspace.Packages.UserProfiles)
local useApolloClient = apolloClientModule.useApolloClient
local contactList = coreGuiService:WaitForChild("RobloxGui").Modules.ContactList
local setCurrentPageModule = require(contactList.Actions.SetCurrentPage)
local pagesModule = require(contactList.Enums.Pages)
local dependenciesModule = require(contactList.dependencies)
local networkingCall = dependenciesModule.NetworkingCall
local useDispatch = dependenciesModule.Hooks.useDispatch
local UIBlox = dependenciesModule.UIBlox
local foundation = dependenciesModule.Foundation
local iconSize = foundation.Enums.IconSize
local loading = foundation.Loading
local useLocalization = dependenciesModule.Hooks.useLocalization
local useSelector = dependenciesModule.Hooks.useSelector
local useStyle = UIBlox.Core.Style.useStyle
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local callHistoryItemModule = require(contactList.Components.CallHistory.CallHistoryItem)
local noItemViewModule = require(contactList.Components.ContactListCommon.NoItemView)
local constantsModule = require(contactList.Components.ContactListCommon.Constants)
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local localPlayer = game:GetService("Players").LocalPlayer
local var17 = if localPlayer then localPlayer.UserId else 0

return function(p0) --[[ line: 53 | named "CallHistoryContainer" ]]
	-- upvalues: useApolloClient (ref), useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useLocalization (ref), reactModule (ref), retrievalStatus (ref), useSelector (ref), networkingCall (ref), userProfilesModule (ref), cryoModule (ref), eventNamesEnumModule (ref), pagesModule (ref), setCurrentPageModule (ref), noItemViewModule (ref), constantsModule (ref), var17 (ref), blockingUtilityModule (ref), callHistoryItemModule (ref), loading (ref), iconSize (ref), roactModule (ref), externalEventConnection (ref), userInputService (ref)
	local var18 = useApolloClient()
	local var19 = useAnalyticsModule()
	local var20 = useDispatch()
	local theme = useStyle().Theme
	local var21 = useLocalization({
		genericErrorLabel = "Feature.Call.Error.Description.Generic",
		noCallsLabel = "Feature.Call.Prompt.FirstCall"
	})
	local var22 = reactModule.useRef(true)
	local var23 = reactModule.useRef(nil)
	local var24 = reactModule.useRef(0)
	local var25, var26 = reactModule.useState(retrievalStatus.Fetching)
	local var27, var28 = reactModule.useState(false)
	local var29, var30 = reactModule.useState({})
	local var31, var32 = reactModule.useState("")
	local var33 = useSelector(reactModule.useCallback(function(p1) --[[ line: 79 ]]
		return p1.Navigation.currentPage
	end, {}))
	local var34 = reactModule.useCallback(function(p2, p3) --[[ line: 84 ]]
		-- upvalues: var22 (ref), var26 (ref), retrievalStatus (copy), var20 (ref), networkingCall (copy), var18 (ref), userProfilesModule (copy), cryoModule (copy), var30 (ref), var32 (ref)
		var22.current = true
		var26(retrievalStatus.Fetching)
		var20(networkingCall.GetCallHistory.API({
			cursor = p3,
			limit = if p3 == "" then 16 else 8,
			universeId = game.GameId
		})):andThen(function(p4) --[[ line: 89 ]]
			-- upvalues: p2 (ref), var18 (copy), userProfilesModule (copy), cryoModule (copy), var30 (copy), var32 (copy), var26 (copy), retrievalStatus (copy)
			local t = {}
			
			for i, v in ipairs(p2) do
				table.insert(t, v)
			end
			for i, v_1 in ipairs(p4.responseBody.callRecords) do
				table.insert(t, v_1)
			end
			local t_1 = {}
			
			for i_2, v_2 in ipairs(t) do
				for i_3, v_3 in ipairs(v_2.participants) do
					t_1[tostring(v_3.userId)] = true
				end
			end
			var18:query({
				query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds,
				variables = { userIds = cryoModule.Dictionary.keys(t_1) }
			}):andThen(function() --[[ line: 110 ]]
				-- upvalues: var30 (copy), t (ref), var32 (copy), p4 (ref), var26 (copy), retrievalStatus (copy)
				var30(t)
				var32(p4.responseBody.nextPageCursor)
				var26(retrievalStatus.Done)
			end):catch(function() --[[ line: 116 ]]
				-- upvalues: var26 (copy), retrievalStatus (copy)
				var26(retrievalStatus.Failed)
			end)
		end, function() --[[ line: 120 ]]
			-- upvalues: var26 (copy), retrievalStatus (copy)
			var26(retrievalStatus.Failed)
		end)
	end, {
		useSelector(function(p5) --[[ line: 75 ]]
			return p5.LastRemovedFriend.lastRemovedFriendId
		end)
	})
	reactModule.useEffect(function() --[[ line: 126 ]]
		-- upvalues: var34 (ref), var30 (ref), var32 (ref)
		var34({}, "")
		
		return function() --[[ line: 129 ]]
			-- upvalues: var30 (copy), var32 (copy)
			var30({})
			var32("")
		end
	end, { var34 })
	local var35 = reactModule.useCallback(function() --[[ line: 135 ]]
		-- upvalues: var19 (ref), eventNamesEnumModule (copy), var33 (ref), pagesModule (copy), var20 (ref), setCurrentPageModule (copy)
		var19.fireEvent(eventNamesEnumModule.PhoneBookNavigate, {
			eventTimestampMs = os.time() * 1000,
			startingPage = var33,
			destinationPage = pagesModule.FriendList
		})
		var20(setCurrentPageModule(pagesModule.FriendList))
	end, { var33 })
	reactModule.useEffect(function() --[[ line: 144 ]]
		-- upvalues: var25 (ref), retrievalStatus (copy), var22 (ref)
		if var25 ~= retrievalStatus.Fetching then
			var22.current = false
		end
	end, { var25 })
	local var36 = reactModule.useMemo(function() --[[ line: 150 ]]
		-- upvalues: var25 (ref), retrievalStatus (copy), var21 (ref), reactModule (copy), noItemViewModule (copy), var34 (ref), var29 (ref), var31 (ref), var35 (ref)
		return reactModule.createElement(noItemViewModule, {
			imageName = "icons/graphic/findfriends_xlarge",
			isImageEnabled = var25 ~= retrievalStatus.Failed,
			isFailedButtonEnabled = var25 == retrievalStatus.Failed,
			onFailedButtonActivated = function() --[[ line: 162 ]]
				-- upvalues: var34 (copy), var29 (copy), var31 (copy)
				var34(var29, var31)
			end,
			isCallButtonEnabled = var25 == retrievalStatus.Done,
			onCallButtonActivated = var35,
			messageText = if var25 == retrievalStatus.Failed then var21.genericErrorLabel else var21.noCallsLabel
		})
	end, {
		var29, var34, var21.genericErrorLabel, var21.noCallsLabel, var35, var31, var25
	})
	local var37 = reactModule.useCallback(function(p6) --[[ line: 179 ]]
		-- upvalues: var24 (ref)
		var24.current = p6.Position.Y
	end, {})
	local var38 = reactModule.useCallback(function(p7) --[[ line: 183 ]]
		-- upvalues: var24 (ref), constantsModule (copy), var23 (ref), var28 (ref)
		if constantsModule.TOUCH_SLOP < p7.Position.Y - var24.current and var23.current and var23.current.CanvasPosition.Y == 0 then
			var28(true)
		end
	end, {})
	local var39 = reactModule.useCallback(function() --[[ line: 198 ]]
		-- upvalues: var28 (ref)
		var28(false)
	end, {})
	local var40 = reactModule.useMemo(function() --[[ line: 202 ]]
		-- upvalues: reactModule (copy), var29 (ref), var17 (copy), blockingUtilityModule (copy), callHistoryItemModule (copy), p0 (ref), var31 (ref), var25 (ref), retrievalStatus (copy), var36 (ref), constantsModule (copy), loading (copy), iconSize (copy)
		local t = {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		local t_1 = {}
		
		for i, v in ipairs(var29) do
			local userId = v.participants[1].userId
			
			if userId == var17 then
				userId = v.participants[2].userId
			end
			if not blockingUtilityModule:IsPlayerBlockedByUserId(userId) then
				table.insert(t_1, v)
			end
		end
		for i_1, v_1 in ipairs(t_1) do
			t[i_1] = reactModule.createElement(callHistoryItemModule, {
				callRecord = v_1,
				localUserId = var17,
				showDivider = i_1 ~= #t_1,
				dismissCallback = p0.dismissCallback,
				layoutOrder = i_1
			})
		end
		if var31 ~= "" then
			local var46 = #t + 1
			
			if var25 == retrievalStatus.Failed then
				t[var46] = var36
				
				return t
			end
			t[var46] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, constantsModule.ITEM_HEIGHT),
				LayoutOrder = var46
			}, {
				LoadingSpinner = reactModule.createElement(loading, {
					size = iconSize.Large,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		end
		return t
	end, { var29, var31, var36, var25 })
	local var41 = reactModule.useCallback(function(p8) --[[ line: 255 ]]
		-- upvalues: var22 (ref), var25 (ref), retrievalStatus (copy), var31 (ref), var34 (ref), var29 (ref)
		if not var22.current and var25 ~= retrievalStatus.Failed and (var31 ~= "" and p8.AbsoluteCanvasSize.Y - p8.AbsoluteSize.Y - 50 <= p8.CanvasPosition.Y) then
			var34(var29, var31)
		end
	end, { var29, var34, var31, var25 })
	reactModule.useEffect(function() --[[ line: 266 ]]
		-- upvalues: var40 (ref), constantsModule (copy), var23 (ref), var41 (ref)
		if var23.current and (#var40 - 1) * constantsModule.ITEM_HEIGHT <= var23.current.AbsoluteSize.Y then
			var41(var23.current)
		end
	end, { var40, var41 })
	
	return if #var29 == 0 and var25 == retrievalStatus.Fetching then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, constantsModule.ITEM_HEIGHT)
	}, {
		LoadingSpinner = reactModule.createElement(loading, {
			size = iconSize.Large,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		})
	}) elseif #var29 == 0 then var36 else roactModule.createFragment({
		reactModule.createElement("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = theme.BackgroundDefault.Color,
			BackgroundTransparency = theme.BackgroundDefault.Transparency,
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			ElasticBehavior = Enum.ElasticBehavior.Never,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollingEnabled = not var27 and p0.scrollingEnabled,
			ScrollBarImageColor3 = theme.UIEmphasis.Color,
			ScrollBarImageTransparency = theme.UIEmphasis.Transparency,
			ScrollBarThickness = 4,
			ref = var23,
			[reactModule.Change.CanvasPosition] = var41
		}, var40),
		TouchStartedUserInputConnection = p0.isSmallScreen and (p0.scrollingEnabled and reactModule.createElement(externalEventConnection, { event = userInputService.TouchStarted, callback = var37 })),
		TouchMovedUserInputConnection = p0.isSmallScreen and (p0.scrollingEnabled and reactModule.createElement(externalEventConnection, { event = userInputService.TouchMoved, callback = var38 })),
		TouchEndedUserInputConnection = p0.isSmallScreen and (p0.scrollingEnabled and reactModule.createElement(externalEventConnection, { event = userInputService.TouchEnded, callback = var39 }))
	})
end