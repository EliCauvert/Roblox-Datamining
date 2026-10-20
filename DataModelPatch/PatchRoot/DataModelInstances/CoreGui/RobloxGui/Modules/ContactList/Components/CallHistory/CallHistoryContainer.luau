local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local UserProfilesModule = require(CorePackages.Workspace.Packages.UserProfiles)
local UseApolloClientFunction = require(CorePackages.Packages.ApolloClient).useApolloClient
local ContactList = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList
local SetCurrentPageModule = require(ContactList.Actions.SetCurrentPage)
local PagesModule = require(ContactList.Enums.Pages)
local DependenciesModule = require(ContactList.dependencies)
local NetworkingCall = DependenciesModule.NetworkingCall
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local Foundation = DependenciesModule.Foundation
local IconSize = Foundation.Enums.IconSize
local Loading = Foundation.Loading
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseStyleFunction = DependenciesModule.UIBlox.Core.Style.useStyle
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local CallHistoryItemModule = require(ContactList.Components.CallHistory.CallHistoryItem)
local NoItemViewModule = require(ContactList.Components.ContactListCommon.NoItemView)
local ConstantsModule = require(ContactList.Components.ContactListCommon.Constants)
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserId = LocalPlayer and LocalPlayer.UserId or 0

return function(p1)
	-- upvalues: UseApolloClientFunction (copy), UseAnalyticsModule (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), RetrievalStatus (copy), UseSelectorFunction (copy), NetworkingCall (copy), UserProfilesModule (copy), CryoModule (copy), EventNamesEnumModule (copy), PagesModule (copy), SetCurrentPageModule (copy), NoItemViewModule (copy), ConstantsModule (copy), UserId (copy), BlockingUtilityModule (copy), CallHistoryItemModule (copy), Loading (copy), IconSize (copy), RoactModule (copy), ExternalEventConnection (copy), UserInputService (copy)
	local UseApolloClientResult = UseApolloClientFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local Theme = UseStyleFunction().Theme
	local UseLocalizationResult = UseLocalizationFunction({
		genericErrorLabel = "Feature.Call.Error.Description.Generic",
		noCallsLabel = "Feature.Call.Prompt.FirstCall"
	})
	local UseRefResult = ReactModule.useRef(true)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(RetrievalStatus.Fetching)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.LastRemovedFriend.lastRemovedFriendId
	end)
	local UseSelectorResult1 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return p2.Navigation.currentPage
	end, {})))
	local UseResult = ReactModule.useCallback(function(p2, Cursor)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), RetrievalStatus (upval), UseDispatchResult (copy), NetworkingCall (upval), UseApolloClientResult (copy), UserProfilesModule (upval), CryoModule (upval), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		UseRefResult.current = true
		UseStateResult2(RetrievalStatus.Fetching)
		UseDispatchResult(NetworkingCall.GetCallHistory.API({
			cursor = Cursor,
			limit = if Cursor == "" then 16 else 8,
			universeId = game.GameId
		})):andThen(function(Result)
			-- upvalues: p2 (copy), UseApolloClientResult (upval), UserProfilesModule (upval), CryoModule (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval), UseStateResult2 (upval), RetrievalStatus (upval)
			local List = {}
			
			for _, value in ipairs(p2) do
				table.insert(List, value)
			end
			for _, callRecord in ipairs(Result.responseBody.callRecords) do
				table.insert(List, callRecord)
			end
			local t = {}
			
			for _, value1 in ipairs(List) do
				for _, participant in ipairs(value1.participants) do
					t[tostring(participant.userId)] = true
				end
			end
			UseApolloClientResult:query({
				query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds,
				variables = { userIds = CryoModule.Dictionary.keys(t) }
			}):andThen(function()
				-- upvalues: UseStateResult2_2 (upval), List (copy), UseStateResult2_3 (upval), Result (copy), UseStateResult2 (upval), RetrievalStatus (upval)
				UseStateResult2_2(List)
				UseStateResult2_3(Result.responseBody.nextPageCursor)
				UseStateResult2(RetrievalStatus.Done)
			end):catch(function()
				-- upvalues: UseStateResult2 (upval), RetrievalStatus (upval)
				UseStateResult2(RetrievalStatus.Failed)
			end)
		end, function()
			-- upvalues: UseStateResult2 (upval), RetrievalStatus (upval)
			UseStateResult2(RetrievalStatus.Failed)
		end)
	end, { UseSelectorResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy)
		UseResult({}, "")
		
		return function()
			-- upvalues: UseStateResult2_2 (upval), UseStateResult2_3 (upval)
			UseStateResult2_2({})
			UseStateResult2_3("")
		end
	end, { UseResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), UseSelectorResult1 (copy), PagesModule (upval), UseDispatchResult (copy), SetCurrentPageModule (upval)
		UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookNavigate, {
			eventTimestampMs = os.time() * 1000,
			startingPage = UseSelectorResult1,
			destinationPage = PagesModule.FriendList
		})
		UseDispatchResult(SetCurrentPageModule(PagesModule.FriendList))
	end, { UseSelectorResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), RetrievalStatus (upval), UseRefResult (copy)
		if UseStateResult ~= RetrievalStatus.Fetching then
			UseRefResult.current = false
		end
	end, { UseStateResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), RetrievalStatus (upval), UseLocalizationResult (copy), ReactModule (upval), NoItemViewModule (upval), UseResult (copy), UseStateResult3 (copy), UseStateResult4 (copy), UseResult1 (copy)
		return ReactModule.createElement(NoItemViewModule, {
			imageName = "icons/graphic/findfriends_xlarge",
			isImageEnabled = UseStateResult ~= RetrievalStatus.Failed,
			isFailedButtonEnabled = UseStateResult == RetrievalStatus.Failed,
			onFailedButtonActivated = function()
				-- upvalues: UseResult (upval), UseStateResult3 (upval), UseStateResult4 (upval)
				UseResult(UseStateResult3, UseStateResult4)
			end,
			isCallButtonEnabled = UseStateResult == RetrievalStatus.Done,
			onCallButtonActivated = UseResult1,
			messageText = if UseStateResult == RetrievalStatus.Failed then UseLocalizationResult.genericErrorLabel else UseLocalizationResult.noCallsLabel
		})
	end, {
		UseStateResult3, UseResult, UseLocalizationResult.genericErrorLabel,
		UseLocalizationResult.noCallsLabel, UseResult1, UseStateResult4, UseStateResult
	})
	local UseResult2 = ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult2 (copy)
		UseRefResult2.current = p3.Position.Y
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p3)
		-- upvalues: UseRefResult2 (copy), ConstantsModule (upval), UseRefResult1 (copy), UseStateResult2_1 (copy)
		if ConstantsModule.TOUCH_SLOP < p3.Position.Y - UseRefResult2.current and UseRefResult1.current and UseRefResult1.current.CanvasPosition.Y == 0 then
			UseStateResult2_1(true)
		end
	end, {})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseStateResult3 (copy), UserId (upval), BlockingUtilityModule (upval), CallHistoryItemModule (upval), p1 (copy), UseStateResult4 (copy), UseStateResult (copy), RetrievalStatus (upval), UseMemoResult (copy), ConstantsModule (upval), Loading (upval), IconSize (upval)
		local config = {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			})
		}
		local List = {}
		
		for _, value in ipairs(UseStateResult3) do
			local UserId1 = value.participants[1].userId
			
			if UserId1 == UserId then
				UserId1 = value.participants[2].userId
			end
			if not BlockingUtilityModule:IsPlayerBlockedByUserId(UserId1) then
				table.insert(List, value)
			end
		end
		for LayoutOrder, CallRecord in ipairs(List) do
			config[LayoutOrder] = ReactModule.createElement(CallHistoryItemModule, {
				callRecord = CallRecord,
				localUserId = UserId,
				showDivider = LayoutOrder ~= #List,
				dismissCallback = p1.dismissCallback,
				layoutOrder = LayoutOrder
			})
		end
		if UseStateResult4 ~= "" then
			local LayoutOrder1 = #config + 1
			
			if UseStateResult == RetrievalStatus.Failed then
				config[LayoutOrder1] = UseMemoResult
				
				return config
			end
			config[LayoutOrder1] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, ConstantsModule.ITEM_HEIGHT),
				LayoutOrder = LayoutOrder1
			}, {
				LoadingSpinner = ReactModule.createElement(Loading, {
					size = IconSize.Large,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				})
			})
		end
		return config
	end, {
		UseStateResult3,
		UseStateResult4,
		UseMemoResult,
		UseStateResult
	})
	local UseResult5 = ReactModule.useCallback(function(ScrollFrame)
		-- upvalues: UseRefResult (copy), UseStateResult (copy), RetrievalStatus (upval), UseStateResult4 (copy), UseResult (copy), UseStateResult3 (copy)
		if not UseRefResult.current and UseStateResult ~= RetrievalStatus.Failed and UseStateResult4 ~= "" and ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.AbsoluteSize.Y - 50 <= ScrollFrame.CanvasPosition.Y then
			UseResult(UseStateResult3, UseStateResult4)
		end
	end, {
		UseStateResult3,
		UseResult,
		UseStateResult4,
		UseStateResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult1 (copy), ConstantsModule (upval), UseRefResult1 (copy), UseResult5 (copy)
		local ScaledITEMHEIGHT = (#UseMemoResult1 - 1) * ConstantsModule.ITEM_HEIGHT
		
		if UseRefResult1.current and ScaledITEMHEIGHT <= UseRefResult1.current.AbsoluteSize.Y then
			UseResult5(UseRefResult1.current)
		end
	end, { UseMemoResult1, UseResult5 })
	
	return if #UseStateResult3 == 0 and UseStateResult == RetrievalStatus.Fetching then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, ConstantsModule.ITEM_HEIGHT)
	}, {
		LoadingSpinner = ReactModule.createElement(Loading, {
			size = IconSize.Large,
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		})
	}) elseif #UseStateResult3 == 0 then UseMemoResult else RoactModule.createFragment({
		ReactModule.createElement("ScrollingFrame", {
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
			[ReactModule.Change.CanvasPosition] = UseResult5
		}, UseMemoResult1),
		TouchStartedUserInputConnection = p1.isSmallScreen and (p1.scrollingEnabled and ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService.TouchStarted,
			callback = UseResult2
		})),
		TouchMovedUserInputConnection = p1.isSmallScreen and (p1.scrollingEnabled and ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService.TouchMoved,
			callback = UseResult3
		})),
		TouchEndedUserInputConnection = p1.isSmallScreen and (p1.scrollingEnabled and ReactModule.createElement(ExternalEventConnection, {
			event = UserInputService.TouchEnded,
			callback = UseResult4
		}))
	})
end