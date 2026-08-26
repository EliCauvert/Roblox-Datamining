local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local images = UIBlox.App.ImageSet.Images
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local image = foundationModule.Image
local var3 = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/menu/home_on" else images["icons/menu/home_on"]
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/menu/home_off" else images["icons/menu/home_off"]
local homeButton = roact.PureComponent:extend("HomeButton")
homeButton.validateProps = t.strictInterface({
	on = t.optional(t.boolean),
	anchorPoint = t.optional(t.Vector2),
	position = t.optional(t.UDim2),
	layoutOrder = t.optional(t.integer),
	onActivated = t.callback
})
homeButton.defaultProps = { on = false }

function homeButton.renderWithSelectionCursor(p1, p2)
	-- upvalues: var3 (ref), var4 (ref), roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), var2 (ref), imageSetButton (ref)
	local var5 = if p1.props.on then var3 else var4
	
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = p1.props.anchorPoint,
		Position = p1.props.position,
		Size = UDim2.fromOffset(64, 64),
		LayoutOrder = p1.props.layoutOrder
	}, {
		HomeButton = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			tag = "position-center-center anchor-center-center size-800",
			Image = var5,
			backgroundStyle = { Transparency = 1 },
			selection = { SelectionImageObject = p2(var2.RoundedRect) },
			onActivated = p1.props.onActivated
		}) else roact.createElement(imageSetButton, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Image = var5,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(32, 32),
			SelectionImageObject = p2(var2.RoundedRect),
			[roact.Event.Activated] = p1.props.onActivated
		})
	})
end

function homeButton.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return homeButton