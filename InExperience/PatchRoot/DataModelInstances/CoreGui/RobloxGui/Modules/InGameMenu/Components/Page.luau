local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var3 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var4 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent
local navigateUpModule = require(parent.Thunks.NavigateUp)
local assetsModule = require(parent.Resources.Assets)
local constantsModule = require(parent.Resources.Constants)
local zonePortalModule = require(parent.Components.ZonePortal)
local directionModule = require(parent.Enums.Direction)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local image = foundationModule.Image
local themedTextLabelModule = require(script.Parent.ThemedTextLabel)

local function renderWithSelectionCursor(p0, p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), roact (ref), image (ref), assetsModule (ref), var4 (ref), imageSetButton (ref), themedTextLabelModule (ref), constantsModule (ref), zonePortalModule (ref), directionModule (ref)
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				IconEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				},
				BackgroundContrast = {
					Color = p2.Color.Surface.Surface_100.Color3,
					Transparency = p2.Color.Surface.Surface_100.Transparency
				}
			}
		}
	end, function(p3)
		-- upvalues: p0 (ref), fFlagCoreUiMigrateUIBloxToFoundation (copy), roact (copy), image (copy), assetsModule (copy), p1 (ref), var4 (copy), imageSetButton (copy), themedTextLabelModule (copy), constantsModule (copy), zonePortalModule (copy), directionModule (copy)
		return roact.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			BorderSizePixel = 0,
			Selectable = false,
			BackgroundColor3 = p3.Theme.BackgroundContrast.Color,
			BackgroundTransparency = p3.Theme.BackgroundContrast.Transparency,
			Position = p0.position,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = p0.visible and not p0.pageIsModal,
			ZIndex = p0.zIndex
		}, {
			PageTitle = roact.createElement(themedTextLabelModule, {
				fontKey = "Header1",
				themeKey = "TextEmphasis",
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 28),
				Size = UDim2.new(1, -48, 0, 28),
				Text = p0.pageTitle
			}, {
				ExtraChildren = p0.titleChildren,
				BackButton = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
					tag = "content-emphasis anchor-center-left size-900",
					Image = assetsModule.Images.NavigateBack,
					backgroundStyle = { Transparency = 1 },
					Position = UDim2.new(0, 4, 0.5, 0),
					selection = {
						NextSelectionDown = p0.NextSelectionDown,
						SelectionImageObject = p1(var4.RoundedRect)
					},
					onActivated = p0.navigateUp,
					ref = p0.buttonRef
				}) else roact.createElement(imageSetButton, {
					BackgroundTransparency = 1,
					Image = assetsModule.Images.NavigateBack,
					AnchorPoint = Vector2.new(0, 0.5),
					ImageColor3 = p3.Theme.IconEmphasis.Color,
					ImageTransparency = p3.Theme.IconEmphasis.Transparency,
					Position = UDim2.new(0, 4, 0.5, 0),
					Size = UDim2.new(0, 36, 0, 36),
					NextSelectionDown = p0.NextSelectionDown,
					[roact.Event.Activated] = p0.navigateUp,
					[roact.Ref] = p0.buttonRef,
					SelectionImageObject = p1(var4.RoundedRect)
				})
			}),
			PageContainer = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, constantsModule.Zone.ContentOffset, 1, 0),
				Size = UDim2.new(1, -constantsModule.Zone.ContentOffset, 1, -68)
			}, p0[roact.Children]),
			ZonePortal = roact.createElement(zonePortalModule, { targetZone = 0, direction = directionModule.Left })
		})
	end)
end

return roactRodux.UNSTABLE_connect2(nil, function(p6)
	-- upvalues: navigateUpModule (ref)
	return {
		navigateUp = function()
			-- upvalues: p6 (ref), navigateUpModule (copy)
			p6(navigateUpModule)
		end
	}
end)(function(p4)
	-- upvalues: var3 (ref), renderWithSelectionCursor (ref)
	return var3(function(p5)
		-- upvalues: renderWithSelectionCursor (copy), p4 (ref)
		return renderWithSelectionCursor(p4, p5)
	end)
end)