local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local cryo = inGameMenuDependenciesModule.Cryo
local UIBlox = inGameMenuDependenciesModule.UIBlox
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var3 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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

function gameIconButton.renderWithSelectionCursor(p0, p1)
	-- upvalues: roact (ref), var4 (ref), gameIconModule (ref), uDim (ref)
	return roact.createElement("TextButton", {
		Text = "",
		AnchorPoint = p0.props.anchorPoint,
		BackgroundTransparency = 1,
		Position = p0.props.position,
		Size = UDim2.fromOffset(32, 32),
		LayoutOrder = p0.props.layoutOrder,
		SelectionImageObject = p1(var4.RoundedRect),
		[roact.Event.Activated] = p0.props.onActivated,
		[roact.Event.SelectionGained] = p0.props.onSelectionGained,
		[roact.Event.SelectionLost] = p0.props.onSelectionLost,
		[roact.Ref] = p0.props.forwardRef
	}, {
		GameIconButton = roact.createElement(gameIconModule, { iconSize = 32, gameId = game.GameId, cornerRadius = uDim })
	})
end

function gameIconButton.render(p2)
	-- upvalues: var3 (ref)
	return var3(function(p3)
		-- upvalues: p2 (ref)
		return p2:renderWithSelectionCursor(p3)
	end)
end

return roact.forwardRef(function(p4, p5)
	-- upvalues: roact (ref), gameIconButton (ref), cryo (ref)
	return roact.createElement(gameIconButton, cryo.Dictionary.join(p4, { forwardRef = p5 }))
end)