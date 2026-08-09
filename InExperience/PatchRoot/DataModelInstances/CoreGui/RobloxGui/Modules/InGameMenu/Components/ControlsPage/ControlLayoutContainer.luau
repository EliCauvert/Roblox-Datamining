local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local themedTextLabelModule = require(script.Parent.Parent.ThemedTextLabel)
local dividerModule = require(script.Parent.Parent.Divider)
local navigateBackModule = require(parent.Actions.NavigateBack)
local withLocalizationModule = require(parent.Localization.withLocalization)
local assetsModule = require(parent.Resources.Assets)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local imageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local var7 = t.strictInterface({
	titleText = t.string,
	[roact.Children] = t.optional(t.table),
	onClosed = t.callback,
	closeButtonRef = t.optional(t.table)
})

local function ControlLayoutContainerWithSelectionCursor(p0, p1) --[[ line: 43 ]]
	-- upvalues: globalConfigModule (ref), var7 (ref), withLocalizationModule (ref), withStyle (ref), roact (ref), imageSetButton (ref), assetsModule (ref), cursorKind (ref), themedTextLabelModule (ref), dividerModule (ref), imageSetLabel (ref)
	if globalConfigModule.propValidation then
		assert(var7(p0))
	end
	return withLocalizationModule({ titleText = p0.titleText })(function(p2) --[[ line: 50 ]]
		-- upvalues: withStyle (copy), roact (copy), p0 (ref), imageSetButton (copy), assetsModule (copy), p1 (ref), cursorKind (copy), themedTextLabelModule (copy), dividerModule (copy), imageSetLabel (copy)
		return withStyle(function(p3) --[[ line: 51 ]]
			-- upvalues: roact (copy), p0 (copy), imageSetButton (copy), assetsModule (copy), p1 (copy), cursorKind (copy), themedTextLabelModule (copy), p2 (ref), dividerModule (copy), imageSetLabel (copy)
			return roact.createElement("Frame", {
				BackgroundTransparency = 0,
				Active = true,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = p3.Theme.Overlay.Color
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
					CloseButton = roact.createElement(imageSetButton, {
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(0, 0, 0, 100),
						Size = UDim2.new(0, 36, 0, 36),
						Image = assetsModule.Images.CloseModal,
						BackgroundTransparency = 1,
						SelectionImageObject = p1(cursorKind.RoundedRect),
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
				RadialGlowBig = roact.createElement(imageSetLabel, {
					BackgroundTransparency = 1,
					Image = assetsModule.Images.RadialGlow,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					SizeConstraint = Enum.SizeConstraint.RelativeXX,
					Size = UDim2.new(1, 0, 1, 0)
				}),
				RadialGlowSquashed = roact.createElement(imageSetLabel, {
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

return roactRodux.UNSTABLE_connect2(nil, function(p6) --[[ line: 139 ]]
	-- upvalues: navigateBackModule (ref)
	return {
		onClosed = function() --[[ line: 141 ]]
			-- upvalues: p6 (ref), navigateBackModule (copy)
			p6(navigateBackModule())
		end
	}
end)(function(p4) --[[ line: 133 | named "ControlLayoutContainer" ]]
	-- upvalues: withSelectionCursorProvider (ref), ControlLayoutContainerWithSelectionCursor (ref)
	return withSelectionCursorProvider(function(p5) --[[ line: 134 ]]
		-- upvalues: ControlLayoutContainerWithSelectionCursor (copy), p4 (ref)
		return ControlLayoutContainerWithSelectionCursor(p4, p5)
	end)
end)