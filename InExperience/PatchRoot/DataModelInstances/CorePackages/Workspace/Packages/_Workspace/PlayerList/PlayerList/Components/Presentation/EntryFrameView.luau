local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local view = require(parent_1.Foundation).View
local fFlagAddNewPlayerListFocusNavModule = require(parent.Flags.FFlagAddNewPlayerListFocusNav)
local fFlagRemoveNewPlayerListOverlayModule = require(parent.Flags.FFlagRemoveNewPlayerListOverlay)

local function EntryFrameView(p1)
	-- upvalues: reactModule (ref), view (ref), fFlagRemoveNewPlayerListOverlayModule (ref), fFlagAddNewPlayerListFocusNavModule (ref)
	return reactModule.createElement(view, {
		Size = p1.size,
		BackgroundTransparency = if fFlagRemoveNewPlayerListOverlayModule then nil else 1,
		AutoButtonColor = if fFlagRemoveNewPlayerListOverlayModule then nil else false,
		backgroundStyle = if fFlagRemoveNewPlayerListOverlayModule then {
			Color3 = p1.backgroundStyle.Color,
			Transparency = p1.backgroundStyle.Transparency
		} else nil,
		Text = if fFlagRemoveNewPlayerListOverlayModule then nil else "",
		AutoLocalize = if fFlagRemoveNewPlayerListOverlayModule then nil else false,
		Selectable = not p1.isTeamFrame,
		Active = if fFlagRemoveNewPlayerListOverlayModule then nil else not p1.isTeamFrame,
		onActivated = p1.onActivated,
		onStateChanged = p1.onStateChanged,
		ref = if fFlagAddNewPlayerListFocusNavModule then p1.forwardRef else p1.firstPlayerRef
	}, if fFlagRemoveNewPlayerListOverlayModule then p1.children else {
		BackgroundFrame = reactModule.createElement("Frame", {
			ZIndex = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.backgroundStyle.Transparency,
			BackgroundColor3 = p1.backgroundStyle.Color
		}),
		DoubleOverLay = reactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Visible = p1.doubleOverlay,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.overlayStyle and p1.overlayStyle.Transparency,
			BackgroundColor3 = p1.overlayStyle and p1.overlayStyle.Color
		}),
		OverlayFrame = reactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.overlayStyle and p1.overlayStyle.Transparency,
			BackgroundColor3 = p1.overlayStyle and p1.overlayStyle.Color
		}, p1.children)
	})
end

return if fFlagAddNewPlayerListFocusNavModule then reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: reactModule (ref), EntryFrameView (ref), cryoModule (ref)
	return reactModule.createElement(EntryFrameView, cryoModule.Dictionary.join(p1, { forwardRef = p2 }))
end)) else reactModule.memo(EntryFrameView)