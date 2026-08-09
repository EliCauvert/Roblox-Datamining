local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local cryo = inGameMenuDependenciesModule.Cryo
local button = UIBlox.App.Button.Button
local buttonType = UIBlox.App.Button.Enum.ButtonType
local withStyle = UIBlox.Core.Style.withStyle
local parent = script.Parent.Parent.Parent
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local focusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local assetsModule = require(parent.Resources.Assets)
local closeReportDialogModule = require(parent.Actions.CloseReportDialog)
local withLocalizationModule = require(parent.Localization.withLocalization)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local textEntryFieldModule = require(script.Parent.TextEntryField)
local dropDownSelectionModule = require(parent.Components.DropDownSelection)
local constantsModule = require(parent.Resources.Constants)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local sendReportModule = require(parent.Thunks.SendReport)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local reportDialog = roact.PureComponent:extend("ReportDialog")
local list = {
	"Swearing", "Inappropriate Username", "Bullying", "Scamming", "Dating",
	"Cheating/Exploiting", "Personal Question", "Offsite Links"
}
local list_1 = {
	"CoreScripts.InGameMenu.Report.AbuseSwearing",
	"CoreScripts.InGameMenu.Report.AbuseUsername",
	"CoreScripts.InGameMenu.Report.AbuseBullying",
	"CoreScripts.InGameMenu.Report.AbuseScamming",
	"CoreScripts.InGameMenu.Report.AbuseDating",
	"CoreScripts.InGameMenu.Report.AbuseExploiting",
	"CoreScripts.InGameMenu.Report.AbusePersonalQuestion",
	"CoreScripts.InGameMenu.Report.AbuseOffsiteLink"
}
reportDialog.validateProps = t.strictInterface({
	isOpen = t.boolean,
	userId = t.optional(t.integer),
	userName = t.optional(t.string),
	placeName = t.string,
	dispatchCloseReportDialog = t.callback,
	dispatchSendReport = t.callback,
	canCaptureFocus = t.optional(t.boolean),
	isGamepadLastInput = t.optional(t.boolean)
})

function reportDialog.init(p0) --[[ line: 81 ]]
	-- upvalues: roact (ref)
	p0.state = { abuseDescription = "", typeOfAbuseIndex = 0 }
	p0.selectionGroupRef = roact.createRef()
	p0.reportTextEntryRef = roact.createRef()
	p0.reportDropDownRef = roact.createRef()
end

function reportDialog.renderReportTitle(_, p1, p2, p3) --[[ line: 92 ]]
	-- upvalues: roact (ref), themedTextLabelModule (ref)
	p2.Title = roact.createElement(themedTextLabelModule, {
		fontKey = "Header1",
		themeKey = "TextEmphasis",
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 48),
		Text = p3
	})
	p2.Divider = roact.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = 2,
		BackgroundColor3 = p1.Theme.Divider.Color,
		BackgroundTransparency = p1.Theme.Divider.Transparency,
		Size = UDim2.new(0.8, 0, 0, 1)
	})
end

function reportDialog.renderTextEntryField(p4, p5, p6, p7) --[[ line: 111 ]]
	-- upvalues: roact (ref), textEntryFieldModule (ref)
	p6.ReportDescription = roact.createElement(textEntryFieldModule, {
		enabled = p4.props.isOpen,
		text = p4.state.abuseDescription,
		textChanged = function(p8) --[[ line: 115 ]]
			-- upvalues: p4 (ref)
			p4:setState({ abuseDescription = p8 })
		end,
		maxTextLength = 160,
		autoFocusOnEnabled = not p4.props.isGamepadLastInput,
		PlaceholderText = p5.textboxPlaceHolder,
		LayoutOrder = 5,
		Size = p7,
		[roact.Ref] = p4.reportTextEntryRef
	})
end

function reportDialog.renderButtons(p9, _, p10, p11) --[[ line: 130 ]]
	-- upvalues: list (ref), roact (ref), button (ref), buttonType (ref)
	local charCount = utf8.len(utf8.nfcnormalize(p9.state.abuseDescription))
	p11.ButtonContainer = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 6,
		Size = UDim2.new(1, 0, 0, 60)
	}, {
		Layout = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0, 12),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		}),
		CancelButton = roact.createElement(button, {
			layoutOrder = 1,
			buttonType = buttonType.Secondary,
			size = UDim2.fromOffset(144, 36),
			text = p10.cancel,
			onActivated = p9.props.dispatchCloseReportDialog
		}),
		ConfirmButton = roact.createElement(button, {
			layoutOrder = 2,
			buttonType = buttonType.PrimarySystem,
			size = UDim2.fromOffset(144, 36),
			isDisabled = not ((charCount >= 0 and charCount <= 160) and (if p9.state.typeOfAbuseIndex <= 0 then p9.props.userId == nil else true)),
			text = p10.report,
			onActivated = function() --[[ line: 135 ]]
				-- upvalues: p9 (ref), list (copy)
				p9.props.dispatchSendReport(if p9.props.userId ~= nil then list[p9.state.typeOfAbuseIndex] else "Inappropriate Content", p9.state.abuseDescription, p9.props.userId)
				p9.props.dispatchCloseReportDialog()
			end
		})
	})
end

function reportDialog.renderReportPlayer(p12, p13, p14, p15) --[[ line: 174 ]]
	-- upvalues: roact (ref), imageSetLabel (ref), cryo (ref), assetsModule (ref), themedTextLabelModule (ref), dropDownSelectionModule (ref), list_1 (ref)
	p12:renderReportTitle(p13, p15, p14.reportPlayerTitle)
	local t = {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0.5, -140, 0.5, 0),
		Size = UDim2.new(0, 44, 0, 44)
	}
	local userId = p12.props.userId
	p15.ReportPlayerTextContainer = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 68)
	}, {
		PlayerCutout = roact.createElement(imageSetLabel, cryo.Dictionary.join(t, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Image = assetsModule.Images.CircleCutout,
			ImageColor3 = p13.Theme.BackgroundUIDefault.Color
		})),
		PlayerIcon = roact.createElement(imageSetLabel, cryo.Dictionary.join(t, {
			BackgroundTransparency = 1,
			Image = if userId > 0 then "rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=48&h=48" else ""
		})),
		PlayerBackground = roact.createElement("Frame", cryo.Dictionary.join(t, {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 0,
			BackgroundColor3 = p13.Theme.UIDefault.Color
		})),
		PlayerName = roact.createElement(themedTextLabelModule, {
			fontKey = "Body",
			themeKey = "TextEmphasis",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0.5, -76, 0.5, 0),
			Size = UDim2.new(0.5, 76, 0, 44),
			Text = p12.props.userName,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
	p15.AbuseTypeDropDown = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = UDim2.new(1, 0, 0, 68)
	}, {
		DropDown = roact.createElement(dropDownSelectionModule, {
			localize = true,
			enabled = true,
			selectionParentName = "abuseTypeDropDown",
			Size = UDim2.new(1, 0, 0, 44),
			placeHolderText = p14.selectTypeOfAbuse,
			selections = list_1,
			selectedIndex = p12.state.typeOfAbuseIndex,
			canOpen = p12.props.canCaptureFocus,
			canCaptureFocus = p12.props.isGamepadLastInput,
			selectionChanged = function(p16) --[[ line: 244 ]]
				-- upvalues: p12 (ref)
				p12:setState({ typeOfAbuseIndex = p16 })
			end,
			ButtonRef = p12.reportDropDownRef
		})
	})
	p12:renderTextEntryField(p14, p15, UDim2.new(1, 0, 0, 180))
	p12:renderButtons(p13, p14, p15)
end

function reportDialog.renderReportGame(p17, p18, p19, p20) --[[ line: 257 ]]
	-- upvalues: assetsModule (ref), roact (ref), imageSetLabel (ref), themedTextLabelModule (ref)
	p17:renderReportTitle(p18, p20, "Report " .. p17.props.placeName)
	p20.ReportGameTextContainer = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 126)
	}, {
		GameIcon = roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 17, 0.5, 0),
			Size = UDim2.new(0, 64, 0, 64),
			Image = if game.GameId > 0 then "rbxthumb://type=GameIcon&id=" .. game.GameId .. "&w=150&h=150" else assetsModule.Images.PlaceholderGameIcon
		}),
		GameName = roact.createElement(themedTextLabelModule, {
			fontKey = "Body",
			themeKey = "TextEmphasis",
			TextWrapped = true,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 104, 0.5, 0),
			Size = UDim2.new(1, -104, 0, 44),
			Text = p19.flagingGame,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
	p17:renderTextEntryField(p19, p20, UDim2.new(1, 0, 0, 191))
	p17:renderButtons(p18, p19, p20)
end

function reportDialog.render(p21) --[[ line: 295 ]]
	-- upvalues: withStyle (ref), withLocalizationModule (ref), roact (ref), imageSetLabel (ref), assetsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerModule (ref), guiService (ref)
	return withStyle(function(p22) --[[ line: 296 ]]
		-- upvalues: withLocalizationModule (copy), p21 (ref), roact (copy), imageSetLabel (copy), assetsModule (copy), getFFlagIGMGamepadSelectionHistoryModule (copy), focusHandlerModule (copy), guiService (copy)
		return withLocalizationModule({
			reportPlayerTitle = "CoreScripts.InGameMenu.Report.ReportPlayerTitle",
			selectTypeOfAbuse = "CoreScripts.InGameMenu.Report.SelectAbuseType",
			cancel = "CoreScripts.InGameMenu.Cancel",
			report = "CoreScripts.InGameMenu.Report.SendReport",
			textboxPlaceHolder = "CoreScripts.InGameMenu.Report.AdditionalDetails",
			flagingGame = {
				"CoreScripts.InGameMenu.Report.FlagingGame",
				RBX_NAME = p21.props.placeName
			},
			reportGameTitle = {
				"CoreScripts.InGameMenu.Report.ReportGameTitle",
				RBX_NAME = p21.props.placeName
			}
		})(function(p23) --[[ line: 308 ]]
			-- upvalues: roact (copy), p21 (copy), p22 (ref), imageSetLabel (copy), assetsModule (copy), getFFlagIGMGamepadSelectionHistoryModule (copy), focusHandlerModule (copy), guiService (copy)
			local t = {
				Padding = roact.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, 24),
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Layout = roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				})
			}
			
			if p21.props.userId == nil then
				p21:renderReportGame(p22, p23, t)
			else
				p21:renderReportPlayer(p22, p23, t)
			end
			return roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				ZIndex = 8,
				Visible = p21.props.isOpen,
				[roact.Ref] = p21.selectionGroupRef
			}, {
				Overlay = roact.createElement("TextButton", {
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					Selectable = false,
					BackgroundColor3 = p22.Theme.Overlay.Color,
					BackgroundTransparency = p22.Theme.Overlay.Transparency,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				DialogMainFrame = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.RoundedRect.Image,
					ImageColor3 = p22.Theme.BackgroundUIDefault.Color,
					ImageTransparency = p22.Theme.BackgroundUIDefault.Transparency,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ScaleType = assetsModule.Images.RoundedRect.ScaleType,
					Size = UDim2.new(0, 600, 0, 450),
					SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
				}, t),
				FocusHandler = getFFlagIGMGamepadSelectionHistoryModule() and (roact.createElement(focusHandlerModule, {
					isFocused = p21.props.canCaptureFocus and p21.props.isGamepadLastInput,
					shouldForgetPreviousSelection = not p21.props.isOpen,
					didFocus = function(p24) --[[ line: 358 ]]
						-- upvalues: p21 (copy), guiService (copy)
						guiService.SelectedCoreObject = p24 or (if p21.props.userId then p21.reportDropDownRef:getValue() else p21.reportTextEntryRef:getValue())
					end
				}) or nil)
			})
		end)
	end)
end

function reportDialog.bindActions(p25) --[[ line: 373 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("InGameMenuReportModalClose", function(_, p26, _) --[[ line: 374 | named "closeReportFunc" ]]
		-- upvalues: p25 (ref)
		if p26 == Enum.UserInputState.Begin then
			p25.props.dispatchCloseReportDialog()
		end
	end, false, Enum.KeyCode.Escape)
end

function reportDialog.unbindActions(_) --[[ line: 383 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("InGameMenuReportModalClose")
end

function reportDialog.didMount(p27) --[[ line: 387 ]]
	-- upvalues: guiService (ref)
	guiService:RemoveSelectionGroup("ReportDialogGroup")
	guiService:AddSelectionParent("ReportDialogGroup", p27.selectionGroupRef:getValue())
	
	if p27.props.isOpen then
		p27:bindActions()
	end
end

function reportDialog.didUpdate(p28, p29) --[[ line: 396 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref)
	if p29.isOpen and not p28.props.isOpen then
		p28:setState({ typeOfAbuseIndex = 0, abuseDescription = "" })
	end
	if not getFFlagIGMGamepadSelectionHistoryModule() and (not p29.canCaptureFocus or not p29.isGamepadLastInput) and (p28.props.canCaptureFocus and p28.props.isGamepadLastInput) then
		guiService.SelectedCoreObject = if p28.props.userId then p28.reportDropDownRef:getValue() else p28.reportTextEntryRef:getValue()
	end
	if p28.props.isOpen then
		p28:bindActions()
		
		return
	end
	p28:unbindActions()
end

function reportDialog.willUnmount(p30) --[[ line: 428 ]]
	p30:unbindActions()
end

return roactRodux.UNSTABLE_connect2(function(p31, _) --[[ line: 432 ]]
	-- upvalues: constantsModule (ref)
	return {
		isOpen = p31.report.dialogOpen,
		userId = p31.report.userId,
		userName = p31.report.userName,
		placeName = p31.gameInfo.name,
		canCaptureFocus = p31.report.dialogOpen and not p31.respawn.dialogOpen,
		isGamepadLastInput = p31.displayOptions.inputType == constantsModule.InputType.Gamepad
	}
end, function(p32) --[[ line: 441 ]]
	-- upvalues: closeReportDialogModule (ref), sendReportModule (ref), sendAnalyticsModule (ref), constantsModule (ref)
	return {
		dispatchCloseReportDialog = function() --[[ line: 443 ]]
			-- upvalues: p32 (ref), closeReportDialogModule (copy)
			p32(closeReportDialogModule())
		end,
		dispatchSendReport = function(p33, p34, p35) --[[ line: 446 ]]
			-- upvalues: p32 (ref), sendReportModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p32(sendReportModule(p33, p34, p35))
			local t = {}
			
			if p33 == "Inappropriate Content" then
				table.insert(t, "report_type=game")
				table.insert(t, "reported_entity_id=" .. tostring(game.GameId))
			else
				table.insert(t, "report_type=user")
				table.insert(t, "reported_entity_id=" .. tostring(p35))
			end
			table.insert(t, "report_source=ingame")
			sendAnalyticsModule(constantsModule.AnalyticsReportSubmittedName, table.concat(t, "&"), {})
		end
	}
end)(reportDialog)