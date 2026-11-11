local ContextActionService = game:GetService("ContextActionService")
local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local ReactModule = require(CorePackages.Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RenderWithCoreScriptsStyleProviderModule = require(Modules.Common.renderWithCoreScriptsStyleProvider)
local ShareGame = Modules.Settings.Pages.ShareGame
local COLORS = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Constants.COLORS
local ConstantsModule = require(ShareGame.Constants)
local GameInviteEvents = require(CorePackages.Workspace.Packages.GameInvite).GameInviteEvents
local InviteStatus = ConstantsModule.InviteStatus
local Translator = require(ShareGame.getTranslator)()
local HttpRequestModule = require(Modules.Common.httpRequest)
local InviteUserIdToPlaceIdModule = require(ShareGame.Thunks.InviteUserIdToPlaceId)
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local InviteUserIdToPlaceIdCustomizedModule = require(ShareGame.Thunks.InviteUserIdToPlaceIdCustomized)
local ThrottleFunctionCallModule = require(ShareGame.ThrottleFunctionCall)
local SingleUserThumbnailModule = require(ShareGame.Components.SingleUserThumbnail)
local GetFFlagAbuseReportAnalyticsHasLaunchDataModule = require(Modules.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local GetFFlagEnableNewInviteSendEndpointModule = require(Modules.Flags.GetFFlagEnableNewInviteSendEndpoint)
local GetFFlagThrottleInviteSendEndpointModule = require(Modules.Flags.GetFFlagThrottleInviteSendEndpoint)
local GetFIntThrottleInviteSendEndpointDelayModule = require(Modules.Flags.GetFIntThrottleInviteSendEndpointDelay)
local GetFFlagSingleUserInvitePageKeybindModule = require(Modules.Settings.Flags.GetFFlagSingleUserInvitePageKeybind)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local _Color3 = Color3.fromRGB(41, 41, 41)

local function v29(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), ConstantsModule (copy), GameInviteEvents (copy), InviteStatus (copy), GetFFlagAbuseReportAnalyticsHasLaunchDataModule (copy), Players (copy), GetFFlagSingleUserInvitePageKeybindModule (copy), ContextActionService (copy), GetFFlagThrottleInviteSendEndpointModule (copy), ThrottleFunctionCallModule (copy), GetFIntThrottleInviteSendEndpointDelayModule (copy), RetrievalStatus (copy), _Color3 (copy), StyledTextLabel (copy), Translator (copy), COLORS (copy), SingleUserThumbnailModule (copy), Button (copy), ButtonType (copy)
	local Friend = p1.friends[tostring(p1.inviteUserId)]
	local Invite = Friend and p1.invites[Friend.id]
	local UseStyleResult = UseStyleFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), ConstantsModule (upval), GameInviteEvents (upval)
		if p1.promptMessage and p1.analytics then
			p1.analytics:sendEvent(ConstantsModule.Triggers.DeveloperSingle, GameInviteEvents.CustomTextShown)
		end
	end, {})
	local UseResult: () -> () = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.closePage()
		
		if p1.onAfterClosePage then
			p1.onAfterClosePage()
		end
	end, { p1.closePage, p1.onAfterClosePage })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), ConstantsModule (upval), GameInviteEvents (upval), UseResult (copy)
		p1.analytics:sendEvent(ConstantsModule.Triggers.DeveloperSingle, GameInviteEvents.CancelInvite)
		UseResult()
	end, { UseResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy), Invite (copy), InviteStatus (upval), ConstantsModule (upval), GameInviteEvents (upval), Friend (copy), GetFFlagAbuseReportAnalyticsHasLaunchDataModule (upval), Players (upval), UseResult (copy)
		UseStateResult2(true)
		local InviteUserFunction = p1.inviteUser
		local Analytics = p1.analytics
		
		if not Invite or Invite == InviteStatus.Failed then
			local IsNotLaunchDataMatch: boolean = p1.launchData ~= nil and p1.launchData ~= ""
			Analytics:sendEvent(ConstantsModule.Triggers.DeveloperSingle, GameInviteEvents.SendInvite, {
				recipient = Friend.id,
				isLaunchDataProvided = if GetFFlagAbuseReportAnalyticsHasLaunchDataModule() then IsNotLaunchDataMatch else nil
			})
			InviteUserFunction(tostring(Friend.id), Analytics, p1.inviteMessageId, p1.launchData):andThen(function(Result)
				-- upvalues: UseStateResult2 (upval), Friend (upval), Players (upval), Analytics (copy), UseResult (upval)
				UseStateResult2(false)
				
				if not Result then return end
				local list = { Friend.id }
				
				if Players.LocalPlayer and Result.conversationId then
					Analytics:onActivatedInviteSent(Players.LocalPlayer.UserId, Result.conversationId, list)
				end
				UseResult()
			end, UseResult)
			
			return
		end
	end, {
		p1.inviteUser, p1.inviteMessageId, p1.launchData, p1.analytics,
		UseStateResult2, Invite, Friend, UseResult
	})
	
	if GetFFlagSingleUserInvitePageKeybindModule() then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), ContextActionService (upval), UseResult2 (ref), UseResult1 (copy)
			if p1.isVisible then
				ContextActionService:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, UserInputState, _)
					-- upvalues: UseResult2 (upval)
					if UserInputState == Enum.UserInputState.Begin then
						UseResult2()
					end
				end, false, Enum.KeyCode.ButtonA)
				ContextActionService:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, UserInputState, _)
					-- upvalues: UseResult1 (upval)
					if UserInputState == Enum.UserInputState.Begin then
						UseResult1()
					end
				end, false, Enum.KeyCode.ButtonB)
				
				return function()
					-- upvalues: ContextActionService (upval)
					ContextActionService:UnbindCoreAction("ProductPurchaseConfirmButtonBind")
					ContextActionService:UnbindCoreAction("ProductPurchaseCancelButtonBind")
				end
			else
				return nil
			end
		end, { p1.isVisible, UseResult2, UseResult1 })
	end
	if GetFFlagThrottleInviteSendEndpointModule() then
		UseResult2 = ReactModule.useCallback(ThrottleFunctionCallModule(GetFIntThrottleInviteSendEndpointDelayModule(), UseResult2), { UseResult2 })
	end
	if Friend then
		local IsNotInviteMatch: boolean = Invite and Invite ~= InviteStatus.Failed
		
		return ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 0.1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = _Color3
		}, {
			SizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(442, 1e999),
				MinSize = Vector2.new(0, 0)
			}),
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 24),
				PaddingRight = UDim.new(0, 24),
				PaddingBottom = UDim.new(0, 24)
			}),
			Header = ReactModule.createElement(StyledTextLabel, {
				fontStyle = UseStyleResult.Font.Header1,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				text = Translator:FormatByKey("Feature.SettingsHub.Heading.InviteUser", { DisplayName = Friend.displayName }),
				size = UDim2.new(1, 0, 0, 48),
				textXAlignment = Enum.TextXAlignment.Center
			}),
			Divider = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0, 0, 48),
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = COLORS.GRAPHITE
			}),
			Wrapper = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0, 0, 0, 56)
			}, {
				ListLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 24)
				}),
				Thumbnail = ReactModule.createElement(SingleUserThumbnailModule, {
					layoutOrder = 1,
					square = true,
					backgroundTransparency = 1,
					user = Friend,
					size = UDim2.new(0, 95, 0, 95)
				}),
				TextBody = ReactModule.createElement(StyledTextLabel, {
					layoutOrder = 2,
					fontStyle = UseStyleResult.Font.Header2,
					colorStyle = UseStyleResult.Theme.TextEmphasis,
					text = p1.promptMessage or Translator:FormatByKey("Feature.SettingsHub.Label.DefaultInviteMessage", { DisplayName = Friend.displayName }),
					textXAlignment = Enum.TextXAlignment.Center,
					automaticSize = Enum.AutomaticSize.Y,
					size = UDim2.new(1, 0, 0, 0)
				}),
				ButtonWrapper = ReactModule.createElement("Frame", {
					LayoutOrder = 3,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 48)
				}, {
					CancelButton = ReactModule.createElement(Button, {
						buttonType = ButtonType.Secondary,
						size = UDim2.new(0.5, -12, 1, 0),
						text = Translator:FormatByKey("Feature.SettingsHub.Action.Cancel"),
						onActivated = UseResult1,
						isDisabled = UseStateResult
					}),
					InviteButton = ReactModule.createElement(Button, {
						buttonType = ButtonType.PrimarySystem,
						size = UDim2.new(0.5, -12, 1, 0),
						position = UDim2.new(0.5, 12, 0, 0),
						text = Translator:FormatByKey(if IsNotInviteMatch then "Feature.SettingsHub.Label.Invited" else "Feature.SettingsHub.Action.InviteFriend"),
						onActivated = UseResult2,
						isLoading = UseStateResult,
						isDisabled = IsNotInviteMatch
					})
				})
			})
		})
	elseif p1.friendsRetrievalStatus == RetrievalStatus.Done or p1.friendsRetrievalStatus == RetrievalStatus.Failed then
		UseResult()
	end
end

return require(CorePackages.Packages.RoactRodux).connect(function(p1)
	-- upvalues: Players (copy)
	return {
		friends = p1.Users,
		friendsRetrievalStatus = Players.LocalPlayer and p1.Friends.retrievalStatus[tostring(Players.LocalPlayer.UserId)],
		invites = p1.Invites
	}
end, function(Callback)
	-- upvalues: HttpRequestModule (copy), HttpRbxApiService (copy), GetFFlagEnableNewInviteSendEndpointModule (copy), InviteUserIdToPlaceIdCustomizedModule (copy), ConstantsModule (copy), InviteUserIdToPlaceIdModule (copy)
	return {
		inviteUser = function(p1, p2, p3, p4)
			-- upvalues: HttpRequestModule (upval), HttpRbxApiService (upval), GetFFlagEnableNewInviteSendEndpointModule (upval), Callback (copy), InviteUserIdToPlaceIdCustomizedModule (upval), ConstantsModule (upval), InviteUserIdToPlaceIdModule (upval)
			local HttpRequestModuleResult = HttpRequestModule(HttpRbxApiService)
			local Text = tostring(game.PlaceId)
			
			return if GetFFlagEnableNewInviteSendEndpointModule() then Callback(InviteUserIdToPlaceIdCustomizedModule(HttpRequestModuleResult, p1, Text, p2, ConstantsModule.Triggers.DeveloperSingle, p3, p4)) else Callback(InviteUserIdToPlaceIdModule(HttpRequestModuleResult, p1, Text))
		end
	}
end)(function(p1)
	-- upvalues: RenderWithCoreScriptsStyleProviderModule (copy), ReactModule (copy), v29 (copy)
	return RenderWithCoreScriptsStyleProviderModule({ SingleUserInvite = ReactModule.createElement(v29, p1) })
end)