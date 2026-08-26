local _ = game:GetService("ContextActionService")
local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("GuiService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local cryoModule = require(corePackagesService.Packages.Cryo)
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local parent = script.Parent.Parent
local dependenciesModule = require(parent.Dependencies)
local _ = require(dependenciesModule.FocusHandler)
local playerInterfaceModule = require(dependenciesModule.playerInterface)
local themedTextLabelModule = require(dependenciesModule.ThemedTextLabel)
local withLocalizationModule = require(dependenciesModule.withLocalization)
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local withVoiceState = require(robloxGui.Modules.VoiceChat.VoiceStateContext).withVoiceState
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local gameIconModule = require(dependenciesModule.GameIcon)
local _ = require(parent.Components.BlockPlayerItem)
local endReportFlowModule = require(parent.Actions.EndReportFlow)
local _ = require(parent.Actions.OpenBlockPlayerDialog)
local selectReportCategoryModule = require(parent.Actions.SelectReportCategory)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local sessionUtilityModule = require(parent.Utility.SessionUtility)
local constantsModule = require(parent.Resources.Constants)
local modalDialogModule = require(parent.Components.ModalDialog)
local assetsModule = require(parent.Resources.Assets)
local _ = require(parent.Components.GameCell)
local barOnTopScrollingFrameModule = require(dependenciesModule.BarOnTopScrollingFrame)
local cell = UIBloxModule.App.Table.Cell
local provider = UIBloxModule.Core.Style.Provider
local withStyle = UIBloxModule.Core.Style.withStyle
local colors = UIBloxModule.App.Style.Colors
local fFlagTopBarSignalizeScreenSize = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local t = {
	BackgroundDefault = { Transparency = 1, Color = colors.Flint },
	BackgroundOnHover = { Transparency = 0.666, Color = colors.Graphite },
	BackgroundOnPress = { Transparency = 0, Color = colors.Graphite }
}

local function Divider(p1)
	-- upvalues: roactModule (ref), cryoModule (ref), colors (ref)
	return roactModule.createElement("Frame", cryoModule.Dictionary.join({ Size = UDim2.new(1, 0, 0, 1) }, p1, {
		BorderSizePixel = 0,
		BackgroundTransparency = 0.5,
		BackgroundColor3 = colors.Graphite,
		theme = cryoModule.None
	}))
end

local function CategoryCellContent(p1)
	-- upvalues: roactModule (ref), imageSetLabel (ref), themedTextLabelModule (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 72),
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		ListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		IconFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, 68, 1, 0)
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			CustomIcon = p1.iconComponent or nil,
			Icon = p1.icon and roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				Image = p1.icon.Image,
				Size = p1.icon.Size
			})
		}),
		TextFrame = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -68, 1, 0)
		}, {
			ListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 2)
			}),
			Text = roactModule.createElement(themedTextLabelModule, {
				themeKey = "TextEmphasis",
				fontKey = "Header2",
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(1, 0, 0, 20),
				Text = p1.text,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			SubText = roactModule.createElement(themedTextLabelModule, {
				fontKey = "CaptionBody",
				themeKey = "TextMuted",
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(1, 0, 0, 14),
				Text = p1.subtext,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left
			})
		})
	})
end

local function CategoryCell(p1)
	-- upvalues: roactModule (ref), cell (ref), CategoryCellContent (ref)
	return roactModule.createElement(cell, {
		userInteractionEnabled = true,
		onActivated = p1.onActivated,
		layoutOrder = p1.layoutOrder,
		size = UDim2.new(1, 0, 0, 72),
		head = CategoryCellContent(p1),
		tail = roactModule.createElement("Frame")
	})
end

local reportCategoryDialog = roactModule.PureComponent:extend("ReportCategoryDialog")
reportCategoryDialog.validateProps = tModule.strictInterface({
	isReportCategoryMenuOpen = tModule.boolean,
	screenSize = if fFlagTopBarSignalizeScreenSize then nil else tModule.Vector2,
	inputType = tModule.optional(tModule.string),
	reportType = tModule.optional(tModule.valueOf(constantsModule.ReportType)),
	targetPlayer = tModule.optional(playerInterfaceModule),
	closeDialog = tModule.callback,
	selectReportCategory = tModule.optional(tModule.callback),
	playerFocusedFlow = tModule.boolean
})

function reportCategoryDialog.init(p1)
	-- upvalues: roactModule (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	p1.buttonRef = roactModule.createRef()
	
	function p3.onCancel()
		-- upvalues: p1 (ref)
		p1.props.closeDialog()
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = signalsModule.createEffect(function(p2)
			-- upvalues: p1 (ref), getViewportSize (ref)
			p1:setState({ screenSize = getViewportSize(p2) })
		end)
	end
end

function reportCategoryDialog.willUnmount(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

function reportCategoryDialog.renderContents(p1, p2, p3)
	-- upvalues: roactModule (ref), default (ref), cryoModule (ref), CategoryCell (ref), assetsModule (ref), constantsModule (ref), Divider (ref), gameIconModule (ref), withStyle (ref), t (ref), provider (ref), barOnTopScrollingFrameModule (ref)
	local _ = p1.props
	local t_1 = {
		ListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local var1 = p2
	
	if p2 then
		local recentUsersInteractionData = default:getRecentUsersInteractionData()
		
		if not recentUsersInteractionData or cryoModule.isEmpty(recentUsersInteractionData) then
			var1 = false
		elseif p1.props.playerFocusedFlow then
			var1 = p1.props.targetPlayer and recentUsersInteractionData[tostring(p1.props.targetPlayer.UserId)] ~= nil
		end
	end
	if var1 then
		table.insert(t_1, roactModule.createElement(CategoryCell, {
			text = p3.voiceHeader,
			subtext = p3.voiceDescription,
			icon = assetsModule.Images.VoiceChatIcon,
			layoutOrder = #t_1 + 1,
			onActivated = function()
				-- upvalues: p1 (ref), constantsModule (copy)
				p1.props.selectReportCategory(constantsModule.Category.Voice)
			end
		}))
		table.insert(t_1, roactModule.createElement(Divider, { LayoutOrder = #t_1 + 1 }))
	end
	table.insert(t_1, roactModule.createElement(CategoryCell, {
		text = p3.textHeader,
		subtext = p3.textDescription,
		icon = assetsModule.Images.TextChatIcon,
		layoutOrder = #t_1 + 1,
		onActivated = function()
			-- upvalues: p1 (ref), constantsModule (copy)
			p1.props.selectReportCategory(constantsModule.Category.Text)
		end
	}))
	table.insert(t_1, roactModule.createElement(Divider, { LayoutOrder = #t_1 + 1 }))
	
	if not p1.props.playerFocusedFlow then
		table.insert(t_1, roactModule.createElement(CategoryCell, {
			iconComponent = roactModule.createElement(gameIconModule, {
				iconSize = 33,
				gameId = game.GameId,
				cornerRadius = UDim.new(0, 8)
			}),
			text = p3.experienceHeader,
			subtext = p3.experienceDescription,
			layoutOrder = #t_1 + 1,
			onActivated = function()
				-- upvalues: p1 (ref), constantsModule (copy)
				p1.props.selectReportCategory(constantsModule.Category.Experience)
			end
		}))
		table.insert(t_1, roactModule.createElement(Divider, { LayoutOrder = #t_1 + 1 }))
	end
	table.insert(t_1, roactModule.createElement(CategoryCell, {
		text = p3.otherHeader,
		subtext = p3.otherDescription,
		icon = assetsModule.Images.OtherIcon,
		layoutOrder = #t_1 + 1,
		onActivated = function()
			-- upvalues: p1 (ref), constantsModule (copy)
			p1.props.selectReportCategory(constantsModule.Category.Other)
		end
	}))
	table.insert(t_1, roactModule.createElement(Divider, { LayoutOrder = #t_1 + 1 }))
	
	return withStyle(function(p4)
		-- upvalues: cryoModule (copy), t (copy), roactModule (copy), provider (copy), barOnTopScrollingFrameModule (copy), p1 (ref), t_1 (ref)
		return roactModule.createElement(provider, {
			style = cryoModule.Dictionary.join(p4, { Theme = cryoModule.Dictionary.join(p4.Theme, t) })
		}, {
			roactModule.createElement(barOnTopScrollingFrameModule, {
				Size = UDim2.fromScale(1, 1),
				CanvasSize = UDim2.new(1, 0, 0, 72),
				scrollingFrameRef = p1.scrollingFrameRef
			}, t_1)
		})
	end)
end

function reportCategoryDialog.render(p1)
	-- upvalues: withVoiceState (ref), withLocalizationModule (ref), roactModule (ref), modalDialogModule (ref), fFlagTopBarSignalizeScreenSize (ref)
	return withVoiceState(function(p2)
		-- upvalues: withLocalizationModule (copy), roactModule (copy), modalDialogModule (copy), p1 (ref), fFlagTopBarSignalizeScreenSize (copy)
		return withLocalizationModule({
			titleText = "CoreScripts.InGameMenu.Report.MenuTitle",
			dismissText = "CoreScripts.InGameMenu.Report.Done",
			voiceHeader = "CoreScripts.InGameMenu.Report.Category.Header.Voice",
			voiceDescription = "CoreScripts.InGameMenu.Report.Category.Description.Voice",
			textHeader = "CoreScripts.InGameMenu.Report.Category.Header.Text",
			textDescription = "CoreScripts.InGameMenu.Report.Category.Description.Text",
			experienceHeader = "CoreScripts.InGameMenu.Report.Category.Header.Experience",
			experienceDescription = "CoreScripts.InGameMenu.Report.Category.Description.Experience",
			otherHeader = "CoreScripts.InGameMenu.Report.Category.Header.Other",
			otherDescription = "CoreScripts.InGameMenu.Report.Category.Description.Other"
		})(function(p3)
			-- upvalues: roactModule (copy), modalDialogModule (copy), p1 (copy), fFlagTopBarSignalizeScreenSize (copy), p2 (ref)
			return roactModule.createFragment({
				ModalDialog = roactModule.createElement(modalDialogModule, {
					showCloseButton = true,
					visible = p1.props.isReportCategoryMenuOpen,
					screenSize = if fFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
					titleText = p3.titleText,
					contents = p1:renderContents(p2.voiceEnabled, p3),
					onDismiss = p1.onCancel
				})
			})
		end)
	end)
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	-- upvalues: constantsModule (ref), fFlagTopBarSignalizeScreenSize (ref)
	return {
		isReportCategoryMenuOpen = p1.report.currentPage == constantsModule.Page.Category,
		reportType = p1.report.reportType,
		targetPlayer = p1.report.targetPlayer,
		screenSize = if fFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		playerFocusedFlow = p1.report.beginningReportType == constantsModule.ReportType.Player
	}
end, function(p1)
	-- upvalues: selectReportCategoryModule (ref), endReportFlowModule (ref), sendAnalyticsModule (ref), constantsModule (ref), sessionUtilityModule (ref)
	return {
		selectReportCategory = function(p2)
			-- upvalues: p1 (ref), selectReportCategoryModule (copy)
			p1(selectReportCategoryModule(p2))
		end,
		closeDialog = function()
			-- upvalues: p1 (ref), endReportFlowModule (copy), sendAnalyticsModule (copy), constantsModule (copy), sessionUtilityModule (copy)
			p1(endReportFlowModule())
			sendAnalyticsModule(constantsModule.Analytics.ReportType, constantsModule.Analytics.ReportFlowAbandoned, { source = constantsModule.Analytics.ReportType })
			sessionUtilityModule.endAbuseReportSession()
		end
	}
end)(reportCategoryDialog)