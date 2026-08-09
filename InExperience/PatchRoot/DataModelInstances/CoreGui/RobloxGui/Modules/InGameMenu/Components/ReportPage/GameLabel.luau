local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local cryo = inGameMenuDependenciesModule.Cryo
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local assetsModule = require(parent.Resources.Assets)
local reactModule = require(corePackagesService.Packages.React)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local gameLabel = roact.PureComponent:extend("GameLabel")
gameLabel.validateProps = t.strictInterface({
	gameId = t.number,
	gameName = t.string,
	LayoutOrder = t.integer,
	onActivated = t.optional(t.callback),
	[roact.Children] = t.optional(t.table),
	buttonRef = t.optional(t.table)
})

function gameLabel.renderButtons(p0) --[[ line: 42 ]]
	-- upvalues: roact (ref), cryo (ref)
	return cryo.Dictionary.join(p0.props[roact.Children] or {}, {
		List = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		})
	})
end

function gameLabel.renderWithSelectionCursor(p1, p2) --[[ line: 57 ]]
	-- upvalues: assetsModule (ref), withStyle (ref), roact (ref), reactModule (ref), cursorKind (ref), imageSetLabel (ref), themedTextLabelModule (ref)
	local var6 = if p1.props.gameId > 0 then "rbxthumb://type=GameIcon&id=" .. p1.props.gameId .. "&w=150&h=150" else assetsModule.Images.PlaceholderGameIcon
	
	return withStyle(function(_) --[[ line: 64 ]]
		-- upvalues: roact (copy), reactModule (copy), p1 (ref), p2 (ref), cursorKind (copy), imageSetLabel (copy), var6 (write), themedTextLabelModule (copy)
		return roact.createElement("TextButton", {
			[reactModule.Tag] = "data-testid=experienceLabel",
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 70),
			Text = "",
			AutoButtonColor = false,
			SelectionImageObject = p2(cursorKind.Square),
			[roact.Ref] = p1.props.buttonRef,
			[roact.Event.Activated] = p1.props.onActivated
		}, {
			GameIcon = roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 24, 0.5, 0),
				Size = UDim2.new(0, 44, 0, 44),
				Image = var6
			}),
			GameNameLabel = roact.createElement(themedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 80, 0.5, 0),
				Size = UDim2.new(0, 219, 0, 22),
				Text = p1.props.gameName,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			ButtonContainer = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -24, 0, 0),
				Size = UDim2.new(0, 0, 1, 0)
			}, p1:renderButtons())
		})
	end)
end

function gameLabel.render(p3) --[[ line: 106 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p4) --[[ line: 107 ]]
		-- upvalues: p3 (ref)
		return p3:renderWithSelectionCursor(p4)
	end)
end

return roact.forwardRef(function(p5, p6) --[[ line: 112 ]]
	-- upvalues: roact (ref), gameLabel (ref), cryo (ref)
	return roact.createElement(gameLabel, cryo.Dictionary.join(p5, { buttonRef = p6 }))
end)