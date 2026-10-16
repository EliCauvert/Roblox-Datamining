local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local View = require(Parent1.Foundation).View
local FFlagAddNewPlayerListFocusNavModule = require(Parent.Flags.FFlagAddNewPlayerListFocusNav)
local FFlagRemoveNewPlayerListOverlayModule = require(Parent.Flags.FFlagRemoveNewPlayerListOverlay)

local function EntryFrameView(p1) --[[ Line: 30 ]]
	-- upvalues: ReactModule (copy), View (copy), FFlagRemoveNewPlayerListOverlayModule (copy), FFlagAddNewPlayerListFocusNavModule (copy)
	return ReactModule.createElement(View, {
		Size = p1.size,
		BackgroundTransparency = if FFlagRemoveNewPlayerListOverlayModule then nil else 1,
		AutoButtonColor = if FFlagRemoveNewPlayerListOverlayModule then nil else false,
		backgroundStyle = if FFlagRemoveNewPlayerListOverlayModule then {
			Color3 = p1.backgroundStyle.Color,
			Transparency = p1.backgroundStyle.Transparency
		} else nil,
		Text = if FFlagRemoveNewPlayerListOverlayModule then nil else "",
		AutoLocalize = if FFlagRemoveNewPlayerListOverlayModule then nil else false,
		Selectable = not p1.isTeamFrame,
		Active = if FFlagRemoveNewPlayerListOverlayModule then nil else not p1.isTeamFrame,
		onActivated = p1.onActivated,
		onStateChanged = p1.onStateChanged,
		ref = if FFlagAddNewPlayerListFocusNavModule then p1.forwardRef else p1.firstPlayerRef
	}, if FFlagRemoveNewPlayerListOverlayModule then p1.children else {
		BackgroundFrame = ReactModule.createElement("Frame", {
			ZIndex = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.backgroundStyle.Transparency,
			BackgroundColor3 = p1.backgroundStyle.Color
		}),
		DoubleOverLay = ReactModule.createElement("Frame", {
			ZIndex = 1,
			BorderSizePixel = 0,
			Visible = p1.doubleOverlay,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.overlayStyle and p1.overlayStyle.Transparency,
			BackgroundColor3 = p1.overlayStyle and p1.overlayStyle.Color
		}),
		OverlayFrame = ReactModule.createElement("Frame", {
			ZIndex = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = p1.overlayStyle and p1.overlayStyle.Transparency,
			BackgroundColor3 = p1.overlayStyle and p1.overlayStyle.Color
		}, p1.children)
	})
end

return if FFlagAddNewPlayerListFocusNavModule then ReactModule.memo((ReactModule.forwardRef(function(p1, ForwardRef) --[[ Line: 85 ]]
	-- upvalues: ReactModule (copy), EntryFrameView (copy), CryoModule (copy)
	return ReactModule.createElement(EntryFrameView, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end))) else ReactModule.memo(EntryFrameView)