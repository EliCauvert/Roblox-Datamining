local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ShareGame = Modules.Settings.Pages.ShareGame
local OpenTypeSupport = require(CorePackages.Packages.UIBlox).Utility.OpenTypeSupport
local Constants = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Constants
local ThemeModule = require(Modules.Settings.Theme)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local GameInviteEvents = require(CorePackages.Workspace.Packages.GameInvite).GameInviteEvents
local PresenceUtilModule = require(ShareGame.PresenceUtil)
local SingleUserThumbnailModule = require(ShareGame.Components.SingleUserThumbnail)
local InviteButtonModule = require(ShareGame.Components.InviteButton)
local InviteStatus = require(ShareGame.Constants).InviteStatus
local ThrottleFunctionCallModule = require(ShareGame.ThrottleFunctionCall)
local GetFFlagAbuseReportAnalyticsHasLaunchDataModule = require(Modules.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local GetFFlagEnableNewInviteSendEndpointModule = require(Modules.Flags.GetFFlagEnableNewInviteSendEndpoint)
local GetFFlagThrottleInviteSendEndpointModule = require(Modules.Flags.GetFFlagThrottleInviteSendEndpoint)
local GetFIntThrottleInviteSendEndpointDelayModule = require(Modules.Flags.GetFIntThrottleInviteSendEndpointDelay)
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local _Rect = Rect.new(10, 10, 10, 10)

return function(p1)
	-- upvalues: ReactModule (copy), InviteStatus (copy), Players (copy), GetFFlagEnableNewInviteSendEndpointModule (copy), GameInviteEvents (copy), GetFFlagAbuseReportAnalyticsHasLaunchDataModule (copy), GetFFlagThrottleInviteSendEndpointModule (copy), ThrottleFunctionCallModule (copy), GetFIntThrottleInviteSendEndpointDelayModule (copy), _Rect (copy), ThemeModule (copy), ReactRobloxModule (copy), SingleUserThumbnailModule (copy), PresenceUtilModule (copy), Constants (copy), AppFonts (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy), InviteButtonModule (copy)
	local User = p1.user
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), InviteStatus (upval), User (copy), Players (upval), GetFFlagEnableNewInviteSendEndpointModule (upval), GameInviteEvents (upval), GetFFlagAbuseReportAnalyticsHasLaunchDataModule (upval)
		local InviteUserFunction = p1.inviteUser
		local InviteStatus1 = p1.inviteStatus
		local Analytics = p1.analytics
		
		if InviteStatus1 and InviteStatus1 ~= InviteStatus.Failed then return end
		local function v25(Result)
			-- upvalues: User (upval), Players (upval), Analytics (copy)
			if not Result then return end
			local list = { User.id }
			
			if Players.LocalPlayer and Result then
				Analytics:onActivatedInviteSent(Players.LocalPlayer.UserId, Result.conversationId, list)
			end
		end
		
		if GetFFlagEnableNewInviteSendEndpointModule() then
			local IsNotLaunchDataMatch: boolean = p1.launchData ~= nil and p1.launchData ~= ""
			Analytics:sendEvent(p1.trigger, GameInviteEvents.SendInvite, {
				recipient = User.id,
				isLaunchDataProvided = if GetFFlagAbuseReportAnalyticsHasLaunchDataModule() then IsNotLaunchDataMatch else nil
			})
			InviteUserFunction(User.id, Analytics, p1.trigger, p1.inviteMessageId, p1.launchData):andThen(v25, function() end)
			
			return
		else
			InviteUserFunction(User.id):andThen(v25, function() end)
		end
	end, { p1.inviteUser, p1.inviteStatus, p1.analytics, User })
	
	if GetFFlagThrottleInviteSendEndpointModule() then
		UseResult = ReactModule.useCallback(ThrottleFunctionCallModule(GetFIntThrottleInviteSendEndpointDelayModule(), UseResult), { UseResult })
	end
	if not p1.visible then return end
	return ReactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 0, 60),
		ScaleType = Enum.ScaleType.Stretch,
		SliceCenter = _Rect,
		BackgroundColor3 = ThemeModule.color("PlayerRowFrame"),
		BackgroundTransparency = ThemeModule.transparency("PlayerRowFrame", 1),
		ImageTransparency = 0.85,
		LayoutOrder = p1.layoutOrder,
		[ReactRobloxModule.Event.Activated] = if p1.isFullRowActivatable then UseResult else nil
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = ThemeModule.MenuContainerCornerRadius }),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingRight = UDim.new(0, 16),
			PaddingLeft = UDim.new(0, 8)
		}),
		Thumbnail = ReactModule.createElement(SingleUserThumbnailModule, {
			user = User,
			size = UDim2.new(0, 44, 0, 44),
			position = UDim2.new(0, 0, 0.5, 0),
			anchorPoint = Vector2.new(0, 0.5)
		}),
		UserInfo = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Position = UDim2.new(0, 44, 0, 0),
			Size = UDim2.new(1, -118, 1, 0)
		}, {
			Padding = ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
			ListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 4)
			}),
			DisplayNameWrapper = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 16)
			}, {
				PresenceIconLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				}),
				Icon = PresenceUtilModule.GetIcon(User.presence),
				DisplayName = ReactModule.createElement("TextLabel", {
					TextSize = 16,
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(0, 0, 0, 16),
					Text = User.displayName,
					TextColor3 = Constants.COLORS.WHITE,
					Font = AppFonts.default:getMedium(),
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			Username = ReactModule.createElement("TextLabel", {
				TextSize = 16,
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 0, 0, 16),
				Text = "@" .. User.name,
				TextColor3 = Constants.COLORS.PUMICE,
				Font = AppFonts.default:getDefault(),
				TextXAlignment = Enum.TextXAlignment.Left,
				OpenTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
			})
		}),
		InviteButton = ReactModule.createElement(InviteButtonModule, {
			size = UDim2.new(0, 66, 0, 36),
			position = UDim2.new(1, 0, 0.5, 0),
			anchorPoint = Vector2.new(1, 0.5),
			onInvite = UseResult,
			inviteStatus = p1.inviteStatus
		})
	})
end