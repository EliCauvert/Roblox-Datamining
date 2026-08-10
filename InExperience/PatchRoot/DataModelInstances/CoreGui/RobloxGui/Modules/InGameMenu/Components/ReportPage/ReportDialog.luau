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
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
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
local image = require(corePackagesService.Packages.Foundation).Image
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
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

function reportDialog.init(p0) --[[ line: 87 ]]
	-- upvalues: roact (ref)
	p0.state = { abuseDescription = "", typeOfAbuseIndex = 0 }
	p0.selectionGroupRef = roact.createRef()
	p0.reportTextEntryRef = roact.createRef()
	p0.reportDropDownRef = roact.createRef()
end

function reportDialog.renderReportTitle(_, p1, p2, p3) --[[ line: 98 ]]
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

function reportDialog.renderTextEntryField(p4, p5, p6, p7) --[[ line: 117 ]]
	-- upvalues: roact (ref), textEntryFieldModule (ref)
	p6.ReportDescription = roact.createElement(textEntryFieldModule, {
		enabled = p4.props.isOpen,
		text = p4.state.abuseDescription,
		textChanged = function(p8) --[[ line: 121 ]]
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

function reportDialog.renderButtons(p9, _, p10, p11) --[[ line: 136 ]]
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
			onActivated = function() --[[ line: 141 ]]
				-- upvalues: p9 (ref), list (copy)
				p9.props.dispatchSendReport(if p9.props.userId ~= nil then list[p9.state.typeOfAbuseIndex] else "Inappropriate Content", p9.state.abuseDescription, p9.props.userId)
				p9.props.dispatchCloseReportDialog()
			end
		})
	})
end

function reportDialog.renderReportPlayer(p12, p13, p14, p15) --[[ line: 180 ]]
	-- upvalues: roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), imageSetLabel (ref), cryo (ref), themedTextLabelModule (ref), dropDownSelectionModule (ref), list_1 (ref)
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
		PlayerCutout = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			ZIndex = 2,
			AnchorPoint = t.AnchorPoint,
			Position = t.Position,
			Size = t.Size,
			Image = assetsModule.Images.CircleCutout,
			imageStyle = {
				Transparency = 0,
				Color3 = p13.Theme.BackgroundUIDefault.Color
			}
		}) else roact.createElement(imageSetLabel, cryo.Dictionary.join(t, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Image = assetsModule.Images.CircleCutout,
			ImageColor3 = p13.Theme.BackgroundUIDefault.Color
		})),
		PlayerIcon = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			AnchorPoint = t.AnchorPoint,
			Position = t.Position,
			Size = t.Size,
			Image = if userId > 0 then "rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=48&h=48" else ""
		}) else roact.createElement(imageSetLabel, cryo.Dictionary.join(t, {
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
			selectionChanged = function(p16) --[[ line: 266 ]]
				-- upvalues: p12 (ref)
				p12:setState({ typeOfAbuseIndex = p16 })
			end,
			ButtonRef = p12.reportDropDownRef
		})
	})
	p12:renderTextEntryField(p14, p15, UDim2.new(1, 0, 0, 180))
	p12:renderButtons(p13, p14, p15)
end

function reportDialog.renderReportGame(p17, p18, p19, p20) --[[ line: 279 ]]
	-- upvalues: assetsModule (ref), roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), imageSetLabel (ref), themedTextLabelModule (ref)
	p17:renderReportTitle(p18, p20, "Report " .. p17.props.placeName)
	local var20 = if game.GameId > 0 then "rbxthumb://type=GameIcon&id=" .. game.GameId .. "&w=150&h=150" else assetsModule.Images.PlaceholderGameIcon
	p20.ReportGameTextContainer = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 126)
	}, {
		GameIcon = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 17, 0.5, 0),
			Size = UDim2.new(0, 64, 0, 64),
			Image = var20
		}) else roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 17, 0.5, 0),
			Size = UDim2.new(0, 64, 0, 64),
			Image = var20
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

function reportDialog.render(p21) --[[ line: 324 ]]
	-- upvalues: withFoundationOrUIBloxStyle (ref), withLocalizationModule (ref), roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), imageSetLabel (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerModule (ref), guiService (ref)
	return withFoundationOrUIBloxStyle(function(p22) --[[ line: 325 ]]
		return {
			Theme = {
				Overlay = {
					Color = p22.Color.Common.Scrim.Color3,
					Transparency = p22.Color.Common.Scrim.Transparency
				},
				BackgroundUIDefault = {
					Color = p22.Color.Surface.Surface_300.Color3,
					Transparency = p22.Color.Surface.Surface_300.Transparency
				},
				UIDefault = {
					Color = p22.Color.Shift.Shift_200.Color3,
					Transparency = p22.Color.Shift.Shift_200.Transparency
				},
				Divider = {
					Color = p22.Color.Stroke.Emphasis.Color3,
					Transparency = p22.Color.Stroke.Emphasis.Transparency
				}
			}
		}
	end, function(p23) --[[ line: 334 ]]
		-- upvalues: withLocalizationModule (copy), p21 (ref), roact (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), imageSetLabel (copy), getFFlagIGMGamepadSelectionHistoryModule (copy), focusHandlerModule (copy), guiService (copy)
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
		})(function(p24) --[[ line: 346 ]]
			-- upvalues: roact (copy), p21 (copy), p23 (ref), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), imageSetLabel (copy), getFFlagIGMGamepadSelectionHistoryModule (copy), focusHandlerModule (copy), guiService (copy)
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
				p21:renderReportGame(p23, p24, t)
			else
				p21:renderReportPlayer(p23, p24, t)
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
					BackgroundColor3 = p23.Theme.Overlay.Color,
					BackgroundTransparency = p23.Theme.Overlay.Transparency,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				DialogMainFrame = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.RoundedRectImageKey,
					imageStyle = {
						Color3 = p23.Theme.BackgroundUIDefault.Color,
						Transparency = p23.Theme.BackgroundUIDefault.Transparency
					},
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, 600, 0, 450),
					slice = { center = Rect.new(8, 8, 9, 9) }
				}, t) else roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.RoundedRect.Image,
					ImageColor3 = p23.Theme.BackgroundUIDefault.Color,
					ImageTransparency = p23.Theme.BackgroundUIDefault.Transparency,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ScaleType = assetsModule.Images.RoundedRect.ScaleType,
					Size = UDim2.new(0, 600, 0, 450),
					SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
				}, t),
				FocusHandler = getFFlagIGMGamepadSelectionHistoryModule() and (roact.createElement(focusHandlerModule, {
					isFocused = p21.props.canCaptureFocus and p21.props.isGamepadLastInput,
					shouldForgetPreviousSelection = not p21.props.isOpen,
					didFocus = function(p25) --[[ line: 408 ]]
						-- upvalues: p21 (copy), guiService (copy)
						guiService.SelectedCoreObject = p25 or (if p21.props.userId then p21.reportDropDownRef:getValue() else p21.reportTextEntryRef:getValue())
					end
				}) or nil)
			})
		end)
	end)
end

function reportDialog.bindActions(p26) --[[ line: 423 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("InGameMenuReportModalClose", function(_, p27, _) --[[ line: 424 | named "closeReportFunc" ]]
		-- upvalues: p26 (ref)
		if p27 == Enum.UserInputState.Begin then
			p26.props.dispatchCloseReportDialog()
		end
	end, false, Enum.KeyCode.Escape)
end

function reportDialog.unbindActions(_) --[[ line: 433 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("InGameMenuReportModalClose")
end

function reportDialog.didMount(p28) --[[ line: 437 ]]
	-- upvalues: guiService (ref)
	guiService:RemoveSelectionGroup("ReportDialogGroup")
	guiService:AddSelectionParent("ReportDialogGroup", p28.selectionGroupRef:getValue())
	
	if p28.props.isOpen then
		p28:bindActions()
	end
end

function reportDialog.didUpdate(p29, p30) --[[ line: 446 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref)
	if p30.isOpen and not p29.props.isOpen then
		p29:setState({ typeOfAbuseIndex = 0, abuseDescription = "" })
	end
	if not getFFlagIGMGamepadSelectionHistoryModule() and (not p30.canCaptureFocus or not p30.isGamepadLastInput) and (p29.props.canCaptureFocus and p29.props.isGamepadLastInput) then
		guiService.SelectedCoreObject = if p29.props.userId then p29.reportDropDownRef:getValue() else p29.reportTextEntryRef:getValue()
	end
	if p29.props.isOpen then
		p29:bindActions()
		
		return
	end
	p29:unbindActions()
end

function reportDialog.willUnmount(p31) --[[ line: 478 ]]
	p31:unbindActions()
end

return roactRodux.UNSTABLE_connect2(function(p32, _) --[[ line: 482 ]]
	-- upvalues: constantsModule (ref)
	return {
		isOpen = p32.report.dialogOpen,
		userId = p32.report.userId,
		userName = p32.report.userName,
		placeName = p32.gameInfo.name,
		canCaptureFocus = p32.report.dialogOpen and not p32.respawn.dialogOpen,
		isGamepadLastInput = p32.displayOptions.inputType == constantsModule.InputType.Gamepad
	}
end, function(p33) --[[ line: 491 ]]
	-- upvalues: closeReportDialogModule (ref), sendReportModule (ref), sendAnalyticsModule (ref), constantsModule (ref)
	return {
		dispatchCloseReportDialog = function() --[[ line: 493 ]]
			-- upvalues: p33 (ref), closeReportDialogModule (copy)
			p33(closeReportDialogModule())
		end,
		dispatchSendReport = function(p34, p35, p36) --[[ line: 496 ]]
			-- upvalues: p33 (ref), sendReportModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p33(sendReportModule(p34, p35, p36))
			local t = {}
			
			if p34 == "Inappropriate Content" then
				table.insert(t, "report_type=game")
				table.insert(t, "reported_entity_id=" .. tostring(game.GameId))
			else
				table.insert(t, "report_type=user")
				table.insert(t, "reported_entity_id=" .. tostring(p36))
			end
			table.insert(t, "report_source=ingame")
			sendAnalyticsModule(constantsModule.AnalyticsReportSubmittedName, table.concat(t, "&"), {})
		end
	}
end)(reportDialog)