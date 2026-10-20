local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local WithCursorMigration = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorType = if FFlagCoreUiMigrateUIBloxToFoundation then FoundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local Parent = script.Parent.Parent.Parent
local GlobalConfigModule = require(Parent.GlobalConfig)
local ThemedTextLabelModule = require(script.Parent.Parent.ThemedTextLabel)
local DividerModule = require(script.Parent.Parent.Divider)
local NavigateBackModule = require(Parent.Actions.NavigateBack)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local AssetsModule = require(Parent.Resources.Assets)
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local Image = FoundationModule.Image
local StrictInterfaceResult = T.strictInterface({
	titleText = T.string,
	[Roact.Children] = T.optional(T.table),
	onClosed = T.callback,
	closeButtonRef = T.optional(T.table)
})

local function ControlLayoutContainerWithSelectionCursor(p1, Callback)
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithLocalizationModule (copy), WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Image (copy), AssetsModule (copy), CursorType (copy), ImageSetButton (copy), ThemedTextLabelModule (copy), DividerModule (copy), ImageSetLabel (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(p1))
	end
	return WithLocalizationModule({ titleText = p1.titleText })(function(p2)
		-- upvalues: WithFoundationOrUIBloxStyleFunction (upval), Roact (upval), p1 (copy), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), AssetsModule (upval), Callback (copy), CursorType (upval), ImageSetButton (upval), ThemedTextLabelModule (upval), DividerModule (upval), ImageSetLabel (upval)
		return WithFoundationOrUIBloxStyleFunction(function(p3)
			return {
				Theme = {
					Overlay = {
						Color = p3.Color.Common.Scrim.Color3,
						Transparency = p3.Color.Common.Scrim.Transparency
					}
				}
			}
		end, function(p3)
			-- upvalues: Roact (upval), p1 (upval), FFlagCoreUiMigrateUIBloxToFoundation (upval), Image (upval), AssetsModule (upval), Callback (upval), CursorType (upval), ImageSetButton (upval), ThemedTextLabelModule (upval), p2 (copy), DividerModule (upval), ImageSetLabel (upval)
			return Roact.createElement("Frame", {
				BackgroundTransparency = 0,
				Active = true,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = p3.Theme.Overlay.Color
			}, {
				PageContent = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 1, -132),
					Position = UDim2.new(0, 0, 0, 132)
				}, p1[Roact.Children]),
				HeaderContainer = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 132)
				}, {
					Padding = Roact.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 95),
						PaddingRight = UDim.new(0, 95)
					}),
					CloseButton = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0, 100),
						Size = UDim2.new(0, 36, 0, 36),
						backgroundStyle = { Transparency = 1 },
						Image = AssetsModule.Images.CloseModal,
						selection = { SelectionImageObject = Callback(CursorType.RoundedRect) },
						onActivated = p1.onClosed,
						ref = p1.closeButtonRef
					}) else Roact.createElement(ImageSetButton, {
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0, 100),
						Size = UDim2.new(0, 36, 0, 36),
						Image = AssetsModule.Images.CloseModal,
						BackgroundTransparency = 1,
						SelectionImageObject = Callback(CursorType.RoundedRect),
						[Roact.Event.Activated] = p1.onClosed,
						[Roact.Ref] = p1.closeButtonRef
					}),
					HeaderTextLabel = Roact.createElement(ThemedTextLabelModule, {
						fontKey = "Header1",
						themeKey = "TextEmphasis",
						Size = UDim2.new(0, 250, 0, 28),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0, 100),
						Text = p2.titleText
					}),
					HeaderDivider = Roact.createElement(DividerModule, {
						Size = UDim2.new(1, 0, 0, 2),
						AnchorPoint = Vector2.new(0.5, 1),
						Position = UDim2.new(0.5, 0, 1, 0)
					})
				}),
				RadialGlowBig = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
					Image = AssetsModule.Images.RadialGlow,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					backgroundStyle = { Transparency = 1 },
					SizeConstraint = Enum.SizeConstraint.RelativeXX,
					Size = UDim2.new(1, 0, 1, 0)
				}) else Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = AssetsModule.Images.RadialGlow,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					SizeConstraint = Enum.SizeConstraint.RelativeXX,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				RadialGlowSquashed = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
					Image = AssetsModule.Images.RadialGlow,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 1, 0),
					backgroundStyle = { Transparency = 1 },
					SizeConstraint = Enum.SizeConstraint.RelativeXX,
					Size = UDim2.new(1, 0, 0.6, 0)
				}) else Roact.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = AssetsModule.Images.RadialGlow,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 1, 0),
					SizeConstraint = Enum.SizeConstraint.RelativeXX,
					Size = UDim2.new(1, 0, 0.6, 0)
				})
			})
		end)
	end)
end

return InGameMenuDependenciesModule.RoactRodux.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: NavigateBackModule (copy)
	return {
		onClosed = function()
			-- upvalues: Callback (copy), NavigateBackModule (upval)
			Callback(NavigateBackModule())
		end
	}
end)(function(p1)
	-- upvalues: WithCursorMigration (copy), ControlLayoutContainerWithSelectionCursor (copy)
	return WithCursorMigration(function(p2)
		-- upvalues: ControlLayoutContainerWithSelectionCursor (upval), p1 (copy)
		return ControlLayoutContainerWithSelectionCursor(p1, p2)
	end)
end)