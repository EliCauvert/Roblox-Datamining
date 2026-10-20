local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local T = InGameMenuDependenciesModule.t
local Roact = InGameMenuDependenciesModule.Roact
local Cryo = InGameMenuDependenciesModule.Cryo
local UIBlox = InGameMenuDependenciesModule.UIBlox
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local GameIconModule = require(script.Parent.Parent.Parent.Components.GameIcon)
local _UDim = UDim.new(0, 8)
local GameIconButton = Roact.PureComponent:extend("GameIconButton")
GameIconButton.validateProps = T.strictInterface({
	anchorPoint = T.optional(T.Vector2),
	position = T.optional(T.UDim2),
	layoutOrder = T.optional(T.integer),
	onActivated = T.callback,
	onSelectionGained = T.optional(T.callback),
	onSelectionLost = T.optional(T.callback),
	forwardRef = T.optional(T.table)
})

function GameIconButton.renderWithSelectionCursor(p1, Callback)
	-- upvalues: Roact (copy), CursorType (copy), GameIconModule (copy), _UDim (copy)
	return Roact.createElement("TextButton", {
		Text = "",
		AnchorPoint = p1.props.anchorPoint,
		BackgroundTransparency = 1,
		Position = p1.props.position,
		Size = UDim2.fromOffset(32, 32),
		LayoutOrder = p1.props.layoutOrder,
		SelectionImageObject = Callback(CursorType.RoundedRect),
		[Roact.Event.Activated] = p1.props.onActivated,
		[Roact.Event.SelectionGained] = p1.props.onSelectionGained,
		[Roact.Event.SelectionLost] = p1.props.onSelectionLost,
		[Roact.Ref] = p1.props.forwardRef
	}, {
		GameIconButton = Roact.createElement(GameIconModule, {
			iconSize = 32,
			gameId = game.GameId,
			cornerRadius = _UDim
		})
	})
end

function GameIconButton.render(p1)
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return Roact.forwardRef(function(p1, ForwardRef)
	-- upvalues: Roact (copy), GameIconButton (copy), Cryo (copy)
	return Roact.createElement(GameIconButton, Cryo.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)