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

local var32 = function(p0)
	-- upvalues: reactModule (ref), voiceStateContextModule (ref), voiceIndicatorFuncModule (ref), cryoModule (ref)
	return if reactModule.useContext(voiceStateContextModule.Context).voiceEnabled then reactModule.createElement(voiceIndicatorFuncModule, cryoModule.Dictionary.join(p0, {})) else nil
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
	
	function p1.onTextChanged(p3)
		-- upvalues: p1 (ref)
		p1:setState({ descriptionText = p3 })
	end
	
	function p1.onReport(p4, p5)
		-- upvalues: p1 (ref)
		p1.props.sendReport(p1.props.reportType, p1.props.targetPlayer, p1:getReason(), p1.state.descriptionText, p1.props.reportCategory, p4, p5)
	end
	
	function p1.navigateBack()
		-- upvalues: p1 (ref)
		p1.props.navigateBack(p1.state.reasonText, p1.state.descriptionText ~= "")
	end
	
	function p1.onCancel()
		-- upvalues: p1 (ref)
		p1.props.closeDialog(p1.state.reasonText, p1.state.descriptionText ~= "")
	end
	
	function p1.onScreenshotAnnotated(p6)
		-- upvalues: p1 (ref)
		p1.props.screenshotAnnotated(p1.props.reportCategory, p1.props.reportType, p6)
	end
end

function reportDialog.getReason(p7)
	-- upvalues: constantsModule (ref)
	return if p7.props.reportType == constantsModule.ReportType.Player then p7.state.reasonText elseif p7.props.reportType == constantsModule.ReportType.Place then "Inappropriate Content" else nil
end

function reportDialog.canReport(p8)
	local charCount = utf8.len(utf8.nfcnormalize(p8.state.descriptionText))
	
	return p8:getReason() ~= nil and (charCount >= 0 and charCount <= 160)
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

function reportDialog.renderPlayerInfo(p9)
	-- upvalues: constantsModule (ref), withStyle (ref), cryoModule (ref), t (ref), roactModule (ref), provider (ref), playerCellModule (ref), isPlayerVerified (ref), var32 (ref), default (ref), constantsModule_1 (ref)
	local var39 = p9.props.reportCategory == constantsModule.Category.Voice
	
	return withStyle(function(p10)
		-- upvalues: cryoModule (copy), t (copy), var39 (ref), p9 (ref), roactModule (copy), provider (copy), playerCellModule (copy), isPlayerVerified (copy), var32 (copy), default (copy), constantsModule_1 (copy)
		local var40 = cryoModule.Dictionary.join(p10, { Theme = cryoModule.Dictionary.join(p10.Theme, t) })
		local var41 = 0
		
		if var39 and p9.props.isReportDialogOpen then
			var41 += 1
		end
		return roactModule.createElement(provider, { style = var40 }, {
			roactModule.createElement(playerCellModule, {
				isOnline = true,
				isSelected = false,
				LayoutOrder = 1,
				userId = p9.props.targetPlayer.UserId,
				username = p9.props.targetPlayer.Name,
				displayName = p9.props.targetPlayer.DisplayName,
				hasVerifiedBadge = isPlayerVerified(p9.props.targetPlayer),
				key = tostring(p9.props.targetPlayer.UserId),
				memoKey = var41
			}, {
				VoiceIndicator = var39 and (p9.props.isReportDialogOpen and (roactModule.createElement(var32, {
					hideOnError = true,
					iconStyle = "SpeakerLight",
					userId = tostring(p9.props.targetPlayer.UserId),
					size = UDim2.fromOffset(36, 36),
					onClicked = function()
						-- upvalues: default (copy), p9 (copy), constantsModule_1 (copy)
						default:ToggleMutePlayer(p9.props.targetPlayer.UserId, constantsModule_1.VOICE_CONTEXT_TYPE.REPORT_MENU)
					end
				}) or nil))
			})
		})
	end)
end

function reportDialog.renderDropDownMenu(p11)
	-- upvalues: isShowUKOSAIllegalContentReportingLink (ref), roactModule (ref), withLocalizationModule (ref), list (ref), dropdownMenu (ref)
	return if p11.props.isReportDialogOpen then roactModule.createElement("Frame", {
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
		})(function(p12)
			-- upvalues: list (copy), p11 (ref), roactModule (copy), dropdownMenu (copy)
			local t = {}
			local t_1 = {}
			
			for i, v in ipairs(list) do
				local var44 = p12["menu" .. tostring(i)]
				table.insert(t, { text = var44 })
				t_1[var44] = v
			end
			return roactModule.createElement(dropdownMenu, {
				showDropShadow = true,
				fixedListHeight = 171,
				placeholder = p12.placeHolderText,
				onChange = function(p13)
					-- upvalues: t_1 (ref), p11 (copy)
					p11.onReasonChanged(t_1[p13])
				end,
				height = UDim.new(0, 48),
				screenSize = p11.props.screenSize,
				cellDatas = t
			})
		end)
	}) else nil
end

function reportDialog.renderPlayerContents(p14)
	-- upvalues: withLocalizationModule (ref), isShowUKOSAIllegalContentReportingLink (ref), roactModule (ref), textEntryFieldModule (ref)
	return withLocalizationModule({
		placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder"
	})(function(p15)
		-- upvalues: isShowUKOSAIllegalContentReportingLink (copy), roactModule (copy), p14 (ref), textEntryFieldModule (copy)
		return roactModule.createFragment({
			PlayerInfo = p14:renderPlayerInfo(),
			DropDownMenu = p14:renderDropDownMenu(),
			TextField = roactModule.createElement(textEntryFieldModule, {
				maxTextLength = 160,
				autoFocusOnEnabled = false,
				enabled = p14.props.isReportDialogOpen,
				text = p14.state.descriptionText,
				textChanged = p14.onTextChanged,
				PlaceholderText = p15.placeHolderText,
				Position = UDim2.fromOffset(0, if isShowUKOSAIllegalContentReportingLink() then 118 else 132),
				Size = UDim2.new(1, 0, 1, if isShowUKOSAIllegalContentReportingLink() then -150 else -132)
			}),
			OSALinkFrame = p14:renderUKOSALink()
		})
	end)
end

function reportDialog.renderPlaceContents(p16)
	-- upvalues: withLocalizationModule (ref), isShowUKOSAIllegalContentReportingLink (ref), roactModule (ref), gameIconModule (ref), themedTextLabelModule (ref), textEntryFieldModule (ref)
	return withLocalizationModule({
		placeHolderText = "CoreScripts.InGameMenu.Report.AbuseDetailsPlaceHolder",
		labelText = {
			"CoreScripts.InGameMenu.Report.ReportingGame",
			RBX_NAME = p16.props.placeName
		}
	})(function(p17)
		-- upvalues: isShowUKOSAIllegalContentReportingLink (copy), roactModule (copy), gameIconModule (copy), themedTextLabelModule (copy), textEntryFieldModule (copy), p16 (ref)
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
					Text = p17.labelText,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			TextField = roactModule.createElement(textEntryFieldModule, {
				maxTextLength = 160,
				autoFocusOnEnabled = false,
				enabled = p16.props.isReportDialogOpen,
				text = p16.state.descriptionText,
				textChanged = p16.onTextChanged,
				PlaceholderText = p17.placeHolderText,
				Position = UDim2.fromOffset(0, if isShowUKOSAIllegalContentReportingLink() then 90 else 112),
				Size = UDim2.new(1, 0, 1, if isShowUKOSAIllegalContentReportingLink() then -135 else -112)
			}),
			OSALinkFrame = p16:renderUKOSALink()
		})
	end)
end

function reportDialog.renderContents(p18)
	-- upvalues: constantsModule (ref)
	return if p18.props.reportType == constantsModule.ReportType.Player then p18:renderPlayerContents() elseif p18.props.reportType == constantsModule.ReportType.Place then p18:renderPlaceContents() else nil
end

local t_1 = {
	[constantsModule.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat",
	[constantsModule.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat",
	[constantsModule.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other",
	[constantsModule.Category.Experience] = "CoreScripts.InGameMenu.Report.Title.Experience"
}

function reportDialog.categoryTitle(p19)
	-- upvalues: constantsModule (ref), t_1 (ref)
	return if p19.props.reportType == constantsModule.ReportType.Place then t_1[constantsModule.Category.Experience] else t_1[p19.props.reportCategory] or "CoreScripts.InGameMenu.Report.ReportTitle"
end

function reportDialog.render(p20)
	-- upvalues: withLocalizationModule (ref), getFFlagReportAnythingScreenshotModule (ref), constantsModule (ref), getFFlagReportAnythingMultistepScreenshotModule (ref), reactModule (ref), screenshotFlowStepHandlerModule (ref), screenshotHelperModule (ref), screenshotDialogModule (ref), roactModule (ref), modalDialogModule (ref), buttonStack (ref), buttonType (ref)
	return withLocalizationModule({
		cancelText = "CoreScripts.InGameMenu.Cancel",
		reportText = "CoreScripts.InGameMenu.Report.SendReport",
		toastDefaultTitle = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReport",
		toastDefaultDescription = "CoreScripts.InGameMenu.Report.Confirmation.ThanksForReportDescription",
		titleText = p20:categoryTitle()
	})(function(p21)
		-- upvalues: getFFlagReportAnythingScreenshotModule (copy), p20 (ref), constantsModule (copy), getFFlagReportAnythingMultistepScreenshotModule (copy), reactModule (copy), screenshotFlowStepHandlerModule (copy), screenshotHelperModule (copy), screenshotDialogModule (copy), roactModule (copy), modalDialogModule (copy), buttonStack (copy), buttonType (copy)
		return if not (not getFFlagReportAnythingScreenshotModule() or p20.props.currentPage ~= constantsModule.Page.ScreenshotDialog) then if getFFlagReportAnythingMultistepScreenshotModule() then reactModule.createElement(screenshotFlowStepHandlerModule, {
			titleText = "Highlight What's Wrong",
			entryPoint = "experience",
			dismissAction = p20.onCancel,
			screenshot = screenshotHelperModule:GetScreenshotContentId(),
			skipAnnotationAction = function() end,
			restartAction = function() end,
			reportAction = function() end
		}) else reactModule.createElement(screenshotDialogModule, {
			titleText = "Highlight What's Wrong",
			screenshot = screenshotHelperModule:GetScreenshotContentId(),
			backAction = if p20.props.canNavigateBack then p20.navigateBack else nil,
			dismissAction = p20.onCancel,
			reportAction = p20.onScreenshotAnnotated,
			initialAnnotationPoints = p20.props.screenshotAnnotationPoints
		}) else roactModule.createElement(modalDialogModule, {
			visible = p20.props.isReportDialogOpen,
			screenSize = p20.props.screenSize,
			titleText = p21.titleText,
			contents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Contents = p20:renderContents()
			}),
			actionButtons = roactModule.createElement(buttonStack, {
				buttonHeight = 48,
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = { onActivated = p20.onCancel, text = p21.cancelText }
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							isDisabled = not p20:canReport(),
							onActivated = function()
								-- upvalues: p20 (copy), p21 (ref)
								return p20.onReport(p21.toastDefaultTitle, p21.toastDefaultDescription)
							end,
							text = p21.reportText
						}
					}
				}
			}),
			onDismiss = p20.onCancel,
			onBackButtonActivated = if p20.props.canNavigateBack then p20.navigateBack else nil
		})
	end)
end

function reportDialog.didUpdate(p22, p23)
	-- upvalues: roactModule (ref)
	if p23.isReportDialogOpen and not p22.props.isReportDialogOpen then
		p22:setState({ descriptionText = "", reasonText = roactModule.None })
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p24, _)
	-- upvalues: constantsModule (ref)
	return {
		reportCategory = p24.report.reportCategory,
		isReportDialogOpen = p24.report.currentPage == constantsModule.Page.ReportForm,
		currentPage = p24.report.currentPage,
		reportType = p24.report.reportType,
		targetPlayer = p24.report.targetPlayer,
		canNavigateBack = #p24.report.history > 1,
		placeName = p24.placeInfo.name,
		screenSize = p24.displayOptions.screenSize,
		screenshotAnnotationPoints = p24.report.screenshotAnnotationPoints
	}
end, function(p25)
	-- upvalues: navigateBackModule (ref), sendAnalyticsModule (ref), constantsModule (ref), endReportFlowModule (ref), sessionUtilityModule (ref), filterIdentifiedAvatarsModule (ref), screenshotAnnotatedModule (ref), sendReportModule (ref)
	return {
		navigateBack = function(p26, p27)
			-- upvalues: p25 (ref), navigateBackModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p25(navigateBackModule())
			sendAnalyticsModule(constantsModule.Page.ReportForm, constantsModule.Analytics.ReportFlowBack, {
				source = constantsModule.Page.ReportForm,
				reason = p26,
				descriptionTextChanged = p27
			})
		end,
		closeDialog = function(p28, p29)
			-- upvalues: p25 (ref), endReportFlowModule (copy), sendAnalyticsModule (copy), constantsModule (copy), sessionUtilityModule (copy)
			p25(endReportFlowModule())
			sendAnalyticsModule(constantsModule.Page.ReportForm, constantsModule.Analytics.ReportFlowAbandoned, {
				source = constantsModule.Page.ReportForm,
				reason = p28,
				descriptionTextChanged = p29
			})
			sessionUtilityModule.endAbuseReportSession()
		end,
		screenshotAnnotated = function(p30, p31, p32)
			-- upvalues: p25 (ref), filterIdentifiedAvatarsModule (copy), screenshotAnnotatedModule (copy)
			p25(filterIdentifiedAvatarsModule(p32))
			p25(screenshotAnnotatedModule(p30, p31, p32))
		end,
		sendReport = function(p33, p34, p35, p36, p37, p38, p39)
			-- upvalues: p25 (ref), sendReportModule (copy)
			p25(sendReportModule(p33, p34, p35, p36, p37, p38, p39))
		end
	}
end)(reportDialog)