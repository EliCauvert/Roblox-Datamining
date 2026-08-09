local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent
local navigateUpModule = require(parent.Thunks.NavigateUp)
local assetsModule = require(parent.Resources.Assets)
local constantsModule = require(parent.Resources.Constants)
local zonePortalModule = require(parent.Components.ZonePortal)
local directionModule = require(parent.Enums.Direction)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local themedTextLabelModule = require(script.Parent.ThemedTextLabel)

local function renderWithSelectionCursor(p0, p1) --[[ line: 28 ]]
	-- upvalues: withStyle (ref), roact (ref), imageSetButton (ref), assetsModule (ref), cursorKind (ref), themedTextLabelModule (ref), constantsModule (ref), zonePortalModule (ref), directionModule (ref)
	return withStyle(function(p2) --[[ line: 29 ]]
		-- upvalues: p0 (ref), roact (copy), imageSetButton (copy), assetsModule (copy), p1 (ref), cursorKind (copy), themedTextLabelModule (copy), constantsModule (copy), zonePortalModule (copy), directionModule (copy)
		return roact.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			BorderSizePixel = 0,
			Selectable = false,
			BackgroundColor3 = p2.Theme.BackgroundContrast.Color,
			BackgroundTransparency = p2.Theme.BackgroundContrast.Transparency,
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
				BackButton = roact.createElement(imageSetButton, {
					BackgroundTransparency = 1,
					Image = assetsModule.Images.NavigateBack,
					AnchorPoint = Vector2.new(0, 0.5),
					ImageColor3 = p2.Theme.IconEmphasis.Color,
					ImageTransparency = p2.Theme.IconEmphasis.Transparency,
					Position = UDim2.new(0, 4, 0.5, 0),
					Size = UDim2.new(0, 36, 0, 36),
					NextSelectionDown = p0.NextSelectionDown,
					[roact.Event.Activated] = p0.navigateUp,
					[roact.Ref] = p0.buttonRef,
					SelectionImageObject = p1(cursorKind.RoundedRect)
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

return roactRodux.UNSTABLE_connect2(nil, function(p5) --[[ line: 88 ]]
	-- upvalues: navigateUpModule (ref)
	return {
		navigateUp = function() --[[ line: 90 ]]
			-- upvalues: p5 (ref), navigateUpModule (copy)
			p5(navigateUpModule)
		end
	}
end)(function(p3) --[[ line: 82 | named "Page" ]]
	-- upvalues: withSelectionCursorProvider (ref), renderWithSelectionCursor (ref)
	return withSelectionCursorProvider(function(p4) --[[ line: 83 ]]
		-- upvalues: renderWithSelectionCursor (copy), p3 (ref)
		return renderWithSelectionCursor(p3, p4)
	end)
end)