local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local cryo = inGameMenuDependenciesModule.Cryo
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local assetsModule = require(parent.Resources.Assets)
local reactModule = require(corePackagesService.Packages.React)
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local image = foundationModule.Image
local gameLabel = roact.PureComponent:extend("GameLabel")
gameLabel.validateProps = t.strictInterface({
	gameId = t.number,
	gameName = t.string,
	LayoutOrder = t.integer,
	onActivated = t.optional(t.callback),
	[roact.Children] = t.optional(t.table),
	buttonRef = t.optional(t.table)
})

function gameLabel.renderButtons(p1)
	-- upvalues: roact (ref), cryo (ref)
	return cryo.Dictionary.join(p1.props[roact.Children] or {}, {
		List = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		})
	})
end

function gameLabel.renderWithSelectionCursor(p1, p2)
	-- upvalues: assetsModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref), reactModule (ref), var2 (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), imageSetLabel (ref), themedTextLabelModule (ref)
	local var3 = if p1.props.gameId > 0 then "rbxthumb://type=GameIcon&id=" .. p1.props.gameId .. "&w=150&h=150" else assetsModule.Images.PlaceholderGameIcon
	
	return withFoundationOrUIBloxStyle(function(_)
		return {}
	end, function(_)
		-- upvalues: roact (copy), reactModule (copy), p1 (ref), p2 (ref), var2 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), var3 (write), imageSetLabel (copy), themedTextLabelModule (copy)
		return roact.createElement("TextButton", {
			[reactModule.Tag] = "data-testid=experienceLabel",
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 70),
			Text = "",
			AutoButtonColor = false,
			SelectionImageObject = p2(var2.Square),
			[roact.Ref] = p1.props.buttonRef,
			[roact.Event.Activated] = p1.props.onActivated
		}, {
			GameIcon = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 24, 0.5, 0),
				Size = UDim2.new(0, 44, 0, 44),
				Image = var3
			}) else roact.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 24, 0.5, 0),
				Size = UDim2.new(0, 44, 0, 44),
				Image = var3
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

function gameLabel.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return roact.forwardRef(function(p1, p2)
	-- upvalues: roact (ref), gameLabel (ref), cryo (ref)
	return roact.createElement(gameLabel, cryo.Dictionary.join(p1, { buttonRef = p2 }))
end)