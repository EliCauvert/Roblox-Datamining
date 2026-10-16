local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local Cell = UIBloxModule.App.Table.Cell
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local DependenciesModule = require(script.Parent.Parent.Dependencies)
local GameIconModule = require(DependenciesModule.GameIcon)
local ThemedTextLabelModule = require(DependenciesModule.ThemedTextLabel)
local WithLocalizationModule = require(DependenciesModule.withLocalization)
local GameCell = RoactModule.PureComponent:extend("GameCell")
GameCell.validateProps = TModule.strictInterface({
	gameId = TModule.number,
	layoutOrder = TModule.optional(TModule.union(TModule.integer, TModule.table)),
	onActivated = TModule.optional(TModule.callback)
})

function GameCell.renderWithSelectionCursor(p1, _) --[[ Line: 27 ]]
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), Cell (copy), GameIconModule (copy), ThemedTextLabelModule (copy)
	local Props = p1.props
	
	return WithLocalizationModule({
		labelText = "CoreScripts.InGameMenu.Report.ReportExperience"
	})(function(p2) --[[ Line: 31 ]]
		-- upvalues: RoactModule (upval), Cell (upval), Props (copy), GameIconModule (upval), ThemedTextLabelModule (upval)
		return RoactModule.createElement(Cell, {
			onActivated = Props.onActivated,
			layoutOrder = Props.layoutOrder,
			size = UDim2.new(1, 0, 0, 72),
			head = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 72)
			}, {
				GameIcon = RoactModule.createElement(GameIconModule, {
					iconSize = 48,
					gameId = Props.gameId,
					cornerRadius = UDim.new(0, 8),
					Position = UDim2.new(0, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5)
				}),
				Label = RoactModule.createElement(ThemedTextLabelModule, {
					fontKey = "Header2",
					themeKey = "TextEmphasis",
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0, 0.5),
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = p2.labelText,
					TextXAlignment = Enum.TextXAlignment.Left,
					Position = UDim2.new(0, 54, 0.5, 0)
				})
			}),
			tail = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(0, 0, 1, 0)
			})
		})
	end)
end

function GameCell.render(p1) --[[ Line: 69 ]]
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2) --[[ Line: 70 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return GameCell