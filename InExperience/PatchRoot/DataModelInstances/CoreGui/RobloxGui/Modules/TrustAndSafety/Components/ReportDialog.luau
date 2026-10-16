local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.Dependencies)
local GameIconModule = require(DependenciesModule.GameIcon)
local PlayerCellModule = require(DependenciesModule.PlayerCell)
local ThemedTextLabelModule = require(DependenciesModule.ThemedTextLabel)
local WithLocalizationModule = require(DependenciesModule.withLocalization)
local NavigateBackModule = require(Parent.Actions.NavigateBack)
local EndReportFlowModule = require(Parent.Actions.EndReportFlow)
local ConstantsModule = require(Parent.Resources.Constants)
local SendReportModule = require(Parent.Thunks.SendReport)
local TextEntryFieldModule = require(Parent.Components.TextEntryField)
local ModalDialogModule = require(Parent.Components.ModalDialog)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local SessionUtilityModule = require(Parent.Utility.SessionUtility)
local Provider = UIBloxModule.Core.Style.Provider
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Colors = UIBloxModule.App.Style.Colors
local DropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local IsPlayerVerifiedFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.isPlayerVerified
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local VoiceIndicatorFuncModule = require(RobloxGui.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local VoiceStateContextModule = require(RobloxGui.Modules.VoiceChat.VoiceStateContext)
local ConstantsModule1 = require(RobloxGui.Modules.VoiceChat.Constants)
local ReactModule = require(CorePackages.Packages.React)

local function v31(p1) --[[ Line: 45 ]]
	-- upvalues: ReactModule (copy), VoiceStateContextModule (copy), VoiceIndicatorFuncModule (copy), CryoModule (copy)
	return if ReactModule.useContext(VoiceStateContextModule.Context).voiceEnabled then ReactModule.createElement(VoiceIndicatorFuncModule, CryoModule.Dictionary.join(p1, {})) else nil
end

local DsaIllegalContentReportingModule = require(CorePackages.Workspace.Packages.DsaIllegalContentReporting)
local IsShowUKOSAIllegalContentReportingLinkFunction = DsaIllegalContentReportingModule.isShowUKOSAIllegalContentReportingLink
local OSAReportLink = DsaIllegalContentReportingModule.OSAReportLink
local list = {
	"Swearing", "Inappropriate Username", "Bullying", "Scamming", "Dating",
	"Cheating/Exploiting", "Personal Question", "Offsite Links"
}
local config = {
	BackgroundDefault = { Transparency = 1, Color = Colors.Flint },
	BackgroundOnHover = { Transparency = 1, Color = Colors.Flint },
	BackgroundOnPress = { Transparency = 1, Color = Colors.Flint }
}
local ReportDialog = RoactModule.PureComponent:extend("ReportDialog")
ReportDialog.validateProps = TModule.strictInterface({
	isReportDialogOpen = TModule.boolean,
	reportType = TModule.optional(TModule.valueOf(ConstantsModule.ReportType)),
	targetPlayer = TModule.optional((require(DependenciesModule.playerInterface))),
	placeName = TModule.string,
	screenSize = TModule.Vector2,
	navigateBack = TModule.optional(TModule.callback),
	canNavigateBack = TModule.optional(TModule.boolean),
	sendReport = TModule.callback,
	closeDialog = TModule.optional(TModule.callback),
	reportCategory = TModule.optional(TModule.string)
})

function ReportDialog.init(p1) --[[ Line: 104 ]]
	p1.state = { reasonText = nil, descriptionText = "" }
	
	function p1.onReasonChanged(ReasonText) --[[ Line: 110 ]]
		-- upvalues: p1 (copy)
		p1:setState({ reasonText = ReasonText })
	end
	
	function p1.onTextChanged(DescriptionText) --[[ Line: 116 ]]
		-- upvalues: p1 (copy)
		p1:setState({ descriptionText = DescriptionText })
	end
	
	function p1.onReport(ToastDefaultTitle, ToastDefaultDescription) --[[ Line: 122 ]]
		-- upvalues: p1 (copy)
		p1.props.sendReport(p1.props.reportType, p1.props.targetPlayer, p1:getReason(), p1.state.descriptionText, p1.props.reportCategory, ToastDefaultTitle, ToastDefaultDescription)
	end
	
	function p1.navigateBack() --[[ Line: 135 ]]
		-- upvalues: p1 (copy)
		p1.props.navigateBack(p1.state.reasonText, p1.state.descriptionText ~= "")
	end
	
	function p1.onCancel() --[[ Line: 139 ]]
		-- upvalues: p1 (copy)
		p1.props.closeDialog(p1.state.reasonText, p1.state.descriptionText ~= "")
	end
end

function ReportDialog.getReason(p1) --[[ Line: 144 ]]
	-- upvalues: ConstantsModule (copy)
	return if p1.props.reportType == ConstantsModule.ReportType.Player then p1.state.reasonText elseif p1.props.reportType == ConstantsModule.ReportType.Place then "Inappropriate Content" else nil
end

function ReportDialog.canReport(p1): boolean --[[ Line: 154 ]]
	local Length = utf8.len(utf8.nfcnormalize(p1.state.descriptionText))
	
	return p1:getReason() ~= nil and (Length >= 0 and Length <= 160)
end

function ReportDialog:renderUKOSALink() --[[ Line: 161 ]]
	-- upvalues: IsShowUKOSAIllegalContentReportingLinkFunction (copy), RoactModule (copy), OSAReportLink (copy)
	return if IsShowUKOSAIllegalContentReportingLinkFunction() then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 99,
		Size = UDim2.new(1, 0, 0, 40),
		Position = UDim2.new(0, 0, 1, -45)
	}, { OSALink = RoactModule.createElement(OSAReportLink) }) else nil
end

function ReportDialog.renderPlayerInfo(p1) --[[ Line: 176 ]]
	-- upvalues: ConstantsModule (copy), WithStyleFunction (copy), CryoModule (copy), config (copy), RoactModule (copy), Provider (copy), PlayerCellModule (copy), IsPlayerVerifiedFunction (copy), v31 (copy), Default (copy), ConstantsModule1 (copy)
	local IsReportCategoryMatch = p1.props.reportCategory == ConstantsModule.Category.Voice
	
	return WithStyleFunction(function(p2) --[[ Line: 179 ]]
		-- upvalues: CryoModule (upval), config (upval), IsReportCategoryMatch (copy), p1 (copy), RoactModule (upval), Provider (upval), PlayerCellModule (upval), IsPlayerVerifiedFunction (upval), v31 (upval), Default (upval), ConstantsModule1 (upval)
		local JoinResult = CryoModule.Dictionary.join(p2, { Theme = CryoModule.Dictionary.join(p2.Theme, config) })
		local MemoKey = 0
		
		if IsReportCategoryMatch and p1.props.isReportDialogOpen then
			MemoKey += 1
		end
		return RoactModule.createElement(Provider, { style = JoinResult }, {
			RoactModule.createElement(PlayerCellModule, {
				isOnline = true,
				isSelected = false,
				LayoutOrder = 1,
				userId = p1.props.targetPlayer.UserId,
				username = p1.props.targetPlayer.Name,
				displayName = p1.props.targetPlayer.DisplayName,
				hasVerifiedBadge = IsPlayerVerifiedFunction(p1.props.targetPlayer),
				key = tostring(p1.props.targetPlayer.UserId),
				memoKey = MemoKey
			}, {
				VoiceIndicator = IsReportCategoryMatch and p1.props.isReportDialogOpen and RoactModule.createElement(v31, {
					hideOnError = true,
					iconStyle = "SpeakerLight",
					userId = tostring(p1.props.targetPlayer.UserId),
					size = UDim2.fromOffset(36, 36),
					onClicked = function() --[[ Line: 210 ]]
						-- upvalues: Default (upval), p1 (upval), ConstantsModule1 (upval)
						Default:ToggleMutePlayer(p1.props.targetPlayer.UserId, ConstantsModule1.VOICE_CONTEXT_TYPE.REPORT_MENU)
					end
				}) or nil
			})
		})
	end)
end

function ReportDialog.renderDropDownMenu(p1) --[[ Line: 223 ]]
	-- upvalues: IsShowUKOSAIllegalContentReportingLinkFunction (copy), RoactModule (copy), WithLocalizationModule (copy), list (copy), DropdownMenu (copy)
	local YOffset: number = if IsShowUKOSAIllegalContentReportingLinkFunction() then 64 else 72
	
	return if p1.props.isReportDialogOpen then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 10,
		Position = UDim2.fromOffset(0, YOffset),
		Size = UDim2.new(1, 0, 0, 48)
	}, {
		DropDown = WithLocalizationModule({
			menu1 = "CoreScripts.InGameMenu.Report.AbuseSwearing",
			menu2 = "CoreScripts.InGameMenu.Report.AbuseUsername",
			menu3 = "CoreScripts.InGameMenu.Report.AbuseBullying",
			menu4 = "CoreScripts.InGameMenu.Report.AbuseScamming",
			menu5 = "CoreScripts.InGameMenu.Report.AbuseDating",
			menu6 = "CoreScripts.InGameMenu.Report.AbuseExploiting",
			menu7 = "CoreScripts.InGameMenu.Report.AbusePersonalQuestion",
			menu8 = "CoreScripts.InGameMenu.Report.AbuseOffsiteLink",
			placeHolderText = "CoreScripts.InGameMenu.Report.AbuseTypePlaceHolder"
		})(function(p2) --[[ Line: 245 ]]
			-- upvalues: list (upval), p1 (copy), RoactModule (upval), DropdownMenu (upval)
			local CellDatas = {}
			local t = {}
			
			for i, value in ipairs(list) do
				local Text = p2["menu" .. tostring(i)]
				table.insert(CellDatas, { text = Text })
				t[Text] = value
			end
			return RoactModule.createElement(DropdownMenu, {
				showDropShadow = true,
				fixedListHeight = 171,
				placeholder = p2.placeHolderText,
				onChange = function(p3) --[[ Line: 256 ]]
					-- upvalues: t (copy), p1 (upval)
					p1.onReasonChanged(t[p3])
				end,
				height = UDim.new(0, 48),
				screenSize = p1.props.screenSize,
				cellDatas = CellDatas
			})
		end)
	}) else nil
end

function ReportDialog.renderPlayerContents(p2) --[[ Line: 275 ]]
	-- upvalues: WithLocalizationModule (copy), IsShowUKOSAIllegalContentReportingLinkFunction (copy), RoactModule (copy), TextEntryFieldModule (copy)
	return WithLocalizationModule({
		placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder"
	})(function(p3) --[[ Line: 278 ]]
		-- upvalues: IsShowUKOSAIllegalContentReportingLinkFunction (upval), RoactModule (upval), p2 (copy), TextEntryFieldModule (upval)
		return RoactModule.createFragment({
			PlayerInfo = p2:renderPlayerInfo(),
			DropDownMenu = p2:renderDropDownMenu(),
			TextField = RoactModule.createElement(TextEntryFieldModule, {
				maxTextLength = 160,
				autoFocusOnEnabled = false,
				enabled = p2.props.isReportDialogOpen,
				text = p2.state.descriptionText,
				textChanged = p2.onTextChanged,
				PlaceholderText = p3.placeHolderText,
				Position = UDim2.fromOffset(0, if IsShowUKOSAIllegalContentReportingLinkFunction() then 118 else 132),
				Size = UDim2.new(1, 0, 1, if IsShowUKOSAIllegalContentReportingLinkFunction() then -150 else -132)
			}),
			OSALinkFrame = p2:renderUKOSALink()
		})
	end)
end

function ReportDialog.renderPlaceContents(p2) --[[ Line: 299 ]]
	-- upvalues: WithLocalizationModule (copy), IsShowUKOSAIllegalContentReportingLinkFunction (copy), RoactModule (copy), GameIconModule (copy), ThemedTextLabelModule (copy), TextEntryFieldModule (copy)
	return WithLocalizationModule({
		placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder",
		labelText = {
			"CoreScripts.InGameMenu.Report.ReportingGame",
			RBX_NAME = p2.props.placeName
		}
	})(function(p3) --[[ Line: 306 ]]
		-- upvalues: IsShowUKOSAIllegalContentReportingLinkFunction (upval), RoactModule (upval), GameIconModule (upval), ThemedTextLabelModule (upval), TextEntryFieldModule (upval), p2 (copy)
		return RoactModule.createFragment({
			PlaceInfo = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, if IsShowUKOSAIllegalContentReportingLinkFunction() then 12 else 24),
				Size = UDim2.new(1, 0, 0, 64)
			}, {
				GameIcon = RoactModule.createElement(GameIconModule, {
					iconSize = 64,
					gameId = game.GameId,
					cornerRadius = UDim.new(0, 8)
				}),
				Label = RoactModule.createElement(ThemedTextLabelModule, {
					fontKey = "Body",
					themeKey = "TextDefault",
					BackgroundTransparency = 1,
					TextWrapped = true,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, 76, 0.5, 0),
					Size = UDim2.new(1, -76, 0, 40),
					Text = p3.labelText,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			TextField = RoactModule.createElement(TextEntryFieldModule, {
				maxTextLength = 160,
				autoFocusOnEnabled = false,
				enabled = p2.props.isReportDialogOpen,
				text = p2.state.descriptionText,
				textChanged = p2.onTextChanged,
				PlaceholderText = p3.placeHolderText,
				Position = UDim2.fromOffset(0, if IsShowUKOSAIllegalContentReportingLinkFunction() then 90 else 112),
				Size = UDim2.new(1, 0, 1, if IsShowUKOSAIllegalContentReportingLinkFunction() then -135 else -112)
			}),
			OSALinkFrame = p2:renderUKOSALink()
		})
	end)
end

function ReportDialog.renderContents(p2) --[[ Line: 348 ]]
	-- upvalues: ConstantsModule (copy)
	return if p2.props.reportType == ConstantsModule.ReportType.Player then p2:renderPlayerContents() elseif p2.props.reportType == ConstantsModule.ReportType.Place then p2:renderPlaceContents() else nil
end

local config1 = {
	[ConstantsModule.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat",
	[ConstantsModule.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat",
	[ConstantsModule.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other",
	[ConstantsModule.Category.Experience] = "CoreScripts.InGameMenu.Report.Title.Experience"
}

function ReportDialog.categoryTitle(p2) --[[ Line: 365 ]]
	-- upvalues: ConstantsModule (copy), config1 (copy)
	return if p2.props.reportType == ConstantsModule.ReportType.Place then config1[ConstantsModule.Category.Experience] else config1[p2.props.reportCategory] or "CoreScripts.InGameMenu.Report.ReportTitle"
end

function ReportDialog.render(p2) --[[ Line: 372 ]]
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), ModalDialogModule (copy), ButtonStack (copy), ButtonType (copy)
	return WithLocalizationModule({
		cancelText = "CoreScripts.InGameMenu.Cancel",
		reportText = "CoreScripts.InGameMenu.Report.SendReport",
		toastDefaultTitle = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport",
		toastDefaultDescription = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription",
		titleText = p2:categoryTitle()
	})(function(p3) --[[ Line: 379 ]]
		-- upvalues: RoactModule (upval), ModalDialogModule (upval), p2 (copy), ButtonStack (upval), ButtonType (upval)
		return RoactModule.createElement(ModalDialogModule, {
			visible = p2.props.isReportDialogOpen,
			screenSize = p2.props.screenSize,
			titleText = p3.titleText,
			contents = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Contents = p2:renderContents()
			}),
			actionButtons = RoactModule.createElement(ButtonStack, {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = { onActivated = p2.onCancel, text = p3.cancelText }
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							isDisabled = not p2:canReport(),
							onActivated = function() --[[ Line: 408 ]]
								-- upvalues: p2 (upval), p3 (copy)
								return p2.onReport(p3.toastDefaultTitle, p3.toastDefaultDescription)
							end,
							text = p3.reportText
						}
					}
				}
			}),
			onDismiss = p2.onCancel,
			onBackButtonActivated = if p2.props.canNavigateBack then p2.navigateBack else nil
		})
	end)
end

function ReportDialog.didUpdate(p2, p3) --[[ Line: 422 ]]
	-- upvalues: RoactModule (copy)
	if p3.isReportDialogOpen and not p2.props.isReportDialogOpen then
		p2:setState({ descriptionText = "", reasonText = RoactModule.None })
	end
end

return RoactRoduxModule.UNSTABLE_connect2(function(p2, _) --[[ Line: 432 ]]
	-- upvalues: ConstantsModule (copy)
	return {
		reportCategory = p2.report.reportCategory,
		isReportDialogOpen = p2.report.currentPage == ConstantsModule.Page.ReportForm,
		reportType = p2.report.reportType,
		targetPlayer = p2.report.targetPlayer,
		canNavigateBack = #p2.report.history > 1,
		placeName = p2.placeInfo.name,
		screenSize = p2.displayOptions.screenSize
	}
end, function(Callback) --[[ Line: 442 ]]
	-- upvalues: NavigateBackModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy), EndReportFlowModule (copy), SessionUtilityModule (copy), SendReportModule (copy)
	return {
		navigateBack = function(Reason, DescriptionTextChanged) --[[ Line: 444 ]]
			-- upvalues: Callback (copy), NavigateBackModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
			Callback(NavigateBackModule())
			SendAnalyticsModule(ConstantsModule.Page.ReportForm, ConstantsModule.Analytics.ReportFlowBack, {
				source = ConstantsModule.Page.ReportForm,
				reason = Reason,
				descriptionTextChanged = DescriptionTextChanged
			})
		end,
		closeDialog = function(Reason, DescriptionTextChanged) --[[ Line: 452 ]]
			-- upvalues: Callback (copy), EndReportFlowModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval), SessionUtilityModule (upval)
			Callback(EndReportFlowModule())
			SendAnalyticsModule(ConstantsModule.Page.ReportForm, ConstantsModule.Analytics.ReportFlowAbandoned, {
				source = ConstantsModule.Page.ReportForm,
				reason = Reason,
				descriptionTextChanged = DescriptionTextChanged
			})
			SessionUtilityModule.endAbuseReportSession()
		end,
		sendReport = function(p2, p3, p4, p5, p6, p7, p8) --[[ Line: 461 ]]
			-- upvalues: Callback (copy), SendReportModule (upval)
			Callback(SendReportModule(p2, p3, p4, p5, p6, p7, p8))
		end
	}
end)(ReportDialog)