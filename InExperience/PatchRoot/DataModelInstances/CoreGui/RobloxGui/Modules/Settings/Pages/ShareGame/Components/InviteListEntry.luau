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

return function(p0)
	-- upvalues: reactModule (ref), inviteStatus (ref), playersService (ref), getFFlagEnableNewInviteSendEndpointModule (ref), gameInviteEvents (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (ref), getFFlagThrottleInviteSendEndpointModule (ref), throttleFunctionCallModule (ref), getFIntThrottleInviteSendEndpointDelayModule (ref), rect (ref), themeModule (ref), reactRobloxModule (ref), singleUserThumbnailModule (ref), presenceUtilModule (ref), constants (ref), appFonts (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), openTypeSupport (ref), inviteButtonModule (ref)
	local user = p0.user
	local var15 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), inviteStatus (copy), user (ref), playersService (copy), getFFlagEnableNewInviteSendEndpointModule (copy), gameInviteEvents (copy), getFFlagAbuseReportAnalyticsHasLaunchDataModule (copy)
		local inviteUser = p0.inviteUser
		local inviteStatus_1 = p0.inviteStatus
		local analytics = p0.analytics
		
		if inviteStatus_1 and inviteStatus_1 ~= inviteStatus.Failed then return end
		local var16 = function(p1)
			-- upvalues: user (copy), playersService (copy), analytics (ref)
			if not p1 then return end
			local list = { user.id }
			
			if playersService.LocalPlayer and p1 then
				analytics:onActivatedInviteSent(playersService.LocalPlayer.UserId, p1.conversationId, list)
			end
		end
		
		if not getFFlagEnableNewInviteSendEndpointModule() then
			inviteUser(user.id):andThen(var16, function() end)
			
			return
		end
		analytics:sendEvent(p0.trigger, gameInviteEvents.SendInvite, {
			recipient = user.id,
			isLaunchDataProvided = if getFFlagAbuseReportAnalyticsHasLaunchDataModule() then p0.launchData ~= nil and p0.launchData ~= "" else nil
		})
		inviteUser(user.id, analytics, p0.trigger, p0.inviteMessageId, p0.launchData):andThen(var16, function() end)
	end, { p0.inviteUser, p0.inviteStatus, p0.analytics, user })
	
	if getFFlagThrottleInviteSendEndpointModule() then
		var15 = reactModule.useCallback(throttleFunctionCallModule(getFIntThrottleInviteSendEndpointDelayModule(), var15), { var15 })
	end
	if p0.visible then
		return reactModule.createElement("ImageButton", {
			Size = UDim2.new(1, 0, 0, 60),
			ScaleType = Enum.ScaleType.Stretch,
			SliceCenter = rect,
			BackgroundColor3 = themeModule.color("PlayerRowFrame"),
			BackgroundTransparency = themeModule.transparency("PlayerRowFrame", 1),
			ImageTransparency = 0.85,
			LayoutOrder = p0.layoutOrder,
			[reactRobloxModule.Event.Activated] = if p0.isFullRowActivatable then var15 else nil
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
				onInvite = var15,
				inviteStatus = p0.inviteStatus
			})
		})
	end
end