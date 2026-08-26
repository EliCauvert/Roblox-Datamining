local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent
local navigateUpModule = require(parent.Thunks.NavigateUp)
local assetsModule = require(parent.Resources.Assets)
local constantsModule = require(parent.Resources.Constants)
local zonePortalModule = require(parent.Components.ZonePortal)
local directionModule = require(parent.Enums.Direction)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local image = foundationModule.Image
local themedTextLabelModule = require(script.Parent.ThemedTextLabel)

local function renderWithSelectionCursor(p1, p2)
	-- upvalues: withFoundationOrUIBloxStyle (ref), fFlagCoreUiMigrateUIBloxToFoundation (ref), roact (ref), image (ref), assetsModule (ref), var2 (ref), imageSetButton (ref), themedTextLabelModule (ref), constantsModule (ref), zonePortalModule (ref), directionModule (ref)
	return withFoundationOrUIBloxStyle(function(p3)
		return {
			Theme = {
				IconEmphasis = {
					Color = p3.Color.Content.Emphasis.Color3,
					Transparency = p3.Color.Content.Emphasis.Transparency
				},
				BackgroundContrast = {
					Color = p3.Color.Surface.Surface_100.Color3,
					Transparency = p3.Color.Surface.Surface_100.Transparency
				}
			}
		}
	end, function(p3)
		-- upvalues: p1 (ref), fFlagCoreUiMigrateUIBloxToFoundation (copy), roact (copy), image (copy), assetsModule (copy), p2 (ref), var2 (copy), imageSetButton (copy), themedTextLabelModule (copy), constantsModule (copy), zonePortalModule (copy), directionModule (copy)
		return roact.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			BorderSizePixel = 0,
			Selectable = false,
			BackgroundColor3 = p3.Theme.BackgroundContrast.Color,
			BackgroundTransparency = p3.Theme.BackgroundContrast.Transparency,
			Position = p1.position,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = p1.visible and not p1.pageIsModal,
			ZIndex = p1.zIndex
		}, {
			PageTitle = roact.createElement(themedTextLabelModule, {
				fontKey = "Header1",
				themeKey = "TextEmphasis",
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 28),
				Size = UDim2.new(1, -48, 0, 28),
				Text = p1.pageTitle
			}, {
				ExtraChildren = p1.titleChildren,
				BackButton = if fFlagCoreUiMigrateUIBloxToFoundation then roact.createElement(image, {
					tag = "content-emphasis anchor-center-left size-900",
					Image = assetsModule.Images.NavigateBack,
					backgroundStyle = { Transparency = 1 },
					Position = UDim2.new(0, 4, 0.5, 0),
					selection = {
						NextSelectionDown = p1.NextSelectionDown,
						SelectionImageObject = p2(var2.RoundedRect)
					},
					onActivated = p1.navigateUp,
					ref = p1.buttonRef
				}) else roact.createElement(imageSetButton, {
					BackgroundTransparency = 1,
					Image = assetsModule.Images.NavigateBack,
					AnchorPoint = Vector2.new(0, 0.5),
					ImageColor3 = p3.Theme.IconEmphasis.Color,
					ImageTransparency = p3.Theme.IconEmphasis.Transparency,
					Position = UDim2.new(0, 4, 0.5, 0),
					Size = UDim2.new(0, 36, 0, 36),
					NextSelectionDown = p1.NextSelectionDown,
					[roact.Event.Activated] = p1.navigateUp,
					[roact.Ref] = p1.buttonRef,
					SelectionImageObject = p2(var2.RoundedRect)
				})
			}),
			PageContainer = roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, constantsModule.Zone.ContentOffset, 1, 0),
				Size = UDim2.new(1, -constantsModule.Zone.ContentOffset, 1, -68)
			}, p1[roact.Children]),
			ZonePortal = roact.createElement(zonePortalModule, { targetZone = 0, direction = directionModule.Left })
		})
	end)
end

return roactRodux.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: navigateUpModule (ref)
	return {
		navigateUp = function()
			-- upvalues: p1 (ref), navigateUpModule (copy)
			p1(navigateUpModule)
		end
	}
end)(function(p1)
	-- upvalues: var1 (ref), renderWithSelectionCursor (ref)
	return var1(function(p2)
		-- upvalues: renderWithSelectionCursor (copy), p1 (ref)
		return renderWithSelectionCursor(p1, p2)
	end)
end)