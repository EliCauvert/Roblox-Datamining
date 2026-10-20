local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local Cryo = InGameMenuDependenciesModule.Cryo
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local Parent = script.Parent.Parent.Parent
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local AssetsModule = require(Parent.Resources.Assets)
local ReactModule = require(CorePackages.Packages.React)
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Image = FoundationModule.Image
local GameLabel = Roact.PureComponent:extend("GameLabel")
GameLabel.validateProps = T.strictInterface({
	gameId = T.number,
	gameName = T.string,
	LayoutOrder = T.integer,
	onActivated = T.optional(T.callback),
	[Roact.Children] = T.optional(T.table),
	buttonRef = T.optional(T.table)
})

function GameLabel.renderButtons(p1)
	-- upvalues: Roact (copy), Cryo (copy)
	return (Cryo.Dictionary.join(p1.props[Roact.Children] or {}, {
		List = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		})
	}))
end

function GameLabel.renderWithSelectionCursor(p1, Callback)
	-- upvalues: AssetsModule (copy), WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), ReactModule (copy), CursorType (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), ImageSetLabel (copy), ThemedTextLabelModule (copy)
	local GameId = p1.props.gameId
	local Text = if p1.props.gameId > 0 then "rbxthumb://type=GameIcon&id=" .. GameId .. "&w=150&h=150" else AssetsModule.Images.PlaceholderGameIcon
	
	return WithFoundationOrUIBloxStyleFunction(function(_)
		return {}
	end, function(_)
		-- upvalues: Roact (upval), ReactModule (upval), p1 (copy), Callback (copy), CursorType (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), Text (ref), ImageSetLabel (upval), ThemedTextLabelModule (upval)
		return Roact.createElement("TextButton", {
			[ReactModule.Tag] = "data-testid=experienceLabel",
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 70),
			Text = "",
			AutoButtonColor = false,
			SelectionImageObject = Callback(CursorType.Square),
			[Roact.Ref] = p1.props.buttonRef,
			[Roact.Event.Activated] = p1.props.onActivated
		}, {
			GameIcon = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 24, 0.5, 0),
				Size = UDim2.new(0, 44, 0, 44),
				Image = Text
			}) else Roact.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 24, 0.5, 0),
				Size = UDim2.new(0, 44, 0, 44),
				Image = Text
			}),
			GameNameLabel = Roact.createElement(ThemedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 80, 0.5, 0),
				Size = UDim2.new(0, 219, 0, 22),
				Text = p1.props.gameName,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			ButtonContainer = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, -24, 0, 0),
				Size = UDim2.new(0, 0, 1, 0)
			}, p1:renderButtons())
		})
	end)
end

function GameLabel.render(p1)
	-- upvalues: WithCursorMigration (copy)
	return WithCursorMigration(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return Roact.forwardRef(function(p1, ButtonRef)
	-- upvalues: Roact (copy), GameLabel (copy), Cryo (copy)
	return Roact.createElement(GameLabel, Cryo.Dictionary.join(p1, { buttonRef = ButtonRef }))
end)