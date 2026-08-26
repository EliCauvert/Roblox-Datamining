local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent
local dependenciesModule = require(parent.Dependencies)
local barOnTopScrollingFrameModule = require(dependenciesModule.BarOnTopScrollingFrame)
local dividerModule = require(dependenciesModule.Divider)
local playerCellModule = require(dependenciesModule.PlayerCell)
local playerSearchPredicateModule = require(dependenciesModule.PlayerSearchPredicate)
local searchBarModule = require(dependenciesModule.SearchBar)
local _ = require(dependenciesModule.ThemedTextLabel)
local withLocalizationModule = require(dependenciesModule.withLocalization)
local navigateBackModule = require(parent.Actions.NavigateBack)
local endReportFlowModule = require(parent.Actions.EndReportFlow)
local selectReportListingModule = require(parent.Actions.SelectReportListing)
local _ = require(parent.Resources.Assets)
local constantsModule = require(parent.Resources.Constants)
local modalDialogModule = require(parent.Components.ModalDialog)
local gameCellModule = require(parent.Components.GameCell)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local sessionUtilityModule = require(parent.Utility.SessionUtility)
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local default = require(robloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local voiceIndicatorFuncModule = require(robloxGui.Modules.VoiceChat.Components.VoiceIndicatorFunc)
local voiceStateContextModule = require(robloxGui.Modules.VoiceChat.VoiceStateContext)
local constantsModule_1 = require(robloxGui.Modules.VoiceChat.Constants)
local reactModule = require(corePackagesService.Packages.React)
local colors = UIBloxModule.App.Style.Colors
local headerBar = UIBloxModule.App.Bar.HeaderBar
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local provider = UIBloxModule.Core.Style.Provider
local images = UIBloxModule.App.ImageSet.Images
local withStyle = UIBloxModule.Core.Style.withStyle
local isPlayerVerified = require(corePackagesService.Workspace.Packages.UserLib).Utils.isPlayerVerified
local makeBackButton = require(corePackagesService.Workspace.Packages.AppHeaderBar).makeBackButton
local t = {
	BackgroundDefault = { Transparency = 1, Color = colors.Flint }
}
local reportMenu = roactModule.PureComponent:extend("ReportMenu")

local var1 = function(p1)
	-- upvalues: reactModule (ref), voiceStateContextModule (ref), voiceIndicatorFuncModule (ref), cryoModule (ref)
	return if reactModule.useContext(voiceStateContextModule.Context).voiceEnabled then reactModule.createElement(voiceIndicatorFuncModule, cryoModule.Dictionary.join(p1, {})) else nil
end

reportMenu.validateProps = tModule.strictInterface({
	isReportMenuOpen = tModule.boolean,
	screenSize = tModule.Vector2,
	closeDialog = tModule.callback,
	openReportDialog = tModule.callback,
	canNavigateBack = tModule.boolean,
	reportCategory = tModule.optional(tModule.string),
	navigateBack = tModule.optional(tModule.callback)
})

function reportMenu.init(p1)
	-- upvalues: roactModule (ref), default (ref)
	p1.scrollingFrameRef = roactModule.createRef()
	p1.state = { isFilterMode = false, filterText = nil }
	
	function p1.onSearch()
		-- upvalues: p1 (ref)
		p1:setState({ isFilterMode = true, filterText = "" })
	end
	
	function p1.onTextChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ filterText = p2 })
	end
	
	function p1.onCancel()
		-- upvalues: p1 (ref), roactModule (copy)
		p1:setState({ isFilterMode = false, filterText = roactModule.None })
	end
	
	function p1.scrollToTop()
		-- upvalues: p1 (ref)
		local value = p1.scrollingFrameRef:getValue()
		
		if value then
			value:scrollToTop()
		end
	end
	
	function p1.navigateBack()
		-- upvalues: p1 (ref)
		p1.props.navigateBack(p1.state.filterText ~= nil)
	end
	
	function p1.closeDialog()
		-- upvalues: p1 (ref)
		p1.props.closeDialog(p1.state.filterText ~= nil)
	end
	
	p1.layoutBindings = {}
	
	function p1.getLayoutBinding(p2, p3)
		-- upvalues: p1 (ref), roactModule (copy)
		local var2 = p1.layoutBindings[p2]
		
		if not var2 then
			local var3, var4 = roactModule.createBinding(p3)
			var2 = { valueBinding = var3, setValue = var4, value = p3 }
			p1.layoutBindings[p2] = var2
		end
		if var2.value ~= p3 then
			var2.value = p3
			var2.setValue(p3)
		end
		return var2.valueBinding
	end
	
	function p1.playerIsVoiceActive(p2)
		-- upvalues: default (copy)
		return default.participants[tostring(p2)] ~= nil
	end
	
	p1.sortedUserIds = {}
end

local function sortPlayers(p1, p2)
	return p1.DisplayName:lower() < p2.DisplayName:lower()
end

function reportMenu.getPlayerList(p1)
	-- upvalues: cryoModule (ref), playersService (ref), sortPlayers (ref), playerSearchPredicateModule (ref)
	local t = {}
	
	for i, v in ipairs(cryoModule.List.sort(playersService:GetPlayers(), sortPlayers)) do
		if v ~= playersService.LocalPlayer then
			if not p1.state.isFilterMode then
				table.insert(t, v)
			elseif playerSearchPredicateModule(p1.state.filterText, v.Name, v.DisplayName) then
				table.insert(t, v)
			end
		end
	end
	return cryoModule.List.sort(t, function(p2, p3)
		return p2.DisplayName:lower() < p3.DisplayName:lower()
	end)
end

local t_1 = {
	[constantsModule.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat",
	[constantsModule.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat",
	[constantsModule.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other"
}

function reportMenu.categoryTitle(p2)
	-- upvalues: t_1 (ref)
	return t_1[p2.props.reportCategory] or "CoreScripts.InGameMenu.Report.MenuTitle"
end

function reportMenu.renderHeaderBar(p2)
	-- upvalues: makeBackButton (ref), roactModule (ref), iconButton (ref), iconSize (ref), images (ref), withLocalizationModule (ref), headerBar (ref), searchBarModule (ref)
	local var2 = if p2.props.canNavigateBack then makeBackButton(p2.navigateBack) else function()
		-- upvalues: roactModule (copy), iconButton (copy), iconSize (copy), images (copy), p2 (ref)
		return roactModule.createElement(iconButton, {
			iconSize = iconSize.Medium,
			icon = images["icons/navigation/close"],
			onActivated = p2.closeDialog
		})
	end
	
	return if p2.state.isFilterMode then roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(24, 6),
		Size = UDim2.new(1, -48, 1, -12)
	}, {
		roactModule.createElement(searchBarModule, {
			autoCaptureFocus = true,
			size = UDim2.fromScale(1, 1),
			text = p2.state.filterText,
			onTextChanged = p2.onTextChanged,
			onCancelled = p2.onCancel
		})
	}) else withLocalizationModule({ titleText = p2:categoryTitle() })(function(p3)
		-- upvalues: roactModule (copy), headerBar (copy), var2 (write), iconButton (copy), iconSize (copy), images (copy), p2 (ref)
		return roactModule.createElement(headerBar, {
			backgroundTransparency = 1,
			barHeight = 48,
			renderLeft = var2,
			renderRight = function()
				-- upvalues: roactModule (copy), iconButton (copy), iconSize (copy), images (copy), p2 (copy)
				return roactModule.createElement(iconButton, {
					iconSize = iconSize.Medium,
					icon = images["icons/common/search"],
					onActivated = p2.onSearch
				})
			end,
			onHeaderActivated = p2.scrollToTop,
			title = p3.titleText
		})
	end)
end

function reportMenu.renderContents(p2)
	-- upvalues: constantsModule (ref), roactModule (ref), gameCellModule (ref), default (ref), dividerModule (ref), playerCellModule (ref), isPlayerVerified (ref), var1 (ref), constantsModule_1 (ref), withStyle (ref), cryoModule (ref), t (ref), provider (ref), barOnTopScrollingFrameModule (ref)
	local props = p2.props
	local var2 = p2.props.reportCategory == constantsModule.Category.Voice
	local var3 = 0
	local t_1 = {
		ListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	if not p2.state.isFilterMode and p2.props.reportCategory == constantsModule.Category.None then
		t_1.GameCell = roactModule.createElement(gameCellModule, {
			gameId = game.GameId,
			layoutOrder = p2.getLayoutBinding("GameCell", var3),
			onActivated = function()
				-- upvalues: props (ref), constantsModule (copy)
				props.openReportDialog(constantsModule.ReportType.Place, nil)
			end
		})
	end
	var3 += 1
	local var4 = 72
	local playerList = p2:getPlayerList()
	local var5 = if var2 then default:getRecentUsersInteractionData() else {}
	p2.sortedUserIds = {}
	
	for i, v in pairs(playerList) do
		local var6 = tostring(v.UserId)
		
		if not var2 or var5[tostring(v.UserId)] then
			table.insert(p2.sortedUserIds, v.UserId)
			local var7 = 0
			
			if var2 then
				var7 += 1
			end
			if p2.props.isReportMenuOpen then
				var7 += 2
			end
			t_1["Divider" .. var44] = roactModule.createElement(dividerModule, {
				LayoutOrder = p2.getLayoutBinding("Divider" .. var44, var3),
				Size = UDim2.new(1, 0, 0, 1)
			})
			var3 += 1
			t_1["PlayerCell" .. var44] = roactModule.createElement(playerCellModule, {
				isOnline = true,
				isSelected = false,
				userId = v.UserId,
				username = v.Name,
				displayName = v.DisplayName,
				hasVerifiedBadge = isPlayerVerified(v),
				LayoutOrder = p2.getLayoutBinding("PlayerCell" .. var44, var3),
				onActivated = function()
					-- upvalues: props (ref), constantsModule (copy), v (ref)
					props.openReportDialog(constantsModule.ReportType.Player, v)
				end,
				memoKey = var7
			}, {
				VoiceIndicator = var2 and (p2.props.isReportMenuOpen and (roactModule.createElement(var1, {
					hideOnError = true,
					iconStyle = "SpeakerLight",
					userId = tostring(v.UserId),
					size = UDim2.fromOffset(36, 36),
					onClicked = function()
						-- upvalues: default (copy), v (ref), constantsModule_1 (copy)
						default:ToggleMutePlayer(v.UserId, constantsModule_1.VOICE_CONTEXT_TYPE.REPORT_MENU)
					end
				}) or nil))
			})
			var3 += 1
			var4 += 73
		end
	end
	t_1.DividerEnd = roactModule.createElement(dividerModule, {
		LayoutOrder = p2.getLayoutBinding("DividerEnd", var3),
		Size = UDim2.new(1, 0, 0, 1)
	})
	var3 += 1
	
	return withStyle(function(p3)
		-- upvalues: cryoModule (copy), t (copy), roactModule (copy), provider (copy), barOnTopScrollingFrameModule (copy), var4 (write), p2 (ref), t_1 (ref)
		return roactModule.createElement(provider, {
			style = cryoModule.Dictionary.join(p3, { Theme = cryoModule.Dictionary.join(p3.Theme, t) })
		}, {
			roactModule.createElement(barOnTopScrollingFrameModule, {
				Size = UDim2.fromScale(1, 1),
				CanvasSize = UDim2.new(1, 0, 0, var4),
				scrollingFrameRef = p2.scrollingFrameRef
			}, t_1)
		})
	end)
end

function reportMenu.render(p3)
	-- upvalues: roactModule (ref), modalDialogModule (ref)
	return roactModule.createFragment({
		ModalDialog = roactModule.createElement(modalDialogModule, {
			visible = p3.props.isReportMenuOpen,
			screenSize = p3.props.screenSize,
			headerBar = p3:renderHeaderBar(),
			showCloseButton = not (p3.props.reportCategory ~= nil),
			contents = p3:renderContents(),
			onDismiss = p3.closeDialog
		})
	})
end

function reportMenu.didUpdate(p3, p4)
	-- upvalues: roactModule (ref)
	if p4.isReportMenuOpen and not p3.props.isReportMenuOpen then
		p3:setState({ isFilterMode = false, filterText = roactModule.None })
		local value = p3.scrollingFrameRef:getValue()
		
		if value and value.CanvasPosition.Y > 0 then
			value.CanvasPosition = Vector2.new(0, 0)
		end
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p3, _)
	-- upvalues: constantsModule (ref)
	return {
		isReportMenuOpen = p3.report.currentPage == constantsModule.Page.Listing,
		screenSize = p3.displayOptions.screenSize,
		reportCategory = p3.report.reportCategory,
		canNavigateBack = #p3.report.history > 1
	}
end, function(p3)
	-- upvalues: navigateBackModule (ref), sendAnalyticsModule (ref), constantsModule (ref), endReportFlowModule (ref), sessionUtilityModule (ref), selectReportListingModule (ref)
	return {
		navigateBack = function(p4)
			-- upvalues: p3 (ref), navigateBackModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p3(navigateBackModule())
			sendAnalyticsModule(constantsModule.Page.Listing, constantsModule.Analytics.ReportFlowBack, {
				source = constantsModule.Page.Listing,
				filterTextChanged = p4
			})
		end,
		closeDialog = function(p4)
			-- upvalues: p3 (ref), endReportFlowModule (copy), sendAnalyticsModule (copy), constantsModule (copy), sessionUtilityModule (copy)
			p3(endReportFlowModule())
			sendAnalyticsModule(constantsModule.Page.Listing, constantsModule.Analytics.ReportFlowAbandoned, {
				source = constantsModule.Page.Listing,
				filterTextChanged = p4
			})
			sessionUtilityModule.endAbuseReportSession()
		end,
		openReportDialog = function(p4, p5, p6)
			-- upvalues: p3 (ref), selectReportListingModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p3(selectReportListingModule(p4, p5, p6))
			sendAnalyticsModule(constantsModule.Page.Listing, constantsModule.Analytics.ReportFlowAdvance, { source = constantsModule.Page.Listing, reportType = p4 })
		end
	}
end)(reportMenu)