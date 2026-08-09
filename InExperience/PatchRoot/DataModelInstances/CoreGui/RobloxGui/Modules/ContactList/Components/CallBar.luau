local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local callProtocolModule = require(corePackagesService.Workspace.Packages.CallProtocol)
local sounds = require(corePackagesService.Workspace.Packages.SoundManager).Sounds
local soundGroups = require(corePackagesService.Workspace.Packages.SoundManager).SoundGroups
local soundManager = require(corePackagesService.Workspace.Packages.SoundManager).SoundManager
local userProfilesModule = require(corePackagesService.Workspace.Packages.UserProfiles)
local contactList = coreGuiService:WaitForChild("RobloxGui").Modules.ContactList
local dependenciesModule = require(contactList.dependencies)
local useAnalyticsModule = require(contactList.Analytics.useAnalytics)
local eventNamesEnumModule = require(contactList.Analytics.EventNamesEnum)
local UIBlox = dependenciesModule.UIBlox
local roduxCall = dependenciesModule.RoduxCall
local getStandardSizeAvatarHeadShotRbxthumb = dependenciesModule.getStandardSizeAvatarHeadShotRbxthumb
local teleportToRootPlace = dependenciesModule.teleportToRootPlace
local colors = UIBlox.App.Style.Colors
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local useStyle = UIBlox.Core.Style.useStyle
local useLocalization = dependenciesModule.Hooks.useLocalization
local useSelector = dependenciesModule.Hooks.useSelector
local runService = game:GetService("RunService")
local localPlayer = game:GetService("Players").LocalPlayer
local var10 = if localPlayer then localPlayer.UserId else 0
local t = { callProtocol = callProtocolModule.CallProtocol.default }

local function formatDuration(p0) --[[ line: 56 ]]
	local floored = math.floor(p0 / 3600)
	local floored_1 = math.floor(p0 % 3600 / 60)
	local var15 = p0 % 60
	local formattedText = string.format("%02d", floored)
	local formattedText_1 = string.format("%02d", floored_1)
	local formattedText_2 = string.format("%02d", var15)
	local _ = ""
	
	return if floored > 0 then formattedText .. ":" .. formattedText_1 .. ":" .. formattedText_2 else formattedText_1 .. ":" .. formattedText_2
end

local function _(p1, _) --[[ line: 75 | named "getTextFromCallStatus" ]]
	-- upvalues: roduxCall (ref)
	if p1 == roduxCall.Enums.Status.Connecting then
		return "Feature.Call.Label.Calling"
	elseif p1 == roduxCall.Enums.Status.Teleporting then
		return "Feature.Call.Label.Teleporting"
	elseif p1 == roduxCall.Enums.Status.Active then
		return "Feature.Call.Label.RobloxCall"
	elseif p1 == roduxCall.Enums.Status.Idle then
		return "Feature.Call.Label.CallEnded"
	end
	error("Invalid status for call bar: " .. p1 .. ".")
end

return function(p2) --[[ line: 89 | named "CallBar" ]]
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useAnalyticsModule (ref), reactModule (ref), useSelector (ref), var10 (ref), getStandardSizeAvatarHeadShotRbxthumb (ref), useLocalization (ref), roduxCall (ref), teleportToRootPlace (ref), soundManager (ref), sounds (ref), soundGroups (ref), eventNamesEnumModule (ref), colors (ref), runService (ref), formatDuration (ref), userProfilesModule (ref), imageSetLabel (ref)
	local var32
	local var19 = cryoModule.Dictionary.join(t, p2)
	local var20 = useStyle()
	local var21 = useAnalyticsModule()
	local theme = var20.Theme
	local font = var20.Font
	local var22, var23 = reactModule.useState("00:00")
	local var24 = useSelector(reactModule.useCallback(function(p3) --[[ line: 98 ]]
		return if p3.Call.currentCall then p3.Call.currentCall.callId else ""
	end))
	local var25 = useSelector(reactModule.useCallback(function(p4) --[[ line: 103 ]]
		return if p4.Call.currentCall then p4.Call.currentCall.callerId else ""
	end))
	local var26 = useSelector(reactModule.useCallback(function(p5) --[[ line: 108 ]]
		return if p5.Call.currentCall then p5.Call.currentCall.calleeId else ""
	end))
	local var27 = useSelector(reactModule.useCallback(function(p6) --[[ line: 113 ]]
		return if p6.Call.currentCall then p6.Call.currentCall.status else ""
	end))
	local var28 = useSelector(reactModule.useCallback(function(p7) --[[ line: 118 ]]
		return if p7.Call.currentCall == nil then "" else p7.Call.currentCall.instanceId
	end))
	local var29 = useSelector(reactModule.useCallback(function(p8) --[[ line: 123 ]]
		-- upvalues: var10 (copy)
		local currentCall = p8.Call.currentCall
		
		return if currentCall then if var10 == currentCall.callerId then currentCall.calleeId else currentCall.callerId else nil
	end))
	local var30 = if var29 then getStandardSizeAvatarHeadShotRbxthumb(var29) else nil
	local t_1 = {}
	
	if var27 == roduxCall.Enums.Status.Connecting then
		var32 = "Feature.Call.Label.Calling"
	elseif var27 == roduxCall.Enums.Status.Teleporting then
		var32 = "Feature.Call.Label.Teleporting"
	elseif var27 == roduxCall.Enums.Status.Active then
		var32 = "Feature.Call.Label.RobloxCall"
	elseif var27 == roduxCall.Enums.Status.Idle then
		var32 = "Feature.Call.Label.CallEnded"
	else
		error("Invalid status for call bar: " .. var27 .. ".")
		var32 = nil
	end
	t_1.callStatusLabel = var32
	t_1 = useLocalization(t_1).callStatusLabel
	local var33 = var27 == roduxCall.Enums.Status.Idle and game.JobId == var28
	local var34 = if var27 ~= roduxCall.Enums.Status.Active then if var27 ~= roduxCall.Enums.Status.Connecting then if var27 ~= roduxCall.Enums.Status.Teleporting then var33 else true else true else true
	local var35 = reactModule.useCallback(function() --[[ line: 154 ]]
		-- upvalues: var33 (ref), teleportToRootPlace (copy), var27 (ref), roduxCall (copy), soundManager (copy), sounds (copy), soundGroups (copy), var19 (ref), var24 (ref), var21 (ref), eventNamesEnumModule (copy), var25 (ref), var26 (ref)
		local var42 = false
		
		if var33 then
			teleportToRootPlace()
			var42 = true
		elseif var27 == roduxCall.Enums.Status.Active then
			soundManager:PlaySound(sounds.HangUp.Name, { Volume = 0.5 }, soundGroups.Iris)
			var19.callProtocol:finishCall(var24)
		elseif var27 == roduxCall.Enums.Status.Connecting or var27 == roduxCall.Enums.Status.Teleporting then
			var19.callProtocol:cancelCall(var24)
		end
		var21.fireEvent(eventNamesEnumModule.CallBarHangUpClicked, {
			eventTimestampMs = os.time() * 1000,
			callerUserId = var25,
			calleeUserId = var26,
			callId = var24,
			callStatus = var27,
			isRetry = var42
		})
	end, { var27, var19.callProtocol, var33 })
	local var36 = if var33 then var20.Theme.SystemPrimaryDefault else var20.Theme.Alert
	local var37 = if var33 then "rbxassetid://15123605982" else "rbxassetid://15239778319"
	local var38 = if var33 then colors.Slate else colors.White
	reactModule.useEffect(function() --[[ line: 180 ]]
		-- upvalues: runService (copy), var19 (ref), formatDuration (copy), var23 (ref)
		local heartbeatConnection = runService.Heartbeat:Connect(function() --[[ line: 181 ]]
			-- upvalues: var19 (copy), formatDuration (copy), var23 (copy)
			if var19.activeUtc == 0 then
				return
			end
			var23(formatDuration(math.max(0, os.time() - var19.activeUtc / 1000)))
		end)
		
		return function() --[[ line: 194 ]]
			-- upvalues: heartbeatConnection (ref)
			heartbeatConnection:Disconnect()
		end
	end, { var19.activeUtc })
	local var39 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { tostring(var29) },
		query = userProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local var40 = useSelector(reactModule.useCallback(function(p9) --[[ line: 204 ]]
		-- upvalues: var10 (copy)
		local currentCall = p9.Call.currentCall
		
		return if currentCall then if var10 == currentCall.callerId then currentCall.calleeCombinedName or "" else currentCall.callerCombinedName or "" else ""
	end))
	local var41 = ""
	
	if var39.data then
		var41 = userProfilesModule.Selectors.getCombinedNameFromId(var39.data, var29)
	elseif var39.error then
		var41 = var40
	end
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(var19.size.X, var19.size.Y),
		Position = var19.position,
		AnchorPoint = Vector2.new(0, 0),
		BackgroundColor3 = theme.BackgroundMuted.Color,
		BackgroundTransparency = theme.BackgroundMuted.Transparency
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 4),
			PaddingTop = UDim.new(0, 4),
			PaddingRight = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 4)
		}),
		ProfileImage = reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromOffset(36, 36),
			Image = var30
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		Content = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -88, 0, 0)
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			DisplayName = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 22),
				Font = font.CaptionHeader.Font,
				Text = var41,
				TextColor3 = theme.TextEmphasis.Color,
				TextSize = font.BaseSize * font.CaptionHeader.RelativeSize,
				TextTransparency = theme.TextEmphasis.Transparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			DetailsText = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				TextTransparency = 0.4,
				Size = UDim2.new(1, 0, 0, 14),
				Font = font.Footer.Font,
				Text = if var27 == roduxCall.Enums.Status.Active then var22 else t_1,
				TextColor3 = colors.White,
				TextSize = font.BaseSize * font.Footer.RelativeSize,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		}),
		ActionButton = if var27 ~= roduxCall.Enums.Status.Failed then nil else reactModule.createElement("ImageButton", {
			Position = UDim2.fromOffset(0, 0),
			Active = var34,
			AnchorPoint = Vector2.new(1, 1),
			LayoutOrder = 3,
			Size = UDim2.fromOffset(36, 36),
			BackgroundTransparency = var36.Transparency,
			BackgroundColor3 = var36.Color,
			BorderSizePixel = 0,
			Image = var37,
			ImageColor3 = var38,
			[reactModule.Event.Activated] = var35
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 36) })
		})
	})
end