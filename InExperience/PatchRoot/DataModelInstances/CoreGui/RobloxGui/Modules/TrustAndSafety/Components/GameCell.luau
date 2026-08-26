local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local tModule = require(corePackagesService.Packages.t)
local cell = UIBloxModule.App.Table.Cell
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local dependenciesModule = require(script.Parent.Parent.Dependencies)
local gameIconModule = require(dependenciesModule.GameIcon)
local themedTextLabelModule = require(dependenciesModule.ThemedTextLabel)
local withLocalizationModule = require(dependenciesModule.withLocalization)
local gameCell = roactModule.PureComponent:extend("GameCell")
gameCell.validateProps = tModule.strictInterface({
	gameId = tModule.number,
	layoutOrder = tModule.optional(tModule.union(tModule.integer, tModule.table)),
	onActivated = tModule.optional(tModule.callback)
})

function gameCell.renderWithSelectionCursor(p1, _)
	-- upvalues: withLocalizationModule (ref), roactModule (ref), cell (ref), gameIconModule (ref), themedTextLabelModule (ref)
	local props = p1.props
	
	return withLocalizationModule({
		labelText = "CoreScripts.InGameMenu.Report.ReportExperience"
	})(function(p2)
		-- upvalues: roactModule (copy), cell (copy), props (ref), gameIconModule (copy), themedTextLabelModule (copy)
		return roactModule.createElement(cell, {
			onActivated = props.onActivated,
			layoutOrder = props.layoutOrder,
			size = UDim2.new(1, 0, 0, 72),
			head = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 72)
			}, {
				GameIcon = roactModule.createElement(gameIconModule, {
					iconSize = 48,
					gameId = props.gameId,
					cornerRadius = UDim.new(0, 8),
					Position = UDim2.new(0, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5)
				}),
				Label = roactModule.createElement(themedTextLabelModule, {
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
			tail = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				Size = UDim2.new(0, 0, 1, 0)
			})
		})
	end)
end

function gameCell.render(p1)
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return gameCell