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

return function(p0, p1)
	-- upvalues: reactModule (ref), controlStateModule (ref), t (ref), useForwardRef (ref)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(controlStateModule.Initialize)
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), var4 (ref), controlStateModule (copy), p1 (ref)
		local current = var5.current
		
		if var4.current then
			if p2 == controlStateModule.Default or p2 == controlStateModule.Hover then
				p2 = controlStateModule.Selected
			elseif p2 == controlStateModule.Pressed then
				p2 = controlStateModule.SelectedPressed
			end
		end
		if current == p2 then return end
		var5.current = p2
		
		if p1 ~= nil then
			p1(p2)
		end
	end, { p1 })
	
	return useForwardRef(p0, reactModule.useCallback(function(p3)
		-- upvalues: var6 (ref), t (copy), var4 (ref), var5 (ref)
		local t_1 = {}
		
		if p3 then
			var6(t[p3.GuiState])
			table.insert(t_1, p3:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: t (copy), p3 (ref), var6 (copy)
				var6(t[p3.GuiState])
			end))
			table.insert(t_1, p3.SelectionGained:Connect(function()
				-- upvalues: var4 (copy), var6 (copy), var5 (copy)
				var4.current = true
				var6(var5.current)
			end))
			table.insert(t_1, p3.SelectionLost:Connect(function()
				-- upvalues: var4 (copy), var6 (copy), var5 (copy)
				var4.current = false
				var6(var5.current)
			end))
		end
		return function()
			-- upvalues: t_1 (ref)
			for i, v in t_1 do
				v:Disconnect()
			end
		end
	end, { var6 }))
end