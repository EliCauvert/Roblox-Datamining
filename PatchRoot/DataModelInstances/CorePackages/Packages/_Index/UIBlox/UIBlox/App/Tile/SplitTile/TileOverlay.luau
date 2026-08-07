-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:01 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent
local core = parent.Core
local reactModule = require(parent.Parent.React)
local interactableModule = require(core.Control.Interactable)
local useControlStateModule = require(core.Control.useControlState)
local useStyleModule = require(core.Style.useStyle)
local controlStateModule = require(core.Control.Enum.ControlState)
local setDefaultModule = require(parent.Utility.setDefault)
local uDim = UDim.new(0, 8)

return function(p0) --[[ line: 33 | named "TileOverlay" ]]
	-- upvalues: setDefaultModule (ref), useControlStateModule (ref), useStyleModule (ref), controlStateModule (ref), reactModule (ref), uDim (ref), interactableModule (ref)
	local onActivated = p0.onActivated
	local var7 = setDefaultModule(p0.isVisible, true)
	local var8 = setDefaultModule(p0.isActive, true)
	local reservedBottomHeight = p0.reservedBottomHeight or 0
	local var10 = reservedBottomHeight > 0
	
	if not var7 and not var8 then
		return nil
	end
	local var11, var12 = useControlStateModule()
	local theme = useStyleModule().Theme
	local color = nil
	local var13 = 1
	
	if var7 and var8 then
		if var11 == controlStateModule.Pressed then
			color = theme.BackgroundOnPress.Color
			var13 = theme.BackgroundOnPress.Transparency
		elseif var11 == controlStateModule.Hover then
			color = theme.BackgroundOnHover.Color
			var13 = theme.BackgroundOnHover.Transparency
		end
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		ZIndex = p0.zIndex
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
		ClippingFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, if var10 then -reservedBottomHeight else 0)
		}, {
			Interactable = reactModule.createElement(interactableModule, {
				Size = UDim2.new(1, 0, 1, if var10 then uDim.Offset else 0),
				BackgroundColor3 = color,
				BackgroundTransparency = var13,
				AutoButtonColor = false,
				onStateChanged = var12,
				[reactModule.Event.Activated] = if var8 then onActivated else nil,
				ZIndex = 3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim })
			})
		})
	})
end