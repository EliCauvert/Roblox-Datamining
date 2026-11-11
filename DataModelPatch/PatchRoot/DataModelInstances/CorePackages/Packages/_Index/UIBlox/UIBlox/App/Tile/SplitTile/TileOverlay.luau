local Parent = script.Parent.Parent.Parent.Parent
local Core = Parent.Core
local ReactModule = require(Parent.Parent.React)
local InteractableModule = require(Core.Control.Interactable)
local UseControlStateModule = require(Core.Control.useControlState)
local UseStyleModule = require(Core.Style.useStyle)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local SetDefaultModule = require(Parent.Utility.setDefault)
local _UDim = UDim.new(0, 8)

return function(p1)
	-- upvalues: SetDefaultModule (copy), UseControlStateModule (copy), UseStyleModule (copy), ControlStateModule (copy), ReactModule (copy), _UDim (copy), InteractableModule (copy)
	local OnActivated = p1.onActivated
	local SetDefaultModuleResult = SetDefaultModule(p1.isVisible, true)
	local SetDefaultModuleResult1 = SetDefaultModule(p1.isActive, true)
	local ReservedBottomHeight = p1.reservedBottomHeight or 0
	local IsReservedBottomHeightAbove = ReservedBottomHeight > 0
	
	if not SetDefaultModuleResult and not SetDefaultModuleResult1 then
		return nil
	end
	local UseControlStateModuleResult, UseControlStateModuleResult2 = UseControlStateModule()
	local Theme = UseStyleModule().Theme
	local Color = nil
	local Transparency = 1
	
	if SetDefaultModuleResult and SetDefaultModuleResult1 then
		if UseControlStateModuleResult == ControlStateModule.Pressed then
			Color = Theme.BackgroundOnPress.Color
			Transparency = Theme.BackgroundOnPress.Transparency
		elseif UseControlStateModuleResult == ControlStateModule.Hover then
			Color = Theme.BackgroundOnHover.Color
			Transparency = Theme.BackgroundOnHover.Transparency
		end
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = p1.zIndex
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
		ClippingFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, if IsReservedBottomHeightAbove then -ReservedBottomHeight else 0)
		}, {
			Interactable = ReactModule.createElement(InteractableModule, {
				Size = UDim2.new(1, 0, 1, if IsReservedBottomHeightAbove then _UDim.Offset else 0),
				BackgroundColor3 = Color,
				BackgroundTransparency = Transparency,
				AutoButtonColor = false,
				onStateChanged = UseControlStateModuleResult2,
				[ReactModule.Event.Activated] = if SetDefaultModuleResult1 then OnActivated else nil,
				ZIndex = 3
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim })
			})
		})
	})
end