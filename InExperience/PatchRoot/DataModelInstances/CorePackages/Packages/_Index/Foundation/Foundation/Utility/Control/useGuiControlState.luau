local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local UseForwardRefFunction = require(Parent.ReactUtils).useForwardRef
local ControlStateModule = require(Foundation.Enums.ControlState)
local _ = require(Foundation.Enums.ControlStateEvent)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Foundation.Components.Types)
local config = {
	[Enum.GuiState.Idle] = ControlStateModule.Default,
	[Enum.GuiState.Hover] = ControlStateModule.Hover,
	[Enum.GuiState.Press] = ControlStateModule.Pressed,
	[Enum.GuiState.NonInteractable] = ControlStateModule.Disabled
}

local function useGuiControlState_DEPRECATED(p1, Callback)
	-- upvalues: ReactModule (copy), ControlStateModule (copy), config (copy), UseForwardRefFunction (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(ControlStateModule.Initialize)
	local UseResult = ReactModule.useCallback(function(Current)
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
	
	return UseForwardRefFunction(p1, (ReactModule.useCallback(function(Object)
		-- upvalues: UseResult (copy), config (upval), UseRefResult (copy), UseRefResult1 (copy)
		local List = {}
		
		if Object then
			UseResult(config[Object.GuiState])
			table.insert(List, Object:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: config (upval), Object (copy), UseResult (upval)
				UseResult(config[Object.GuiState])
			end))
			table.insert(List, Object.SelectionGained:Connect(function()
				-- upvalues: UseRefResult (upval), UseResult (upval), UseRefResult1 (upval)
				UseRefResult.current = true
				UseResult(UseRefResult1.current)
			end))
			table.insert(List, Object.SelectionLost:Connect(function()
				-- upvalues: UseRefResult (upval), UseResult (upval), UseRefResult1 (upval)
				UseRefResult.current = false
				UseResult(UseRefResult1.current)
			end))
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { UseResult })))
end

local function _(Callback: (any) -> (), Current)
	if typeof(Callback) == "function" then
		Callback(Current)
		
		return
	end
	if Callback ~= nil then
		Callback.current = Current
	end
end

local _ = function(Current, ControlState)
	-- upvalues: ControlStateModule (copy)
	if Current.isSelected then
		if ControlState == ControlStateModule.Default or ControlState == ControlStateModule.Hover then
			ControlState = ControlStateModule.Selected
		elseif ControlState == ControlStateModule.Pressed then
			ControlState = ControlStateModule.SelectedPressed
		end
	end
	if Current.controlState == ControlState then return end
	Current.controlState = ControlState
	
	if Current.onStateChanged ~= nil then
		Current.onStateChanged(ControlState)
	end
end

local function useGuiControlState(Callback, OnStateChanged)
	-- upvalues: ReactModule (copy), ControlStateModule (copy), config (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = {
			isSelected = false,
			connections = nil,
			controlState = ControlStateModule.Initialize,
			onStateChanged = OnStateChanged
		}
	end
	UseRefResult.current.onStateChanged = OnStateChanged
	
	return ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), Callback (copy), config (upval), ControlStateModule (upval)
		local Current1 = UseRefResult.current
		
		if typeof(Callback) == "function" then
			Callback(Current)
		elseif Callback ~= nil then
			Callback.current = Current
		end
		local Connections = Current1.connections
		
		if Connections ~= nil then
			for _, connection in Connections do
				connection:Disconnect()
			end
			Current1.connections = nil
		end
		if Current == nil then return end
		local Entry = config[Current.GuiState]
		
		if Current1.isSelected then
			if Entry == ControlStateModule.Default or Entry == ControlStateModule.Hover then
				Entry = ControlStateModule.Selected
			elseif Entry == ControlStateModule.Pressed then
				Entry = ControlStateModule.SelectedPressed
			end
		end
		if Current1.controlState ~= Entry then
			Current1.controlState = Entry
			
			if Current1.onStateChanged ~= nil then
				Current1.onStateChanged(Entry)
			end
		end
		Current1.connections = {
			Current:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: Current1 (copy), config (upval), Current (copy), ControlStateModule (upval)
				local Entry = config[Current.GuiState]
				
				if Current1.isSelected then
					if Entry == ControlStateModule.Default or Entry == ControlStateModule.Hover then
						Entry = ControlStateModule.Selected
					elseif Entry == ControlStateModule.Pressed then
						Entry = ControlStateModule.SelectedPressed
					end
				end
				if Current1.controlState == Entry then return end
				Current1.controlState = Entry
				
				if Current1.onStateChanged ~= nil then
					Current1.onStateChanged(Entry)
				end
			end),
			Current.SelectionGained:Connect(function()
				-- upvalues: Current1 (copy), ControlStateModule (upval)
				Current1.isSelected = true
				local ControlState = Current1.controlState
				
				if Current1.isSelected then
					if ControlState == ControlStateModule.Default or ControlState == ControlStateModule.Hover then
						ControlState = ControlStateModule.Selected
					elseif ControlState == ControlStateModule.Pressed then
						ControlState = ControlStateModule.SelectedPressed
					end
				end
				if Current1.controlState == ControlState then return end
				Current1.controlState = ControlState
				
				if Current1.onStateChanged ~= nil then
					Current1.onStateChanged(ControlState)
				end
			end),
			Current.SelectionLost:Connect(function()
				-- upvalues: Current1 (copy), ControlStateModule (upval)
				Current1.isSelected = false
				local ControlState = Current1.controlState
				
				if Current1.isSelected then
					if ControlState == ControlStateModule.Default or ControlState == ControlStateModule.Hover then
						ControlState = ControlStateModule.Selected
					elseif ControlState == ControlStateModule.Pressed then
						ControlState = ControlStateModule.SelectedPressed
					end
				end
				if Current1.controlState == ControlState then return end
				Current1.controlState = ControlState
				
				if Current1.onStateChanged ~= nil then
					Current1.onStateChanged(ControlState)
				end
			end)
		}
	end, { Callback })
end

return if FlagsModule.FoundationLightweightGuiControlState then useGuiControlState else useGuiControlState_DEPRECATED