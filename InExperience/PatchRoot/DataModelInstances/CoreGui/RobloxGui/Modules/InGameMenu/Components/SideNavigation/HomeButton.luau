local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local T = InGameMenuDependenciesModule.t
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local Images = UIBlox.App.ImageSet.Images
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local Image = FoundationModule.Image
local HomeOn = if FFlagCoreUiMigrateUIBloxToFoundation then "icons/menu/home_on" else Images["icons/menu/home_on"]
local HomeOff = if FFlagCoreUiMigrateUIBloxToFoundation then "icons/menu/home_off" else Images["icons/menu/home_off"]
local HomeButton = Roact.PureComponent:extend("HomeButton")
HomeButton.validateProps = T.strictInterface({
	on = T.optional(T.boolean),
	anchorPoint = T.optional(T.Vector2),
	position = T.optional(T.UDim2),
	layoutOrder = T.optional(T.integer),
	onActivated = T.callback
})
HomeButton.defaultProps = { on = false }

function HomeButton.renderWithSelectionCursor(p1, Callback)
	-- upvalues: HomeOn (copy), HomeOff (copy), Roact (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), CursorType (copy), ImageSetButton (copy)
	local HomeOn1 = p1.props.on and HomeOn or HomeOff
	
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		AnchorPoint = p1.props.anchorPoint,
		Position = p1.props.position,
		Size = UDim2.fromOffset(64, 64),
		LayoutOrder = p1.props.layoutOrder
	}, {
		HomeButton = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
			tag = "position-center-center anchor-center-center size-800",
			Image = HomeOn1,
			backgroundStyle = { Transparency = 1 },
			selection = { SelectionImageObject = Callback(CursorType.RoundedRect) },
			onActivated = p1.props.onActivated
		}) else Roact.createElement(ImageSetButton, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Image = HomeOn1,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(32, 32),
			SelectionImageObject = Callback(CursorType.RoundedRect),
			[Roact.Event.Activated] = p1.props.onActivated
		})
	})
end

function HomeButton.render(p1)
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return HomeButton