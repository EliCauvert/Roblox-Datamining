local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local cryo = inGameMenuDependenciesModule.Cryo
local parent = script.Parent.Parent.Parent
local constantsModule = require(parent.Resources.Constants)
local playerLabelModule = require(parent.Components.PlayerLabel)
local dividerModule = require(parent.Components.Divider)
local barOnTopScrollingFrameModule = require(parent.Components.BarOnTopScrollingFrame)
local gameLabelModule = require(script.Parent.GameLabel)
local reportButtonModule = require(script.Parent.ReportButton)
local focusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local withLocalizationModule = require(parent.Localization.withLocalization)
local isShowEUDSAIllegalContentReportingLink = require(corePackagesService.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink
local trustAndSafetyModule = require(robloxGui.Modules.TrustAndSafety)
local reportList = roact.PureComponent:extend("ReportList")
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
reportList.validateProps = t.strictInterface({
	placeName = t.string,
	players = t.array(t.union(t.instanceIsA("Player"), t.strictInterface({ UserId = t.integer, Name = t.string }))),
	canCaptureFocus = t.optional(t.boolean),
	currentPage = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.string) or nil,
	currentZone = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.number) or nil
})

local function sortPlayers(p1, p2)
	return p1.Name:lower() < p2.Name:lower()
end

function reportList.init(p1)
	-- upvalues: roact (ref)
	p1.reportGameRef = roact.createRef()
end

function reportList.renderListEntries(p1)
	-- upvalues: cryo (ref), sortPlayers (ref), roact (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref), gameLabelModule (ref), trustAndSafetyModule (ref), reportButtonModule (ref), dividerModule (ref), playerLabelModule (ref)
	local var1 = cryo.List.sort(p1.props.players, sortPlayers)
	local var17Count = #var1
	local var2 = 3
	local t = {
		ListLayout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		t.FocusHandler = roact.createElement(focusHandlerModule, {
			isFocused = p1.props.canCaptureFocus,
			shouldForgetPreviousSelection = if p1.props.currentPage ~= constantsModule.MainPagePageKey then p1.props.currentZone == 0 else true,
			didFocus = function(p2)
				-- upvalues: guiService (copy), p1 (ref)
				guiService.SelectedCoreObject = p2 or p1.reportGameRef:getValue()
			end
		})
	end
	t.GameReport = roact.createElement(gameLabelModule, {
		gameId = game.GameId,
		gameName = p1.props.placeName,
		LayoutOrder = 1,
		[roact.Ref] = p1.reportGameRef,
		onActivated = function()
			-- upvalues: trustAndSafetyModule (copy), constantsModule (copy)
			trustAndSafetyModule.openReportDialogForPlace(constantsModule.AnalyticsInGameMenuName)
		end
	}, {
		ReportButton = roact.createElement(reportButtonModule, { LayoutOrder = 1 })
	})
	
	if #var1 > 0 then
		t["divider_" .. var19] = roact.createElement(dividerModule, { LayoutOrder = 2, Size = UDim2.new(1, -80, 0, 1) })
	end
	for i, v in pairs(var1) do
		t["player_" .. i] = roact.createElement(playerLabelModule, {
			isOnline = true,
			isSelected = false,
			username = v.Name,
			userId = v.UserId,
			LayoutOrder = var2,
			onActivated = function()
				-- upvalues: trustAndSafetyModule (copy), v (ref), constantsModule (copy)
				trustAndSafetyModule.openReportDialogForPlayer(v, constantsModule.AnalyticsInGameMenuName)
			end
		}, {
			ReportButton = roact.createElement(reportButtonModule, { LayoutOrder = 1, userId = v.UserId, userName = v.Name })
		})
		var2 += 1
		
		if i < var17Count then
			t["divider_" .. var19] = roact.createElement(dividerModule, { LayoutOrder = var2, Size = UDim2.new(1, -80, 0, 1) })
			var2 += 1
		end
	end
	return t
end

function reportList.didUpdate(p2, p3, _)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref)
	if not getFFlagIGMGamepadSelectionHistoryModule() and p2.props.canCaptureFocus and not p3.canCaptureFocus then
		guiService.SelectedCoreObject = p2.reportGameRef:getValue()
	end
end

function reportList.render(p2)
	-- upvalues: isShowEUDSAIllegalContentReportingLink (ref), withLocalizationModule (ref), roact (ref), barOnTopScrollingFrameModule (ref), themedTextLabelModule (ref)
	local var3 = #p2.props.players * 71 + 70
	
	return if isShowEUDSAIllegalContentReportingLink() then withLocalizationModule({
		DSAFooterText = "CoreScripts.InGameMenu.Report.DSAFooter"
	})(function(p3)
		-- upvalues: roact (copy), barOnTopScrollingFrameModule (copy), var3 (ref), p2 (ref), themedTextLabelModule (copy)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, -50)
		}, {
			ScrollingFrame = roact.createElement(barOnTopScrollingFrameModule, {
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, -50),
				CanvasSize = UDim2.new(1, 0, 0, var3)
			}, p2:renderListEntries()),
			EUWarning = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 50),
				Position = UDim2.new(0, 0, 1, -50)
			}, {
				Padding = roact.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 30),
					PaddingRight = UDim.new(0, 30),
					PaddingTop = UDim.new(0, 20)
				}),
				TextLabel = roact.createElement(themedTextLabelModule, {
					fontKey = "Footer",
					themeKey = "TextEmphasis",
					TextWrapped = true,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(1, 0, 1, 0),
					Text = p3.DSAFooterText,
					TextXAlignment = Enum.TextXAlignment.Center
				})
			})
		})
	end) else roact.createElement(barOnTopScrollingFrameModule, {
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		CanvasSize = UDim2.new(1, 0, 0, var3)
	}, p2:renderListEntries())
end

return roactRodux.UNSTABLE_connect2(function(p2, _)
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	local name = p2.gameInfo.name
	local var3 = false
	
	if p2.menuPage == "Report" then
		var3 = false
		
		if p2.displayOptions.inputType == constantsModule.InputType.Gamepad then
			var3 = not (p2.report.dialogOpen or (p2.report.reportSentOpen or p2.respawn.dialogOpen)) and p2.currentZone == 1
		end
	end
	return {
		placeName = name,
		canCaptureFocus = var3,
		currentPage = if not getFFlagIGMGamepadSelectionHistoryModule() then nil else p2.menuPage,
		currentZone = if not getFFlagIGMGamepadSelectionHistoryModule() then nil else p2.currentZone
	}
end)(reportList)