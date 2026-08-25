local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local t = inGameMenuDependenciesModule.t
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local cryo = inGameMenuDependenciesModule.Cryo
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
local imageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local _ = game:GetService("StarterGui")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = game:GetService("StarterPlayer")
local _ = t.strictInterface({
	AnchorPoint = t.optional(t.Vector2),
	Position = t.optional(t.UDim2),
	layoutOrder = t.optional(t.integer),
	onActivated = t.callback,
	onSelectionGained = t.optional(t.callback),
	onSelectionLost = t.optional(t.callback),
	forwardRef = t.optional(t.table)
})

local function renderWithSelectionCursor(p0, p1)
	-- upvalues: roact (ref), imageSetButton (ref), cursorKind (ref)
	return roact.createElement(imageSetButton, {
		Visible = true,
		AnchorPoint = p0.AnchorPoint,
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/MenuBar/divider.png",
		Position = UDim2.new(0, 1, 0, 1),
		Size = UDim2.new(0, 28, 0, 36),
		LayoutOrder = p0.layoutOrder,
		SelectionImageObject = p1(cursorKind.RoundedRect),
		[roact.Event.Activated] = function() end,
		[roact.Event.SelectionGained] = p0.onSelectionGained,
		[roact.Event.SelectionLost] = p0.onSelectionLost,
		[roact.Ref] = p0.forwardRef
	})
end

local function VRBarSeparator(p2)
	-- upvalues: withSelectionCursorProvider (ref), renderWithSelectionCursor (ref)
	return withSelectionCursorProvider(function(p3)
		-- upvalues: renderWithSelectionCursor (copy), p2 (ref)
		return renderWithSelectionCursor(p2, p3)
	end)
end

return roact.forwardRef(function(p4, p5)
	-- upvalues: roact (ref), VRBarSeparator (ref), cryo (ref)
	return roact.createElement(VRBarSeparator, cryo.Dictionary.join(p4, { forwardRef = p5 }))
end)