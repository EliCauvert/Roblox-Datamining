local _ = game:GetService("ContextActionService")
local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.Dependencies)
local _ = require(DependenciesModule.FocusHandler)
local ThemedTextLabelModule = require(DependenciesModule.ThemedTextLabel)
local WithLocalizationModule = require(DependenciesModule.withLocalization)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local WithVoiceStateFunction = require(RobloxGui.Modules.VoiceChat.VoiceStateContext).withVoiceState
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GameIconModule = require(DependenciesModule.GameIcon)
local _ = require(Parent.Components.BlockPlayerItem)
local EndReportFlowModule = require(Parent.Actions.EndReportFlow)
local _ = require(Parent.Actions.OpenBlockPlayerDialog)
local SelectReportCategoryModule = require(Parent.Actions.SelectReportCategory)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local SessionUtilityModule = require(Parent.Utility.SessionUtility)
local ConstantsModule = require(Parent.Resources.Constants)
local ModalDialogModule = require(Parent.Components.ModalDialog)
local AssetsModule = require(Parent.Resources.Assets)
local _ = require(Parent.Components.GameCell)
local BarOnTopScrollingFrameModule = require(DependenciesModule.BarOnTopScrollingFrame)
local Cell = UIBloxModule.App.Table.Cell
local Provider = UIBloxModule.Core.Style.Provider
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Colors = UIBloxModule.App.Style.Colors
local FFlagTopBarSignalizeScreenSize = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local config = {
	BackgroundDefault = { Transparency = 1, Color = Colors.Flint },
	BackgroundOnHover = { Transparency = 0.666, Color = Colors.Graphite },
	BackgroundOnPress = { Transparency = 0, Color = Colors.Graphite }
}

local function Divider(p1)
	-- upvalues: RoactModule (copy), CryoModule (copy), Colors (copy)
	return RoactModule.createElement("Frame", CryoModule.Dictionary.join({ Size = UDim2.new(1, 0, 0, 1) }, p1, {
		BorderSizePixel = 0,
		BackgroundTransparency = 0.5,
		BackgroundColor3 = Colors.Graphite,
		theme = CryoModule.None
	}))
end

local function CategoryCellContent(p1)
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), ThemedTextLabelModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 72),
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		IconFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, 68, 1, 0)
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			CustomIcon = p1.iconComponent or nil,
			Icon = p1.icon and RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Image = p1.icon.Image,
				Size = p1.icon.Size
			})
		}),
		TextFrame = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -68, 1, 0)
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 2)
			}),
			Text = RoactModule.createElement(ThemedTextLabelModule, {
				themeKey = "TextEmphasis",
				fontKey = "Header2",
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(1, 0, 0, 20),
				Text = p1.text,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			SubText = RoactModule.createElement(ThemedTextLabelModule, {
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
	-- upvalues: RoactModule (copy), Cell (copy), CategoryCellContent (copy)
	return RoactModule.createElement(Cell, {
		userInteractionEnabled = true,
		onActivated = p1.onActivated,
		layoutOrder = p1.layoutOrder,
		size = UDim2.new(1, 0, 0, 72),
		head = CategoryCellContent(p1),
		tail = RoactModule.createElement("Frame")
	})
end

local ReportCategoryDialog = RoactModule.PureComponent:extend("ReportCategoryDialog")
ReportCategoryDialog.validateProps = TModule.strictInterface({
	isReportCategoryMenuOpen = TModule.boolean,
	screenSize = if FFlagTopBarSignalizeScreenSize then nil else TModule.Vector2,
	inputType = TModule.optional(TModule.string),
	reportType = TModule.optional(TModule.valueOf(ConstantsModule.ReportType)),
	targetPlayer = TModule.optional((require(DependenciesModule.playerInterface))),
	closeDialog = TModule.callback,
	selectReportCategory = TModule.optional(TModule.callback),
	playerFocusedFlow = TModule.boolean
})

function ReportCategoryDialog.init(p1)
	-- upvalues: RoactModule (copy), FFlagTopBarSignalizeScreenSize (copy), DisplayModule (copy), SignalsModule (copy)
	p1.buttonRef = RoactModule.createRef()
	
	function p1.onCancel()
		-- upvalues: p1 (copy)
		p1.props.closeDialog()
	end
	
	if FFlagTopBarSignalizeScreenSize then
		local GetViewportSizeFunction = DisplayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = SignalsModule.createEffect(function(p2)
			-- upvalues: p1 (copy), GetViewportSizeFunction (copy)
			p1:setState({ screenSize = GetViewportSizeFunction(p2) })
		end)
	end
end

function ReportCategoryDialog.willUnmount(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	if FFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

function ReportCategoryDialog.renderContents(p1, VoiceEnabled, p2)
	-- upvalues: RoactModule (copy), Default (copy), CryoModule (copy), CategoryCell (copy), AssetsModule (copy), ConstantsModule (copy), Divider (copy), GameIconModule (copy), WithStyleFunction (copy), config (copy), Provider (copy), BarOnTopScrollingFrameModule (copy)
	local _ = p1.props
	local Elements = {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local Flag: boolean = VoiceEnabled
	
	if VoiceEnabled then
		local RecentUsersInteractionData = Default:getRecentUsersInteractionData()
		
		if RecentUsersInteractionData and not CryoModule.isEmpty(RecentUsersInteractionData) then
			if p1.props.playerFocusedFlow then
				Flag = p1.props.targetPlayer and RecentUsersInteractionData[tostring(p1.props.targetPlayer.UserId)] ~= nil
			end
		else
			Flag = false
		end
	end
	if Flag then
		table.insert(Elements, RoactModule.createElement(CategoryCell, {
			text = p2.voiceHeader,
			subtext = p2.voiceDescription,
			icon = AssetsModule.Images.VoiceChatIcon,
			layoutOrder = #Elements + 1,
			onActivated = function()
				-- upvalues: p1 (copy), ConstantsModule (upval)
				p1.props.selectReportCategory(ConstantsModule.Category.Voice)
			end
		}))
		table.insert(Elements, RoactModule.createElement(Divider, { LayoutOrder = #Elements + 1 }))
	end
	table.insert(Elements, RoactModule.createElement(CategoryCell, {
		text = p2.textHeader,
		subtext = p2.textDescription,
		icon = AssetsModule.Images.TextChatIcon,
		layoutOrder = #Elements + 1,
		onActivated = function()
			-- upvalues: p1 (copy), ConstantsModule (upval)
			p1.props.selectReportCategory(ConstantsModule.Category.Text)
		end
	}))
	table.insert(Elements, RoactModule.createElement(Divider, { LayoutOrder = #Elements + 1 }))
	
	if not p1.props.playerFocusedFlow then
		table.insert(Elements, RoactModule.createElement(CategoryCell, {
			iconComponent = RoactModule.createElement(GameIconModule, {
				iconSize = 33,
				gameId = game.GameId,
				cornerRadius = UDim.new(0, 8)
			}),
			text = p2.experienceHeader,
			subtext = p2.experienceDescription,
			layoutOrder = #Elements + 1,
			onActivated = function()
				-- upvalues: p1 (copy), ConstantsModule (upval)
				p1.props.selectReportCategory(ConstantsModule.Category.Experience)
			end
		}))
		table.insert(Elements, RoactModule.createElement(Divider, { LayoutOrder = #Elements + 1 }))
	end
	table.insert(Elements, RoactModule.createElement(CategoryCell, {
		text = p2.otherHeader,
		subtext = p2.otherDescription,
		icon = AssetsModule.Images.OtherIcon,
		layoutOrder = #Elements + 1,
		onActivated = function()
			-- upvalues: p1 (copy), ConstantsModule (upval)
			p1.props.selectReportCategory(ConstantsModule.Category.Other)
		end
	}))
	table.insert(Elements, RoactModule.createElement(Divider, { LayoutOrder = #Elements + 1 }))
	
	return WithStyleFunction(function(p3)
		-- upvalues: CryoModule (upval), config (upval), RoactModule (upval), Provider (upval), BarOnTopScrollingFrameModule (upval), p1 (copy), Elements (copy)
		return RoactModule.createElement(Provider, {
			style = CryoModule.Dictionary.join(p3, { Theme = CryoModule.Dictionary.join(p3.Theme, config) })
		}, {
			RoactModule.createElement(BarOnTopScrollingFrameModule, {
				Size = UDim2.fromScale(1, 1),
				CanvasSize = UDim2.new(1, 0, 0, 72),
				scrollingFrameRef = p1.scrollingFrameRef
			}, Elements)
		})
	end)
end

function ReportCategoryDialog.render(p1)
	-- upvalues: WithVoiceStateFunction (copy), WithLocalizationModule (copy), RoactModule (copy), ModalDialogModule (copy), FFlagTopBarSignalizeScreenSize (copy)
	return WithVoiceStateFunction(function(p2)
		-- upvalues: WithLocalizationModule (upval), RoactModule (upval), ModalDialogModule (upval), p1 (copy), FFlagTopBarSignalizeScreenSize (upval)
		return WithLocalizationModule({
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
			-- upvalues: RoactModule (upval), ModalDialogModule (upval), p1 (upval), FFlagTopBarSignalizeScreenSize (upval), p2 (copy)
			return RoactModule.createFragment({
				ModalDialog = RoactModule.createElement(ModalDialogModule, {
					showCloseButton = true,
					visible = p1.props.isReportCategoryMenuOpen,
					screenSize = if FFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
					titleText = p3.titleText,
					contents = p1:renderContents(p2.voiceEnabled, p3),
					onDismiss = p1.onCancel
				})
			})
		end)
	end)
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	-- upvalues: ConstantsModule (copy), FFlagTopBarSignalizeScreenSize (copy)
	return {
		isReportCategoryMenuOpen = p1.report.currentPage == ConstantsModule.Page.Category,
		reportType = p1.report.reportType,
		targetPlayer = p1.report.targetPlayer,
		screenSize = if FFlagTopBarSignalizeScreenSize then nil else p1.displayOptions.screenSize,
		playerFocusedFlow = p1.report.beginningReportType == ConstantsModule.ReportType.Player
	}
end, function(Callback)
	-- upvalues: SelectReportCategoryModule (copy), EndReportFlowModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy), SessionUtilityModule (copy)
	return {
		selectReportCategory = function(p1)
			-- upvalues: Callback (copy), SelectReportCategoryModule (upval)
			Callback(SelectReportCategoryModule(p1))
		end,
		closeDialog = function()
			-- upvalues: Callback (copy), EndReportFlowModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval), SessionUtilityModule (upval)
			Callback(EndReportFlowModule())
			SendAnalyticsModule(ConstantsModule.Analytics.ReportType, ConstantsModule.Analytics.ReportFlowAbandoned, { source = ConstantsModule.Analytics.ReportType })
			SessionUtilityModule.endAbuseReportSession()
		end
	}
end)(ReportCategoryDialog)