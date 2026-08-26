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
local var1 = require(shareGame.getTranslator)()
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

local var2 = function(p1)
	-- upvalues: useStyle (ref), reactModule (ref), constantsModule (ref), gameInviteEvents (ref), inviteStatus (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (ref), playersService (ref), getFFlagSingleUserInvitePageKeybindModule (ref), contextActionService (ref), getFFlagThrottleInviteSendEndpointModule (ref), throttleFunctionCallModule (ref), getFIntThrottleInviteSendEndpointDelayModule (ref), retrievalStatus (ref), color (ref), styledTextLabel (ref), var1 (ref), COLORS (ref), singleUserThumbnailModule (ref), button (ref), buttonType (ref)
	local inviteUserId = p1.friends[tostring(p1.inviteUserId)]
	local id = inviteUserId and p1.invites[inviteUserId.id]
	local var3 = useStyle()
	local var4, var5 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), constantsModule (copy), gameInviteEvents (copy)
		if p1.promptMessage and p1.analytics then
			p1.analytics:sendEvent(constantsModule.Triggers.DeveloperSingle, gameInviteEvents.CustomTextShown)
		end
	end, {})
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.closePage()
		
		if p1.onAfterClosePage then
			p1.onAfterClosePage()
		end
	end, { p1.closePage, p1.onAfterClosePage })
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), constantsModule (copy), gameInviteEvents (copy), var6 (ref)
		p1.analytics:sendEvent(constantsModule.Triggers.DeveloperSingle, gameInviteEvents.CancelInvite)
		var6()
	end, { var6 })
	local var8 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), p1 (ref), id (ref), inviteStatus (copy), constantsModule (copy), gameInviteEvents (copy), inviteUserId (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (copy), playersService (copy), var6 (ref)
		var5(true)
		local inviteUser = p1.inviteUser
		local analytics = p1.analytics
		
		if id and id ~= inviteStatus.Failed then return end
		analytics:sendEvent(constantsModule.Triggers.DeveloperSingle, gameInviteEvents.SendInvite, {
			recipient = inviteUserId.id,
			isLaunchDataProvided = if getFFlagAbuseReportAnalyticsHasLaunchDataModule() then p1.launchData ~= nil and p1.launchData ~= "" else nil
		})
		inviteUser(tostring(inviteUserId.id), analytics, p1.inviteMessageId, p1.launchData):andThen(function(p2)
			-- upvalues: var5 (copy), inviteUserId (copy), playersService (copy), analytics (ref), var6 (copy)
			var5(false)
			
			if not p2 then return end
			local list = { inviteUserId.id }
			
			if playersService.LocalPlayer and p2.conversationId then
				analytics:onActivatedInviteSent(playersService.LocalPlayer.UserId, p2.conversationId, list)
			end
			var6()
		end, var6)
	end, {
		p1.inviteUser, p1.inviteMessageId, p1.launchData, p1.analytics, var5, id,
		inviteUserId, var6
	})
	
	if getFFlagSingleUserInvitePageKeybindModule() then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), contextActionService (copy), var8 (write), var7 (ref)
			if p1.isVisible then
				contextActionService:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, p2, _)
					-- upvalues: var8 (copy)
					if p2 == Enum.UserInputState.Begin then
						var8()
					end
				end, false, Enum.KeyCode.ButtonA)
				contextActionService:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, p2, _)
					-- upvalues: var7 (copy)
					if p2 == Enum.UserInputState.Begin then
						var7()
					end
				end, false, Enum.KeyCode.ButtonB)
				
				return function()
					-- upvalues: contextActionService (copy)
					contextActionService:UnbindCoreAction("ProductPurchaseConfirmButtonBind")
					contextActionService:UnbindCoreAction("ProductPurchaseCancelButtonBind")
				end
			end
			return nil
		end, { p1.isVisible, var8, var7 })
	end
	if getFFlagThrottleInviteSendEndpointModule() then
		var8 = reactModule.useCallback(throttleFunctionCallModule(getFIntThrottleInviteSendEndpointDelayModule(), var8), { var8 })
	end
	if inviteUserId then
		local var9 = id and id ~= inviteStatus.Failed
		
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
				fontStyle = var3.Font.Header1,
				colorStyle = var3.Theme.TextEmphasis,
				text = var1:FormatByKey("Feature.SettingsHub.Heading.InviteUser", { DisplayName = inviteUserId.displayName }),
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
					fontStyle = var3.Font.Header2,
					colorStyle = var3.Theme.TextEmphasis,
					text = p1.promptMessage or var1:FormatByKey("Feature.SettingsHub.Label.DefaultInviteMessage", { DisplayName = inviteUserId.displayName }),
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
						text = var1:FormatByKey("Feature.SettingsHub.Action.Cancel"),
						onActivated = var7,
						isDisabled = var4
					}),
					InviteButton = reactModule.createElement(button, {
						buttonType = buttonType.PrimarySystem,
						size = UDim2.new(0.5, -12, 1, 0),
						position = UDim2.new(0.5, 12, 0, 0),
						text = var1:FormatByKey(if var9 then "Feature.SettingsHub.Label.Invited" else "Feature.SettingsHub.Action.InviteFriend"),
						onActivated = var8,
						isLoading = var4,
						isDisabled = var9
					})
				})
			})
		})
	elseif p1.friendsRetrievalStatus == retrievalStatus.Done or p1.friendsRetrievalStatus == retrievalStatus.Failed then
		var6()
	end
end

return roactRoduxModule.connect(function(p1)
	-- upvalues: playersService (ref)
	return {
		friends = p1.Users,
		friendsRetrievalStatus = playersService.LocalPlayer and p1.Friends.retrievalStatus[tostring(playersService.LocalPlayer.UserId)],
		invites = p1.Invites
	}
end, function(p1)
	-- upvalues: httpRequestModule (ref), httpRbxApiService (ref), getFFlagEnableNewInviteSendEndpointModule (ref), inviteUserIdToPlaceIdCustomizedModule (ref), constantsModule (ref), inviteUserIdToPlaceIdModule (ref)
	return {
		inviteUser = function(p2, p3, p4, p5)
			-- upvalues: httpRequestModule (copy), httpRbxApiService (copy), getFFlagEnableNewInviteSendEndpointModule (copy), p1 (ref), inviteUserIdToPlaceIdCustomizedModule (copy), constantsModule (copy), inviteUserIdToPlaceIdModule (copy)
			local var3 = httpRequestModule(httpRbxApiService)
			local var4 = tostring(game.PlaceId)
			
			return if getFFlagEnableNewInviteSendEndpointModule() then p1(inviteUserIdToPlaceIdCustomizedModule(var3, p2, var4, p3, constantsModule.Triggers.DeveloperSingle, p4, p5)) else p1(inviteUserIdToPlaceIdModule(var3, p2, var4))
		end
	}
end)(function(p1)
	-- upvalues: renderWithCoreScriptsStyleProviderModule (ref), reactModule (ref), var2 (ref)
	return renderWithCoreScriptsStyleProviderModule({ SingleUserInvite = reactModule.createElement(var2, p1) })
end)