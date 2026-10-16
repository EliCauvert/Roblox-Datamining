local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local Cryo = InGameMenuDependenciesModule.Cryo
local Parent = script.Parent.Parent.Parent
local ConstantsModule = require(Parent.Resources.Constants)
local PlayerLabelModule = require(Parent.Components.PlayerLabel)
local DividerModule = require(Parent.Components.Divider)
local BarOnTopScrollingFrameModule = require(Parent.Components.BarOnTopScrollingFrame)
local GameLabelModule = require(script.Parent.GameLabel)
local ReportButtonModule = require(script.Parent.ReportButton)
local FocusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local IsShowEUDSAIllegalContentReportingLinkFunction = require(CorePackages.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink
local TrustAndSafetyModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.TrustAndSafety)
local ReportList = Roact.PureComponent:extend("ReportList")
local GetFFlagIGMGamepadSelectionHistoryModule = require(Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
ReportList.validateProps = T.strictInterface({
	placeName = T.string,
	players = T.array(T.union(T.instanceIsA("Player"), T.strictInterface({ UserId = T.integer, Name = T.string }))),
	canCaptureFocus = T.optional(T.boolean),
	currentPage = GetFFlagIGMGamepadSelectionHistoryModule() and T.optional(T.string) or nil,
	currentZone = GetFFlagIGMGamepadSelectionHistoryModule() and T.optional(T.number) or nil
})

local function sortPlayers(p1, p2): boolean --[[ Line: 57 ]]
	return p1.Name:lower() < p2.Name:lower()
end

function ReportList.init(p1) --[[ Line: 61 ]]
	-- upvalues: Roact (copy)
	p1.reportGameRef = Roact.createRef()
end

function ReportList.renderListEntries(p1) --[[ Line: 65 ]]
	-- upvalues: Cryo (copy), sortPlayers (copy), Roact (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy), FocusHandlerModule (copy), ConstantsModule (copy), GuiService (copy), GameLabelModule (copy), TrustAndSafetyModule (copy), ReportButtonModule (copy), DividerModule (copy), PlayerLabelModule (copy)
	local SortResult = Cryo.List.sort(p1.props.players, sortPlayers)
	local CountSortResult = #SortResult
	local LayoutOrder = 3
	local Elements = {
		ListLayout = Roact.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Right
		})
	}
	
	if GetFFlagIGMGamepadSelectionHistoryModule() then
		Elements.FocusHandler = Roact.createElement(FocusHandlerModule, {
			isFocused = p1.props.canCaptureFocus,
			shouldForgetPreviousSelection = p1.props.currentPage == ConstantsModule.MainPagePageKey or p1.props.currentZone == 0,
			didFocus = function(p2) --[[ Line: 83 ]]
				-- upvalues: GuiService (upval), p1 (copy)
				GuiService.SelectedCoreObject = p2 or p1.reportGameRef:getValue()
			end
		})
	end
	Elements.GameReport = Roact.createElement(GameLabelModule, {
		gameId = game.GameId,
		gameName = p1.props.placeName,
		LayoutOrder = 1,
		[Roact.Ref] = p1.reportGameRef,
		onActivated = function() --[[ Line: 94 ]]
			-- upvalues: TrustAndSafetyModule (upval), ConstantsModule (upval)
			TrustAndSafetyModule.openReportDialogForPlace(ConstantsModule.AnalyticsInGameMenuName)
		end
	}, {
		ReportButton = Roact.createElement(ReportButtonModule, { LayoutOrder = 1 })
	})
	
	if #SortResult > 0 then
		Elements["divider_" .. LayoutOrder] = Roact.createElement(DividerModule, { LayoutOrder = 2, Size = UDim2.new(1, -80, 0, 1) })
	end
	for i, Player in pairs(SortResult) do
		Elements["player_" .. i] = Roact.createElement(PlayerLabelModule, {
			isOnline = true,
			isSelected = false,
			username = Player.Name,
			userId = Player.UserId,
			LayoutOrder = LayoutOrder,
			onActivated = function() --[[ Line: 118 ]]
				-- upvalues: TrustAndSafetyModule (upval), Player (copy), ConstantsModule (upval)
				TrustAndSafetyModule.openReportDialogForPlayer(Player, ConstantsModule.AnalyticsInGameMenuName)
			end
		}, {
			ReportButton = Roact.createElement(ReportButtonModule, {
				LayoutOrder = 1,
				userId = Player.UserId,
				userName = Player.Name
			})
		})
		LayoutOrder += 1
		
		if i < CountSortResult then
			Elements["divider_" .. LayoutOrder] = Roact.createElement(DividerModule, {
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(1, -80, 0, 1)
			})
			LayoutOrder += 1
		end
	end
	return Elements
end

function ReportList.didUpdate(p2, p3, _) --[[ Line: 144 ]]
	-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (copy), GuiService (copy)
	if not GetFFlagIGMGamepadSelectionHistoryModule() and p2.props.canCaptureFocus and not p3.canCaptureFocus then
		GuiService.SelectedCoreObject = p2.reportGameRef:getValue()
	end
end

function ReportList.render(p2) --[[ Line: 153 ]]
	-- upvalues: IsShowEUDSAIllegalContentReportingLinkFunction (copy), WithLocalizationModule (copy), Roact (copy), BarOnTopScrollingFrameModule (copy), ThemedTextLabelModule (copy)
	local YOffset = #p2.props.players * 71 + 70
	
	return if IsShowEUDSAIllegalContentReportingLinkFunction() then WithLocalizationModule({
		DSAFooterText = "CoreScripts.InGameMenu.Report.DSAFooter"
	})(function(p3) --[[ Line: 159 ]]
		-- upvalues: Roact (upval), BarOnTopScrollingFrameModule (upval), YOffset (copy), p2 (copy), ThemedTextLabelModule (upval)
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 1, -50)
		}, {
			ScrollingFrame = Roact.createElement(BarOnTopScrollingFrameModule, {
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, -50),
				CanvasSize = UDim2.new(1, 0, 0, YOffset)
			}, p2:renderListEntries()),
			EUWarning = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 50),
				Position = UDim2.new(0, 0, 1, -50)
			}, {
				Padding = Roact.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 30),
					PaddingRight = UDim.new(0, 30),
					PaddingTop = UDim.new(0, 20)
				}),
				TextLabel = Roact.createElement(ThemedTextLabelModule, {
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
	end) else Roact.createElement(BarOnTopScrollingFrameModule, {
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0),
		CanvasSize = UDim2.new(1, 0, 0, YOffset)
	}, p2:renderListEntries())
end

return RoactRodux.UNSTABLE_connect2(function(p2, _) --[[ Line: 204 ]]
	-- upvalues: ConstantsModule (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy)
	return {
		placeName = p2.gameInfo.name,
		canCaptureFocus = p2.menuPage == "Report" and p2.displayOptions.inputType == ConstantsModule.InputType.Gamepad and (not (p2.report.dialogOpen or (p2.report.reportSentOpen or p2.respawn.dialogOpen)) and p2.currentZone == 1),
		currentPage = if GetFFlagIGMGamepadSelectionHistoryModule() then p2.menuPage else nil,
		currentZone = if GetFFlagIGMGamepadSelectionHistoryModule() then p2.currentZone else nil
	}
end)(ReportList)