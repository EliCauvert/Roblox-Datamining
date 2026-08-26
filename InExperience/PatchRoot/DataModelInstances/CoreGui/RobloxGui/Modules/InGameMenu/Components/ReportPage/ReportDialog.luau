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

function reportDialog.init(p1)
	-- upvalues: roact (ref)
	p1.state = { abuseDescription = "", typeOfAbuseIndex = 0 }
	p1.selectionGroupRef = roact.createRef()
	p1.reportTextEntryRef = roact.createRef()
	p1.reportDropDownRef = roact.createRef()
end

function reportDialog.renderReportTitle(_, p1, p2, p3)
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

function reportDialog.renderTextEntryField(p1, p2, p3, p4)
	-- upvalues: roact (ref), textEntryFieldModule (ref)
	p3.ReportDescription = roact.createElement(textEntryFieldModule, {
		enabled = p1.props.isOpen,
		text = p1.state.abuseDescription,
		textChanged = function(p5)
			-- upvalues: p1 (ref)
			p1:setState({ abuseDescription = p5 })
		end,
		maxTextLength = 160,
		autoFocusOnEnabled = not p1.props.isGamepadLastInput,
		PlaceholderText = p2.textboxPlaceHolder,
		LayoutOrder = 5,
		Size = p4,
		[roact.Ref] = p1.reportTextEntryRef
	})
end

function reportDialog.renderButtons(p1, _, p2, p3)
	-- upvalues: list (ref), roact (ref), button (ref), buttonType (ref)
	local charCount = utf8.len(utf8.nfcnormalize(p1.state.abuseDescription))
	p3.ButtonContainer = roact.createElement("Frame", {
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
			text = p2.cancel,
			onActivated = p1.props.dispatchCloseReportDialog
		}),
		ConfirmButton = roact.createElement(button, {
			layoutOrder = 2,
			buttonType = buttonType.PrimarySystem,
			size = UDim2.fromOffset(144, 36),
			isDisabled = not ((charCount >= 0 and charCount <= 160) and (if p1.state.typeOfAbuseIndex <= 0 then p1.props.userId == nil else true)),
			text = p2.report,
			onActivated = function()
				-- upvalues: p1 (ref), list (copy)
				p1.props.dispatchSendReport(if p1.props.userId ~= nil then list[p1.state.typeOfAbuseIndex] else "Inappropriate Content", p1.state.abuseDescription, p1.props.userId)
				p1.props.dispatchCloseReportDialog()
			end
		})
	})
end

function reportDialog.renderReportPlayer(p1, p2, p3, p4)
	-- upvalues: roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), imageSetLabel (ref), cryo (ref), themedTextLabelModule (ref), dropDownSelectionModule (ref), list_1 (ref)
	p1:renderReportTitle(p2, p4, p3.reportPlayerTitle)
	local t = {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0.5, -140, 0.5, 0),
		Size = UDim2.new(0, 44, 0, 44)
	}
	local userId = p1.props.userId
	p4.ReportPlayerTextContainer = roact.createElement("Frame", {
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
				Color3 = p2.Theme.BackgroundUIDefault.Color
			}
		}) else roact.createElement(imageSetLabel, cryo.Dictionary.join(t, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Image = assetsModule.Images.CircleCutout,
			ImageColor3 = p2.Theme.BackgroundUIDefault.Color
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
			BackgroundColor3 = p2.Theme.UIDefault.Color
		})),
		PlayerName = roact.createElement(themedTextLabelModule, {
			fontKey = "Body",
			themeKey = "TextEmphasis",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0.5, -76, 0.5, 0),
			Size = UDim2.new(0.5, 76, 0, 44),
			Text = p1.props.userName,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
	p4.AbuseTypeDropDown = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = UDim2.new(1, 0, 0, 68)
	}, {
		DropDown = roact.createElement(dropDownSelectionModule, {
			localize = true,
			enabled = true,
			selectionParentName = "abuseTypeDropDown",
			Size = UDim2.new(1, 0, 0, 44),
			placeHolderText = p3.selectTypeOfAbuse,
			selections = list_1,
			selectedIndex = p1.state.typeOfAbuseIndex,
			canOpen = p1.props.canCaptureFocus,
			canCaptureFocus = p1.props.isGamepadLastInput,
			selectionChanged = function(p5)
				-- upvalues: p1 (ref)
				p1:setState({ typeOfAbuseIndex = p5 })
			end,
			ButtonRef = p1.reportDropDownRef
		})
	})
	p1:renderTextEntryField(p3, p4, UDim2.new(1, 0, 0, 180))
	p1:renderButtons(p2, p3, p4)
end

function reportDialog.renderReportGame(p1, p2, p3, p4)
	-- upvalues: assetsModule (ref), roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), imageSetLabel (ref), themedTextLabelModule (ref)
	p1:renderReportTitle(p2, p4, "Report " .. p17.props.placeName)
	local var1 = if game.GameId > 0 then "rbxthumb://type=GameIcon&id=" .. game.GameId .. "&w=150&h=150" else assetsModule.Images.PlaceholderGameIcon
	p4.ReportGameTextContainer = roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 126)
	}, {
		GameIcon = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 17, 0.5, 0),
			Size = UDim2.new(0, 64, 0, 64),
			Image = var1
		}) else roact.createElement(imageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 17, 0.5, 0),
			Size = UDim2.new(0, 64, 0, 64),
			Image = var1
		}),
		GameName = roact.createElement(themedTextLabelModule, {
			fontKey = "Body",
			themeKey = "TextEmphasis",
			TextWrapped = true,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 104, 0.5, 0),
			Size = UDim2.new(1, -104, 0, 44),
			Text = p3.flagingGame,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
	p1:renderTextEntryField(p3, p4, UDim2.new(1, 0, 0, 191))
	p1:renderButtons(p2, p3, p4)
end

function reportDialog.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), withLocalizationModule (ref), roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), imageSetLabel (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerModule (ref), guiService (ref)
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				Overlay = {
					Color = p2.Color.Common.Scrim.Color3,
					Transparency = p2.Color.Common.Scrim.Transparency
				},
				BackgroundUIDefault = {
					Color = p2.Color.Surface.Surface_300.Color3,
					Transparency = p2.Color.Surface.Surface_300.Transparency
				},
				UIDefault = {
					Color = p2.Color.Shift.Shift_200.Color3,
					Transparency = p2.Color.Shift.Shift_200.Transparency
				},
				Divider = {
					Color = p2.Color.Stroke.Emphasis.Color3,
					Transparency = p2.Color.Stroke.Emphasis.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: withLocalizationModule (copy), p1 (ref), roact (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), imageSetLabel (copy), getFFlagIGMGamepadSelectionHistoryModule (copy), focusHandlerModule (copy), guiService (copy)
		return withLocalizationModule({
			reportPlayerTitle = "CoreScripts.InGameMenu.Report.ReportPlayerTitle",
			selectTypeOfAbuse = "CoreScripts.InGameMenu.Report.SelectAbuseType",
			cancel = "CoreScripts.InGameMenu.Cancel",
			report = "CoreScripts.InGameMenu.Report.SendReport",
			textboxPlaceHolder = "CoreScripts.InGameMenu.Report.AdditionalDetails",
			flagingGame = {
				"CoreScripts.InGameMenu.Report.FlagingGame",
				RBX_NAME = p1.props.placeName
			},
			reportGameTitle = {
				"CoreScripts.InGameMenu.Report.ReportGameTitle",
				RBX_NAME = p1.props.placeName
			}
		})(function(p3)
			-- upvalues: roact (copy), p1 (copy), p2 (ref), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), imageSetLabel (copy), getFFlagIGMGamepadSelectionHistoryModule (copy), focusHandlerModule (copy), guiService (copy)
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
			
			if p1.props.userId == nil then
				p1:renderReportGame(p2, p3, t)
			else
				p1:renderReportPlayer(p2, p3, t)
			end
			return roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				ZIndex = 8,
				Visible = p1.props.isOpen,
				[roact.Ref] = p1.selectionGroupRef
			}, {
				Overlay = roact.createElement("TextButton", {
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					Selectable = false,
					BackgroundColor3 = p2.Theme.Overlay.Color,
					BackgroundTransparency = p2.Theme.Overlay.Transparency,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				DialogMainFrame = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.RoundedRectImageKey,
					imageStyle = {
						Color3 = p2.Theme.BackgroundUIDefault.Color,
						Transparency = p2.Theme.BackgroundUIDefault.Transparency
					},
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, 600, 0, 450),
					slice = { center = Rect.new(8, 8, 9, 9) }
				}, t) else roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = assetsModule.Images.RoundedRect.Image,
					ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
					ImageTransparency = p2.Theme.BackgroundUIDefault.Transparency,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ScaleType = assetsModule.Images.RoundedRect.ScaleType,
					Size = UDim2.new(0, 600, 0, 450),
					SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
				}, t),
				FocusHandler = getFFlagIGMGamepadSelectionHistoryModule() and (roact.createElement(focusHandlerModule, {
					isFocused = p1.props.canCaptureFocus and p1.props.isGamepadLastInput,
					shouldForgetPreviousSelection = not p1.props.isOpen,
					didFocus = function(p4)
						-- upvalues: p1 (copy), guiService (copy)
						guiService.SelectedCoreObject = p4 or (if p1.props.userId then p1.reportDropDownRef:getValue() else p1.reportTextEntryRef:getValue())
					end
				}) or nil)
			})
		end)
	end)
end

function reportDialog.bindActions(p1)
	-- upvalues: contextActionService (ref)
	contextActionService:BindCoreAction("InGameMenuReportModalClose", function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.Begin then
			p1.props.dispatchCloseReportDialog()
		end
	end, false, Enum.KeyCode.Escape)
end

function reportDialog.unbindActions(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("InGameMenuReportModalClose")
end

function reportDialog.didMount(p1)
	-- upvalues: guiService (ref)
	guiService:RemoveSelectionGroup("ReportDialogGroup")
	guiService:AddSelectionParent("ReportDialogGroup", p1.selectionGroupRef:getValue())
	
	if p1.props.isOpen then
		p1:bindActions()
	end
end

function reportDialog.didUpdate(p1, p2)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref)
	if p2.isOpen and not p1.props.isOpen then
		p1:setState({ typeOfAbuseIndex = 0, abuseDescription = "" })
	end
	if not getFFlagIGMGamepadSelectionHistoryModule() and (not p2.canCaptureFocus or not p2.isGamepadLastInput) and (p1.props.canCaptureFocus and p1.props.isGamepadLastInput) then
		guiService.SelectedCoreObject = if p1.props.userId then p1.reportDropDownRef:getValue() else p1.reportTextEntryRef:getValue()
	end
	if p1.props.isOpen then
		p1:bindActions()
		
		return
	end
	p1:unbindActions()
end

function reportDialog.willUnmount(p1)
	p1:unbindActions()
end

return roactRodux.UNSTABLE_connect2(function(p1, _)
	-- upvalues: constantsModule (ref)
	return {
		isOpen = p1.report.dialogOpen,
		userId = p1.report.userId,
		userName = p1.report.userName,
		placeName = p1.gameInfo.name,
		canCaptureFocus = p1.report.dialogOpen and not p1.respawn.dialogOpen,
		isGamepadLastInput = p1.displayOptions.inputType == constantsModule.InputType.Gamepad
	}
end, function(p1)
	-- upvalues: closeReportDialogModule (ref), sendReportModule (ref), sendAnalyticsModule (ref), constantsModule (ref)
	return {
		dispatchCloseReportDialog = function()
			-- upvalues: p1 (ref), closeReportDialogModule (copy)
			p1(closeReportDialogModule())
		end,
		dispatchSendReport = function(p2, p3, p4)
			-- upvalues: p1 (ref), sendReportModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p1(sendReportModule(p2, p3, p4))
			local t = {}
			
			if p2 == "Inappropriate Content" then
				table.insert(t, "report_type=game")
				table.insert(t, "reported_entity_id=" .. tostring(game.GameId))
			else
				table.insert(t, "report_type=user")
				table.insert(t, "reported_entity_id=" .. tostring(p4))
			end
			table.insert(t, "report_source=ingame")
			sendAnalyticsModule(constantsModule.AnalyticsReportSubmittedName, table.concat(t, "&"), {})
		end
	}
end)(reportDialog)