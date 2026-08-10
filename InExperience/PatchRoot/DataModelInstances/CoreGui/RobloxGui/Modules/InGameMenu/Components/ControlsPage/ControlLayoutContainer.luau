local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var3 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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
local var11 = t.strictInterface({
	titleText = t.string,
	[roact.Children] = t.optional(t.table),
	onClosed = t.callback,
	closeButtonRef = t.optional(t.table)
})

local function ControlLayoutContainerWithSelectionCursor(p0, p1) --[[ line: 53 ]]
	-- upvalues: globalConfigModule (ref), var11 (ref), withLocalizationModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), image (ref), assetsModule (ref), var4 (ref), imageSetButton (ref), themedTextLabelModule (ref), dividerModule (ref), imageSetLabel (ref)
	if globalConfigModule.propValidation then
		assert(var11(p0))
	end
	return withLocalizationModule({ titleText = p0.titleText })(function(p2) --[[ line: 60 ]]
		-- upvalues: withFoundationOrUIBloxStyle (copy), roact (copy), p0 (ref), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), p1 (ref), var4 (copy), imageSetButton (copy), themedTextLabelModule (copy), dividerModule (copy), imageSetLabel (copy)
		return withFoundationOrUIBloxStyle(function(p3) --[[ line: 61 ]]
			return {
				Theme = {
					Overlay = {
						Color = p3.Color.Common.Scrim.Color3,
						Transparency = p3.Color.Common.Scrim.Transparency
					}
				}
			}
		end, function(p4) --[[ line: 70 ]]
			-- upvalues: roact (copy), p0 (copy), fFlagCoreUiMigrateUIBloxToFoundation (copy), image (copy), assetsModule (copy), p1 (copy), var4 (copy), imageSetButton (copy), themedTextLabelModule (copy), p2 (ref), dividerModule (copy), imageSetLabel (copy)
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
				}, p0[roact.Children]),
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
						selection = { SelectionImageObject = p1(var4.RoundedRect) },
						onActivated = p0.onClosed,
						ref = p0.closeButtonRef
					}) else roact.createElement(imageSetButton, {
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0, 100),
						Size = UDim2.new(0, 36, 0, 36),
						Image = assetsModule.Images.CloseModal,
						BackgroundTransparency = 1,
						SelectionImageObject = p1(var4.RoundedRect),
						[roact.Event.Activated] = p0.onClosed,
						[roact.Ref] = p0.closeButtonRef
					}),
					HeaderTextLabel = roact.createElement(themedTextLabelModule, {
						fontKey = "Header1",
						themeKey = "TextEmphasis",
						Size = UDim2.new(0, 250, 0, 28),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0, 100),
						Text = p2.titleText
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

return roactRodux.UNSTABLE_connect2(nil, function(p7) --[[ line: 188 ]]
	-- upvalues: navigateBackModule (ref)
	return {
		onClosed = function() --[[ line: 190 ]]
			-- upvalues: p7 (ref), navigateBackModule (copy)
			p7(navigateBackModule())
		end
	}
end)(function(p5) --[[ line: 182 | named "ControlLayoutContainer" ]]
	-- upvalues: var3 (ref), ControlLayoutContainerWithSelectionCursor (ref)
	return var3(function(p6) --[[ line: 183 ]]
		-- upvalues: ControlLayoutContainerWithSelectionCursor (copy), p5 (ref)
		return ControlLayoutContainerWithSelectionCursor(p5, p6)
	end)
end)