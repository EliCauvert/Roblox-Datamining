local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local UIBlox = inGameMenuDependenciesModule.UIBlox
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local gameIconModule = require(script.Parent.Parent.Parent.Components.GameIcon)
local uDim = UDim.new(0, 8)
local gameIconButton = roact.PureComponent:extend("GameIconButton")
gameIconButton.validateProps = t.strictInterface({
	anchorPoint = t.optional(t.Vector2),
	position = t.optional(t.UDim2),
	layoutOrder = t.optional(t.integer),
	onActivated = t.callback,
	onSelectionGained = t.optional(t.callback),
	onSelectionLost = t.optional(t.callback),
	forwardRef = t.optional(t.table)
})

function gameIconButton.renderWithSelectionCursor(p0, p1) --[[ line: 30 ]]
	-- upvalues: roact (ref), cursorKind (ref), gameIconModule (ref), uDim (ref)
	return roact.createElement("TextButton", {
		Text = "",
		AnchorPoint = p0.props.anchorPoint,
		BackgroundTransparency = 1,
		Position = p0.props.position,
		Size = UDim2.fromOffset(32, 32),
		LayoutOrder = p0.props.layoutOrder,
		SelectionImageObject = p1(cursorKind.RoundedRect),
		[roact.Event.Activated] = p0.props.onActivated,
		[roact.Event.SelectionGained] = p0.props.onSelectionGained,
		[roact.Event.SelectionLost] = p0.props.onSelectionLost,
		[roact.Ref] = p0.props.forwardRef
	}, {
		GameIconButton = roact.createElement(gameIconModule, { iconSize = 32, gameId = game.GameId, cornerRadius = uDim })
	})
end

function gameIconButton.render(p2) --[[ line: 53 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p3) --[[ line: 54 ]]
		-- upvalues: p2 (ref)
		return p2:renderWithSelectionCursor(p3)
	end)
end

return roact.forwardRef(function(p4, p5) --[[ line: 59 ]]
	-- upvalues: roact (ref), gameIconButton (ref), cryo (ref)
	return roact.createElement(gameIconButton, cryo.Dictionary.join(p4, { forwardRef = p5 }))
end)