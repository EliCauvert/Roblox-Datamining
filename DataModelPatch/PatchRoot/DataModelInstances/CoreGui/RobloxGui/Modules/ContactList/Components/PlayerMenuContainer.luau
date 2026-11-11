local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local ContactList = RobloxGui.Modules.ContactList
local BlockPlayerModule = require(RobloxGui.Modules.PlayerList.Thunks.BlockPlayer)
local DependenciesModule = require(ContactList.dependencies)
local UnfriendTargetUserId = DependenciesModule.NetworkingFriends.UnfriendTargetUserId
local UIBlox = DependenciesModule.UIBlox
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local CloseCFMModule = require(ContactList.Actions.CloseCFM)
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local ConfigureFriendMenuModule = require(ContactList.Components.ContactListCommon.ConfigureFriendMenu)
local FriendActionModule = require(ContactList.Enums.FriendAction)
local UpdateLastFriendModule = require(ContactList.Actions.UpdateLastFriend)
local UseStyleFunction = UIBlox.Core.Style.useStyle
local WithStyleFunction = UIBlox.Style.withStyle
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserId = LocalPlayer and LocalPlayer.UserId or 0

return function()
	-- upvalues: UseAnalyticsModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), FriendActionModule (copy), BlockPlayerModule (copy), UpdateLastFriendModule (copy), UnfriendTargetUserId (copy), UserId (copy), EventNamesEnumModule (copy), ConfigureFriendMenuModule (copy), WithStyleFunction (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy), CloseCFMModule (copy), CoreGui (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local Theme = UseStyleFunction().Theme
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return p1.PlayerMenu.isOpen
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		return p1.PlayerMenu.friend
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		blockAction = "Feature.Friends.Action.Block",
		unfriendAction = "Feature.Friends.Action.Unfriend",
		cancelAction = "Feature.Friends.Label.Cancel",
		blockTitle = {
			"Feature.Call.Label.Block",
			combinedName = UseSelectorResult1.combinedName
		},
		unfriendTitle = {
			"Feature.Call.Label.Unfriend",
			combinedName = UseSelectorResult1.combinedName
		},
		confirmationDescription = {
			"Feature.SettingsHub.Message.BlockConfirmation",
			DISPLAY_NAME = UseSelectorResult1.combinedName,
			RBX_NAME = UseSelectorResult1.userName
		}
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(FriendActionModule.NoAction)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), FriendActionModule (upval), UseDispatchResult (copy), BlockPlayerModule (upval), UseSelectorResult1 (copy), UpdateLastFriendModule (upval), UnfriendTargetUserId (upval), UserId (upval), UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval)
		if UseStateResult == FriendActionModule.Block then
			UseDispatchResult(BlockPlayerModule({ UserId = UseSelectorResult1.userId }))
			UseDispatchResult(UpdateLastFriendModule(UseSelectorResult1.userId))
			
			return
		end
		if UseStateResult == FriendActionModule.Unfriend then
			UseDispatchResult((UnfriendTargetUserId.API({
				currentUserId = UserId,
				targetUserId = UseSelectorResult1.userId
			}))):andThen(function(_)
				-- upvalues: UseAnalyticsModuleResult (upval), EventNamesEnumModule (upval), UseSelectorResult1 (upval), UseDispatchResult (upval), UpdateLastFriendModule (upval)
				UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookPlayerMenuUnfriendFinished, {
					success = true,
					eventTimestampMs = os.time() * 1000,
					friendUserId = UseSelectorResult1.userId
				})
				UseDispatchResult(UpdateLastFriendModule(UseSelectorResult1.userId))
			end):catch(function(_)
				-- upvalues: UseAnalyticsModuleResult (upval), EventNamesEnumModule (upval), UseSelectorResult1 (upval)
				UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.PhoneBookPlayerMenuUnfriendFinished, {
					success = false,
					eventTimestampMs = os.time() * 1000,
					friendUserId = UseSelectorResult1.userId
				})
			end)
		end
	end, { UseStateResult, UseSelectorResult1.userId })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), FriendActionModule (upval), UseStateResult2_2 (copy), UseLocalizationResult (copy), UseStateResult2_3 (copy)
		if UseStateResult == FriendActionModule.Block then
			UseStateResult2_2(UseLocalizationResult.blockTitle)
			UseStateResult2_3(UseLocalizationResult.blockAction)
			
			return
		end
		if UseStateResult == FriendActionModule.Unfriend then
			UseStateResult2_2(UseLocalizationResult.unfriendTitle)
			UseStateResult2_3(UseLocalizationResult.unfriendAction)
		end
	end, {
		UseStateResult, UseSelectorResult1.combinedName,
		UseLocalizationResult.blockAction, UseLocalizationResult.blockTitle,
		UseLocalizationResult.unfriendAction, UseLocalizationResult.unfriendTitle
	})
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p1)
	end, {})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), ConfigureFriendMenuModule (upval), UseResult1 (copy)
		return ReactModule.createElement(ConfigureFriendMenuModule, { initiateConfirmation = UseResult1 })
	end, {})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: WithStyleFunction (upval), RoactModule (upval), InteractiveAlert (upval), UseStateResult3 (copy), UseLocalizationResult (copy), ButtonType (upval), UseDispatchResult (copy), CloseCFMModule (upval), UseStateResult2 (copy), FriendActionModule (upval), UseStateResult4 (copy), UseResult (copy), UseStateResult1 (copy)
		return WithStyleFunction(function(_)
			-- upvalues: RoactModule (upval), InteractiveAlert (upval), UseStateResult3 (upval), UseLocalizationResult (upval), ButtonType (upval), UseDispatchResult (upval), CloseCFMModule (upval), UseStateResult2 (upval), FriendActionModule (upval), UseStateResult4 (upval), UseResult (upval), UseStateResult1 (upval)
			return RoactModule.createElement(InteractiveAlert, {
				title = UseStateResult3,
				bodyText = UseLocalizationResult.confirmationDescription,
				buttonStackInfo = {
					buttons = {
						{
							buttonType = ButtonType.Secondary,
							props = {
								text = UseLocalizationResult.cancelAction,
								onActivated = function()
									-- upvalues: UseDispatchResult (upval), CloseCFMModule (upval), UseStateResult2 (upval), FriendActionModule (upval)
									UseDispatchResult(CloseCFMModule())
									UseStateResult2(FriendActionModule.NoAction)
								end
							}
						},
						{
							buttonType = ButtonType.Alert,
							props = {
								text = UseStateResult4,
								onActivated = function()
									-- upvalues: UseResult (upval), UseDispatchResult (upval), CloseCFMModule (upval), UseStateResult2 (upval), FriendActionModule (upval)
									UseResult()
									UseDispatchResult(CloseCFMModule())
									UseStateResult2(FriendActionModule.NoAction)
								end
							}
						}
					}
				},
				screenSize = UseStateResult1
			})
		end)
	end, {
		UseStateResult3, UseStateResult4, UseStateResult,
		UseSelectorResult1.combinedName, UseSelectorResult1.userName,
		UseLocalizationResult.cancelAction,
		UseLocalizationResult.confirmationDescription
	})
	
	return ReactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
		PlayerMenuScreen = ReactModule.createElement("ScreenGui", {
			Enabled = UseSelectorResult,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			DisplayOrder = 8,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(Frame.AbsoluteSize)
			end
		}, {
			Overlay = ReactModule.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundColor3 = Theme.Overlay.Color,
				BackgroundTransparency = Theme.Overlay.Transparency,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Text = "",
				[ReactModule.Event.Activated] = function()
					-- upvalues: UseDispatchResult (copy), CloseCFMModule (upval), UseStateResult2 (copy), FriendActionModule (upval)
					UseDispatchResult(CloseCFMModule())
					UseStateResult2(FriendActionModule.NoAction)
				end
			}),
			PlayerMenu = if UseStateResult == FriendActionModule.NoAction then UseMemoResult else UseMemoResult1
		})
	})
end