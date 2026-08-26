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

function isPlayerUserIdMuted(p1)
	-- upvalues: default (ref)
	local isMutedLocally = false
	
	if default.participants then
		local var1 = default.participants[tostring(p1)]
		
		if var1 then
			isMutedLocally = var1.isMutedLocally
		end
	end
	return isMutedLocally
end

function reportSentDialog.init(p1)
	-- upvalues: roactModule (ref), default (ref), constantsModule_1 (ref)
	p1:clearState()
	p1.buttonRef = roactModule.createRef()
	
	function p1.onBlockCheckBoxActivated(p2)
		-- upvalues: p1 (ref)
		p1:setState({
			isBlockCheckBoxSelected = p2,
			isMuteCheckBoxSelected = if p2 and p1:isVoiceReport() then true else p1.state.isMuteCheckBoxSelected
		})
	end
	
	function p1.onMuteCheckBoxActivated(p2)
		-- upvalues: p1 (ref)
		p1:setState({ isMuteCheckBoxSelected = p2 })
	end
	
	function p1.hasMuteChanged()
		-- upvalues: p1 (ref)
		return p1.state.isMuteCheckBoxSelected ~= p1.state.wasPlayerMutedWhenDialogOpened
	end
	
	function p1.getToastMessage(p2)
		-- upvalues: p1 (ref)
		local t = {
			title = p2.toastDefaultTitle,
			description = p2.toastDefaultDescription
		}
		
		if p1.state.isMuteCheckBoxSelected and p1.state.isBlockCheckBoxSelected then
			t.title = p2.toastMutedAndBlockedTitle
			t.description = p2.toastMutedAndBlockedDescription
			
			return t
		elseif p1.state.isMuteCheckBoxSelected then
			t.title = p2.toastMutedTitle
			t.description = p2.toastMutedDescription
			
			return t
		elseif p1.state.isBlockCheckBoxSelected then
			t.title = p2.toastBlockedTitle
			t.description = p2.toastBlockedDescription
		end
		return t
	end
	
	function p1.onConfirm(p2)
		-- upvalues: p1 (ref), default (copy), constantsModule_1 (copy)
		if p1:isReportingPlayer() then
			local toastMessage = p1.getToastMessage(p2)
			
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
	
	function p1.onCancel()
		-- upvalues: p1 (ref)
		p1.props.closeDialog()
		p1:clearState()
	end
end

function reportSentDialog.clearState(p1)
	p1:setState({
		wasPlayerMutedWhenDialogOpened = false,
		isMuteCheckBoxSelected = false,
		isBlockCheckBoxSelected = false
	})
end

function reportSentDialog.isVoiceReport(p1)
	-- upvalues: constantsModule (ref)
	return p1:isReportingPlayer() and p1.props.reportCategory == constantsModule.Category.Voice
end

function reportSentDialog.doesRequireConfirmation(p1)
	return p1.state.isBlockCheckBoxSelected or p1:hasMuteChanged()
end

function reportSentDialog.isReportingPlayer(p1)
	-- upvalues: constantsModule (ref)
	return p1.props.reportType == constantsModule.ReportType.Player and p1.props.targetPlayer ~= nil
end

function reportSentDialog.renderFocusHandler(p1)
	-- upvalues: roactModule (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref), contextActionService (ref)
	return roactModule.createElement(focusHandlerModule, {
		isFocused = p1.props.inputType == constantsModule.InputType.Gamepad and p1.props.isReportSentOpen,
		didFocus = function()
			-- upvalues: guiService (copy), p1 (ref), contextActionService (copy)
			guiService:RemoveSelectionGroup("ReportSentDialogGroup")
			guiService:AddSelectionParent("ReportSentDialogGroup", p1.buttonRef:getValue())
			guiService.SelectedCoreObject = p1.buttonRef:getValue()
			contextActionService:BindCoreAction("ReporSentDialogSinkAction", function(_, _)
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonX)
		end,
		didBlur = function()
			-- upvalues: contextActionService (copy), guiService (copy)
			contextActionService:UnbindCoreAction("ReporSentDialogSinkAction")
			guiService:RemoveSelectionGroup("ReportSentDialogGroup")
		end
	})
end

function reportSentDialog.renderBlockFrame(p1)
	-- upvalues: withLocalizationModule (ref), roactModule (ref), dividerModule (ref), blockPlayerItemModule (ref), assetsModule (ref)
	return if p1:isReportingPlayer() then withLocalizationModule({
		mutePlayerText = "CoreScripts.InGameMenu.Report.Mute",
		mutePlayerDescription = "CoreScripts.InGameMenu.Report.MuteDescription",
		blockPlayerText = "CoreScripts.InGameMenu.Report.Block",
		blockPlayerDescription = "CoreScripts.InGameMenu.Report.BlockDescription"
	})(function(p2)
		-- upvalues: roactModule (copy), dividerModule (copy), p1 (ref), blockPlayerItemModule (copy), assetsModule (copy)
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
			MutePlayerItem = if p1:isVoiceReport() then roactModule.createElement(blockPlayerItemModule, {
				layoutOrder = 2,
				size = UDim2.new(1, 0, 0, 72),
				text = p2.mutePlayerText,
				description = p2.mutePlayerDescription,
				icon = assetsModule.Images.MuteIcon.Image,
				iconSize = assetsModule.Images.MuteIcon.Size,
				isDisabled = p1.state.isBlockCheckBoxSelected,
				isCheckBoxSelected = p1.state.isMuteCheckBoxSelected,
				onCheckBoxActivated = p1.onMuteCheckBoxActivated
			}) else nil,
			BlockPlayerItem = roactModule.createElement(blockPlayerItemModule, {
				layoutOrder = 3,
				size = UDim2.new(1, 0, 0, 72),
				text = p2.blockPlayerText,
				description = p2.blockPlayerDescription,
				icon = assetsModule.Images.BlockIcon.Image,
				iconSize = assetsModule.Images.BlockIcon.Size,
				isCheckBoxSelected = p1.state.isBlockCheckBoxSelected,
				onCheckBoxActivated = p1.onBlockCheckBoxActivated
			})
		})
	end) else nil
end

function reportSentDialog.renderContents(p1)
	-- upvalues: withStyle (ref), withLocalizationModule (ref), roactModule (ref), themedTextLabelModule (ref)
	return withStyle(function(_)
		-- upvalues: withLocalizationModule (copy), p1 (ref), roactModule (copy), themedTextLabelModule (copy)
		return withLocalizationModule({
			bodyText = "CoreScripts.InGameMenu.Report.ThanksForReportDescription",
			otherStepsText = {
				"CoreScripts.InGameMenu.Report.OtherStepsTitle",
				RBX_NAME = p1.props.targetPlayer.Name
			}
		})(function(p2)
			-- upvalues: roactModule (copy), themedTextLabelModule (copy), p1 (copy)
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
						Text = p2.bodyText,
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
						Text = p2.otherStepsText,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				BlockFrame = p1:renderBlockFrame()
			})
		end)
	end)
end

function reportSentDialog.render(p1)
	-- upvalues: withLocalizationModule (ref), roactModule (ref), modalDialogModule (ref), button (ref), buttonType (ref)
	return if p1:isReportingPlayer() then withLocalizationModule({
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
	})(function(p2)
		-- upvalues: roactModule (copy), modalDialogModule (copy), p1 (ref), button (copy), buttonType (copy)
		return roactModule.createFragment({
			ModalDialog = roactModule.createElement(modalDialogModule, {
				visible = p1.props.isReportSentOpen,
				screenSize = p1.props.screenSize,
				titleText = p2.titleText,
				contents = p1:renderContents(),
				actionButtons = roactModule.createElement(button, {
					buttonType = buttonType.PrimarySystem,
					size = UDim2.new(1, 0, 1, 0),
					onActivated = function()
						-- upvalues: p1 (copy), p2 (ref)
						return p1.onConfirm(p2)
					end,
					text = p2.dismissText,
					[roactModule.Ref] = p1.buttonRef
				}),
				onDismiss = p1.onCancel
			}),
			FocusHandler = p1:renderFocusHandler()
		})
	end) else nil
end

function reportSentDialog.didUpdate(p1, p2, _)
	if not p2.isReportSentOpen and p1.props.isReportSentOpen and p1:isVoiceReport() then
		local var1 = isPlayerUserIdMuted(p1.props.targetPlayer.UserId)
		p1:setState({
			wasPlayerMutedWhenDialogOpened = var1,
			isMuteCheckBoxSelected = var1
		})
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	-- upvalues: constantsModule (ref)
	return {
		isReportSentOpen = p1.report.currentPage == constantsModule.Page.ReportSent,
		reportType = p1.report.reportType,
		targetPlayer = p1.report.targetPlayer,
		screenSize = p1.displayOptions.screenSize,
		reportCategory = p1.report.reportCategory
	}
end, function(p1)
	-- upvalues: endReportFlowModule (ref), blockPlayerModule (ref), showToastModule (ref)
	return {
		closeDialog = function()
			-- upvalues: p1 (ref), endReportFlowModule (copy)
			p1(endReportFlowModule())
		end,
		blockPlayer = function(p2, p3, p4)
			-- upvalues: p1 (ref), blockPlayerModule (copy)
			p1(blockPlayerModule(p2, p3, p4))
		end,
		showToast = function(p2, p3)
			-- upvalues: p1 (ref), showToastModule (copy)
			p1(showToastModule(p2, p3))
		end
	}
end)(reportSentDialog)