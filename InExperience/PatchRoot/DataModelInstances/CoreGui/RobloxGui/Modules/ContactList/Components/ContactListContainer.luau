local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local socialService = game:GetService("SocialService")
local deprecateOldGuiObjectPropertiesEngineFeature = game:GetEngineFeature("DeprecateOldGuiObjectProperties")
local reactModule = require(corePackagesService.Packages.React)
local peekView = require(corePackagesService.Workspace.Packages.PeekView).PeekView
local peekViewState = require(corePackagesService.Workspace.Packages.PeekView).PeekViewState
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local sounds = require(corePackagesService.Workspace.Packages.SoundManager).Sounds
local soundGroups = require(corePackagesService.Workspace.Packages.SoundManager).SoundGroups
local soundManager = require(corePackagesService.Workspace.Packages.SoundManager).SoundManager
local useIsSpatial = require(corePackagesService.Workspace.Packages.Responsive).useIsSpatial
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local contactList = coreGuiService:WaitForChild("RobloxGui").Modules.ContactList
local dependenciesModule = require(contactList.dependencies)
local useSelector = dependenciesModule.Hooks.useSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local useStyle = dependenciesModule.UIBlox.Core.Style.useStyle
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local contactListHeaderModule = require(contactList.Components.ContactListHeader)
local callHistoryContainerModule = require(contactList.Components.CallHistory.CallHistoryContainer)
local friendListContainerModule = require(contactList.Components.FriendList.FriendListContainer)
local contactListSearchBarModule = require(contactList.Components.ContactListSearchBar)
local setCurrentPageModule = require(contactList.Actions.SetCurrentPage)
local setCurrentTagModule = require(contactList.Actions.SetCurrentTag)
local openOrUpdateDialogModule = require(contactList.Actions.OpenOrUpdateDialog)
local pagesModule = require(contactList.Enums.Pages)
local constantsModule = require(contactList.Parent.TopBar.Constants)
local localPlayer = game:GetService("Players").LocalPlayer
local currentCamera = workspace.CurrentCamera
local var18 = 12 + constantsModule.ApplyDisplayScale(constantsModule.TopBarHeight)

return function() --[[ line: 64 | named "ContactListContainer" ]]
	-- upvalues: useAnalyticsModule (ref), useStyle (ref), useDispatch (ref), useIsSpatial (ref), reactModule (ref), currentCamera (ref), var18 (ref), signal (ref), useSelector (ref), socialService (ref), localPlayer (ref), setCurrentTagModule (ref), eventNamesEnumModule (ref), pagesModule (ref), setCurrentPageModule (ref), soundManager (ref), sounds (ref), soundGroups (ref), openOrUpdateDialogModule (ref), robloxTranslatorModule (ref), deprecateOldGuiObjectPropertiesEngineFeature (ref), peekViewState (ref), callHistoryContainerModule (ref), friendListContainerModule (ref), contactListHeaderModule (ref), contactListSearchBarModule (ref), peekView (ref)
	local var19 = useAnalyticsModule()
	local theme = useStyle().Theme
	local var20 = useDispatch()
	local var21 = useIsSpatial()
	local var22 = reactModule.useRef(nil)
	local var23, var24 = reactModule.useState(0)
	local var25, var26 = reactModule.useState(currentCamera.ViewportSize.X < 640)
	local var27, var28 = reactModule.useState("")
	local var29, var30 = reactModule.useState(currentCamera.ViewportSize.Y - var18)
	local var31, var32 = reactModule.useState(nil)
	local var33 = reactModule.useRef(signal.new())
	local var34 = useSelector(reactModule.useCallback(function(p0) --[[ line: 87 ]]
		return p0.Navigation.currentPage
	end, {}))
	reactModule.useEffect(function() --[[ line: 92 ]]
		-- upvalues: socialService (copy), localPlayer (copy), var21 (ref), var20 (ref), setCurrentTagModule (copy), var19 (ref), eventNamesEnumModule (copy), var34 (ref), pagesModule (copy), setCurrentPageModule (copy), soundManager (copy), sounds (copy), soundGroups (copy), openOrUpdateDialogModule (copy), robloxTranslatorModule (copy), var24 (ref), var23 (ref)
		local promptIrisInviteRequestedConnection = socialService.PromptIrisInviteRequested:Connect(function(p1, p2) --[[ line: 94 ]]
			-- upvalues: localPlayer (copy), var21 (copy), var20 (copy), setCurrentTagModule (copy), var19 (copy), eventNamesEnumModule (copy), var34 (copy), pagesModule (copy), setCurrentPageModule (copy), soundManager (copy), sounds (copy), soundGroups (copy), openOrUpdateDialogModule (copy), robloxTranslatorModule (copy), socialService (copy)
			if localPlayer and localPlayer.UserId == p1.UserId then
				if var21 then
					var20(openOrUpdateDialogModule(robloxTranslatorModule:FormatByKey("Feature.Call.Error.Label.OhNo"), robloxTranslatorModule:FormatByKey("Feature.Call.Error.Description.DeviceNotSupported"), function() --[[ line: 111 ]]
						-- upvalues: socialService (copy), localPlayer (copy)
						socialService:InvokeIrisInvitePromptClosed(localPlayer)
					end))
				else
					var20(setCurrentTagModule(p2))
					var19.fireEvent(eventNamesEnumModule.PhoneBookNavigate, {
						eventTimestampMs = os.time() * 1000,
						startingPage = var34,
						destinationPage = pagesModule.CallHistory
					})
					var20(setCurrentPageModule(pagesModule.CallHistory))
					soundManager:PlaySound(sounds.Swipe.Name, { Volume = 0.5 }, soundGroups.Iris)
					
					return
				end
			end
		end)
		local _ = nil
		local phoneBookPromptClosedConnection = socialService.PhoneBookPromptClosed:Connect(function(p3) --[[ line: 123 ]]
			-- upvalues: localPlayer (copy), var19 (copy), eventNamesEnumModule (copy), var34 (copy), var20 (copy), setCurrentPageModule (copy), var24 (copy), var23 (copy)
			if localPlayer and localPlayer.UserId == p3.UserId then
				var19.fireEvent(eventNamesEnumModule.PhoneBookNavigate, {
					destinationPage = nil,
					eventTimestampMs = os.time() * 1000,
					startingPage = tostring(var34)
				})
				var20(setCurrentPageModule(nil))
				var24(var23 + 1)
			end
		end)
		
		return function() --[[ line: 136 ]]
			-- upvalues: promptIrisInviteRequestedConnection (ref), phoneBookPromptClosedConnection (ref)
			promptIrisInviteRequestedConnection:Disconnect()
			phoneBookPromptClosedConnection:Disconnect()
		end
	end, { var23, var34 })
	local var35 = reactModule.useCallback(function() --[[ line: 142 ]]
		-- upvalues: var25 (ref), var22 (ref), soundManager (copy), sounds (copy), soundGroups (copy), deprecateOldGuiObjectPropertiesEngineFeature (copy), var18 (copy), socialService (copy), localPlayer (copy), var33 (ref)
		if not var25 and var22.current then
			soundManager:PlaySound(sounds.Swipe.Name, { Volume = 0.5 }, soundGroups.Iris)
			pcall(function() --[[ line: 145 ]]
				-- upvalues: deprecateOldGuiObjectPropertiesEngineFeature (copy), var22 (copy), var18 (copy), socialService (copy), localPlayer (copy)
				if deprecateOldGuiObjectPropertiesEngineFeature then
					var22.current:TweenPositionInternal(UDim2.new(0, -376, 0, var18), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true, function() --[[ line: 153 ]]
						-- upvalues: socialService (copy), localPlayer (copy)
						socialService:InvokeIrisInvitePromptClosed(localPlayer)
					end)
					
					return
				end
				var22.current:TweenPosition(UDim2.new(0, -376, 0, var18), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true, function() --[[ line: 164 ]]
					-- upvalues: socialService (copy), localPlayer (copy)
					socialService:InvokeIrisInvitePromptClosed(localPlayer)
				end)
			end)
			
			return
		elseif var33 and var33.current then
			var33.current:fire()
		end
	end, { var25 })
	local var36 = reactModule.useCallback(function(p4) --[[ line: 177 ]]
		-- upvalues: var28 (ref)
		var28(p4)
	end, {})
	reactModule.useEffect(function() --[[ line: 182 ]]
		-- upvalues: currentCamera (copy), var26 (ref), var30 (ref), var18 (copy)
		local var43 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 183 ]]
			-- upvalues: currentCamera (copy), var26 (copy), var30 (copy), var18 (copy)
			if currentCamera.ViewportSize.X < 640 then
				var26(true)
			else
				var26(false)
			end
			var30(currentCamera.ViewportSize.Y - var18)
		end)
		
		return function() --[[ line: 193 ]]
			-- upvalues: var43 (ref)
			var43:Disconnect()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 198 ]]
		-- upvalues: var34 (ref), var25 (ref), var22 (ref), deprecateOldGuiObjectPropertiesEngineFeature (copy), var18 (copy), var28 (ref)
		if var34 and not var25 and var22.current then
			pcall(function() --[[ line: 200 ]]
				-- upvalues: deprecateOldGuiObjectPropertiesEngineFeature (copy), var22 (copy), var18 (copy)
				if deprecateOldGuiObjectPropertiesEngineFeature then
					var22.current:TweenPositionInternal(UDim2.new(0, 12, 0, var18), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true)
					
					return
				end
				var22.current:TweenPosition(UDim2.new(0, 12, 0, var18), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true)
			end)
		end
		var28("")
	end, { var25, var34 })
	local var37 = reactModule.useCallback(function(p5, _) --[[ line: 225 ]]
		-- upvalues: peekViewState (copy), localPlayer (copy), socialService (copy), soundManager (copy), sounds (copy), soundGroups (copy), var32 (ref)
		if p5 == peekViewState.Closed then
			if localPlayer then
				socialService:InvokeIrisInvitePromptClosed(localPlayer)
			end
			soundManager:PlaySound(sounds.Swipe.Name, { Volume = 0.5 }, soundGroups.Iris)
		end
		var32(p5)
	end, {})
	local var38 = reactModule.useCallback(function() --[[ line: 237 ]]
		-- upvalues: var19 (ref), eventNamesEnumModule (copy), var34 (ref), pagesModule (copy), var20 (ref), setCurrentPageModule (copy), var32 (ref), peekViewState (copy)
		var19.fireEvent(eventNamesEnumModule.PhoneBookSearchClicked, { eventTimestampMs = os.time() * 1000 })
		
		if var34 ~= pagesModule.FriendList then
			var19.fireEvent(eventNamesEnumModule.PhoneBookNavigate, {
				eventTimestampMs = os.time() * 1000,
				startingPage = var34,
				destinationPage = pagesModule.FriendList
			})
		end
		var20(setCurrentPageModule(pagesModule.FriendList))
		var32(peekViewState.Full)
	end, { var34 })
	local var39 = reactModule.useMemo(function() --[[ line: 251 ]]
		-- upvalues: var34 (ref), pagesModule (copy), reactModule (copy), callHistoryContainerModule (copy), var35 (ref), var25 (ref), var31 (ref), peekViewState (copy), var27 (ref), friendListContainerModule (copy), var29 (ref), var18 (copy), theme (ref), var22 (ref), contactListHeaderModule (copy), contactListSearchBarModule (copy), var36 (ref), var38 (ref)
		local var44 = nil
		
		if var34 == pagesModule.CallHistory then
			var44 = reactModule.createElement(callHistoryContainerModule, {
				dismissCallback = var35,
				isSmallScreen = var25,
				scrollingEnabled = not var25 or var31 == peekViewState.Full,
				searchText = var27
			})
		elseif var34 == pagesModule.FriendList then
			var44 = reactModule.createElement(friendListContainerModule, {
				dismissCallback = var35,
				isSmallScreen = var25,
				scrollingEnabled = not var25 or var31 == peekViewState.Full,
				searchText = var27
			})
		end
		return reactModule.createElement("ImageButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Size = if var25 then UDim2.new(1, 0, 0, var29 - 25) else UDim2.new(0, 376, 1, -var18),
			Position = if var25 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -376, 0, var18),
			BackgroundColor3 = theme.BackgroundDefault.Color,
			BackgroundTransparency = theme.BackgroundDefault.Transparency,
			ref = var22
		}, {
			UICorner = if var25 then nil else reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) }),
			UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 8) }),
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 8)
			}),
			Header = reactModule.createElement(contactListHeaderModule, {
				headerHeight = 36,
				layoutOrder = 1,
				currentPage = var34,
				dismissCallback = var35
			}),
			SearchBar = reactModule.createElement(contactListSearchBarModule, {
				layoutOrder = 2,
				searchBarHeight = 36,
				onSearchChanged = var36,
				searchText = var27,
				onFocused = var38
			}),
			ContentContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 1, -88)
			}, var44)
		})
	end, {
		var29, var34, var35, var31, var25, var27
	})
	local t = {}
	
	if var25 then
		t["ContactListContent" .. tostring(var23)] = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, -var18),
			Position = UDim2.fromOffset(0, var18)
		}, {
			reactModule.createElement(peekView, {
				canDragFullViewToBrief = true,
				briefViewContentHeight = UDim.new(0.6, 0),
				closeSignal = var33.current,
				elasticBehavior = Enum.ElasticBehavior.Never,
				peekViewState = var31,
				viewStateChanged = var37
			}, { Content = var39 })
		})
	else
		t.ContactListContent = var39
	end
	return if var34 then reactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		[reactModule.Event.Activated] = function() --[[ line: 353 ]]
			-- upvalues: var35 (ref)
			var35()
		end
	}, t) else nil
end