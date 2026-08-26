local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local useForwardRef = require(parent.ReactUtils).useForwardRef
local controlStateModule = require(foundation.Enums.ControlState)
local _ = require(foundation.Enums.ControlStateEvent)
local _ = require(foundation.Components.Types)
local t = {
	[Enum.GuiState.Idle] = controlStateModule.Default,
	[Enum.GuiState.Hover] = controlStateModule.Hover,
	[Enum.GuiState.Press] = controlStateModule.Pressed,
	[Enum.GuiState.NonInteractable] = controlStateModule.Disabled
}

return function(p1, p2)
	-- upvalues: reactModule (ref), controlStateModule (ref), t (ref), useForwardRef (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useRef(controlStateModule.Initialize)
	local var3 = reactModule.useCallback(function(p3)
		-- upvalues: var2 (ref), var1 (ref), controlStateModule (copy), p2 (ref)
		local current = var2.current
		
		if var1.current then
			if p3 == controlStateModule.Default or p3 == controlStateModule.Hover then
				p3 = controlStateModule.Selected
			elseif p3 == controlStateModule.Pressed then
				p3 = controlStateModule.SelectedPressed
			end
		end
		if current == p3 then return end
		var2.current = p3
		
		if p2 ~= nil then
			p2(p3)
		end
	end, { p2 })
	
	return useForwardRef(p1, reactModule.useCallback(function(p3)
		-- upvalues: var3 (ref), t (copy), var1 (ref), var2 (ref)
		local t_1 = {}
		
		if p3 then
			var3(t[p3.GuiState])
			table.insert(t_1, p3:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: t (copy), p3 (ref), var3 (copy)
				var3(t[p3.GuiState])
			end))
			table.insert(t_1, p3.SelectionGained:Connect(function()
				-- upvalues: var1 (copy), var3 (copy), var2 (copy)
				var1.current = true
				var3(var2.current)
			end))
			table.insert(t_1, p3.SelectionLost:Connect(function()
				-- upvalues: var1 (copy), var3 (copy), var2 (copy)
				var1.current = false
				var3(var2.current)
			end))
		end
		return function()
			-- upvalues: t_1 (ref)
			for i, v in t_1 do
				v:Disconnect()
			end
		end
	end, { var3 }))
end