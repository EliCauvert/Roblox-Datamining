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

local var29 = function(p0)
	-- upvalues: reactModule (ref), voiceStateContextModule (ref), voiceIndicatorFuncModule (ref), cryoModule (ref)
	return if reactModule.useContext(voiceStateContextModule.Context).voiceEnabled then reactModule.createElement(voiceIndicatorFuncModule, cryoModule.Dictionary.join(p0, {})) else nil
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
	
	function p1.getLayoutBinding(p3, p4)
		-- upvalues: p1 (ref), roactModule (copy)
		local var33 = p1.layoutBindings[p3]
		
		if not var33 then
			local var34, var35 = roactModule.createBinding(p4)
			var33 = { valueBinding = var34, setValue = var35, value = p4 }
			p1.layoutBindings[p3] = var33
		end
		if var33.value ~= p4 then
			var33.value = p4
			var33.setValue(p4)
		end
		return var33.valueBinding
	end
	
	function p1.playerIsVoiceActive(p5)
		-- upvalues: default (copy)
		return default.participants[tostring(p5)] ~= nil
	end
	
	p1.sortedUserIds = {}
end

local function sortPlayers(p6, p7)
	return p6.DisplayName:lower() < p7.DisplayName:lower()
end

function reportMenu.getPlayerList(p8)
	-- upvalues: cryoModule (ref), playersService (ref), sortPlayers (ref), playerSearchPredicateModule (ref)
	local t = {}
	
	for i, v in ipairs(cryoModule.List.sort(playersService:GetPlayers(), sortPlayers)) do
		if v ~= playersService.LocalPlayer then
			if not p8.state.isFilterMode then
				table.insert(t, v)
			elseif playerSearchPredicateModule(p8.state.filterText, v.Name, v.DisplayName) then
				table.insert(t, v)
			end
		end
	end
	return cryoModule.List.sort(t, function(p9, p10)
		return p9.DisplayName:lower() < p10.DisplayName:lower()
	end)
end

local t_1 = {
	[constantsModule.Category.Voice] = "CoreScripts.InGameMenu.Report.Title.VoiceChat",
	[constantsModule.Category.Text] = "CoreScripts.InGameMenu.Report.Title.TextChat",
	[constantsModule.Category.Other] = "CoreScripts.InGameMenu.Report.Title.Other"
}

function reportMenu.categoryTitle(p11)
	-- upvalues: t_1 (ref)
	return t_1[p11.props.reportCategory] or "CoreScripts.InGameMenu.Report.MenuTitle"
end

function reportMenu.renderHeaderBar(p12)
	-- upvalues: makeBackButton (ref), roactModule (ref), iconButton (ref), iconSize (ref), images (ref), withLocalizationModule (ref), headerBar (ref), searchBarModule (ref)
	local var37 = if p12.props.canNavigateBack then makeBackButton(p12.navigateBack) else function()
		-- upvalues: roactModule (copy), iconButton (copy), iconSize (copy), images (copy), p12 (ref)
		return roactModule.createElement(iconButton, {
			iconSize = iconSize.Medium,
			icon = images["icons/navigation/close"],
			onActivated = p12.closeDialog
		})
	end
	
	return if p12.state.isFilterMode then roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(24, 6),
		Size = UDim2.new(1, -48, 1, -12)
	}, {
		roactModule.createElement(searchBarModule, {
			autoCaptureFocus = true,
			size = UDim2.fromScale(1, 1),
			text = p12.state.filterText,
			onTextChanged = p12.onTextChanged,
			onCancelled = p12.onCancel
		})
	}) else withLocalizationModule({ titleText = p12:categoryTitle() })(function(p13)
		-- upvalues: roactModule (copy), headerBar (copy), var37 (write), iconButton (copy), iconSize (copy), images (copy), p12 (ref)
		return roactModule.createElement(headerBar, {
			backgroundTransparency = 1,
			barHeight = 48,
			renderLeft = var37,
			renderRight = function()
				-- upvalues: roactModule (copy), iconButton (copy), iconSize (copy), images (copy), p12 (copy)
				return roactModule.createElement(iconButton, {
					iconSize = iconSize.Medium,
					icon = images["icons/common/search"],
					onActivated = p12.onSearch
				})
			end,
			onHeaderActivated = p12.scrollToTop,
			title = p13.titleText
		})
	end)
end

function reportMenu.renderContents(p14)
	-- upvalues: constantsModule (ref), roactModule (ref), gameCellModule (ref), default (ref), dividerModule (ref), playerCellModule (ref), isPlayerVerified (ref), var29 (ref), constantsModule_1 (ref), withStyle (ref), cryoModule (ref), t (ref), provider (ref), barOnTopScrollingFrameModule (ref)
	local props = p14.props
	local var38 = p14.props.reportCategory == constantsModule.Category.Voice
	local var39 = 0
	local t_1 = {
		ListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	
	if not p14.state.isFilterMode and p14.props.reportCategory == constantsModule.Category.None then
		t_1.GameCell = roactModule.createElement(gameCellModule, {
			gameId = game.GameId,
			layoutOrder = p14.getLayoutBinding("GameCell", var39),
			onActivated = function()
				-- upvalues: props (ref), constantsModule (copy)
				props.openReportDialog(constantsModule.ReportType.Place, nil)
			end
		})
	end
	var39 += 1
	local var41 = 72
	local playerList = p14:getPlayerList()
	local var43 = if var38 then default:getRecentUsersInteractionData() else {}
	p14.sortedUserIds = {}
	
	for i, v in pairs(playerList) do
		local var44 = tostring(v.UserId)
		
		if not var38 or var43[tostring(v.UserId)] then
			table.insert(p14.sortedUserIds, v.UserId)
			local var45 = 0
			
			if var38 then
				var45 += 1
			end
			if p14.props.isReportMenuOpen then
				var45 += 2
			end
			t_1["Divider" .. var44] = roactModule.createElement(dividerModule, {
				LayoutOrder = p14.getLayoutBinding("Divider" .. var44, var39),
				Size = UDim2.new(1, 0, 0, 1)
			})
			var39 += 1
			t_1["PlayerCell" .. var44] = roactModule.createElement(playerCellModule, {
				isOnline = true,
				isSelected = false,
				userId = v.UserId,
				username = v.Name,
				displayName = v.DisplayName,
				hasVerifiedBadge = isPlayerVerified(v),
				LayoutOrder = p14.getLayoutBinding("PlayerCell" .. var44, var39),
				onActivated = function()
					-- upvalues: props (ref), constantsModule (copy), v (ref)
					props.openReportDialog(constantsModule.ReportType.Player, v)
				end,
				memoKey = var45
			}, {
				VoiceIndicator = var38 and (p14.props.isReportMenuOpen and (roactModule.createElement(var29, {
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
			var39 += 1
			var41 += 73
		end
	end
	t_1.DividerEnd = roactModule.createElement(dividerModule, {
		LayoutOrder = p14.getLayoutBinding("DividerEnd", var39),
		Size = UDim2.new(1, 0, 0, 1)
	})
	var39 += 1
	
	return withStyle(function(p15)
		-- upvalues: cryoModule (copy), t (copy), roactModule (copy), provider (copy), barOnTopScrollingFrameModule (copy), var41 (write), p14 (ref), t_1 (ref)
		return roactModule.createElement(provider, {
			style = cryoModule.Dictionary.join(p15, { Theme = cryoModule.Dictionary.join(p15.Theme, t) })
		}, {
			roactModule.createElement(barOnTopScrollingFrameModule, {
				Size = UDim2.fromScale(1, 1),
				CanvasSize = UDim2.new(1, 0, 0, var41),
				scrollingFrameRef = p14.scrollingFrameRef
			}, t_1)
		})
	end)
end

function reportMenu.render(p16)
	-- upvalues: roactModule (ref), modalDialogModule (ref)
	return roactModule.createFragment({
		ModalDialog = roactModule.createElement(modalDialogModule, {
			visible = p16.props.isReportMenuOpen,
			screenSize = p16.props.screenSize,
			headerBar = p16:renderHeaderBar(),
			showCloseButton = not (p16.props.reportCategory ~= nil),
			contents = p16:renderContents(),
			onDismiss = p16.closeDialog
		})
	})
end

function reportMenu.didUpdate(p17, p18)
	-- upvalues: roactModule (ref)
	if p18.isReportMenuOpen and not p17.props.isReportMenuOpen then
		p17:setState({ isFilterMode = false, filterText = roactModule.None })
		local value = p17.scrollingFrameRef:getValue()
		
		if value and value.CanvasPosition.Y > 0 then
			value.CanvasPosition = Vector2.new(0, 0)
		end
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p19, _)
	-- upvalues: constantsModule (ref)
	return {
		isReportMenuOpen = p19.report.currentPage == constantsModule.Page.Listing,
		screenSize = p19.displayOptions.screenSize,
		reportCategory = p19.report.reportCategory,
		canNavigateBack = #p19.report.history > 1
	}
end, function(p20)
	-- upvalues: navigateBackModule (ref), sendAnalyticsModule (ref), constantsModule (ref), endReportFlowModule (ref), sessionUtilityModule (ref), selectReportListingModule (ref)
	return {
		navigateBack = function(p21)
			-- upvalues: p20 (ref), navigateBackModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p20(navigateBackModule())
			sendAnalyticsModule(constantsModule.Page.Listing, constantsModule.Analytics.ReportFlowBack, {
				source = constantsModule.Page.Listing,
				filterTextChanged = p21
			})
		end,
		closeDialog = function(p22)
			-- upvalues: p20 (ref), endReportFlowModule (copy), sendAnalyticsModule (copy), constantsModule (copy), sessionUtilityModule (copy)
			p20(endReportFlowModule())
			sendAnalyticsModule(constantsModule.Page.Listing, constantsModule.Analytics.ReportFlowAbandoned, {
				source = constantsModule.Page.Listing,
				filterTextChanged = p22
			})
			sessionUtilityModule.endAbuseReportSession()
		end,
		openReportDialog = function(p23, p24, p25)
			-- upvalues: p20 (ref), selectReportListingModule (copy), sendAnalyticsModule (copy), constantsModule (copy)
			p20(selectReportListingModule(p23, p24, p25))
			sendAnalyticsModule(constantsModule.Page.Listing, constantsModule.Analytics.ReportFlowAdvance, { source = constantsModule.Page.Listing, reportType = p23 })
		end
	}
end)(reportMenu)