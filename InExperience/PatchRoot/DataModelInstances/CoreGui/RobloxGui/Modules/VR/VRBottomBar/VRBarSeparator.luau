local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local T = InGameMenuDependenciesModule.t
local Roact = InGameMenuDependenciesModule.Roact
local UIBlox = InGameMenuDependenciesModule.UIBlox
local Cryo = InGameMenuDependenciesModule.Cryo
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local ImageSetButton = UIBlox.Core.ImageSet.ImageSetButton
local _ = game:GetService("StarterGui")
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local _ = game:GetService("StarterPlayer")
local _ = T.strictInterface({
	AnchorPoint = T.optional(T.Vector2),
	Position = T.optional(T.UDim2),
	layoutOrder = T.optional(T.integer),
	onActivated = T.callback,
	onSelectionGained = T.optional(T.callback),
	onSelectionLost = T.optional(T.callback),
	forwardRef = T.optional(T.table)
})

local function renderWithSelectionCursor(Frame, Callback) --[[ Line: 44 ]]
	-- upvalues: Roact (copy), ImageSetButton (copy), CursorKind (copy)
	return Roact.createElement(ImageSetButton, {
		Visible = true,
		AnchorPoint = Frame.AnchorPoint,
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/MenuBar/divider.png",
		Position = UDim2.new(0, 1, 0, 1),
		Size = UDim2.new(0, 28, 0, 36),
		LayoutOrder = Frame.layoutOrder,
		SelectionImageObject = Callback(CursorKind.RoundedRect),
		[Roact.Event.Activated] = function() --[[ Line: 55 ]] end,
		[Roact.Event.SelectionGained] = Frame.onSelectionGained,
		[Roact.Event.SelectionLost] = Frame.onSelectionLost,
		[Roact.Ref] = Frame.forwardRef
	})
end

local function VRBarSeparator(Frame) --[[ Line: 64 ]]
	-- upvalues: WithSelectionCursorProviderFunction (copy), renderWithSelectionCursor (copy)
	return WithSelectionCursorProviderFunction(function(p1) --[[ Line: 65 ]]
		-- upvalues: renderWithSelectionCursor (upval), Frame (copy)
		return renderWithSelectionCursor(Frame, p1)
	end)
end

return Roact.forwardRef(function(p1, ForwardRef) --[[ Line: 70 ]]
	-- upvalues: Roact (copy), VRBarSeparator (copy), Cryo (copy)
	return Roact.createElement(VRBarSeparator, Cryo.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)