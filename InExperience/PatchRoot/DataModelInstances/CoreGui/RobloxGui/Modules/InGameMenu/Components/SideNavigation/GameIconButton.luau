local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local UIBlox = inGameMenuDependenciesModule.UIBlox
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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

function gameIconButton.renderWithSelectionCursor(p1, p2)
	-- upvalues: roact (ref), var2 (ref), gameIconModule (ref), uDim (ref)
	return roact.createElement("TextButton", {
		Text = "",
		AnchorPoint = p1.props.anchorPoint,
		BackgroundTransparency = 1,
		Position = p1.props.position,
		Size = UDim2.fromOffset(32, 32),
		LayoutOrder = p1.props.layoutOrder,
		SelectionImageObject = p2(var2.RoundedRect),
		[roact.Event.Activated] = p1.props.onActivated,
		[roact.Event.SelectionGained] = p1.props.onSelectionGained,
		[roact.Event.SelectionLost] = p1.props.onSelectionLost,
		[roact.Ref] = p1.props.forwardRef
	}, {
		GameIconButton = roact.createElement(gameIconModule, { iconSize = 32, gameId = game.GameId, cornerRadius = uDim })
	})
end

function gameIconButton.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return roact.forwardRef(function(p1, p2)
	-- upvalues: roact (ref), gameIconButton (ref), cryo (ref)
	return roact.createElement(gameIconButton, cryo.Dictionary.join(p1, { forwardRef = p2 }))
end)