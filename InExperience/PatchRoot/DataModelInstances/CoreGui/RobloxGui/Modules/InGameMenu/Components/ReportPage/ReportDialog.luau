local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local Cryo = InGameMenuDependenciesModule.Cryo
local Button = UIBlox.App.Button.Button
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Parent = script.Parent.Parent.Parent
local Flags = Parent.Flags
local GetFFlagIGMGamepadSelectionHistoryModule = require(Flags.GetFFlagIGMGamepadSelectionHistory)
local FFlagIGMDialogButtonsUseUIBloxButtonModule = require(Flags.FFlagIGMDialogButtonsUseUIBloxButton)
local FocusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local AssetsModule = require(Parent.Resources.Assets)
local CloseReportDialogModule = require(Parent.Actions.CloseReportDialog)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local TextEntryFieldModule = require(script.Parent.TextEntryField)
local DropDownSelectionModule = require(Parent.Components.DropDownSelection)
local ConstantsModule = require(Parent.Resources.Constants)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local SendReportModule = require(Parent.Thunks.SendReport)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Image = require(CorePackages.Packages.Foundation).Image
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local ReportDialog = Roact.PureComponent:extend("ReportDialog")
local list = {
	"Swearing", "Inappropriate Username", "Bullying", "Scamming", "Dating",
	"Cheating/Exploiting", "Personal Question", "Offsite Links"
}
local Selections = {
	"CoreScripts.InGameMenu.Report.AbuseSwearing",
	"CoreScripts.InGameMenu.Report.AbuseUsername",
	"CoreScripts.InGameMenu.Report.AbuseBullying",
	"CoreScripts.InGameMenu.Report.AbuseScamming",
	"CoreScripts.InGameMenu.Report.AbuseDating",
	"CoreScripts.InGameMenu.Report.AbuseExploiting",
	"CoreScripts.InGameMenu.Report.AbusePersonalQuestion",
	"CoreScripts.InGameMenu.Report.AbuseOffsiteLink"
}
ReportDialog.validateProps = T.strictInterface({
	isOpen = T.boolean,
	userId = T.optional(T.integer),
	userName = T.optional(T.string),
	placeName = T.string,
	dispatchCloseReportDialog = T.callback,
	dispatchSendReport = T.callback,
	canCaptureFocus = T.optional(T.boolean),
	isGamepadLastInput = T.optional(T.boolean)
})

function ReportDialog.init(p1) --[[ Line: 88 ]]
	-- upvalues: Roact (copy)
	p1.state = { abuseDescription = "", typeOfAbuseIndex = 0 }
	p1.selectionGroupRef = Roact.createRef()
	p1.reportTextEntryRef = Roact.createRef()
	p1.reportDropDownRef = Roact.createRef()
end

function ReportDialog:renderReportTitle(p1, p2, Text) --[[ Line: 99 ]]
	-- upvalues: Roact (copy), ThemedTextLabelModule (copy)
	p2.Title = Roact.createElement(ThemedTextLabelModule, {
		fontKey = "Header1",
		themeKey = "TextEmphasis",
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, 48),
		Text = Text
	})
	p2.Divider = Roact.createElement("Frame", {
		BorderSizePixel = 0,
		LayoutOrder = 2,
		BackgroundColor3 = p1.Theme.Divider.Color,
		BackgroundTransparency = p1.Theme.Divider.Transparency,
		Size = UDim2.new(0.8, 0, 0, 1)
	})
end

function ReportDialog.renderTextEntryField(p1, p2, p3, Size) --[[ Line: 118 ]]
	-- upvalues: Roact (copy), TextEntryFieldModule (copy)
	p3.ReportDescription = Roact.createElement(TextEntryFieldModule, {
		enabled = p1.props.isOpen,
		text = p1.state.abuseDescription,
		textChanged = function(AbuseDescription) --[[ Line: 122 ]]
			-- upvalues: p1 (copy)
			p1:setState({ abuseDescription = AbuseDescription })
		end,
		maxTextLength = 160,
		autoFocusOnEnabled = not p1.props.isGamepadLastInput,
		PlaceholderText = p2.textboxPlaceHolder,
		LayoutOrder = 5,
		Size = Size,
		[Roact.Ref] = p1.reportTextEntryRef
	})
end

function ReportDialog.renderButtons(p1, _, p2, p3) --[[ Line: 137 ]]
	-- upvalues: list (copy), Roact (copy), Button (copy), ButtonType (copy), FFlagIGMDialogButtonsUseUIBloxButtonModule (copy)
	local Length = utf8.len(utf8.nfcnormalize(p1.state.abuseDescription))
	local IsTypeOfAbuseIndexAbove: boolean = p1.state.typeOfAbuseIndex > 0 or p1.props.userId == nil
	p3.ButtonContainer = Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 6,
		Size = UDim2.new(1, 0, 0, 60)
	}, {
		Layout = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			Padding = UDim.new(0, 12),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		}),
		CancelButton = Roact.createElement(Button, {
			layoutOrder = 1,
			buttonType = ButtonType.Secondary,
			size = UDim2.fromOffset(144, 36),
			text = p2.cancel,
			onActivated = p1.props.dispatchCloseReportDialog,
			DO_NOT_USE_useUIBloxButton = if FFlagIGMDialogButtonsUseUIBloxButtonModule then true else nil
		}),
		ConfirmButton = Roact.createElement(Button, {
			layoutOrder = 2,
			buttonType = ButtonType.PrimarySystem,
			size = UDim2.fromOffset(144, 36),
			isDisabled = not (Length >= 0 and Length <= 160 and IsTypeOfAbuseIndexAbove),
			text = p2.report,
			onActivated = function() --[[ Line: 142 ]]
				-- upvalues: p1 (copy), list (upval)
				p1.props.dispatchSendReport(if p1.props.userId == nil then "Inappropriate Content" else list[p1.state.typeOfAbuseIndex], p1.state.abuseDescription, p1.props.userId)
				p1.props.dispatchCloseReportDialog()
			end,
			DO_NOT_USE_useUIBloxButton = if FFlagIGMDialogButtonsUseUIBloxButtonModule then true else nil
		})
	})
end

function ReportDialog.renderReportPlayer(p1, p2, p3, p4) --[[ Line: 183 ]]
	-- upvalues: Roact (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), AssetsModule (copy), ImageSetLabel (copy), Cryo (copy), ThemedTextLabelModule (copy), DropDownSelectionModule (copy), Selections (copy)
	p1:renderReportTitle(p2, p4, p3.reportPlayerTitle)
	local Frame = {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0.5, -140, 0.5, 0),
		Size = UDim2.new(0, 44, 0, 44)
	}
	local UserId: number = p1.props.userId
	p4.ReportPlayerTextContainer = Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 68)
	}, {
		PlayerCutout = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
			ZIndex = 2,
			AnchorPoint = Frame.AnchorPoint,
			Position = Frame.Position,
			Size = Frame.Size,
			Image = AssetsModule.Images.CircleCutout,
			imageStyle = {
				Transparency = 0,
				Color3 = p2.Theme.BackgroundUIDefault.Color
			}
		}) else Roact.createElement(ImageSetLabel, Cryo.Dictionary.join(Frame, {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Image = AssetsModule.Images.CircleCutout,
			ImageColor3 = p2.Theme.BackgroundUIDefault.Color
		})),
		PlayerIcon = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
			AnchorPoint = Frame.AnchorPoint,
			Position = Frame.Position,
			Size = Frame.Size,
			Image = UserId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. UserId .. "&w=48&h=48" or ""
		}) else Roact.createElement(ImageSetLabel, Cryo.Dictionary.join(Frame, {
			BackgroundTransparency = 1,
			Image = UserId > 0 and "rbxthumb://type=AvatarHeadShot&id=" .. UserId .. "&w=48&h=48" or ""
		})),
		PlayerBackground = Roact.createElement("Frame", Cryo.Dictionary.join(Frame, {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ZIndex = 0,
			BackgroundColor3 = p2.Theme.UIDefault.Color
		})),
		PlayerName = Roact.createElement(ThemedTextLabelModule, {
			fontKey = "Body",
			themeKey = "TextEmphasis",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0.5, -76, 0.5, 0),
			Size = UDim2.new(0.5, 76, 0, 44),
			Text = p1.props.userName,
			TextXAlignment = Enum.TextXAlignment.Left
		})
	})
	p4.AbuseTypeDropDown = Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 4,
		Size = UDim2.new(1, 0, 0, 68)
	}, {
		DropDown = Roact.createElement(DropDownSelectionModule, {
			localize = true,
			enabled = true,
			selectionParentName = "abuseTypeDropDown",
			Size = UDim2.new(1, 0, 0, 44),
			placeHolderText = p3.selectTypeOfAbuse,
			selections = Selections,
			selectedIndex = p1.state.typeOfAbuseIndex,
			canOpen = p1.props.canCaptureFocus,
			canCaptureFocus = p1.props.isGamepadLastInput,
			selectionChanged = function(TypeOfAbuseIndex) --[[ Line: 269 ]]
				-- upvalues: p1 (copy)
				p1:setState({ typeOfAbuseIndex = TypeOfAbuseIndex })
			end,
			ButtonRef = p1.reportDropDownRef
		})
	})
	p1:renderTextEntryField(p3, p4, UDim2.new(1, 0, 0, 180))
	p1:renderButtons(p2, p3, p4)
end

function ReportDialog.renderReportGame(p1, p2, p3, p4) --[[ Line: 282 ]]
	-- upvalues: AssetsModule (copy), Roact (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), ImageSetLabel (copy), ThemedTextLabelModule (copy)
	p1:renderReportTitle(p2, p4, "Report " .. p1.props.placeName)
	local Text = if game.GameId > 0 then "rbxthumb://type=GameIcon&id=" .. game.GameId .. "&w=150&h=150" else AssetsModule.Images.PlaceholderGameIcon
	p4.ReportGameTextContainer = Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 126)
	}, {
		GameIcon = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 17, 0.5, 0),
			Size = UDim2.new(0, 64, 0, 64),
			Image = Text
		}) else Roact.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 17, 0.5, 0),
			Size = UDim2.new(0, 64, 0, 64),
			Image = Text
		}),
		GameName = Roact.createElement(ThemedTextLabelModule, {
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

function ReportDialog.render(p1) --[[ Line: 327 ]]
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), WithLocalizationModule (copy), Roact (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), AssetsModule (copy), ImageSetLabel (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy), FocusHandlerModule (copy), GuiService (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2) --[[ Line: 328 ]]
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
	end, function(p2) --[[ Line: 337 ]]
		-- upvalues: WithLocalizationModule (upval), p1 (copy), Roact (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), AssetsModule (upval), ImageSetLabel (upval), GetFFlagIGMGamepadSelectionHistoryModule (upval), FocusHandlerModule (upval), GuiService (upval)
		return WithLocalizationModule({
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
		})(function(p3) --[[ Line: 349 ]]
			-- upvalues: Roact (upval), p1 (upval), p2 (copy), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), AssetsModule (upval), ImageSetLabel (upval), GetFFlagIGMGamepadSelectionHistoryModule (upval), FocusHandlerModule (upval), GuiService (upval)
			local config = {
				Padding = Roact.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, 24),
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 24)
				}),
				Layout = Roact.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				})
			}
			
			if p1.props.userId == nil then
				p1:renderReportGame(p2, p3, config)
			else
				p1:renderReportPlayer(p2, p3, config)
			end
			return Roact.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				ZIndex = 8,
				Visible = p1.props.isOpen,
				[Roact.Ref] = p1.selectionGroupRef
			}, {
				Overlay = Roact.createElement("TextButton", {
					AutoButtonColor = false,
					BorderSizePixel = 0,
					Text = "",
					Selectable = false,
					BackgroundColor3 = p2.Theme.Overlay.Color,
					BackgroundTransparency = p2.Theme.Overlay.Transparency,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				DialogMainFrame = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = AssetsModule.Images.RoundedRectImageKey,
					imageStyle = {
						Color3 = p2.Theme.BackgroundUIDefault.Color,
						Transparency = p2.Theme.BackgroundUIDefault.Transparency
					},
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, 600, 0, 450),
					slice = { center = Rect.new(8, 8, 9, 9) }
				}, config) else Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Image = AssetsModule.Images.RoundedRect.Image,
					ImageColor3 = p2.Theme.BackgroundUIDefault.Color,
					ImageTransparency = p2.Theme.BackgroundUIDefault.Transparency,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
					Size = UDim2.new(0, 600, 0, 450),
					SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter
				}, config),
				FocusHandler = GetFFlagIGMGamepadSelectionHistoryModule() and Roact.createElement(FocusHandlerModule, {
					isFocused = p1.props.canCaptureFocus and p1.props.isGamepadLastInput,
					shouldForgetPreviousSelection = not p1.props.isOpen,
					didFocus = function(p4) --[[ Line: 411 ]]
						-- upvalues: p1 (upval), GuiService (upval)
						local Value = if p1.props.userId then p1.reportDropDownRef:getValue() else p1.reportTextEntryRef:getValue()
						GuiService.SelectedCoreObject = p4 or Value
					end
				}) or nil
			})
		end)
	end)
end

function ReportDialog.bindActions(p1) --[[ Line: 426 ]]
	-- upvalues: ContextActionService (copy)
	ContextActionService:BindCoreAction("InGameMenuReportModalClose", function(_, UserInputState, _) --[[ Line: 427 | Named "closeReportFunc" ]]
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.Begin then
			p1.props.dispatchCloseReportDialog()
		end
	end, false, Enum.KeyCode.Escape)
end

function ReportDialog:unbindActions() --[[ Line: 436 ]]
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("InGameMenuReportModalClose")
end

function ReportDialog.didMount(p1) --[[ Line: 440 ]]
	-- upvalues: GuiService (copy)
	GuiService:RemoveSelectionGroup("ReportDialogGroup")
	GuiService:AddSelectionParent("ReportDialogGroup", p1.selectionGroupRef:getValue())
	
	if p1.props.isOpen then
		p1:bindActions()
	end
end

function ReportDialog.didUpdate(p1, p2) --[[ Line: 449 ]]
	-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (copy), GuiService (copy)
	if p2.isOpen and not p1.props.isOpen then
		p1:setState({ typeOfAbuseIndex = 0, abuseDescription = "" })
	end
	if not GetFFlagIGMGamepadSelectionHistoryModule() and (not p2.canCaptureFocus or not p2.isGamepadLastInput) and (p1.props.canCaptureFocus and p1.props.isGamepadLastInput) then
		GuiService.SelectedCoreObject = if p1.props.userId then p1.reportDropDownRef:getValue() else p1.reportTextEntryRef:getValue()
	end
	if p1.props.isOpen then
		p1:bindActions()
		
		return
	else
		p1:unbindActions()
	end
end

function ReportDialog.willUnmount(p1) --[[ Line: 481 ]]
	p1:unbindActions()
end

return RoactRodux.UNSTABLE_connect2(function(p1, _) --[[ Line: 485 ]]
	-- upvalues: ConstantsModule (copy)
	return {
		isOpen = p1.report.dialogOpen,
		userId = p1.report.userId,
		userName = p1.report.userName,
		placeName = p1.gameInfo.name,
		canCaptureFocus = p1.report.dialogOpen and not p1.respawn.dialogOpen,
		isGamepadLastInput = p1.displayOptions.inputType == ConstantsModule.InputType.Gamepad
	}
end, function(Callback) --[[ Line: 494 ]]
	-- upvalues: CloseReportDialogModule (copy), SendReportModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy)
	return {
		dispatchCloseReportDialog = function() --[[ Line: 496 ]]
			-- upvalues: Callback (copy), CloseReportDialogModule (upval)
			Callback(CloseReportDialogModule())
		end,
		dispatchSendReport = function(p1, p2, p3) --[[ Line: 499 ]]
			-- upvalues: Callback (copy), SendReportModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
			Callback(SendReportModule(p1, p2, p3))
			local List = {}
			
			if p1 == "Inappropriate Content" then
				table.insert(List, "report_type=game")
				table.insert(List, "reported_entity_id=" .. tostring(game.GameId))
			else
				table.insert(List, "report_type=user")
				table.insert(List, "reported_entity_id=" .. tostring(p3))
			end
			table.insert(List, "report_source=ingame")
			SendAnalyticsModule(ConstantsModule.AnalyticsReportSubmittedName, table.concat(List, "&"), {})
		end
	}
end)(ReportDialog)