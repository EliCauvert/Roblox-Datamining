local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local parent = script.Parent.Parent
local dependenciesModule = require(parent.Dependencies)
local gameIconModule = require(dependenciesModule.GameIcon)
local playerCellModule = require(dependenciesModule.PlayerCell)
local themedTextLabelModule = require(dependenciesModule.ThemedTextLabel)
local withLocalizationModule = require(dependenciesModule.withLocalization)
local playerInterfaceModule = require(dependenciesModule.playerInterface)
local navigateBackModule = require(parent.Actions.NavigateBack)
local endReportFlowModule = require(parent.Actions.EndReportFlow)
local constantsModule = require(parent.Resources.Constants)
local sendReportModule = require(parent.Thunks.SendReport)
local textEntryFieldModule = require(parent.Components.TextEntryField)
local modalDialogModule = require(parent.Components.ModalDialog)
local screenshotDialogModule = require(parent.Components.ReportAnything.ScreenshotDialog)
local screenshotFlowStepHandlerModule = require(parent.Components.ReportAnything.ScreenshotFlowStepHandler)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local sessionUtilityModule = require(parent.Utility.SessionUtility)
local screenshotHelperModule = require(parent.Utility.ScreenshotHelper)
local getFFlagReportAnythingScreenshotModule = require(parent.Flags.GetFFlagReportAnythingScreenshot)
local getFFlagReportAnythingMultistepScreenshotModule = require(parent.Flags.GetFFlagReportAnythingMultistepScreenshot)
local screenshotAnnotatedModule = require(parent.Actions.ScreenshotAnnotated)
local filterIdentifiedAvatarsModule = require(parent.Thunks.FilterIdentifiedAvatars)
local provider = UIBloxModule.Core.Style.Provider
local withStyle = UIBloxModule.Core.Style.withStyle
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local colors = UIBloxModule.App.Style.Colors
local dropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local isPlayerVerified = require(corePackagesService.Workspace.Packages.UserLib).Utils.isPlayerVerified
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceIndicatorFuncModule = require(robloxGui.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local voiceStateContextModule = require(robloxGui.Modules.VoiceChat.VoiceStateContext)
local constantsModule_1 = require(robloxGui.Modules.VoiceChat.Constants)
local reactModule = require(corePackagesService.Packages.React)

local var1 = function(p1)
	-- upvalues: reactModule (ref), voiceStateContextModule (ref), voiceIndicatorFuncModule (ref), cryoModule (ref)
	return if reactModule.useContext(voiceStateContextModule.Context).voiceEnabled then reactModule.createElement(voiceIndicatorFuncModule, cryoModule.Dictionary.join(p1, {})) else nil
end

local dsaIllegalContentReportingModule = require(corePackagesService.Workspace.Packages.DsaIllegalContentReporting)
local isShowUKOSAIllegalContentReportingLink = dsaIllegalContentReportingModule.isShowUKOSAIllegalContentReportingLink
local OSAReportLink = dsaIllegalContentReportingModule.OSAReportLink
local list = {
	"Swearing", "Inappropriate Username", "Bullying", "Scamming", "Dating",
	"Cheating/Exploiting", "Personal Question", "Offsite Links"
}
local t = {
	BackgroundDefault = { Transparency = 1, Color = colors.Flint },
	BackgroundOnHover = { Transparency = 1, Color = colors.Flint },
	BackgroundOnPress = { Transparency = 1, Color = colors.Flint }
}
local reportDialog = roactModule.PureComponent:extend("ReportDialog")
reportDialog.validateProps = tModule.strictInterface({
	isReportDialogOpen = tModule.boolean,
	reportType = tModule.optional(tModule.valueOf(constantsModule.ReportType)),
	targetPlayer = tModule.optional(playerInterfaceModule),
	placeName = tModule.string,
	screenSize = tModule.Vector2,
	screenshotAnnotationPoints = tModule.array(tModule.Vector2),
	navigateBack = tModule.optional(tModule.callback),
	canNavigateBack = tModule.optional(tModule.boolean),
	sendReport = tModule.callback,
	closeDialog = tModule.optional(tModule.callback),
	screenshotAnnotated = tModule.optional(tModule.callback),
	reportCategory = tModule.optional(tModule.string),
	currentPage = tModule.string
})

function reportDialog.init(p1)
	p1.state = { reasonText = nil, descriptionText = "" }
	
	function p1.onReasonChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ reasonText = p2 })
	end
	
	function p1.onTextChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ descriptionText = p2 })
	end
	
	function p1.onReport(p2, p3)
		-- upvalues: p1 (ref)
		p1.props.sendReport(p1.props.reportType, p1.props.targetPlayer, p1:getReason(), p1.state.descriptionText, p1.props.reportCategory, p2, p3)
	end
	
	function p1.navigateBack()
		-- upvalues: p1 (ref)
		p1.props.navigateBack(p1.state.reasonText, p1.state.descriptionText ~= "")
	end
	
	function p1.onCancel()
		-- upvalues: p1 (ref)
		p1.props.closeDialog(p1.state.reasonText, p1.state.descriptionText ~= "")
	end
	
	function p1.onScreenshotAnnotated(p2)
		-- upvalues: p1 (ref)
		p1.props.screenshotAnnotated(p1.props.reportCategory, p1.props.reportType, p2)
	end
end

function reportDialog.getReason(p1)
	-- upvalues: constantsModule (ref)
	return if p1.props.reportType == constantsModule.ReportType.Player then p1.state.reasonText elseif p1.props.reportType == constantsModule.ReportType.Place then "Inappropriate Content" else nil
end

function reportDialog.canReport(p1)
	local charCount = utf8.len(utf8.nfcnormalize(p1.state.descriptionText))
	
	return p1:getReason() ~= nil and (charCount >= 0 and charCount <= 160)
end

function reportDialog.renderUKOSALink(_)
	-- upvalues: isShowUKOSAIllegalContentReportingLink (ref), roactModule (ref), OSAReportLink (ref)
	return if isShowUKOSAIllegalContentReportingLink() then roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 99,
		Size = UDim2.new(1, 0, 0, 40),
		Position = UDim2.new(0, 0, 1, -45)
	}, { OSALink = roactModule.createElement(OSAReportLink) }) else nil
end

function reportDialog.renderPlayerInfo(p1)
	-- upvalues: constantsModule (ref), withStyle (ref), cryoModule (ref), t (ref), roactModule (ref), provider (ref), playerCellModule (ref), isPlayerVerified (ref), var1 (ref), default (ref), constantsModule_1 (ref)
	local var2 = p1.props.reportCategory == constantsModule.Category.Voice
	
	return withStyle(function(p2)
		-- upvalues: cryoModule (copy), t (copy), var2 (ref), p1 (ref), roactModule (copy), provider (copy), playerCellModule (copy), isPlayerVerified (copy), var1 (copy), default (copy), constantsModule_1 (copy)
		local var3 = cryoModule.Dictionary.join(p2, { Theme = cryoModule.Dictionary.join(p2.Theme, t) })
		local var4 = 0
		
		if var2 and p1.props.isReportDialogOpen then
			var4 += 1
		end
		return roactModule.createElement(provider, { style = var3 }, {
			roactModule.createElement(playerCellModule, {
				isOnline = true,
				isSelected = false,
				LayoutOrder = 1,
				userId = p1.props.targetPlayer.UserId,
				username = p1.props.targetPlayer.Name,
				displayName = p1.props.targetPlayer.DisplayName,
				hasVerifiedBadge = isPlayerVerified(p1.props.targetPlayer),
				key = tostring(p1.props.targetPlayer.UserId),
				memoKey = var4
			}, {
				VoiceIndicator = var2 and (p1.props.isReportDialogOpen and (roactModule.createElement(var1, {
					hideOnError = true,
					iconStyle = "SpeakerLight",
					userId = tostring(p1.props.targetPlayer.UserId),
					size = UDim2.fromOffset(36, 36),
					onClicked = function()
						-- upvalues: default (copy), p1 (copy), constantsModule_1 (copy)
						default:ToggleMutePlayer(p1.props.targetPlayer.UserId, constantsModule_1.VOICE_CONTEXT_TYPE.REPORT_MENU)
					end
				}) or nil))
			})
		})
	end)
end

function reportDialog.renderDropDownMenu(p1)
	-- upvalues: isShowUKOSAIllegalContentReportingLink (ref), roactModule (ref), withLocalizationModule (ref), list (ref), dropdownMenu (ref)
	return if p1.props.isReportDialogOpen then roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 10,
		Position = UDim2.fromOffset(0, if isShowUKOSAIllegalContentReportingLink() then 64 else 72),
		Size = UDim2.new(1, 0, 0, 48)
	}, {
		DropDown = withLocalizationModule({
			menu1 = "CoreScripts.InGameMenu.Report.AbuseSwearing",
			menu2 = "CoreScripts.InGameMenu.Report.AbuseUsername",
			menu3 = "CoreScripts.InGameMenu.Report.AbuseBullying",
			menu4 = "CoreScripts.InGameMenu.Report.AbuseScamming",
			menu5 = "CoreScripts.InGameMenu.Report.AbuseDating",
			menu6 = "CoreScripts.InGameMenu.Report.AbuseExploiting",
			menu7 = "CoreScripts.InGameMenu.Report.AbusePersonalQuestion",
			menu8 = "CoreScripts.InGameMenu.Report.AbuseOffsiteLink",
			placeHolderText = "CoreScripts.InGameMenu.Report.AbuseTypePlaceHolder"
		})(function(p2)
			-- upvalues: list (copy), p1 (ref), roactModule (copy), dropdownMenu (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in ipairs(list) do
				local var2 = p2["menu" .. tostring(i)]
				table.insert(t, { text = var2 })
				t_1[var2] = v
			end
			return roactModule.createElement(dropdownMenu, {
				showDropShadow = true,
				fixedListHeight = 171,
				placeholder = p2.placeHolderText,
				onChange = function(p3)
					-- upvalues: t_1 (ref), p1 (copy)
					p1.onReasonChanged(t_1[p3])
				end,
				height = UDim.new(0, 48),
				screenSize = p1.props.screenSize,
				cellDatas = t
			})
		end)
	}) else nil
end

function reportDialog.renderPlayerContents(p2)
	-- upvalues: withLocalizationModule (ref), isShowUKOSAIllegalContentReportingLink (ref), roactModule (ref), textEntryFieldModule (ref)
	return withLocalizationModule({
		placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder"
	})(function(p3)
		-- upvalues: isShowUKOSAIllegalContentReportingLink (copy), roactModule (copy), p2 (ref), textEntryFieldModule (copy)
		return roactModule.createFragment({
			PlayerInfo = p2:renderPlayerInfo(),
			DropDownMenu = p2:renderDropDownMenu(),
			TextField = roactModule.createElement(textEntryFieldModule, {
				maxTextLength = 160,
				autoFocusOnEnabled = false,
				enabled = p2.props.isReportDialogOpen,
				text = p2.state.descriptionText,
				textChanged = p2.onTextChanged,
				PlaceholderText = p3.placeHolderText,
				Position = UDim2.fromOffset(0, if isShowUKOSAIllegalContentReportingLink() then 118 else 132),
				Size = UDim2.new(1, 0, 1, if isShowUKOSAIllegalContentReportingLink() then -150 else -132)
			}),
			OSALinkFrame = p2:renderUKOSALink()
		})
	end)
end

function reportDialog.renderPlaceContents(p2)
	-- upvalues: withLocalizationModule (ref), isShowUKOSAIllegalContentReportingLink (ref), roactModule (ref), gameIconModule (ref), themedTextLabelModule (ref), textEntryFieldModule (ref)
	return withLocalizationModule({
		placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder",
		labelText = {
			"CoreScripts.InGameMenu.Report.ReportingGame",
			RBX_NAME = p2.props.placeName
		}
	})(function(p3)
		-- upvalues: isShowUKOSAIllegalContentReportingLink (copy), roactModule (copy), gameIconModule (copy), themedTextLabelModule (copy), textEntryFieldModule (copy), p2 (ref)
		return roactModule.createFragment({
			PlaceInfo = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, if isShowUKOSAIllegalContentReportingLink() then 12 else 24),
				Size = UDim2.new(1, 0, 0, 64)
			}, {
				GameIcon = roactModule.createElement(gameIconModule, {
					iconSize = 64,
					gameId = game.GameId,
					cornerRadius = UDim.new(0, 8)
				}),
				Label = roactModule.createElement(themedTextLabelModule, {
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
			TextField = roactModule.createElement(textEntryFieldModule, {
				maxTextLength = 160,
				autoFocusOnEnabled = false,
				enabled = p2.props.isReportDialogOpen,
				text = p2.state.descriptionText,
				textChanged = p2.onTextChanged,
				PlaceholderText = p3.placeHolderText,
				Position = UDim2.fromOffset(0, if isShowUKOSAIllegalContentReportingLink() then 90 else 112),
				Size = UDim2.new(1, 0, 1, if isShowUKOSAIllegalContentReportingLink() then -135 else -112)
			}),
			OSALinkFrame = p2:renderUKOSALink()
		})
	end)
end

function reportDialog.renderContents(p2)
	-- upvalues: constantsModule (ref)
	return if p2.props.reportType == constantsModule.ReportType.Player then p2:renderPlayerContents() elseif p2.props.reportType == constantsModule.ReportType.Place then p2:renderPlaceContents() else nil
end

local t_1 = {
	[constantsModule.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat",
	[constantsModule.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat",
	[constantsModule.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other",
	[constantsModule.Category.Experience] = "CoreScripts.InGameMenu.Report.Title.Experience"
}

function reportDialog.categoryTitle(p2)
	-- upvalues: constantsModule (ref), t_1 (ref)
	return if p2.props.reportType == constantsModule.ReportType.Place then t_1[constantsModule.Category.Experience] else t_1[p2.props.reportCategory] or "CoreScripts.InGameMenu.Report.ReportTitle"
end

function reportDialog.render(p2)
	-- upvalues: withLocalizationModule (ref), getFFlagReportAnythingScreenshotModule (ref), constantsModule (ref), getFFlagReportAnythingMultistepScreenshotModule (ref), reactModule (ref), screenshotFlowStepHandlerModule (ref), screenshotHelperModule (ref), screenshotDialogModule (ref), roactModule (ref), modalDialogModule (ref), buttonStack (ref), buttonType (ref)
	return withLocalizationModule({
		cancelText = "CoreScripts.InGameMenu.Cancel",
		reportText = "CoreScripts.InGameMenu.Report.SendReport",
		toastDefaultTitle = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport",
		toastDefaultDescription = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription",
		titleText = p2:categoryTitle()
	})(function(p3)
		-- upvalues: getFFlagReportAnythingScreenshotModule (copy), p2 (ref), constantsModule (copy), getFFlagReportAnythingMultistepScreenshotModule (copy), reactModule (copy), screenshotFlowStepHandlerModule (copy), screenshotHelperModule (copy), screenshotDialogModule (copy), roactModule (copy), modalDialogModule (copy), buttonStack (copy), buttonType (copy)
		return if not (not getFFlagReportAnythingScreenshotModule() or p2.props.currentPage ~= constantsModule.Page.ScreenshotDialog) then if getFFlagReportAnythingMultistepScreenshotModule() then reactModule.createElement(screenshotFlowStepHandlerModule, {
			titleText = "Highlight What's Wrong",
			entryPoint = "experience",
			dismissAction = p2.onCancel,
			screenshot = screenshotHelperModule:GetScreenshotContentId(),
			skipAnnotationAction = function() end,
			restartAction = function() end,
			reportAction = function() end
		}) else reactModule.createElement(screenshotDialogModule, {
			titleText = "Highlight What's Wrong",
			screenshot = screenshotHelperModule:GetScreenshotContentId(),
			backAction = if p2.props.canNavigateBack then p2.navigateBack else nil,
			dismissAction = p2.onCancel,
			reportAction = p2.onScreenshotAnnotated,
			initialAnnotationPoints = p2.props.screenshotAnnotationPoints
		}) else roactModule.createElement(modalDialogModule, {
			visible = p2.props.isReportDialogOpen,
			screenSize = p2.props.screenSize,
			titleText = p3.titleText,
			contents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Contents = p2:renderContents()
			}),
			actionButtons = roactModule.createElement(buttonStack, {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = { onActivated = p2.onCancel, text = p3.cancelText }
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							isDisabled = not p2:canReport(),
							onActivated = function()
								-- upvalues: p2 (copy), p3 (ref)
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

function reportDialog.didUpdate(p2, p3)
	-- upvalues: roactModule (ref)
	if p3.isReportDialogOpen and not p2.props.isReportDialogOpen then
		p2:setState({ descriptionText = "", reasonText = roactModule.None })
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p2, _)
	-- upvalues: constantsModule (ref)
	return {
		reportCategory = p2.report.reportCategory,
		isReportDialogOpen = p2.report.currentPage == constantsModule.Page.ReportForm,
		currentPage = p2.report.currentPage,
		reportType = p2.report.reportType,
		targetPlayer = p2.report.targetPlayer,
		canNavigateBack = #p2.report.history > 1,
		placeName = p2.placeInfo.name,
		screenSize = p2.displayOptions.screenSize,
		screenshotAnnotationPoints = p2.report.screenshotAnnotationPoints
	}
end, function(p2)
	-- upvalues: navigateBackModule (ref), sendAnalyticsModule (ref), constantsModule (ref), endReportFlowModule (ref), sessionUtilityModule (ref), filterIdentifiedAvatarsModule (ref), screenshotAnnotatedModule (ref), sendReportModule (ref)
	return {
		navigateBack = function(p3, p4)
			-- upvalues: p2 (ref), navigateBackModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p2(navigateBackModule())
			sendAnalyticsModule(constantsModule.Page.ReportForm, constantsModule.Analytics.ReportFlowBack, {
				source = constantsModule.Page.ReportForm,
				reason = p3,
				descriptionTextChanged = p4
			})
		end,
		closeDialog = function(p3, p4)
			-- upvalues: p2 (ref), endReportFlowModule (copy), sendAnalyticsModule (copy), constantsModule (copy), sessionUtilityModule (copy)
			p2(endReportFlowModule())
			sendAnalyticsModule(constantsModule.Page.ReportForm, constantsModule.Analytics.ReportFlowAbandoned, {
				source = constantsModule.Page.ReportForm,
				reason = p3,
				descriptionTextChanged = p4
			})
			sessionUtilityModule.endAbuseReportSession()
		end,
		screenshotAnnotated = function(p3, p4, p5)
			-- upvalues: p2 (ref), filterIdentifiedAvatarsModule (copy), screenshotAnnotatedModule (copy)
			p2(filterIdentifiedAvatarsModule(p5))
			p2(screenshotAnnotatedModule(p3, p4, p5))
		end,
		sendReport = function(p3, p4, p5, p6, p7, p8, p9)
			-- upvalues: p2 (ref), sendReportModule (copy)
			p2(sendReportModule(p3, p4, p5, p6, p7, p8, p9))
		end
	}
end)(reportDialog)