local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local themedTextLabelModule = require(script.Parent.Parent.ThemedTextLabel)
local dividerModule = require(script.Parent.Parent.Divider)
local navigateBackModule = require(parent.Actions.NavigateBack)
local withLocalizationModule = require(parent.Localization.withLocalization)
local assetsModule = require(parent.Resources.Assets)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local image = foundationModule.Image
local var3 = t.strictInterface({
	titleText = t.string,
	[roact.Children] = t.optional(t.table),
	onClosed = t.callback,
	closeButtonRef = t.optional(t.table)
})

local function ControlLayoutContainerWithSelectionCursor(p1, p2)
	-- upvalues: globalConfigModule (ref), var3 (ref), withLocalizationModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), var2 (ref), imageSetButton (ref), themedTextLabelModule (ref), dividerModule (ref), imageSetLabel (ref)
	if globalConfigModule.propValidation then
		assert(var3(p1))
	end
	return withLocalizationModule({ titleText = p1.titleText })(function(p3)
		-- upvalues: withFoundationOrUIBloxStyle (copy), roact (copy), p1 (ref), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), p2 (ref), var2 (copy), imageSetButton (copy), themedTextLabelModule (copy), dividerModule (copy), imageSetLabel (copy)
		return withFoundationOrUIBloxStyle(function(p4)
			return {
				Theme = {
					Overlay = {
						Color = p4.Color.Common.Scrim.Color3,
						Transparency = p4.Color.Common.Scrim.Transparency
					}
				}
			}
		end, function(p4)
			-- upvalues: roact (copy), p1 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), p2 (copy), var2 (copy), imageSetButton (copy), themedTextLabelModule (copy), p3 (ref), dividerModule (copy), imageSetLabel (copy)
			return roact.createElement("Frame", {
				BackgroundTransparency = 0,
				Active = true,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = p4.Theme.Overlay.Color
			}, {
				PageContent = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = UDim2.new(1, 0, 1, -132),
					Position = UDim2.new(0, 0, 0, 132)
				}, p1[roact.Children]),
				HeaderContainer = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 132)
				}, {
					Padding = roact.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, 95),
						PaddingRight = UDim.new(0, 95)
					}),
					CloseButton = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0, 100),
						Size = UDim2.new(0, 36, 0, 36),
						backgroundStyle = { Transparency = 1 },
						Image = assetsModule.Images.CloseModal,
						selection = { SelectionImageObject = p2(var2.RoundedRect) },
						onActivated = p1.onClosed,
						ref = p1.closeButtonRef
					}) else roact.createElement(imageSetButton, {
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0, 100),
						Size = UDim2.new(0, 36, 0, 36),
						Image = assetsModule.Images.CloseModal,
						BackgroundTransparency = 1,
						SelectionImageObject = p2(var2.RoundedRect),
						[roact.Event.Activated] = p1.onClosed,
						[roact.Ref] = p1.closeButtonRef
					}),
					HeaderTextLabel = roact.createElement(themedTextLabelModule, {
						fontKey = "Header1",
						themeKey = "TextEmphasis",
						Size = UDim2.new(0, 250, 0, 28),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0, 100),
						Text = p3.titleText
					}),
					HeaderDivider = roact.createElement(dividerModule, {
						Size = UDim2.new(1, 0, 0, 2),
						AnchorPoint = Vector2.new(0.5, 1),
						Position = UDim2.new(0.5, 0, 1, 0)
					})
				}),
				RadialGlowBig = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
					Image = assetsModule.Images.RadialGlow,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					backgroundStyle = { Transparency = 1 },
					SizeConstraint = Enum.SizeConstraint.RelativeXX,
					Size = UDim2.new(1, 0, 1, 0)
				}) else roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = assetsModule.Images.RadialGlow,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					SizeConstraint = Enum.SizeConstraint.RelativeXX,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				RadialGlowSquashed = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
					Image = assetsModule.Images.RadialGlow,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 1, 0),
					backgroundStyle = { Transparency = 1 },
					SizeConstraint = Enum.SizeConstraint.RelativeXX,
					Size = UDim2.new(1, 0, 0.6, 0)
				}) else roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = assetsModule.Images.RadialGlow,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 1, 0),
					SizeConstraint = Enum.SizeConstraint.RelativeXX,
					Size = UDim2.new(1, 0, 0.6, 0)
				})
			})
		end)
	end)
end

return roactRodux.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: navigateBackModule (ref)
	return {
		onClosed = function()
			-- upvalues: p1 (ref), navigateBackModule (copy)
			p1(navigateBackModule())
		end
	}
end)(function(p1)
	-- upvalues: var1 (ref), ControlLayoutContainerWithSelectionCursor (ref)
	return var1(function(p2)
		-- upvalues: ControlLayoutContainerWithSelectionCursor (copy), p1 (ref)
		return ControlLayoutContainerWithSelectionCursor(p1, p2)
	end)
end)