local CorePackages = game:GetService("CorePackages")
local SocialService = game:GetService("SocialService")
local ReactModule = require(CorePackages.Packages.React)
local PeekView = require(CorePackages.Workspace.Packages.PeekView).PeekView
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local Sounds = require(CorePackages.Workspace.Packages.SoundManager).Sounds
local SoundGroups = require(CorePackages.Workspace.Packages.SoundManager).SoundGroups
local SoundManager = require(CorePackages.Workspace.Packages.SoundManager).SoundManager
local UseIsSpatialFunction = require(CorePackages.Workspace.Packages.Responsive).useIsSpatial
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local ContactList = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList
local DependenciesModule = require(ContactList.dependencies)
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseStyleFunction = DependenciesModule.UIBlox.Core.Style.useStyle
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local ContactListHeaderModule = require(ContactList.Components.ContactListHeader)
local CallHistoryContainerModule = require(ContactList.Components.CallHistory.CallHistoryContainer)
local FriendListContainerModule = require(ContactList.Components.FriendList.FriendListContainer)
local ContactListSearchBarModule = require(ContactList.Components.ContactListSearchBar)
local SetCurrentPageModule = require(ContactList.Actions.SetCurrentPage)
local SetCurrentTagModule = require(ContactList.Actions.SetCurrentTag)
local OpenOrUpdateDialogModule = require(ContactList.Actions.OpenOrUpdateDialog)
local PagesModule = require(ContactList.Enums.Pages)
local ConstantsModule = require(ContactList.Parent.TopBar.Constants)
local LocalPlayer = game:GetService("Players").LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local NewApplyDisplayScaleResult = 12 + ConstantsModule.ApplyDisplayScale(ConstantsModule.TopBarHeight)

return function()
	-- upvalues: UseAnalyticsModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseIsSpatialFunction (copy), ReactModule (copy), CurrentCamera (copy), NewApplyDisplayScaleResult (copy), Signal (copy), UseSelectorFunction (copy), SocialService (copy), LocalPlayer (copy), SetCurrentTagModule (copy), EventNamesEnumModule (copy), PagesModule (copy), SetCurrentPageModule (copy), SoundManager (copy), Sounds (copy), SoundGroups (copy), OpenOrUpdateDialogModule (copy), RobloxTranslatorModule (copy), PeekViewState (copy), CallHistoryContainerModule (copy), FriendListContainerModule (copy), ContactListHeaderModule (copy), ContactListSearchBarModule (copy), PeekView (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local Theme = UseStyleFunction().Theme
	local UseDispatchResult = UseDispatchFunction()
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(CurrentCamera.ViewportSize.X < 640)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(CurrentCamera.ViewportSize.Y - NewApplyDisplayScaleResult)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local UseRefResult1 = ReactModule.useRef(Signal.new())
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p1)
		return p1.Navigation.currentPage
	end, {})))
	ReactModule.useEffect(function()
		-- upvalues: SocialService (upval), LocalPlayer (upval), UseIsSpatialResult (copy), UseDispatchResult (copy), SetCurrentTagModule (upval), UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), UseSelectorResult (copy), PagesModule (upval), SetCurrentPageModule (upval), SoundManager (upval), Sounds (upval), SoundGroups (upval), OpenOrUpdateDialogModule (upval), RobloxTranslatorModule (upval), UseStateResult2 (copy), UseStateResult (copy)
		local PromptIrisInviteRequestedConnection = SocialService.PromptIrisInviteRequested:Connect(function(Player, Tag)
			-- upvalues: LocalPlayer (upval), UseIsSpatialResult (upval), UseDispatchResult (upval), SetCurrentTagModule (upval), UseAnalyticsModuleResult (upval), EventNamesEnumModule (upval), UseSelectorResult (upval), PagesModule (upval), SetCurrentPageModule (upval), SoundManager (upval), Sounds (upval), SoundGroups (upval), OpenOrUpdateDialogModule (upval), RobloxTranslatorModule (upval), SocialService (upval)
			if LocalPlayer and LocalPlayer.UserId == Player.UserId then
				if UseIsSpatialResult then
					UseDispatchResult(OpenOrUpdateDialogModule(RobloxTranslatorModule:FormatByKey("Feature.Call.Error.Label.OhNo"), RobloxTranslatorModule:FormatByKey("Feature.Call.Error.Description.DeviceNotSupported"), function()
						-- upvalues: SocialService (upval), LocalPlayer (upval)
						SocialService:InvokeIrisInvitePromptClosed(LocalPlayer)
					end))
				else
					UseDispatchResult(SetCurrentTagModule(Tag))
					UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookNavigate, {
						eventTimestampMs = os.time() * 1000,
						startingPage = UseSelectorResult,
						destinationPage = PagesModule.CallHistory
					})
					UseDispatchResult(SetCurrentPageModule(PagesModule.CallHistory))
					SoundManager:PlaySound(Sounds.Swipe.Name, { Volume = 0.5 }, SoundGroups.Iris)
					
					return
				end
			end
		end)
		local PhoneBookPromptClosedConnection = SocialService.PhoneBookPromptClosed:Connect(function(Player)
			-- upvalues: LocalPlayer (upval), UseAnalyticsModuleResult (upval), EventNamesEnumModule (upval), UseSelectorResult (upval), UseDispatchResult (upval), SetCurrentPageModule (upval), UseStateResult2 (upval), UseStateResult (upval)
			if LocalPlayer and LocalPlayer.UserId == Player.UserId then
				UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookNavigate, {
					destinationPage = nil,
					eventTimestampMs = os.time() * 1000,
					startingPage = tostring(UseSelectorResult)
				})
				UseDispatchResult(SetCurrentPageModule(nil))
				UseStateResult2(UseStateResult + 1)
			end
		end)
		
		return function()
			-- upvalues: PromptIrisInviteRequestedConnection (copy), PhoneBookPromptClosedConnection (copy)
			PromptIrisInviteRequestedConnection:Disconnect()
			PhoneBookPromptClosedConnection:Disconnect()
		end
	end, { UseStateResult, UseSelectorResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), UseRefResult (copy), SoundManager (upval), Sounds (upval), SoundGroups (upval), NewApplyDisplayScaleResult (upval), SocialService (upval), LocalPlayer (upval), UseRefResult1 (copy)
		if not UseStateResult1 and UseRefResult.current then
			SoundManager:PlaySound(Sounds.Swipe.Name, { Volume = 0.5 }, SoundGroups.Iris)
			pcall(function()
				-- upvalues: UseRefResult (upval), NewApplyDisplayScaleResult (upval), SocialService (upval), LocalPlayer (upval)
				UseRefResult.current:TweenPositionInternal(UDim2.new(0, -376, 0, NewApplyDisplayScaleResult), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true, function()
					-- upvalues: SocialService (upval), LocalPlayer (upval)
					SocialService:InvokeIrisInvitePromptClosed(LocalPlayer)
				end)
			end)
			
			return
		end
		if UseRefResult1 and UseRefResult1.current then
			UseRefResult1.current:fire()
		end
	end, { UseStateResult1 })
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(p1)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: CurrentCamera (upval), UseStateResult2_1 (copy), UseStateResult2_3 (copy), NewApplyDisplayScaleResult (upval)
		local Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: CurrentCamera (upval), UseStateResult2_1 (upval), UseStateResult2_3 (upval), NewApplyDisplayScaleResult (upval)
			if CurrentCamera.ViewportSize.X < 640 then
				UseStateResult2_1(true)
			else
				UseStateResult2_1(false)
			end
			UseStateResult2_3(CurrentCamera.ViewportSize.Y - NewApplyDisplayScaleResult)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseStateResult1 (copy), UseRefResult (copy), NewApplyDisplayScaleResult (upval), UseStateResult2_2 (copy)
		if UseSelectorResult and not UseStateResult1 and UseRefResult.current then
			pcall(function()
				-- upvalues: UseRefResult (upval), NewApplyDisplayScaleResult (upval)
				UseRefResult.current:TweenPositionInternal(UDim2.new(0, 12, 0, NewApplyDisplayScaleResult), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true)
			end)
		end
		UseStateResult2_2("")
	end, { UseStateResult1, UseSelectorResult })
	local UseResult2 = ReactModule.useCallback(function(Closed, _)
		-- upvalues: PeekViewState (upval), LocalPlayer (upval), SocialService (upval), SoundManager (upval), Sounds (upval), SoundGroups (upval), UseStateResult2_4 (copy)
		if Closed == PeekViewState.Closed then
			if LocalPlayer then
				SocialService:InvokeIrisInvitePromptClosed(LocalPlayer)
			end
			SoundManager:PlaySound(Sounds.Swipe.Name, { Volume = 0.5 }, SoundGroups.Iris)
		end
		UseStateResult2_4(Closed)
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), UseSelectorResult (copy), PagesModule (upval), UseDispatchResult (copy), SetCurrentPageModule (upval), UseStateResult2_4 (copy), PeekViewState (upval)
		UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookSearchClicked, { eventTimestampMs = os.time() * 1000 })
		
		if UseSelectorResult ~= PagesModule.FriendList then
			UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookNavigate, {
				eventTimestampMs = os.time() * 1000,
				startingPage = UseSelectorResult,
				destinationPage = PagesModule.FriendList
			})
		end
		UseDispatchResult(SetCurrentPageModule(PagesModule.FriendList))
		UseStateResult2_4(PeekViewState.Full)
	end, { UseSelectorResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), PagesModule (upval), ReactModule (upval), CallHistoryContainerModule (upval), UseResult (copy), UseStateResult1 (copy), UseStateResult5 (copy), PeekViewState (upval), UseStateResult3 (copy), FriendListContainerModule (upval), UseStateResult4 (copy), NewApplyDisplayScaleResult (upval), Theme (copy), UseRefResult (copy), ContactListHeaderModule (upval), ContactListSearchBarModule (upval), UseResult1 (copy), UseResult3 (copy)
		return ReactModule.createElement("ImageButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Size = if UseStateResult1 then UDim2.new(1, 0, 0, UseStateResult4 - 25) else UDim2.new(0, 376, 1, -NewApplyDisplayScaleResult),
			Position = if UseStateResult1 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -376, 0, NewApplyDisplayScaleResult),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			ref = UseRefResult
		}, {
			UICorner = if UseStateResult1 then nil else ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) }),
			UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 8) }),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 8)
			}),
			Header = ReactModule.createElement(ContactListHeaderModule, {
				headerHeight = 36,
				layoutOrder = 1,
				currentPage = UseSelectorResult,
				dismissCallback = UseResult
			}),
			SearchBar = ReactModule.createElement(ContactListSearchBarModule, {
				layoutOrder = 2,
				searchBarHeight = 36,
				onSearchChanged = UseResult1,
				searchText = UseStateResult3,
				onFocused = UseResult3
			}),
			ContentContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 1, -88)
			}, if UseSelectorResult == PagesModule.CallHistory then ReactModule.createElement(CallHistoryContainerModule, {
				dismissCallback = UseResult,
				isSmallScreen = UseStateResult1,
				scrollingEnabled = not UseStateResult1 or UseStateResult5 == PeekViewState.Full,
				searchText = UseStateResult3
			}) elseif UseSelectorResult == PagesModule.FriendList then ReactModule.createElement(FriendListContainerModule, {
				dismissCallback = UseResult,
				isSmallScreen = UseStateResult1,
				scrollingEnabled = not UseStateResult1 or UseStateResult5 == PeekViewState.Full,
				searchText = UseStateResult3
			}) else nil)
		})
	end, {
		UseStateResult4, UseSelectorResult, UseResult, UseStateResult5,
		UseStateResult1, UseStateResult3
	})
	local Frames = {}
	
	if UseStateResult1 then
		Frames["ContactListContent" .. tostring(UseStateResult)] = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -NewApplyDisplayScaleResult),
			Position = UDim2.fromOffset(0, NewApplyDisplayScaleResult)
		}, {
			ReactModule.createElement(PeekView, {
				canDragFullViewToBrief = true,
				briefViewContentHeight = UDim.new(0.6, 0),
				closeSignal = UseRefResult1.current,
				elasticBehavior = Enum.ElasticBehavior.Never,
				peekViewState = UseStateResult5,
				viewStateChanged = UseResult2
			}, { Content = UseMemoResult })
		})
	else
		Frames.ContactListContent = UseMemoResult
	end
	return if UseSelectorResult then ReactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		[ReactModule.Event.Activated] = function()
			-- upvalues: UseResult (copy)
			UseResult()
		end
	}, Frames) else nil
end