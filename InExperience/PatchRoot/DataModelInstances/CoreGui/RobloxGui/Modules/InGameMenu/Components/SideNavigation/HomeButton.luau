local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local images = UIBlox.App.ImageSet.Images
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var3 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local image = foundationModule.Image
local var5 = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/menu/home_on" else images["icons/menu/home_on"]
local var6 = if fFlagCoreUiMigrateUIBloxToFoundation then "icons/menu/home_off" else images["icons/menu/home_off"]
local homeButton = roact.PureComponent:extend("HomeButton")
homeButton.validateProps = t.strictInterface({
	on = t.optional(t.boolean),
	anchorPoint = t.optional(t.Vector2),
	position = t.optional(t.UDim2),
	layoutOrder = t.optional(t.integer),
	onActivated = t.callback
})
homeButton.defaultProps = { on = false }

function homeButton.renderWithSelectionCursor(p0, p1)
	-- upvalues: var5 (ref), var6 (ref), roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), var4 (ref), imageSetButton (ref)
	local var8 = if p0.props.on then var5 else var6
	
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = p0.props.anchorPoint,
		Position = p0.props.position,
		Size = UDim2.fromOffset(64, 64),
		LayoutOrder = p0.props.layoutOrder
	}, {
		HomeButton = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
			tag = "position-center-center anchor-center-center size-800",
			Image = var8,
			backgroundStyle = { Transparency = 1 },
			selection = { SelectionImageObject = p1(var4.RoundedRect) },
			onActivated = p0.props.onActivated
		}) else roact.createElement(imageSetButton, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Image = var8,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(32, 32),
			SelectionImageObject = p1(var4.RoundedRect),
			[roact.Event.Activated] = p0.props.onActivated
		})
	})
end

function homeButton.render(p2)
	-- upvalues: var3 (ref)
	return var3(function(p3)
		-- upvalues: p2 (ref)
		return p2:renderWithSelectionCursor(p3)
	end)
end

return homeButton