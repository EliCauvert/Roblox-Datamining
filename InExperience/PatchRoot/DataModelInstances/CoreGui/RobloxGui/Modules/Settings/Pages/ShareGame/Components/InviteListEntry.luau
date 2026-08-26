local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local modules = game:GetService("CoreGui").RobloxGui.Modules
local shareGame = modules.Settings.Pages.ShareGame
local openTypeSupport = require(corePackagesService.Packages.UIBlox).Utility.OpenTypeSupport
local constants = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Constants
local themeModule = require(modules.Settings.Theme)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local gameInviteEvents = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteEvents
local constantsModule = require(shareGame.Constants)
local presenceUtilModule = require(shareGame.PresenceUtil)
local singleUserThumbnailModule = require(shareGame.Components.SingleUserThumbnail)
local inviteButtonModule = require(shareGame.Components.InviteButton)
local inviteStatus = constantsModule.InviteStatus
local throttleFunctionCallModule = require(shareGame.ThrottleFunctionCall)
local getFFlagAbuseReportAnalyticsHasLaunchDataModule = require(modules.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local getFFlagEnableNewInviteSendEndpointModule = require(modules.Flags.GetFFlagEnableNewInviteSendEndpoint)
local getFFlagThrottleInviteSendEndpointModule = require(modules.Flags.GetFFlagThrottleInviteSendEndpoint)
local getFIntThrottleInviteSendEndpointDelayModule = require(modules.Flags.GetFIntThrottleInviteSendEndpointDelay)
local getFFlagLuaAppEnableOpenTypeSupport = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local rect = Rect.new(10, 10, 10, 10)

return function(p1)
	-- upvalues: reactModule (ref), inviteStatus (ref), playersService (ref), getFFlagEnableNewInviteSendEndpointModule (ref), gameInviteEvents (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (ref), getFFlagThrottleInviteSendEndpointModule (ref), throttleFunctionCallModule (ref), getFIntThrottleInviteSendEndpointDelayModule (ref), rect (ref), themeModule (ref), reactRobloxModule (ref), singleUserThumbnailModule (ref), presenceUtilModule (ref), constants (ref), appFonts (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref), inviteButtonModule (ref)
	local user = p1.user
	local var1 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), inviteStatus (copy), user (ref), playersService (copy), getFFlagEnableNewInviteSendEndpointModule (copy), gameInviteEvents (copy), getFFlagAbuseReportAnalyticsHasLaunchDataModule (copy)
		local inviteUser = p1.inviteUser
		local inviteStatus_1 = p1.inviteStatus
		local analytics = p1.analytics
		
		if inviteStatus_1 and inviteStatus_1 ~= inviteStatus.Failed then return end
		local var2 = function(p2)
			-- upvalues: user (copy), playersService (copy), analytics (ref)
			if not p2 then return end
			local list = { user.id }
			
			if playersService.LocalPlayer and p2 then
				analytics:onActivatedInviteSent(playersService.LocalPlayer.UserId, p2.conversationId, list)
			end
		end
		
		if not getFFlagEnableNewInviteSendEndpointModule() then
			inviteUser(user.id):andThen(var2, function() end)
			
			return
		end
		analytics:sendEvent(p1.trigger, gameInviteEvents.SendInvite, {
			recipient = user.id,
			isLaunchDataProvided = if getFFlagAbuseReportAnalyticsHasLaunchDataModule() then p1.launchData ~= nil and p1.launchData ~= "" else nil
		})
		inviteUser(user.id, analytics, p1.trigger, p1.inviteMessageId, p1.launchData):andThen(var2, function() end)
	end, { p1.inviteUser, p1.inviteStatus, p1.analytics, user })
	
	if getFFlagThrottleInviteSendEndpointModule() then
		var1 = reactModule.useCallback(throttleFunctionCallModule(getFIntThrottleInviteSendEndpointDelayModule(), var1), { var1 })
	end
	if p1.visible then
		return reactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 0, 60),
			ScaleType = Enum.ScaleType.Stretch,
			SliceCenter = rect,
			BackgroundColor3 = themeModule.color("PlayerRowFrame"),
			BackgroundTransparency = themeModule.transparency("PlayerRowFrame", 1),
			ImageTransparency = 0.85,
			LayoutOrder = p1.layoutOrder,
			[reactRobloxModule.Event.Activated] = if p1.isFullRowActivatable then var1 else nil
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = themeModule.MenuContainerCornerRadius }),
			Padding = reactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, 16),
				PaddingLeft = UDim.new(0, 8)
			}),
			Thumbnail = reactModule.createElement(singleUserThumbnailModule, {
				user = user,
				size = UDim2.new(0, 44, 0, 44),
				position = UDim2.new(0, 0, 0.5, 0),
				anchorPoint = Vector2.new(0, 0.5)
			}),
			UserInfo = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Position = UDim2.new(0, 44, 0, 0),
				Size = UDim2.new(1, -118, 1, 0)
			}, {
				Padding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }),
				ListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 4)
				}),
				DisplayNameWrapper = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 16)
				}, {
					PresenceIconLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 4)
					}),
					Icon = presenceUtilModule.GetIcon(user.presence),
					DisplayName = reactModule.createElement("TextLabel", {
						TextSize = 16,
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(0, 0, 0, 16),
						Text = user.displayName,
						TextColor3 = constants.COLORS.WHITE,
						Font = appFonts.default:getMedium(),
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				Username = reactModule.createElement("TextLabel", {
					TextSize = 16,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 16),
					Text = "@" .. user.name,
					TextColor3 = constants.COLORS.PUMICE,
					Font = appFonts.default:getDefault(),
					TextXAlignment = Enum.TextXAlignment.Left,
					OpenTypeFeatures = if getFFlagLuaAppEnableOpenTypeSupport() then openTypeSupport:getUserNameStylisticAlternative() else nil
				})
			}),
			InviteButton = reactModule.createElement(inviteButtonModule, {
				size = UDim2.new(0, 66, 0, 36),
				position = UDim2.new(1, 0, 0.5, 0),
				anchorPoint = Vector2.new(1, 0.5),
				onInvite = var1,
				inviteStatus = p1.inviteStatus
			})
		})
	end
end