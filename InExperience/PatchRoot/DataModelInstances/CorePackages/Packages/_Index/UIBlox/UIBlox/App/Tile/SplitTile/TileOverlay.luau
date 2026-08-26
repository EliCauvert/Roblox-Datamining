local parent = script.Parent.Parent.Parent.Parent
local core = parent.Core
local reactModule = require(parent.Parent.React)
local interactableModule = require(core.Control.Interactable)
local useControlStateModule = require(core.Control.useControlState)
local useStyleModule = require(core.Style.useStyle)
local controlStateModule = require(core.Control.Enum.ControlState)
local setDefaultModule = require(parent.Utility.setDefault)
local uDim = UDim.new(0, 8)

return function(p1)
	-- upvalues: setDefaultModule (ref), useControlStateModule (ref), useStyleModule (ref), controlStateModule (ref), reactModule (ref), uDim (ref), interactableModule (ref)
	local onActivated = p1.onActivated
	local var1 = setDefaultModule(p1.isVisible, true)
	local var2 = setDefaultModule(p1.isActive, true)
	local reservedBottomHeight = p1.reservedBottomHeight or 0
	local var3 = reservedBottomHeight > 0
	
	if not var1 and not var2 then
		return nil
	end
	local var4, var5 = useControlStateModule()
	local theme = useStyleModule().Theme
	local color = nil
	local var6 = 1
	
	if var1 and var2 then
		if var4 == controlStateModule.Pressed then
			color = theme.BackgroundOnPress.Color
			var6 = theme.BackgroundOnPress.Transparency
		elseif var4 == controlStateModule.Hover then
			color = theme.BackgroundOnHover.Color
			var6 = theme.BackgroundOnHover.Transparency
		end
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = p1.zIndex
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
		ClippingFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, if var3 then -reservedBottomHeight else 0)
		}, {
			Interactable = reactModule.createElement(interactableModule, {
				Size = UDim2.new(1, 0, 1, if var3 then uDim.Offset else 0),
				BackgroundColor3 = color,
				BackgroundTransparency = var6,
				AutoButtonColor = false,
				onStateChanged = var5,
				[reactModule.Event.Activated] = if var2 then onActivated else nil,
				ZIndex = 3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim })
			})
		})
	})
end