local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local parent = script.Parent.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local globalConfigModule = require(parent.GlobalConfig)
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local var3 = t.strictInterface({
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	layoutOrder = t.optional(t.integer),
	onActivated = t.callback,
	onSelectionGained = t.optional(t.callback),
	onSelectionLost = t.optional(t.callback),
	forwardRef = t.optional(t.table)
})

local function renderWithSelectionCursor(p0, p1) --[[ line: 29 ]]
	-- upvalues: globalConfigModule (ref), var3 (ref), roact (ref), imageSetButton (ref), assetsModule (ref), cursorKind (ref)
	if globalConfigModule.propValidation then
		assert(var3(p0))
	end
	return roact.createElement(imageSetButton, {
		AnchorPoint = p0.AnchorPoint,
		BackgroundTransparency = 1,
		Image = assetsModule.Images.CloseButton,
		Position = p0.Position,
		Size = UDim2.new(0, 32, 0, 32),
		LayoutOrder = p0.layoutOrder,
		SelectionImageObject = p1(cursorKind.RoundedRect),
		[roact.Event.Activated] = p0.onActivated,
		[roact.Event.SelectionGained] = p0.onSelectionGained,
		[roact.Event.SelectionLost] = p0.onSelectionLost,
		[roact.Ref] = p0.forwardRef
	})
end

local function CloseMenuButton(p2) --[[ line: 50 ]]
	-- upvalues: withSelectionCursorProvider (ref), renderWithSelectionCursor (ref)
	return withSelectionCursorProvider(function(p3) --[[ line: 51 ]]
		-- upvalues: renderWithSelectionCursor (copy), p2 (ref)
		return renderWithSelectionCursor(p2, p3)
	end)
end

return roact.forwardRef(function(p4, p5) --[[ line: 56 ]]
	-- upvalues: roact (ref), CloseMenuButton (ref), cryo (ref)
	return roact.createElement(CloseMenuButton, cryo.Dictionary.join(p4, { forwardRef = p5 }))
end)