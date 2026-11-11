local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.Dependencies)
local BarOnTopScrollingFrameModule = require(DependenciesModule.BarOnTopScrollingFrame)
local DividerModule = require(DependenciesModule.Divider)
local PlayerCellModule = require(DependenciesModule.PlayerCell)
local PlayerSearchPredicateModule = require(DependenciesModule.PlayerSearchPredicate)
local SearchBarModule = require(DependenciesModule.SearchBar)
local _ = require(DependenciesModule.ThemedTextLabel)
local WithLocalizationModule = require(DependenciesModule.withLocalization)
local NavigateBackModule = require(Parent.Actions.NavigateBack)
local EndReportFlowModule = require(Parent.Actions.EndReportFlow)
local SelectReportListingModule = require(Parent.Actions.SelectReportListing)
local _ = require(Parent.Resources.Assets)
local ConstantsModule = require(Parent.Resources.Constants)
local ModalDialogModule = require(Parent.Components.ModalDialog)
local GameCellModule = require(Parent.Components.GameCell)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local SessionUtilityModule = require(Parent.Utility.SessionUtility)
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Default = require(RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local VoiceIndicatorFuncModule = require(RobloxGui.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local VoiceStateContextModule = require(RobloxGui.Modules.VoiceChat.VoiceStateContext)
local ConstantsModule1 = require(RobloxGui.Modules.VoiceChat.Constants)
local ReactModule = require(CorePackages.Packages.React)
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Provider = UIBloxModule.Core.Style.Provider
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local IsPlayerVerifiedFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.isPlayerVerified
local MakeBackButtonFunction = require(CorePackages.Workspace.Packages.AppHeaderBar).makeBackButton
local config = {
	BackgroundDefault = {
		Transparency = 1,
		Color = UIBloxModule.App.Style.Colors.Flint
	}
}
local ReportMenu = RoactModule.PureComponent:extend("ReportMenu")

local function v38(p1)
	-- upvalues: ReactModule (copy), VoiceStateContextModule (copy), VoiceIndicatorFuncModule (copy), CryoModule (copy)
	return if ReactModule.useContext(VoiceStateContextModule.Context).voiceEnabled then ReactModule.createElement(VoiceIndicatorFuncModule, CryoModule.Dictionary.join(p1, {})) else nil
end

ReportMenu.validateProps = TModule.strictInterface({
	isReportMenuOpen = TModule.boolean,
	screenSize = TModule.Vector2,
	closeDialog = TModule.callback,
	openReportDialog = TModule.callback,
	canNavigateBack = TModule.boolean,
	reportCategory = TModule.optional(TModule.string),
	navigateBack = TModule.optional(TModule.callback)
})

function ReportMenu.init(p1)
	-- upvalues: RoactModule (copy), Default (copy)
	p1.scrollingFrameRef = RoactModule.createRef()
	p1.state = { isFilterMode = false, filterText = nil }
	
	function p1.onSearch()
		-- upvalues: p1 (copy)
		p1:setState({ isFilterMode = true, filterText = "" })
	end
	
	function p1.onTextChanged(FilterText)
		-- upvalues: p1 (copy)
		p1:setState({ filterText = FilterText })
	end
	
	function p1.onCancel()
		-- upvalues: p1 (copy), RoactModule (upval)
		p1:setState({ isFilterMode = false, filterText = RoactModule.None })
	end
	
	function p1.scrollToTop()
		-- upvalues: p1 (copy)
		local Value = p1.scrollingFrameRef:getValue()
		
		if Value then
			Value:scrollToTop()
		end
	end
	
	function p1.navigateBack()
		-- upvalues: p1 (copy)
		p1.props.navigateBack(p1.state.filterText ~= nil)
	end
	
	function p1.closeDialog()
		-- upvalues: p1 (copy)
		p1.props.closeDialog(p1.state.filterText ~= nil)
	end
	
	p1.layoutBindings = {}
	
	function p1.getLayoutBinding(p2, Value)
		-- upvalues: p1 (copy), RoactModule (upval)
		local LayoutBinding = p1.layoutBindings[p2]
		
		if not LayoutBinding then
			local Binding, Binding2 = RoactModule.createBinding(Value)
			LayoutBinding = {
				valueBinding = Binding,
				setValue = Binding2,
				value = Value
			}
			p1.layoutBindings[p2] = LayoutBinding
		end
		if LayoutBinding.value ~= Value then
			LayoutBinding.value = Value
			LayoutBinding.setValue(Value)
		end
		return LayoutBinding.valueBinding
	end
	
	function p1.playerIsVoiceActive(p2): boolean
		-- upvalues: Default (upval)
		return Default.participants[tostring(p2)] ~= nil
	end
	
	p1.sortedUserIds = {}
end

local function sortPlayers(Player, Player1): boolean
	return Player.DisplayName:lower() < Player1.DisplayName:lower()
end

function ReportMenu.getPlayerList(p1)
	-- upvalues: CryoModule (copy), Players (copy), sortPlayers (copy), PlayerSearchPredicateModule (copy)
	local List = {}
	
	for _, Player in ipairs((CryoModule.List.sort(Players:GetPlayers(), sortPlayers))) do
		if Player ~= Players.LocalPlayer then
			if not p1.state.isFilterMode then
				table.insert(List, Player)
			elseif PlayerSearchPredicateModule(p1.state.filterText, Player.Name, Player.DisplayName) then
				table.insert(List, Player)
			end
		end
	end
	return (CryoModule.List.sort(List, function(Player, Player1): boolean
		return Player.DisplayName:lower() < Player1.DisplayName:lower()
	end))
end

local config1 = {
	[ConstantsModule.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat",
	[ConstantsModule.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat",
	[ConstantsModule.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other"
}

function ReportMenu.categoryTitle(p2)
	-- upvalues: config1 (copy)
	return config1[p2.props.reportCategory] or "CoreScripts.InGameMenu.Report.MenuTitle"
end

function ReportMenu.renderHeaderBar(p2)
	-- upvalues: MakeBackButtonFunction (copy), RoactModule (copy), IconButton (copy), IconSize (copy), Images (copy), WithLocalizationModule (copy), HeaderBar (copy), SearchBarModule (copy)
	local BackButton = nil
	BackButton = if p2.props.canNavigateBack then MakeBackButtonFunction(p2.navigateBack) else function()
		-- upvalues: RoactModule (upval), IconButton (upval), IconSize (upval), Images (upval), p2 (copy)
		return RoactModule.createElement(IconButton, {
			iconSize = IconSize.Medium,
			icon = Images["icons/navigation/close"],
			onActivated = p2.closeDialog
		})
	end
	
	return if p2.state.isFilterMode then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(24, 6),
		Size = UDim2.new(1, -48, 1, -12)
	}, {
		RoactModule.createElement(SearchBarModule, {
			autoCaptureFocus = true,
			size = UDim2.fromScale(1, 1),
			text = p2.state.filterText,
			onTextChanged = p2.onTextChanged,
			onCancelled = p2.onCancel
		})
	}) else WithLocalizationModule({ titleText = p2:categoryTitle() })(function(p3)
		-- upvalues: RoactModule (upval), HeaderBar (upval), BackButton (ref), IconButton (upval), IconSize (upval), Images (upval), p2 (copy)
		return RoactModule.createElement(HeaderBar, {
			backgroundTransparency = 1,
			barHeight = 48,
			renderLeft = BackButton,
			renderRight = function()
				-- upvalues: RoactModule (upval), IconButton (upval), IconSize (upval), Images (upval), p2 (upval)
				return RoactModule.createElement(IconButton, {
					iconSize = IconSize.Medium,
					icon = Images["icons/common/search"],
					onActivated = p2.onSearch
				})
			end,
			onHeaderActivated = p2.scrollToTop,
			title = p3.titleText
		})
	end)
end

function ReportMenu.renderContents(p2)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), GameCellModule (copy), Default (copy), DividerModule (copy), PlayerCellModule (copy), IsPlayerVerifiedFunction (copy), v38 (copy), ConstantsModule1 (copy), WithStyleFunction (copy), CryoModule (copy), config (copy), Provider (copy), BarOnTopScrollingFrameModule (copy)
	local Props = p2.props
	local IsReportCategoryMatch = p2.props.reportCategory == ConstantsModule.Category.Voice
	local v1 = 0
	local Elements = {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	if not p2.state.isFilterMode and p2.props.reportCategory == ConstantsModule.Category.None then
		Elements.GameCell = RoactModule.createElement(GameCellModule, {
			gameId = game.GameId,
			layoutOrder = p2.getLayoutBinding("GameCell", v1),
			onActivated = function()
				-- upvalues: Props (copy), ConstantsModule (upval)
				Props.openReportDialog(ConstantsModule.ReportType.Place, nil)
			end
		})
	end
	local v2 = v1 + 1
	local YOffset = 72
	local PlayerList = p2:getPlayerList()
	local RecentUsersInteractionData = if IsReportCategoryMatch then Default:getRecentUsersInteractionData() else {}
	p2.sortedUserIds = {}
	
	for _, Player in pairs(PlayerList) do
		local Text = tostring(Player.UserId)
		
		if not IsReportCategoryMatch or RecentUsersInteractionData[tostring(Player.UserId)] then
			table.insert(p2.sortedUserIds, Player.UserId)
			local Count = 0
			
			if IsReportCategoryMatch then
				Count += 1
			end
			if p2.props.isReportMenuOpen then
				Count += 2
			end
			Elements["Divider" .. Text] = RoactModule.createElement(DividerModule, {
				LayoutOrder = p2.getLayoutBinding("Divider" .. Text, v2),
				Size = UDim2.new(1, 0, 0, 1)
			})
			local v3 = v2 + 1
			Elements["PlayerCell" .. Text] = RoactModule.createElement(PlayerCellModule, {
				isOnline = true,
				isSelected = false,
				userId = Player.UserId,
				username = Player.Name,
				displayName = Player.DisplayName,
				hasVerifiedBadge = IsPlayerVerifiedFunction(Player),
				LayoutOrder = p2.getLayoutBinding("PlayerCell" .. Text, v3),
				onActivated = function()
					-- upvalues: Props (copy), ConstantsModule (upval), Player (copy)
					Props.openReportDialog(ConstantsModule.ReportType.Player, Player)
				end,
				memoKey = Count
			}, {
				VoiceIndicator = IsReportCategoryMatch and p2.props.isReportMenuOpen and RoactModule.createElement(v38, {
					hideOnError = true,
					iconStyle = "SpeakerLight",
					userId = tostring(Player.UserId),
					size = UDim2.fromOffset(36, 36),
					onClicked = function()
						-- upvalues: Default (upval), Player (copy), ConstantsModule1 (upval)
						Default:ToggleMutePlayer(Player.UserId, ConstantsModule1.VOICE_CONTEXT_TYPE.REPORT_MENU)
					end
				}) or nil
			})
			v2 = v3 + 1
			YOffset += 73
		end
	end
	Elements.DividerEnd = RoactModule.createElement(DividerModule, {
		LayoutOrder = p2.getLayoutBinding("DividerEnd", v2),
		Size = UDim2.new(1, 0, 0, 1)
	})
	local _ = v2 + 1
	
	return WithStyleFunction(function(p3)
		-- upvalues: CryoModule (upval), config (upval), RoactModule (upval), Provider (upval), BarOnTopScrollingFrameModule (upval), YOffset (ref), p2 (copy), Elements (copy)
		return RoactModule.createElement(Provider, {
			style = CryoModule.Dictionary.join(p3, { Theme = CryoModule.Dictionary.join(p3.Theme, config) })
		}, {
			RoactModule.createElement(BarOnTopScrollingFrameModule, {
				Size = UDim2.fromScale(1, 1),
				CanvasSize = UDim2.new(1, 0, 0, YOffset),
				scrollingFrameRef = p2.scrollingFrameRef
			}, Elements)
		})
	end)
end

function ReportMenu.render(p3)
	-- upvalues: RoactModule (copy), ModalDialogModule (copy)
	return RoactModule.createFragment({
		ModalDialog = RoactModule.createElement(ModalDialogModule, {
			visible = p3.props.isReportMenuOpen,
			screenSize = p3.props.screenSize,
			headerBar = p3:renderHeaderBar(),
			showCloseButton = not (p3.props.reportCategory ~= nil),
			contents = p3:renderContents(),
			onDismiss = p3.closeDialog
		})
	})
end

function ReportMenu.didUpdate(p3, p4)
	-- upvalues: RoactModule (copy)
	if p4.isReportMenuOpen and not p3.props.isReportMenuOpen then
		p3:setState({ isFilterMode = false, filterText = RoactModule.None })
		local Value = p3.scrollingFrameRef:getValue()
		
		if Value and Value.CanvasPosition.Y > 0 then
			Value.CanvasPosition = Vector2.new(0, 0)
		end
	end
end

return RoactRoduxModule.UNSTABLE_connect2(function(p3, _)
	-- upvalues: ConstantsModule (copy)
	return {
		isReportMenuOpen = p3.report.currentPage == ConstantsModule.Page.Listing,
		screenSize = p3.displayOptions.screenSize,
		reportCategory = p3.report.reportCategory,
		canNavigateBack = #p3.report.history > 1
	}
end, function(Callback)
	-- upvalues: NavigateBackModule (copy), SendAnalyticsModule (copy), ConstantsModule (copy), EndReportFlowModule (copy), SessionUtilityModule (copy), SelectReportListingModule (copy)
	return {
		navigateBack = function(FilterTextChanged)
			-- upvalues: Callback (copy), NavigateBackModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
			Callback(NavigateBackModule())
			SendAnalyticsModule(ConstantsModule.Page.Listing, ConstantsModule.Analytics.ReportFlowBack, {
				source = ConstantsModule.Page.Listing,
				filterTextChanged = FilterTextChanged
			})
		end,
		closeDialog = function(FilterTextChanged)
			-- upvalues: Callback (copy), EndReportFlowModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval), SessionUtilityModule (upval)
			Callback(EndReportFlowModule())
			SendAnalyticsModule(ConstantsModule.Page.Listing, ConstantsModule.Analytics.ReportFlowAbandoned, {
				source = ConstantsModule.Page.Listing,
				filterTextChanged = FilterTextChanged
			})
			SessionUtilityModule.endAbuseReportSession()
		end,
		openReportDialog = function(ReportType, Player, p3)
			-- upvalues: Callback (copy), SelectReportListingModule (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
			Callback(SelectReportListingModule(ReportType, Player, p3))
			SendAnalyticsModule(ConstantsModule.Page.Listing, ConstantsModule.Analytics.ReportFlowAdvance, {
				source = ConstantsModule.Page.Listing,
				reportType = ReportType
			})
		end
	}
end)(ReportMenu)