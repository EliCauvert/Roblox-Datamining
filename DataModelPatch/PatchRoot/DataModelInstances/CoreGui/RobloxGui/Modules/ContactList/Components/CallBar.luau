local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local Sounds = require(CorePackages.Workspace.Packages.SoundManager).Sounds
local SoundGroups = require(CorePackages.Workspace.Packages.SoundManager).SoundGroups
local SoundManager = require(CorePackages.Workspace.Packages.SoundManager).SoundManager
local UserProfilesModule = require(CorePackages.Workspace.Packages.UserProfiles)
local ContactList = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.ContactList
local DependenciesModule = require(ContactList.dependencies)
local UseAnalyticsModule = require(ContactList.Analytics.useAnalytics)
local EventNamesEnumModule = require(ContactList.Analytics.EventNamesEnum)
local UIBlox = DependenciesModule.UIBlox
local RoduxCall = DependenciesModule.RoduxCall
local GetStandardSizeAvatarHeadShotRbxthumbFunction = DependenciesModule.getStandardSizeAvatarHeadShotRbxthumb
local TeleportToRootPlaceFunction = DependenciesModule.teleportToRootPlace
local Colors = UIBlox.App.Style.Colors
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBlox.Core.Style.useStyle
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local UserId = LocalPlayer and LocalPlayer.UserId or 0
local config = {
	callProtocol = require(CorePackages.Workspace.Packages.CallProtocol).CallProtocol.default
}

local function formatDuration(Largest: number): string
	local Floored = math.floor(Largest / 3600)
	local Formatted = string.format("%02d", Floored)
	local Formatted1 = string.format("%02d", (math.floor(Largest % 3600 / 60)))
	local Formatted2 = string.format("%02d", Largest % 60)
	
	return if Floored > 0 then Formatted .. ":" .. Formatted1 .. ":" .. Formatted2 else Formatted1 .. ":" .. Formatted2
end

local function _(Active, _): string?
	-- upvalues: RoduxCall (copy)
	if Active == RoduxCall.Enums.Status.Connecting then
		return "Feature.Call.Label.Calling"
	elseif Active == RoduxCall.Enums.Status.Teleporting then
		return "Feature.Call.Label.Teleporting"
	elseif Active == RoduxCall.Enums.Status.Active then
		return "Feature.Call.Label.RobloxCall"
	elseif Active == RoduxCall.Enums.Status.Idle then
		return "Feature.Call.Label.CallEnded"
	else
		error("Invalid status for call bar: " .. Active .. ".")
	end
end

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseAnalyticsModule (copy), ReactModule (copy), UseSelectorFunction (copy), UserId (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), UseLocalizationFunction (copy), RoduxCall (copy), TeleportToRootPlaceFunction (copy), SoundManager (copy), Sounds (copy), SoundGroups (copy), EventNamesEnumModule (copy), Colors (copy), RunService (copy), formatDuration (copy), UserProfilesModule (copy), ImageSetLabel (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local _0000, _00002 = ReactModule.useState("00:00")
	local UseSelectorResult = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.Call.currentCall then p2.Call.currentCall.callId else ""
	end)))
	local UseSelectorResult1 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.Call.currentCall then p2.Call.currentCall.callerId else ""
	end)))
	local UseSelectorResult2 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.Call.currentCall then p2.Call.currentCall.calleeId else ""
	end)))
	local UseSelectorResult3 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.Call.currentCall then p2.Call.currentCall.status else ""
	end)))
	local UseSelectorResult4 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		return if p2.Call.currentCall == nil then "" else p2.Call.currentCall.instanceId
	end)))
	local UseSelectorResult5 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: UserId (upval)
		local CurrentCall = p2.Call.currentCall
		
		return if CurrentCall then if UserId == CurrentCall.callerId then CurrentCall.calleeId else CurrentCall.callerId else nil
	end)))
	local StandardSizeAvatarHeadShotRbxthumb = if UseSelectorResult5 then GetStandardSizeAvatarHeadShotRbxthumbFunction(UseSelectorResult5) else nil
	local t = {}
	local CallStatusLabel = nil
	
	if UseSelectorResult3 == RoduxCall.Enums.Status.Connecting then
		CallStatusLabel = "Feature.Call.Label.Calling"
	elseif UseSelectorResult3 == RoduxCall.Enums.Status.Teleporting then
		CallStatusLabel = "Feature.Call.Label.Teleporting"
	elseif UseSelectorResult3 == RoduxCall.Enums.Status.Active then
		CallStatusLabel = "Feature.Call.Label.RobloxCall"
	elseif UseSelectorResult3 == RoduxCall.Enums.Status.Idle then
		CallStatusLabel = "Feature.Call.Label.CallEnded"
	else
		error("Invalid status for call bar: " .. UseSelectorResult3 .. ".")
		CallStatusLabel = nil
	end
	t.callStatusLabel = CallStatusLabel
	local CallStatusLabel1 = UseLocalizationFunction(t).callStatusLabel
	local IsJobIdMatch: boolean = UseSelectorResult3 == RoduxCall.Enums.Status.Idle and game.JobId == UseSelectorResult4
	local IsUseSelectorResultMatch: boolean = UseSelectorResult3 == RoduxCall.Enums.Status.Active or (UseSelectorResult3 == RoduxCall.Enums.Status.Connecting or (UseSelectorResult3 == RoduxCall.Enums.Status.Teleporting or IsJobIdMatch))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsJobIdMatch (copy), TeleportToRootPlaceFunction (upval), UseSelectorResult3 (copy), RoduxCall (upval), SoundManager (upval), Sounds (upval), SoundGroups (upval), JoinResult (copy), UseSelectorResult (copy), UseAnalyticsModuleResult (copy), EventNamesEnumModule (upval), UseSelectorResult1 (copy), UseSelectorResult2 (copy)
		local IsRetry = false
		
		if IsJobIdMatch then
			TeleportToRootPlaceFunction()
			IsRetry = true
		elseif UseSelectorResult3 == RoduxCall.Enums.Status.Active then
			SoundManager:PlaySound(Sounds.HangUp.Name, { Volume = 0.5 }, SoundGroups.Iris)
			JoinResult.callProtocol:finishCall(UseSelectorResult)
		elseif UseSelectorResult3 == RoduxCall.Enums.Status.Connecting or UseSelectorResult3 == RoduxCall.Enums.Status.Teleporting then
			JoinResult.callProtocol:cancelCall(UseSelectorResult)
		end
		UseAnalyticsModuleResult.fireEvent(EventNamesEnumModule.CallBarHangUpClicked, {
			eventTimestampMs = os.time() * 1000,
			callerUserId = UseSelectorResult1,
			calleeUserId = UseSelectorResult2,
			callId = UseSelectorResult,
			callStatus = UseSelectorResult3,
			isRetry = IsRetry
		})
	end, {
		UseSelectorResult3,
		JoinResult.callProtocol,
		IsJobIdMatch
	})
	local SystemPrimaryDefault = if IsJobIdMatch then UseStyleResult.Theme.SystemPrimaryDefault else UseStyleResult.Theme.Alert
	local Image: string = if IsJobIdMatch then "rbxassetid://15123605982" else "rbxassetid://15239778319"
	local Slate = if IsJobIdMatch then Colors.Slate else Colors.White
	ReactModule.useEffect(function()
		-- upvalues: RunService (upval), JoinResult (copy), formatDuration (upval), _00002 (copy)
		local HeartbeatConnection = RunService.Heartbeat:Connect(function()
			-- upvalues: JoinResult (upval), formatDuration (upval), _00002 (upval)
			if JoinResult.activeUtc ~= 0 then
				_00002((formatDuration((math.max(0, os.time() - JoinResult.activeUtc / 1000)))))
				
				return
			end
		end)
		
		return function()
			-- upvalues: HeartbeatConnection (copy)
			HeartbeatConnection:Disconnect()
		end
	end, { JoinResult.activeUtc })
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { (tostring(UseSelectorResult5)) },
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local UseSelectorResult6 = UseSelectorFunction((ReactModule.useCallback(function(p2)
		-- upvalues: UserId (upval)
		local CurrentCall = p2.Call.currentCall
		
		return CurrentCall and (if UserId == CurrentCall.callerId then CurrentCall.calleeCombinedName else CurrentCall.callerCombinedName) or ""
	end)))
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.fromOffset(JoinResult.size.X, JoinResult.size.Y),
		Position = JoinResult.position,
		AnchorPoint = Vector2.new(0, 0),
		BackgroundColor3 = Theme.BackgroundMuted.Color,
		BackgroundTransparency = Theme.BackgroundMuted.Transparency
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 4),
			PaddingTop = UDim.new(0, 4),
			PaddingRight = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 4)
		}),
		ProfileImage = ReactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.fromOffset(36, 36),
			Image = StandardSizeAvatarHeadShotRbxthumb
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		}),
		Content = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -88, 0, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			DisplayName = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 22),
				Font = UseStyleResultFont.CaptionHeader.Font,
				Text = if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, UseSelectorResult5) elseif UseUserProfilesFetchResult.error then UseSelectorResult6 else "",
				TextColor3 = Theme.TextEmphasis.Color,
				TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionHeader.RelativeSize,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			DetailsText = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				TextTransparency = 0.4,
				Size = UDim2.new(1, 0, 0, 14),
				Font = UseStyleResultFont.Footer.Font,
				Text = if UseSelectorResult3 == RoduxCall.Enums.Status.Active then _0000 else CallStatusLabel1,
				TextColor3 = Colors.White,
				TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Footer.RelativeSize,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		}),
		ActionButton = if UseSelectorResult3 == RoduxCall.Enums.Status.Failed then nil else ReactModule.createElement("ImageButton", {
			Position = UDim2.fromOffset(0, 0),
			Active = IsUseSelectorResultMatch,
			AnchorPoint = Vector2.new(1, 1),
			LayoutOrder = 3,
			Size = UDim2.fromOffset(36, 36),
			BackgroundTransparency = SystemPrimaryDefault.Transparency,
			BackgroundColor3 = SystemPrimaryDefault.Color,
			BorderSizePixel = 0,
			Image = Image,
			ImageColor3 = Slate,
			[ReactModule.Event.Activated] = UseResult
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 36) })
		})
	})
end