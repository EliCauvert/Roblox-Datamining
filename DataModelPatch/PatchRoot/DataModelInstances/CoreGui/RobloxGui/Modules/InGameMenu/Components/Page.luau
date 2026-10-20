local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local Parent = script.Parent.Parent
local NavigateUpModule = require(Parent.Thunks.NavigateUp)
local AssetsModule = require(Parent.Resources.Assets)
local ConstantsModule = require(Parent.Resources.Constants)
local ZonePortalModule = require(Parent.Components.ZonePortal)
local DirectionModule = require(Parent.Enums.Direction)
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local Image = require(CorePackages.Packages.Foundation).Image
local FFlagCoreUiMigrateUIBloxToFoundation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local ThemedTextLabelModule = require(script.Parent.ThemedTextLabel)

local function renderWithSelectionCursor(p1, Callback)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FFlagCoreUiMigrateUIBloxToFoundation (copy), Roact (copy), Image (copy), AssetsModule (copy), CursorKind (copy), ImageSetButton (copy), ThemedTextLabelModule (copy), ConstantsModule (copy), ZonePortalModule (copy), DirectionModule (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2)
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
	end, function(p2)
		-- upvalues: p1 (copy), FFlagCoreUiMigrateUIBloxToFoundation (upval), Roact (upval), Image (upval), AssetsModule (upval), Callback (copy), CursorKind (upval), ImageSetButton (upval), ThemedTextLabelModule (upval), ConstantsModule (upval), ZonePortalModule (upval), DirectionModule (upval)
		return Roact.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			BorderSizePixel = 0,
			Selectable = false,
			BackgroundColor3 = p2.Theme.BackgroundContrast.Color,
			BackgroundTransparency = p2.Theme.BackgroundContrast.Transparency,
			Position = p1.position,
			Size = UDim2.new(1, 0, 1, 0),
			Visible = p1.visible and not p1.pageIsModal,
			ZIndex = p1.zIndex
		}, {
			PageTitle = Roact.createElement(ThemedTextLabelModule, {
				fontKey = "Header1",
				themeKey = "TextEmphasis",
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 28),
				Size = UDim2.new(1, -48, 0, 28),
				Text = p1.pageTitle
			}, {
				ExtraChildren = p1.titleChildren,
				BackButton = if FFlagCoreUiMigrateUIBloxToFoundation then Roact.createElement(Image, {
					tag = "content-emphasis anchor-center-left size-900",
					Image = AssetsModule.Images.NavigateBack,
					Position = UDim2.new(0, 4, 0.5, 0),
					selection = {
						NextSelectionDown = p1.NextSelectionDown,
						SelectionImageObject = Callback(CursorKind.RoundedRect)
					},
					onActivated = p1.navigateUp,
					ref = p1.buttonRef
				}) else Roact.createElement(ImageSetButton, {
					BackgroundTransparency = 1,
					Image = AssetsModule.Images.NavigateBack,
					AnchorPoint = Vector2.new(0, 0.5),
					ImageColor3 = p2.Theme.IconEmphasis.Color,
					ImageTransparency = p2.Theme.IconEmphasis.Transparency,
					Position = UDim2.new(0, 4, 0.5, 0),
					Size = UDim2.new(0, 36, 0, 36),
					NextSelectionDown = p1.NextSelectionDown,
					[Roact.Event.Activated] = p1.navigateUp,
					[Roact.Ref] = p1.buttonRef,
					SelectionImageObject = Callback(CursorKind.RoundedRect)
				})
			}),
			PageContainer = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, ConstantsModule.Zone.ContentOffset, 1, 0),
				Size = UDim2.new(1, -ConstantsModule.Zone.ContentOffset, 1, -68)
			}, p1[Roact.Children]),
			ZonePortal = Roact.createElement(ZonePortalModule, { targetZone = 0, direction = DirectionModule.Left })
		})
	end)
end

return InGameMenuDependenciesModule.RoactRodux.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: NavigateUpModule (copy)
	return {
		navigateUp = function()
			-- upvalues: Callback (copy), NavigateUpModule (upval)
			Callback(NavigateUpModule)
		end
	}
end)(function(p1)
	-- upvalues: WithSelectionCursorProviderFunction (copy), renderWithSelectionCursor (copy)
	return WithSelectionCursorProviderFunction(function(p2)
		-- upvalues: renderWithSelectionCursor (upval), p1 (copy)
		return renderWithSelectionCursor(p1, p2)
	end)
end)