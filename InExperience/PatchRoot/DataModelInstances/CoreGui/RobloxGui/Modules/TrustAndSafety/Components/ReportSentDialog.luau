local ContextActionService = game:GetService("ContextActionService")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.Dependencies)
local FocusHandlerModule = require(DependenciesModule.FocusHandler)
local DividerModule = require(DependenciesModule.Divider)
local ThemedTextLabelModule = require(DependenciesModule.ThemedTextLabel)
local WithLocalizationModule = require(DependenciesModule.withLocalization)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local BlockPlayerModule = require(Parent.Thunks.BlockPlayer)
local BlockPlayerItemModule = require(Parent.Components.BlockPlayerItem)
local EndReportFlowModule = require(Parent.Actions.EndReportFlow)
local _ = require(Parent.Actions.OpenBlockPlayerDialog)
local ShowToastModule = require(Parent.Actions.ShowToast)
local ConstantsModule = require(Parent.Resources.Constants)
local AssetsModule = require(Parent.Resources.Assets)
local ModalDialogModule = require(Parent.Components.ModalDialog)
local ConstantsModule1 = require(RobloxGui.Modules.VoiceChat.Constants)
local ReportSentDialog = RoactModule.PureComponent:extend("ReportSentDialog")
ReportSentDialog.validateProps = TModule.strictInterface({
	isReportSentOpen = TModule.boolean,
	screenSize = TModule.Vector2,
	inputType = TModule.optional(TModule.string),
	reportType = TModule.optional(TModule.valueOf(ConstantsModule.ReportType)),
	targetPlayer = TModule.optional((require(DependenciesModule.playerInterface))),
	blockPlayer = TModule.callback,
	showToast = TModule.callback,
	closeDialog = TModule.callback,
	reportCategory = TModule.optional(TModule.string)
})

function isPlayerUserIdMuted(p1) --[[ Line: 55 ]]
	-- upvalues: Default (copy)
	local IsMutedLocally = false
	
	if Default.participants then
		local Participant = Default.participants[tostring(p1)]
		
		if Participant then
			IsMutedLocally = Participant.isMutedLocally
		end
	end
	return IsMutedLocally
end

function ReportSentDialog.init(p1) --[[ Line: 66 ]]
	-- upvalues: RoactModule (copy), Default (copy), ConstantsModule1 (copy)
	p1:clearState()
	p1.buttonRef = RoactModule.createRef()
	
	function p1.onBlockCheckBoxActivated(IsBlockCheckBoxSelected) --[[ Line: 70 ]]
		-- upvalues: p1 (copy)
		p1:setState({
			isBlockCheckBoxSelected = IsBlockCheckBoxSelected,
			isMuteCheckBoxSelected = if IsBlockCheckBoxSelected and p1:isVoiceReport() then true else p1.state.isMuteCheckBoxSelected
		})
	end
	
	function p1.onMuteCheckBoxActivated(IsMuteCheckBoxSelected) --[[ Line: 79 ]]
		-- upvalues: p1 (copy)
		p1:setState({ isMuteCheckBoxSelected = IsMuteCheckBoxSelected })
	end
	
	function p1.hasMuteChanged(): boolean --[[ Line: 85 ]]
		-- upvalues: p1 (copy)
		return p1.state.isMuteCheckBoxSelected ~= p1.state.wasPlayerMutedWhenDialogOpened
	end
	
	function p1.getToastMessage(p2) --[[ Line: 89 ]]
		-- upvalues: p1 (copy)
		local config = {
			title = p2.toastDefaultTitle,
			description = p2.toastDefaultDescription
		}
		
		if p1.state.isMuteCheckBoxSelected and p1.state.isBlockCheckBoxSelected then
			config.title = p2.toastMutedAndBlockedTitle
			config.description = p2.toastMutedAndBlockedDescription
			
			return config
		end
		if p1.state.isMuteCheckBoxSelected then
			config.title = p2.toastMutedTitle
			config.description = p2.toastMutedDescription
			
			return config
		end
		if p1.state.isBlockCheckBoxSelected then
			config.title = p2.toastBlockedTitle
			config.description = p2.toastBlockedDescription
		end
		return config
	end
	
	function p1.onConfirm(p2) --[[ Line: 110 ]]
		-- upvalues: p1 (copy), Default (upval), ConstantsModule1 (upval)
		if p1:isReportingPlayer() then
			local ToastMessage = p1.getToastMessage(p2)
			
			if p1:hasMuteChanged() then
				Default:ToggleMutePlayer(p1.props.targetPlayer.UserId, ConstantsModule1.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
			if p1.state.isBlockCheckBoxSelected then
				p1.props.blockPlayer(p1.props.targetPlayer, ToastMessage.title, ToastMessage.description)
			else
				p1.props.showToast(ToastMessage.title, ToastMessage.description)
			end
		end
		p1.props.closeDialog()
		p1:clearState()
	end
	
	function p1.onCancel() --[[ Line: 131 ]]
		-- upvalues: p1 (copy)
		p1.props.closeDialog()
		p1:clearState()
	end
end

function ReportSentDialog.clearState(p1) --[[ Line: 137 ]]
	p1:setState({
		wasPlayerMutedWhenDialogOpened = false,
		isMuteCheckBoxSelected = false,
		isBlockCheckBoxSelected = false
	})
end

function ReportSentDialog.isVoiceReport(p1): boolean --[[ Line: 145 ]]
	-- upvalues: ConstantsModule (copy)
	return p1:isReportingPlayer() and p1.props.reportCategory == ConstantsModule.Category.Voice
end

function ReportSentDialog.doesRequireConfirmation(p1) --[[ Line: 149 ]]
	return p1.state.isBlockCheckBoxSelected or p1:hasMuteChanged()
end

function ReportSentDialog.isReportingPlayer(p1): boolean --[[ Line: 154 ]]
	-- upvalues: ConstantsModule (copy)
	return p1.props.reportType == ConstantsModule.ReportType.Player and p1.props.targetPlayer ~= nil
end

function ReportSentDialog.renderFocusHandler(p1) --[[ Line: 158 ]]
	-- upvalues: RoactModule (copy), FocusHandlerModule (copy), ConstantsModule (copy), GuiService (copy), ContextActionService (copy)
	return RoactModule.createElement(FocusHandlerModule, {
		isFocused = p1.props.inputType == ConstantsModule.InputType.Gamepad and p1.props.isReportSentOpen,
		didFocus = function() --[[ Line: 161 ]]
			-- upvalues: GuiService (upval), p1 (copy), ContextActionService (upval)
			GuiService:RemoveSelectionGroup("ReportSentDialogGroup")
			GuiService:AddSelectionParent("ReportSentDialogGroup", p1.buttonRef:getValue())
			GuiService.SelectedCoreObject = p1.buttonRef:getValue()
			ContextActionService:BindCoreAction("ReporSentDialogSinkAction", function(_, _) --[[ Line: 166 ]]
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonX)
		end,
		didBlur = function() --[[ Line: 170 ]]
			-- upvalues: ContextActionService (upval), GuiService (upval)
			ContextActionService:UnbindCoreAction("ReporSentDialogSinkAction")
			GuiService:RemoveSelectionGroup("ReportSentDialogGroup")
		end
	})
end

function ReportSentDialog.renderBlockFrame(p1) --[[ Line: 177 ]]
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), DividerModule (copy), BlockPlayerItemModule (copy), AssetsModule (copy)
	return if p1:isReportingPlayer() then WithLocalizationModule({
		mutePlayerText = "CoreScripts.InGameMenu.Report.Mute",
		mutePlayerDescription = "CoreScripts.InGameMenu.Report.MuteDescription",
		blockPlayerText = "CoreScripts.InGameMenu.Report.Block",
		blockPlayerDescription = "CoreScripts.InGameMenu.Report.BlockDescription"
	})(function(p2) --[[ Line: 186 ]]
		-- upvalues: RoactModule (upval), DividerModule (upval), p1 (copy), BlockPlayerItemModule (upval), AssetsModule (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Divider = RoactModule.createElement(DividerModule, { LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 1) }),
			MutePlayerItem = if p1:isVoiceReport() then RoactModule.createElement(BlockPlayerItemModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 0, 72),
				text = p2.mutePlayerText,
				description = p2.mutePlayerDescription,
				icon = AssetsModule.Images.MuteIcon.Image,
				iconSize = AssetsModule.Images.MuteIcon.Size,
				isDisabled = p1.state.isBlockCheckBoxSelected,
				isCheckBoxSelected = p1.state.isMuteCheckBoxSelected,
				onCheckBoxActivated = p1.onMuteCheckBoxActivated
			}) else nil,
			BlockPlayerItem = RoactModule.createElement(BlockPlayerItemModule, {
				layoutOrder = 3,
				size = UDim2.new(1, 0, 0, 72),
				text = p2.blockPlayerText,
				description = p2.blockPlayerDescription,
				icon = AssetsModule.Images.BlockIcon.Image,
				iconSize = AssetsModule.Images.BlockIcon.Size,
				isCheckBoxSelected = p1.state.isBlockCheckBoxSelected,
				onCheckBoxActivated = p1.onBlockCheckBoxActivated
			})
		})
	end) else nil
end

function ReportSentDialog.renderContents(p1) --[[ Line: 228 ]]
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), RoactModule (copy), ThemedTextLabelModule (copy)
	return WithStyleFunction(function(_) --[[ Line: 229 ]]
		-- upvalues: WithLocalizationModule (upval), p1 (copy), RoactModule (upval), ThemedTextLabelModule (upval)
		return WithLocalizationModule({
			bodyText = "CoreScripts.InGameMenu.Report.ThanksForReportDescription",
			otherStepsText = {
				"CoreScripts.InGameMenu.Report.OtherStepsTitle",
				RBX_NAME = p1.props.targetPlayer.Name
			}
		})(function(p2) --[[ Line: 236 ]]
			-- upvalues: RoactModule (upval), ThemedTextLabelModule (upval), p1 (upval)
			return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				BodyFrame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Layout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12)
					}),
					Padding = RoactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 12),
						PaddingBottom = UDim.new(0, 12),
						PaddingLeft = UDim.new(0, 24),
						PaddingRight = UDim.new(0, 24)
					}),
					BodyText = RoactModule.createElement(ThemedTextLabelModule, {
						LayoutOrder = 1,
						themeKey = "TextEmphasis",
						TextWrapped = true,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p2.bodyText,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					OtherStepsText = RoactModule.createElement(ThemedTextLabelModule, {
						LayoutOrder = 2,
						fontKey = "Footer",
						themeKey = "TextDefault",
						TextWrapped = true,
						AutomaticSize = Enum.AutomaticSize.Y,
						Position = UDim2.new(0, 0, 0, 12),
						Size = UDim2.new(1, 0, 0, 0),
						Text = p2.otherStepsText,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				BlockFrame = p1:renderBlockFrame()
			})
		end)
	end)
end

function ReportSentDialog.render(p1) --[[ Line: 291 ]]
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), ModalDialogModule (copy), Button (copy), ButtonType (copy)
	return if p1:isReportingPlayer() then WithLocalizationModule({
		titleText = "CoreScripts.InGameMenu.Report.ThanksForReport",
		toastDefaultTitle = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport",
		toastDefaultDescription = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription",
		toastMutedTitle = "CoreScripts.InGameMenu.Report.Confirmation.Muted",
		toastMutedAndBlockedTitle = "CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlocked",
		toastBlockedTitle = "CoreScripts.InGameMenu.Report.Confirmation.Blocked",
		dismissText = if p1:doesRequireConfirmation() then "CoreScripts.InGameMenu.Report.Confirm" else "CoreScripts.InGameMenu.Report.Done",
		toastMutedDescription = {
			"CoreScripts.InGameMenu.Report.Confirmation.MutedDescriptionWithUser",
			RBX_NAME = p1.props.targetPlayer.Name
		},
		toastMutedAndBlockedDescription = {
			"CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlockedDescriptionWithUser",
			RBX_NAME = p1.props.targetPlayer.Name
		},
		toastBlockedDescription = {
			"CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlockedDescriptionWithUser",
			RBX_NAME = p1.props.targetPlayer.Name
		}
	})(function(p2) --[[ Line: 317 ]]
		-- upvalues: RoactModule (upval), ModalDialogModule (upval), p1 (copy), Button (upval), ButtonType (upval)
		return RoactModule.createFragment({
			ModalDialog = RoactModule.createElement(ModalDialogModule, {
				visible = p1.props.isReportSentOpen,
				screenSize = p1.props.screenSize,
				titleText = p2.titleText,
				contents = p1:renderContents(),
				actionButtons = RoactModule.createElement(Button, {
					buttonType = ButtonType.PrimarySystem,
					size = UDim2.new(1, 0, 1, 0),
					onActivated = function() --[[ Line: 327 ]]
						-- upvalues: p1 (upval), p2 (copy)
						return p1.onConfirm(p2)
					end,
					text = p2.dismissText,
					[RoactModule.Ref] = p1.buttonRef
				}),
				onDismiss = p1.onCancel
			}),
			FocusHandler = p1:renderFocusHandler()
		})
	end) else nil
end

function ReportSentDialog.didUpdate(p1, p2, _) --[[ Line: 340 ]]
	if not p2.isReportSentOpen and p1.props.isReportSentOpen and p1:isVoiceReport() then
		local IsPlayerUserIdMuted1 = isPlayerUserIdMuted(p1.props.targetPlayer.UserId)
		p1:setState({
			wasPlayerMutedWhenDialogOpened = IsPlayerUserIdMuted1,
			isMuteCheckBoxSelected = IsPlayerUserIdMuted1
		})
	end
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 350 ]]
	-- upvalues: ConstantsModule (copy)
	return {
		isReportSentOpen = p1.report.currentPage == ConstantsModule.Page.ReportSent,
		reportType = p1.report.reportType,
		targetPlayer = p1.report.targetPlayer,
		screenSize = p1.displayOptions.screenSize,
		reportCategory = p1.report.reportCategory
	}
end, function(Callback) --[[ Line: 359 ]]
	-- upvalues: EndReportFlowModule (copy), BlockPlayerModule (copy), ShowToastModule (copy)
	return {
		closeDialog = function() --[[ Line: 361 ]]
			-- upvalues: Callback (copy), EndReportFlowModule (upval)
			Callback(EndReportFlowModule())
		end,
		blockPlayer = function(p1, p2, p3) --[[ Line: 364 ]]
			-- upvalues: Callback (copy), BlockPlayerModule (upval)
			Callback(BlockPlayerModule(p1, p2, p3))
		end,
		showToast = function(p1, p2) --[[ Line: 367 ]]
			-- upvalues: Callback (copy), ShowToastModule (upval)
			Callback(ShowToastModule(p1, p2))
		end
	}
end)(ReportSentDialog)