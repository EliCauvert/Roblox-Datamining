local contextActionService = game:GetService("ContextActionService")
local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local reactModule = require(corePackagesService.Packages.React)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local modules = coreGuiService.RobloxGui.Modules
local renderWithCoreScriptsStyleProviderModule = require(modules.Common.renderWithCoreScriptsStyleProvider)
local shareGame = modules.Settings.Pages.ShareGame
local COLORS = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Constants.COLORS
local constantsModule = require(shareGame.Constants)
local gameInviteEvents = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteEvents
local inviteStatus = constantsModule.InviteStatus
local var9 = require(shareGame.getTranslator)()
local httpRequestModule = require(modules.Common.httpRequest)
local inviteUserIdToPlaceIdModule = require(shareGame.Thunks.InviteUserIdToPlaceId)
local retrievalStatus = require(corePackagesService.Workspace.Packages.Http).Enum.RetrievalStatus
local inviteUserIdToPlaceIdCustomizedModule = require(shareGame.Thunks.InviteUserIdToPlaceIdCustomized)
local throttleFunctionCallModule = require(shareGame.ThrottleFunctionCall)
local singleUserThumbnailModule = require(shareGame.Components.SingleUserThumbnail)
local getFFlagAbuseReportAnalyticsHasLaunchDataModule = require(modules.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local getFFlagEnableNewInviteSendEndpointModule = require(modules.Flags.GetFFlagEnableNewInviteSendEndpoint)
local getFFlagThrottleInviteSendEndpointModule = require(modules.Flags.GetFFlagThrottleInviteSendEndpoint)
local getFIntThrottleInviteSendEndpointDelayModule = require(modules.Flags.GetFIntThrottleInviteSendEndpointDelay)
local getFFlagSingleUserInvitePageKeybindModule = require(modules.Settings.Flags.GetFFlagSingleUserInvitePageKeybind)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local color = Color3.fromRGB(41, 41, 41)

local var22 = function(p0)
	-- upvalues: useStyle (ref), reactModule (ref), constantsModule (ref), gameInviteEvents (ref), inviteStatus (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (ref), playersService (ref), getFFlagSingleUserInvitePageKeybindModule (ref), contextActionService (ref), getFFlagThrottleInviteSendEndpointModule (ref), throttleFunctionCallModule (ref), getFIntThrottleInviteSendEndpointDelayModule (ref), retrievalStatus (ref), color (ref), styledTextLabel (ref), var9 (ref), COLORS (ref), singleUserThumbnailModule (ref), button (ref), buttonType (ref)
	local inviteUserId = p0.friends[tostring(p0.inviteUserId)]
	local id = inviteUserId and p0.invites[inviteUserId.id]
	local var24 = useStyle()
	local var25, var26 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), constantsModule (copy), gameInviteEvents (copy)
		if p0.promptMessage and p0.analytics then
			p0.analytics:sendEvent(constantsModule.Triggers.DeveloperSingle, gameInviteEvents.CustomTextShown)
		end
	end, {})
	local var27 = reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		p0.closePage()
		
		if p0.onAfterClosePage then
			p0.onAfterClosePage()
		end
	end, { p0.closePage, p0.onAfterClosePage })
	local var28 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), constantsModule (copy), gameInviteEvents (copy), var27 (ref)
		p0.analytics:sendEvent(constantsModule.Triggers.DeveloperSingle, gameInviteEvents.CancelInvite)
		var27()
	end, { var27 })
	local var29 = reactModule.useCallback(function()
		-- upvalues: var26 (ref), p0 (ref), id (ref), inviteStatus (copy), constantsModule (copy), gameInviteEvents (copy), inviteUserId (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (copy), playersService (copy), var27 (ref)
		var26(true)
		local inviteUser = p0.inviteUser
		local analytics = p0.analytics
		
		if id and id ~= inviteStatus.Failed then return end
		analytics:sendEvent(constantsModule.Triggers.DeveloperSingle, gameInviteEvents.SendInvite, {
			recipient = inviteUserId.id,
			isLaunchDataProvided = if getFFlagAbuseReportAnalyticsHasLaunchDataModule() then p0.launchData ~= nil and p0.launchData ~= "" else nil
		})
		inviteUser(tostring(inviteUserId.id), analytics, p0.inviteMessageId, p0.launchData):andThen(function(p1)
			-- upvalues: var26 (copy), inviteUserId (copy), playersService (copy), analytics (ref), var27 (copy)
			var26(false)
			
			if not p1 then return end
			local list = { inviteUserId.id }
			
			if playersService.LocalPlayer and p1.conversationId then
				analytics:onActivatedInviteSent(playersService.LocalPlayer.UserId, p1.conversationId, list)
			end
			var27()
		end, var27)
	end, {
		p0.inviteUser, p0.inviteMessageId, p0.launchData, p0.analytics, var26, id,
		inviteUserId, var27
	})
	
	if getFFlagSingleUserInvitePageKeybindModule() then
		reactModule.useEffect(function()
			-- upvalues: p0 (ref), contextActionService (copy), var29 (write), var28 (ref)
			if p0.isVisible then
				contextActionService:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, p2, _)
					-- upvalues: var29 (copy)
					if p2 == Enum.UserInputState.Begin then
						var29()
					end
				end, false, Enum.KeyCode.ButtonA)
				contextActionService:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, p3, _)
					-- upvalues: var28 (copy)
					if p3 == Enum.UserInputState.Begin then
						var28()
					end
				end, false, Enum.KeyCode.ButtonB)
				
				return function()
					-- upvalues: contextActionService (copy)
					contextActionService:UnbindCoreAction("ProductPurchaseConfirmButtonBind")
					contextActionService:UnbindCoreAction("ProductPurchaseCancelButtonBind")
				end
			end
			return nil
		end, { p0.isVisible, var29, var28 })
	end
	if getFFlagThrottleInviteSendEndpointModule() then
		var29 = reactModule.useCallback(throttleFunctionCallModule(getFIntThrottleInviteSendEndpointDelayModule(), var29), { var29 })
	end
	if inviteUserId then
		local var30 = id and id ~= inviteStatus.Failed
		
		return reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0.1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = color
		}, {
			SizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(442, 1e999),
				MinSize = Vector2.new(0, 0)
			}),
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Padding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 24)
			}),
			Header = reactModule.createElement(styledTextLabel, {
				fontStyle = var24.Font.Header1,
				colorStyle = var24.Theme.TextEmphasis,
				text = var9:FormatByKey("Feature.SettingsHub.Heading.InviteUser", { DisplayName = inviteUserId.displayName }),
				size = UDim2.new(1, 0, 0, 48),
				textXAlignment = Enum.TextXAlignment.Center
			}),
			Divider = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 48),
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = COLORS.GRAPHITE
			}),
			Wrapper = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0, 0, 0, 56)
			}, {
				ListLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 24)
				}),
				Thumbnail = reactModule.createElement(singleUserThumbnailModule, {
					layoutOrder = 1,
					square = true,
					backgroundTransparency = 1,
					user = inviteUserId,
					size = UDim2.new(0, 95, 0, 95)
				}),
				TextBody = reactModule.createElement(styledTextLabel, {
					layoutOrder = 2,
					fontStyle = var24.Font.Header2,
					colorStyle = var24.Theme.TextEmphasis,
					text = p0.promptMessage or var9:FormatByKey("Feature.SettingsHub.Label.DefaultInviteMessage", { DisplayName = inviteUserId.displayName }),
					textXAlignment = Enum.TextXAlignment.Center,
					automaticSize = Enum.AutomaticSize.Y,
					size = UDim2.new(1, 0, 0, 0)
				}),
				ButtonWrapper = reactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 48)
				}, {
					CancelButton = reactModule.createElement(button, {
						buttonType = buttonType.Secondary,
						size = UDim2.new(0.5, -12, 1, 0),
						text = var9:FormatByKey("Feature.SettingsHub.Action.Cancel"),
						onActivated = var28,
						isDisabled = var25
					}),
					InviteButton = reactModule.createElement(button, {
						buttonType = buttonType.PrimarySystem,
						size = UDim2.new(0.5, -12, 1, 0),
						position = UDim2.new(0.5, 12, 0, 0),
						text = var9:FormatByKey(if var30 then "Feature.SettingsHub.Label.Invited" else "Feature.SettingsHub.Action.InviteFriend"),
						onActivated = var29,
						isLoading = var25,
						isDisabled = var30
					})
				})
			})
		})
	elseif p0.friendsRetrievalStatus == retrievalStatus.Done or p0.friendsRetrievalStatus == retrievalStatus.Failed then
		var27()
	end
end

return roactRoduxModule.connect(function(p5)
	-- upvalues: playersService (ref)
	return {
		friends = p5.Users,
		friendsRetrievalStatus = playersService.LocalPlayer and p5.Friends.retrievalStatus[tostring(playersService.LocalPlayer.UserId)],
		invites = p5.Invites
	}
end, function(p6)
	-- upvalues: httpRequestModule (ref), httpRbxApiService (ref), getFFlagEnableNewInviteSendEndpointModule (ref), inviteUserIdToPlaceIdCustomizedModule (ref), constantsModule (ref), inviteUserIdToPlaceIdModule (ref)
	return {
		inviteUser = function(p7, p8, p9, p10)
			-- upvalues: httpRequestModule (copy), httpRbxApiService (copy), getFFlagEnableNewInviteSendEndpointModule (copy), p6 (ref), inviteUserIdToPlaceIdCustomizedModule (copy), constantsModule (copy), inviteUserIdToPlaceIdModule (copy)
			local var32 = httpRequestModule(httpRbxApiService)
			local var33 = tostring(game.PlaceId)
			
			return if getFFlagEnableNewInviteSendEndpointModule() then p6(inviteUserIdToPlaceIdCustomizedModule(var32, p7, var33, p8, constantsModule.Triggers.DeveloperSingle, p9, p10)) else p6(inviteUserIdToPlaceIdModule(var32, p7, var33))
		end
	}
end)(function(p4)
	-- upvalues: renderWithCoreScriptsStyleProviderModule (ref), reactModule (ref), var22 (ref)
	return renderWithCoreScriptsStyleProviderModule({ SingleUserInvite = reactModule.createElement(var22, p4) })
end)