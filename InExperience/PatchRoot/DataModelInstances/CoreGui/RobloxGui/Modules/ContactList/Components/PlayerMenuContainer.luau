local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local contactList = robloxGui.Modules.ContactList
local blockPlayerModule = require(robloxGui.Modules.PlayerList.Thunks.BlockPlayer)
local dependenciesModule = require(contactList.dependencies)
local unfriendTargetUserId = dependenciesModule.NetworkingFriends.UnfriendTargetUserId
local UIBlox = dependenciesModule.UIBlox
local useSelector = dependenciesModule.Hooks.useSelector
local useDispatch = dependenciesModule.Hooks.useDispatch
local useLocalization = dependenciesModule.Hooks.useLocalization
local closeCFMModule = require(contactList.Actions.CloseCFM)
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local configureFriendMenuModule = require(contactList.Components.ContactListCommon.ConfigureFriendMenu)
local friendActionModule = require(contactList.Enums.FriendAction)
local updateLastFriendModule = require(contactList.Actions.UpdateLastFriend)
local useStyle = UIBlox.Core.Style.useStyle
local withStyle = UIBlox.Style.withStyle
local interactiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBlox.App.Button.Enum.ButtonType
local localPlayer = playersService.LocalPlayer
local var14 = if localPlayer then localPlayer.UserId else 0

return function() --[[ line: 43 | named "PlayerMenuContainer" ]]
	-- upvalues: useAnalyticsModule (ref), useStyle (ref), useDispatch (ref), useSelector (ref), useLocalization (ref), reactModule (ref), friendActionModule (ref), blockPlayerModule (ref), updateLastFriendModule (ref), unfriendTargetUserId (ref), var14 (ref), eventNamesEnumModule (ref), configureFriendMenuModule (ref), withStyle (ref), roactModule (ref), interactiveAlert (ref), buttonType (ref), closeCFMModule (ref), coreGuiService (ref)
	local var15 = useAnalyticsModule()
	local theme = useStyle().Theme
	local var16 = useDispatch()
	local var17 = useSelector(function(p0) --[[ line: 50 ]]
		return p0.PlayerMenu.isOpen
	end)
	local var18 = useSelector(function(p1) --[[ line: 54 ]]
		return p1.PlayerMenu.friend
	end)
	local var19 = useLocalization({
		blockAction = "Feature.Friends.Action.Block",
		unfriendAction = "Feature.Friends.Action.Unfriend",
		cancelAction = "Feature.Friends.Label.Cancel",
		blockTitle = {
			"Feature.Call.Label.Block",
			combinedName = var18.combinedName
		},
		unfriendTitle = {
			"Feature.Call.Label.Unfriend",
			combinedName = var18.combinedName
		},
		confirmationDescription = {
			"Feature.SettingsHub.Message.BlockConfirmation",
			DISPLAY_NAME = var18.combinedName,
			RBX_NAME = var18.userName
		}
	})
	local var20, var21 = reactModule.useState(friendActionModule.NoAction)
	local var22, var23 = reactModule.useState(Vector2.new(0, 0))
	local var24, var25 = reactModule.useState("")
	local var26, var27 = reactModule.useState("")
	local var28 = reactModule.useCallback(function() --[[ line: 72 ]]
		-- upvalues: var20 (ref), friendActionModule (copy), var16 (ref), blockPlayerModule (copy), var18 (ref), updateLastFriendModule (copy), unfriendTargetUserId (copy), var14 (copy), var15 (ref), eventNamesEnumModule (copy)
		if var20 == friendActionModule.Block then
			var16(blockPlayerModule({ UserId = var18.userId }))
			var16(updateLastFriendModule(var18.userId))
			
			return
		elseif var20 == friendActionModule.Unfriend then
			var16(unfriendTargetUserId.API({ currentUserId = var14, targetUserId = var18.userId })):andThen(function(_) --[[ line: 84 ]]
				-- upvalues: var15 (copy), eventNamesEnumModule (copy), var18 (copy), var16 (copy), updateLastFriendModule (copy)
				var15.fireEvent(eventNamesEnumModule.PhoneBookPlayerMenuUnfriendFinished, {
					success = true,
					eventTimestampMs = os.time() * 1000,
					friendUserId = var18.userId
				})
				var16(updateLastFriendModule(var18.userId))
			end):catch(function(_) --[[ line: 92 ]]
				-- upvalues: var15 (copy), eventNamesEnumModule (copy), var18 (copy)
				var15.fireEvent(eventNamesEnumModule.PhoneBookPlayerMenuUnfriendFinished, {
					success = false,
					eventTimestampMs = os.time() * 1000,
					friendUserId = var18.userId
				})
			end)
		end
	end, { var20, var18.userId })
	reactModule.useEffect(function() --[[ line: 102 ]]
		-- upvalues: var20 (ref), friendActionModule (copy), var25 (ref), var19 (ref), var27 (ref)
		if var20 == friendActionModule.Block then
			var25(var19.blockTitle)
			var27(var19.blockAction)
			
			return
		elseif var20 == friendActionModule.Unfriend then
			var25(var19.unfriendTitle)
			var27(var19.unfriendAction)
		end
	end, {
		var20, var18.combinedName, var19.blockAction, var19.blockTitle,
		var19.unfriendAction, var19.unfriendTitle
	})
	local var29 = reactModule.useCallback(function(p2) --[[ line: 119 ]]
		-- upvalues: var21 (ref)
		var21(p2)
	end, {})
	
	return reactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
		PlayerMenuScreen = reactModule.createElement("ScreenGui", {
			Enabled = var17,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			DisplayOrder = 8,
			[reactModule.Change.AbsoluteSize] = function(p3) --[[ line: 180 ]]
				-- upvalues: var23 (ref)
				var23(p3.AbsoluteSize)
			end
		}, {
			Overlay = reactModule.createElement("TextButton", {
				AutoButtonColor = false,
				BackgroundColor3 = theme.Overlay.Color,
				BackgroundTransparency = theme.Overlay.Transparency,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Text = "",
				[reactModule.Event.Activated] = function() --[[ line: 191 ]]
					-- upvalues: var16 (ref), closeCFMModule (copy), var21 (ref), friendActionModule (copy)
					var16(closeCFMModule())
					var21(friendActionModule.NoAction)
				end
			}),
			PlayerMenu = if var20 == friendActionModule.NoAction then reactModule.useMemo(function() --[[ line: 123 ]]
				-- upvalues: reactModule (copy), configureFriendMenuModule (copy), var29 (ref)
				return reactModule.createElement(configureFriendMenuModule, { initiateConfirmation = var29 })
			end, {}) else reactModule.useMemo(function() --[[ line: 129 ]]
				-- upvalues: withStyle (copy), roactModule (copy), interactiveAlert (copy), var24 (ref), var19 (ref), buttonType (copy), var16 (ref), closeCFMModule (copy), var21 (ref), friendActionModule (copy), var26 (ref), var28 (ref), var22 (ref)
				return withStyle(function(_) --[[ line: 130 ]]
					-- upvalues: roactModule (copy), interactiveAlert (copy), var24 (copy), var19 (copy), buttonType (copy), var16 (copy), closeCFMModule (copy), var21 (copy), friendActionModule (copy), var26 (copy), var28 (copy), var22 (copy)
					return roactModule.createElement(interactiveAlert, {
						title = var24,
						bodyText = var19.confirmationDescription,
						buttonStackInfo = {
							buttons = {
								{
									buttonType = buttonType.Secondary,
									props = {
										text = var19.cancelAction,
										onActivated = function() --[[ line: 140 ]]
											-- upvalues: var16 (copy), closeCFMModule (copy), var21 (copy), friendActionModule (copy)
											var16(closeCFMModule())
											var21(friendActionModule.NoAction)
										end
									}
								},
								{
									buttonType = buttonType.Alert,
									props = {
										text = var26,
										onActivated = function() --[[ line: 150 ]]
											-- upvalues: var28 (copy), var16 (copy), closeCFMModule (copy), var21 (copy), friendActionModule (copy)
											var28()
											var16(closeCFMModule())
											var21(friendActionModule.NoAction)
										end
									}
								}
							}
						},
						screenSize = var22
					})
				end)
			end, {
				var24, var26, var20, var18.combinedName, var18.userName, var19.cancelAction,
				var19.confirmationDescription
			})
		})
	})
end