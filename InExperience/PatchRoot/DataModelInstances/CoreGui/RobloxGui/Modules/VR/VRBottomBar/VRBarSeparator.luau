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

local function renderWithSelectionCursor(p1, p2)
	-- upvalues: roact (ref), imageSetButton (ref), cursorKind (ref)
	return roact.createElement(imageSetButton, {
		Visible = true,
		AnchorPoint = p1.AnchorPoint,
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/MenuBar/divider.png",
		Position = UDim2.new(0, 1, 0, 1),
		Size = UDim2.new(0, 28, 0, 36),
		LayoutOrder = p1.layoutOrder,
		SelectionImageObject = p2(cursorKind.RoundedRect),
		[roact.Event.Activated] = function() end,
		[roact.Event.SelectionGained] = p1.onSelectionGained,
		[roact.Event.SelectionLost] = p1.onSelectionLost,
		[roact.Ref] = p1.forwardRef
	})
end

local function VRBarSeparator(p1)
	-- upvalues: withSelectionCursorProvider (ref), renderWithSelectionCursor (ref)
	return withSelectionCursorProvider(function(p2)
		-- upvalues: renderWithSelectionCursor (copy), p1 (ref)
		return renderWithSelectionCursor(p1, p2)
	end)
end

return roact.forwardRef(function(p1, p2)
	-- upvalues: roact (ref), VRBarSeparator (ref), cryo (ref)
	return roact.createElement(VRBarSeparator, cryo.Dictionary.join(p1, { forwardRef = p2 }))
end)