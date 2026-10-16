local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local UseForwardRefFunction = require(Parent.ReactUtils).useForwardRef
local ControlStateModule = require(Foundation.Enums.ControlState)
local _ = require(Foundation.Enums.ControlStateEvent)
local _ = require(Foundation.Components.Types)
local config = {
	[Enum.GuiState.Idle] = ControlStateModule.Default,
	[Enum.GuiState.Hover] = ControlStateModule.Hover,
	[Enum.GuiState.Press] = ControlStateModule.Pressed,
	[Enum.GuiState.NonInteractable] = ControlStateModule.Disabled
}

return function(p1, Callback) --[[ Line: 22 | Named "useGuiControlState" ]]
	-- upvalues: ReactModule (copy), ControlStateModule (copy), config (copy), UseForwardRefFunction (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(ControlStateModule.Initialize)
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 26 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), ControlStateModule (upval), Callback (copy)
		local Current1 = UseRefResult1.current
		
		if UseRefResult.current then
			if Current == ControlStateModule.Default or Current == ControlStateModule.Hover then
				Current = ControlStateModule.Selected
			elseif Current == ControlStateModule.Pressed then
				Current = ControlStateModule.SelectedPressed
			end
		end
		if Current1 == Current then return end
		UseRefResult1.current = Current
		
		if Callback ~= nil then
			Callback(Current)
		end
	end, { Callback })
	
	return UseForwardRefFunction(p1, (ReactModule.useCallback(function(Object) --[[ Line: 48 ]]
		-- upvalues: UseResult (copy), config (upval), UseRefResult (copy), UseRefResult1 (copy)
		local List = {}
		
		if Object then
			UseResult(config[Object.GuiState])
			table.insert(List, Object:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ Line: 55 ]]
				-- upvalues: config (upval), Object (copy), UseResult (upval)
				UseResult(config[Object.GuiState])
			end))
			table.insert(List, Object.SelectionGained:Connect(function() --[[ Line: 64 ]]
				-- upvalues: UseRefResult (upval), UseResult (upval), UseRefResult1 (upval)
				UseRefResult.current = true
				UseResult(UseRefResult1.current)
			end))
			table.insert(List, Object.SelectionLost:Connect(function() --[[ Line: 71 ]]
				-- upvalues: UseRefResult (upval), UseResult (upval), UseRefResult1 (upval)
				UseRefResult.current = false
				UseResult(UseRefResult1.current)
			end))
		end
		return function() --[[ Line: 78 ]]
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { UseResult })))
end