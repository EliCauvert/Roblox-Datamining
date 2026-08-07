local contextActionService = game:GetService("ContextActionService")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local withStyle = UIBloxModule.Core.Style.withStyle
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local parent = script.Parent.Parent
local dependenciesModule = require(parent.Dependencies)
local focusHandlerModule = require(dependenciesModule.FocusHandler)
local playerInterfaceModule = require(dependenciesModule.playerInterface)
local dividerModule = require(dependenciesModule.Divider)
local themedTextLabelModule = require(dependenciesModule.ThemedTextLabel)
local withLocalizationModule = require(dependenciesModule.withLocalization)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local blockPlayerModule = require(parent.Thunks.BlockPlayer)
local blockPlayerItemModule = require(parent.Components.BlockPlayerItem)
local endReportFlowModule = require(parent.Actions.EndReportFlow)
local _ = require(parent.Actions.OpenBlockPlayerDialog)
local showToastModule = require(parent.Actions.ShowToast)
local constantsModule = require(parent.Resources.Constants)
local assetsModule = require(parent.Resources.Assets)
local modalDialogModule = require(parent.Components.ModalDialog)
local constantsModule_1 = require(robloxGui.Modules.VoiceChat.Constants)
local reportSentDialog = roactModule.PureComponent:extend("ReportSentDialog")
reportSentDialog.validateProps = tModule.strictInterface({
	isReportSentOpen = tModule.boolean,
	screenSize = tModule.Vector2,
	inputType = tModule.optional(tModule.string),
	reportType = tModule.optional(tModule.valueOf(constantsModule.ReportType)),
	targetPlayer = tModule.optional(playerInterfaceModule),
	blockPlayer = tModule.callback,
	showToast = tModule.callback,
	closeDialog = tModule.callback,
	reportCategory = tModule.optional(tModule.string)
})

function isPlayerUserIdMuted(p0) --[[ line: 55 ]]
	-- upvalues: default (ref)
	local isMutedLocally = false
	
	if default.participants then
		local var23 = default.participants[tostring(p0)]
		
		if var23 then
			isMutedLocally = var23.isMutedLocally
		end
	end
	return isMutedLocally
end

function reportSentDialog.init(p1) --[[ line: 66 ]]
	-- upvalues: roactModule (ref), default (ref), constantsModule_1 (ref)
	p1:clearState()
	p1.buttonRef = roactModule.createRef()
	
	function p1.onBlockCheckBoxActivated(p2) --[[ line: 70 ]]
		-- upvalues: p1 (ref)
		p1:setState({
			isBlockCheckBoxSelected = p2,
			isMuteCheckBoxSelected = if p2 and p1:isVoiceReport() then true else p1.state.isMuteCheckBoxSelected
		})
	end
	
	function p1.onMuteCheckBoxActivated(p3) --[[ line: 79 ]]
		-- upvalues: p1 (ref)
		p1:setState({ isMuteCheckBoxSelected = p3 })
	end
	
	function p1.hasMuteChanged() --[[ line: 85 ]]
		-- upvalues: p1 (ref)
		return p1.state.isMuteCheckBoxSelected ~= p1.state.wasPlayerMutedWhenDialogOpened
	end
	
	function p1.getToastMessage(p4) --[[ line: 89 ]]
		-- upvalues: p1 (ref)
		local t = {
			title = p4.toastDefaultTitle,
			description = p4.toastDefaultDescription
		}
		
		if p1.state.isMuteCheckBoxSelected and p1.state.isBlockCheckBoxSelected then
			t.title = p4.toastMutedAndBlockedTitle
			t.description = p4.toastMutedAndBlockedDescription
			
			return t
		elseif p1.state.isMuteCheckBoxSelected then
			t.title = p4.toastMutedTitle
			t.description = p4.toastMutedDescription
			
			return t
		elseif p1.state.isBlockCheckBoxSelected then
			t.title = p4.toastBlockedTitle
			t.description = p4.toastBlockedDescription
		end
		return t
	end
	
	function p1.onConfirm(p5) --[[ line: 110 ]]
		-- upvalues: p1 (ref), default (copy), constantsModule_1 (copy)
		if p1:isReportingPlayer() then
			local toastMessage = p1.getToastMessage(p5)
			
			if p1:hasMuteChanged() then
				default:ToggleMutePlayer(p1.props.targetPlayer.UserId, constantsModule_1.VOICE_CONTEXT_TYPE.REPORT_MENU)
			end
			if p1.state.isBlockCheckBoxSelected then
				p1.props.blockPlayer(p1.props.targetPlayer, toastMessage.title, toastMessage.description)
			else
				p1.props.showToast(toastMessage.title, toastMessage.description)
			end
		end
		p1.props.closeDialog()
		p1:clearState()
	end
	
	function p1.onCancel() --[[ line: 131 ]]
		-- upvalues: p1 (ref)
		p1.props.closeDialog()
		p1:clearState()
	end
end

function reportSentDialog.clearState(p6) --[[ line: 137 ]]
	p6:setState({
		wasPlayerMutedWhenDialogOpened = false,
		isMuteCheckBoxSelected = false,
		isBlockCheckBoxSelected = false
	})
end

function reportSentDialog.isVoiceReport(p7) --[[ line: 145 ]]
	-- upvalues: constantsModule (ref)
	return p7:isReportingPlayer() and p7.props.reportCategory == constantsModule.Category.Voice
end

function reportSentDialog.doesRequireConfirmation(p8) --[[ line: 149 ]]
	return p8.state.isBlockCheckBoxSelected or p8:hasMuteChanged()
end

function reportSentDialog.isReportingPlayer(p9) --[[ line: 154 ]]
	-- upvalues: constantsModule (ref)
	return p9.props.reportType == constantsModule.ReportType.Player and p9.props.targetPlayer ~= nil
end

function reportSentDialog.renderFocusHandler(p10) --[[ line: 158 ]]
	-- upvalues: roactModule (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref), contextActionService (ref)
	return roactModule.createElement(focusHandlerModule, {
		isFocused = p10.props.inputType == constantsModule.InputType.Gamepad and p10.props.isReportSentOpen,
		didFocus = function() --[[ line: 161 ]]
			-- upvalues: guiService (copy), p10 (ref), contextActionService (copy)
			guiService:RemoveSelectionGroup("ReportSentDialogGroup")
			guiService:AddSelectionParent("ReportSentDialogGroup", p10.buttonRef:getValue())
			guiService.SelectedCoreObject = p10.buttonRef:getValue()
			contextActionService:BindCoreAction("ReporSentDialogSinkAction", function(_, _) --[[ line: 166 ]]
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonX)
		end,
		didBlur = function() --[[ line: 170 ]]
			-- upvalues: contextActionService (copy), guiService (copy)
			contextActionService:UnbindCoreAction("ReporSentDialogSinkAction")
			guiService:RemoveSelectionGroup("ReportSentDialogGroup")
		end
	})
end

function reportSentDialog.renderBlockFrame(p11) --[[ line: 177 ]]
	-- upvalues: withLocalizationModule (ref), roactModule (ref), dividerModule (ref), blockPlayerItemModule (ref), assetsModule (ref)
	return if p11:isReportingPlayer() then withLocalizationModule({
		mutePlayerText = "CoreScripts.InGameMenu.Report.Mute",
		mutePlayerDescription = "CoreScripts.InGameMenu.Report.MuteDescription",
		blockPlayerText = "CoreScripts.InGameMenu.Report.Block",
		blockPlayerDescription = "CoreScripts.InGameMenu.Report.BlockDescription"
	})(function(p12) --[[ line: 186 ]]
		-- upvalues: roactModule (copy), dividerModule (copy), p11 (ref), blockPlayerItemModule (copy), assetsModule (copy)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Divider = roactModule.createElement(dividerModule, { LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 1) }),
			MutePlayerItem = if p11:isVoiceReport() then roactModule.createElement(blockPlayerItemModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 0, 72),
				text = p12.mutePlayerText,
				description = p12.mutePlayerDescription,
				icon = assetsModule.Images.MuteIcon.Image,
				iconSize = assetsModule.Images.MuteIcon.Size,
				isDisabled = p11.state.isBlockCheckBoxSelected,
				isCheckBoxSelected = p11.state.isMuteCheckBoxSelected,
				onCheckBoxActivated = p11.onMuteCheckBoxActivated
			}) else nil,
			BlockPlayerItem = roactModule.createElement(blockPlayerItemModule, {
				layoutOrder = 3,
				size = UDim2.new(1, 0, 0, 72),
				text = p12.blockPlayerText,
				description = p12.blockPlayerDescription,
				icon = assetsModule.Images.BlockIcon.Image,
				iconSize = assetsModule.Images.BlockIcon.Size,
				isCheckBoxSelected = p11.state.isBlockCheckBoxSelected,
				onCheckBoxActivated = p11.onBlockCheckBoxActivated
			})
		})
	end) else nil
end

function reportSentDialog.renderContents(p13) --[[ line: 228 ]]
	-- upvalues: withStyle (ref), withLocalizationModule (ref), roactModule (ref), themedTextLabelModule (ref)
	return withStyle(function(_) --[[ line: 229 ]]
		-- upvalues: withLocalizationModule (copy), p13 (ref), roactModule (copy), themedTextLabelModule (copy)
		return withLocalizationModule({
			bodyText = "CoreScripts.InGameMenu.Report.ThanksForReportDescription",
			otherStepsText = {
				"CoreScripts.InGameMenu.Report.OtherStepsTitle",
				RBX_NAME = p13.props.targetPlayer.Name
			}
		})(function(p14) --[[ line: 236 ]]
			-- upvalues: roactModule (copy), themedTextLabelModule (copy), p13 (copy)
			return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				BodyFrame = roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					Layout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 12)
					}),
					Padding = roactModule.createElement("UIPadding", {
						PaddingTop = UDim.new(0, 12),
						PaddingBottom = UDim.new(0, 12),
						PaddingLeft = UDim.new(0, 24),
						PaddingRight = UDim.new(0, 24)
					}),
					BodyText = roactModule.createElement(themedTextLabelModule, {
						LayoutOrder = 1,
						themeKey = "TextEmphasis",
						TextWrapped = true,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0),
						Text = p14.bodyText,
						TextXAlignment = Enum.TextXAlignment.Left
					}),
					OtherStepsText = roactModule.createElement(themedTextLabelModule, {
						LayoutOrder = 2,
						fontKey = "Footer",
						themeKey = "TextDefault",
						TextWrapped = true,
						AutomaticSize = Enum.AutomaticSize.Y,
						Position = UDim2.new(0, 0, 0, 12),
						Size = UDim2.new(1, 0, 0, 0),
						Text = p14.otherStepsText,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				BlockFrame = p13:renderBlockFrame()
			})
		end)
	end)
end

function reportSentDialog.render(p15) --[[ line: 291 ]]
	-- upvalues: withLocalizationModule (ref), roactModule (ref), modalDialogModule (ref), button (ref), buttonType (ref)
	return if p15:isReportingPlayer() then withLocalizationModule({
		titleText = "CoreScripts.InGameMenu.Report.ThanksForReport",
		toastDefaultTitle = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport",
		toastDefaultDescription = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription",
		toastMutedTitle = "CoreScripts.InGameMenu.Report.Confirmation.Muted",
		toastMutedAndBlockedTitle = "CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlocked",
		toastBlockedTitle = "CoreScripts.InGameMenu.Report.Confirmation.Blocked",
		dismissText = if p15:doesRequireConfirmation() then "CoreScripts.InGameMenu.Report.Confirm" else "CoreScripts.InGameMenu.Report.Done",
		toastMutedDescription = {
			"CoreScripts.InGameMenu.Report.Confirmation.MutedDescriptionWithUser",
			RBX_NAME = p15.props.targetPlayer.Name
		},
		toastMutedAndBlockedDescription = {
			"CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlockedDescriptionWithUser",
			RBX_NAME = p15.props.targetPlayer.Name
		},
		toastBlockedDescription = {
			"CoreScripts.InGameMenu.Report.Confirmation.MutedAndBlockedDescriptionWithUser",
			RBX_NAME = p15.props.targetPlayer.Name
		}
	})(function(p16) --[[ line: 317 ]]
		-- upvalues: roactModule (copy), modalDialogModule (copy), p15 (ref), button (copy), buttonType (copy)
		return roactModule.createFragment({
			ModalDialog = roactModule.createElement(modalDialogModule, {
				visible = p15.props.isReportSentOpen,
				screenSize = p15.props.screenSize,
				titleText = p16.titleText,
				contents = p15:renderContents(),
				actionButtons = roactModule.createElement(button, {
					buttonType = buttonType.PrimarySystem,
					size = UDim2.new(1, 0, 1, 0),
					onActivated = function() --[[ line: 327 ]]
						-- upvalues: p15 (copy), p16 (ref)
						return p15.onConfirm(p16)
					end,
					text = p16.dismissText,
					[roactModule.Ref] = p15.buttonRef
				}),
				onDismiss = p15.onCancel
			}),
			FocusHandler = p15:renderFocusHandler()
		})
	end) else nil
end

function reportSentDialog.didUpdate(p17, p18, _) --[[ line: 340 ]]
	if not p18.isReportSentOpen and p17.props.isReportSentOpen and p17:isVoiceReport() then
		local var26 = isPlayerUserIdMuted(p17.props.targetPlayer.UserId)
		p17:setState({
			wasPlayerMutedWhenDialogOpened = var26,
			isMuteCheckBoxSelected = var26
		})
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p19, _) --[[ line: 350 ]]
	-- upvalues: constantsModule (ref)
	return {
		isReportSentOpen = p19.report.currentPage == constantsModule.Page.ReportSent,
		reportType = p19.report.reportType,
		targetPlayer = p19.report.targetPlayer,
		screenSize = p19.displayOptions.screenSize,
		reportCategory = p19.report.reportCategory
	}
end, function(p20) --[[ line: 359 ]]
	-- upvalues: endReportFlowModule (ref), blockPlayerModule (ref), showToastModule (ref)
	return {
		closeDialog = function() --[[ line: 361 ]]
			-- upvalues: p20 (ref), endReportFlowModule (copy)
			p20(endReportFlowModule())
		end,
		blockPlayer = function(p21, p22, p23) --[[ line: 364 ]]
			-- upvalues: p20 (ref), blockPlayerModule (copy)
			p20(blockPlayerModule(p21, p22, p23))
		end,
		showToast = function(p24, p25) --[[ line: 367 ]]
			-- upvalues: p20 (ref), showToastModule (copy)
			p20(showToastModule(p24, p25))
		end
	}
end)(reportSentDialog)