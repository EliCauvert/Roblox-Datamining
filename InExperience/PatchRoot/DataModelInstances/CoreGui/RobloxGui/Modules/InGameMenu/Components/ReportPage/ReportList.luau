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

local function sortPlayers(p0, p1) --[[ line: 57 ]]
	return p0.Name:lower() < p1.Name:lower()
end

function reportList.init(p2) --[[ line: 61 ]]
	-- upvalues: roact (ref)
	p2.reportGameRef = roact.createRef()
end

function reportList.renderListEntries(p3) --[[ line: 65 ]]
	-- upvalues: cryo (ref), sortPlayers (ref), roact (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref), gameLabelModule (ref), trustAndSafetyModule (ref), reportButtonModule (ref), dividerModule (ref), playerLabelModule (ref)
	local var17 = cryo.List.sort(p3.props.players, sortPlayers)
	local var17Count = #var17
	local var19 = 3
	local t = {
		ListLayout = roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	
	if getFFlagIGMGamepadSelectionHistoryModule() then
		t.FocusHandler = roact.createElement(focusHandlerModule, {
			isFocused = p3.props.canCaptureFocus,
			shouldForgetPreviousSelection = if p3.props.currentPage ~= constantsModule.MainPagePageKey then p3.props.currentZone == 0 else true,
			didFocus = function(p4) --[[ line: 83 ]]
				-- upvalues: guiService (copy), p3 (ref)
				guiService.SelectedCoreObject = p4 or p3.reportGameRef:getValue()
			end
		})
	end
	t.GameReport = roact.createElement(gameLabelModule, {
		gameId = game.GameId,
		gameName = p3.props.placeName,
		LayoutOrder = 1,
		[roact.Ref] = p3.reportGameRef,
		onActivated = function() --[[ line: 94 ]]
			-- upvalues: trustAndSafetyModule (copy), constantsModule (copy)
			trustAndSafetyModule.openReportDialogForPlace(constantsModule.AnalyticsInGameMenuName)
		end
	}, {
		ReportButton = roact.createElement(reportButtonModule, { LayoutOrder = 1 })
	})
	
	if #var17 > 0 then
		t["divider_" .. var19] = roact.createElement(dividerModule, { LayoutOrder = 2, Size = UDim2.new(1, -80, 0, 1) })
	end
	for i, v in pairs(var17) do
		t["player_" .. i] = roact.createElement(playerLabelModule, {
			isOnline = true,
			isSelected = false,
			username = v.Name,
			userId = v.UserId,
			LayoutOrder = var19,
			onActivated = function() --[[ line: 118 ]]
				-- upvalues: trustAndSafetyModule (copy), v (ref), constantsModule (copy)
				trustAndSafetyModule.openReportDialogForPlayer(v, constantsModule.AnalyticsInGameMenuName)
			end
		}, {
			ReportButton = roact.createElement(reportButtonModule, { LayoutOrder = 1, userId = v.UserId, userName = v.Name })
		})
		var19 += 1
		
		if i < var17Count then
			t["divider_" .. var19] = roact.createElement(dividerModule, { LayoutOrder = var19, Size = UDim2.new(1, -80, 0, 1) })
			var19 += 1
		end
	end
	return t
end

function reportList.didUpdate(p5, p6, _) --[[ line: 144 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), guiService (ref)
	if not getFFlagIGMGamepadSelectionHistoryModule() and p5.props.canCaptureFocus and not p6.canCaptureFocus then
		guiService.SelectedCoreObject = p5.reportGameRef:getValue()
	end
end

function reportList.render(p7) --[[ line: 153 ]]
	-- upvalues: isShowEUDSAIllegalContentReportingLink (ref), withLocalizationModule (ref), roact (ref), barOnTopScrollingFrameModule (ref), themedTextLabelModule (ref)
	local var21 = #p7.props.players * 71 + 70
	
	return if isShowEUDSAIllegalContentReportingLink() then withLocalizationModule({
		DSAFooterText = "CoreScripts.InGameMenu.Report.DSAFooter"
	})(function(p8) --[[ line: 159 ]]
		-- upvalues: roact (copy), barOnTopScrollingFrameModule (copy), var21 (ref), p7 (ref), themedTextLabelModule (copy)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, -50)
		}, {
			ScrollingFrame = roact.createElement(barOnTopScrollingFrameModule, {
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, -50),
				CanvasSize = UDim2.new(1, 0, 0, var21)
			}, p7:renderListEntries()),
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
					Text = p8.DSAFooterText,
					TextXAlignment = Enum.TextXAlignment.Center
				})
			})
		})
	end) else roact.createElement(barOnTopScrollingFrameModule, {
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		CanvasSize = UDim2.new(1, 0, 0, var21)
	}, p7:renderListEntries())
end

return roactRodux.UNSTABLE_connect2(function(p9, _) --[[ line: 204 ]]
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	local name = p9.gameInfo.name
	local var22 = false
	
	if p9.menuPage == "Report" then
		var22 = false
		
		if p9.displayOptions.inputType == constantsModule.InputType.Gamepad then
			var22 = not (p9.report.dialogOpen or (p9.report.reportSentOpen or p9.respawn.dialogOpen)) and p9.currentZone == 1
		end
	end
	return {
		placeName = name,
		canCaptureFocus = var22,
		currentPage = if not getFFlagIGMGamepadSelectionHistoryModule() then nil else p9.menuPage,
		currentZone = if not getFFlagIGMGamepadSelectionHistoryModule() then nil else p9.currentZone
	}
end)(reportList)