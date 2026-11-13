return function(p1)
	local Box = p1.box
	local Input = p1.input
	local _Enum = p1.Enum
	local v1 = nil
	local v2 = nil
	
	local function _(p2)
		-- upvalues: p1 (copy), Box (copy)
		if not p1.disabled() and Box:IsFocused() then
			Box.CursorPosition = #Box.Text + 1
			Box.SelectionStart = if p2 == "all" then 1 else -1
			
			return
		end
	end
	
	local function finish(p2)
		-- upvalues: v2 (ref), p1 (copy)
		local v3 = v2
		
		if v3 ~= nil then
			v2 = nil
			
			for _, connection in v3.connections do
				connection:Disconnect()
			end
			if v3.promoted and p1.onScrub then
				p1.onScrub(p2)
			end
		end
	end
	
	local function follow(Touch)
		-- upvalues: v2 (ref), Input (copy), _Enum (copy), finish (copy), v1 (ref), p1 (copy), Box (copy)
		local config = {
			scrub = false,
			promoted = false,
			gate = 6,
			touch = Touch,
			connections = {}
		}
		v2 = config
		table.insert(config.connections, Input.InputEnded:Connect(function(Input)
			-- upvalues: config (copy), _Enum (upval), finish (upval), v1 (upval), p1 (upval), Box (upval)
			if not (if config.touch == nil then Input.UserInputType == _Enum.UserInputType.MouseButton1 else Input == config.touch) then return end
			finish("end")
			
			if v1 ~= nil then
				local v4 = v1
				v1 = nil
				
				if not p1.disabled() then
					if not Box:IsFocused() then return end
					Box.CursorPosition = #Box.Text + 1
					Box.SelectionStart = if v4 == "all" then 1 else -1
				end
			end
		end))
		table.insert(config.connections, Input.InputChanged:Connect(function(Input)
			-- upvalues: config (copy), _Enum (upval), p1 (upval), v1 (upval), Box (upval)
			local IsUserInputTypeMatch: boolean = if config.touch == nil then Input.UserInputType == _Enum.UserInputType.MouseMovement else Input == config.touch
			local Start = config.start
			
			if not config.scrub or not IsUserInputTypeMatch or Start == nil then return end
			local XDelta = Input.Position.X - Start.X
			local YDelta = Input.Position.Y - Start.Y
			
			if not config.promoted then
				if XDelta * XDelta + YDelta * YDelta < config.gate * config.gate then return end
				local OnScrubFunction = p1.onScrub
				
				if math.abs(XDelta) <= math.abs(YDelta) or OnScrubFunction == nil or not OnScrubFunction("begin") then
					config.scrub = false
					
					return
				end
				config.promoted = true
				v1 = nil
				
				if Box:IsFocused() then
					Box:ReleaseFocus(false)
				end
			end
			local OnScrubFunction1: (any, any) -> () = p1.onScrub
			
			if OnScrubFunction1 then
				OnScrubFunction1("move", XDelta)
			end
		end))
		table.insert(config.connections, Input.InputBegan:Connect(function(Input)
			-- upvalues: config (copy), _Enum (upval), finish (upval)
			if config.promoted and (Input.KeyCode == _Enum.KeyCode.Escape or Input.KeyCode == _Enum.KeyCode.ButtonB) then
				finish("cancel")
			end
		end))
		
		return config
	end
	
	local Connections = {
		Box.InputBegan:Connect(function(Input)
			-- upvalues: _Enum (copy), v2 (ref), finish (copy), p1 (copy), follow (copy)
			local IsUserInputTypeMatch = Input.UserInputType == _Enum.UserInputType.Touch
			
			if not IsUserInputTypeMatch and Input.UserInputType ~= _Enum.UserInputType.MouseButton1 then return end
			local v4 = v2
			
			if not IsUserInputTypeMatch and v4 ~= nil and v4.start ~= nil and v4.touch == nil then
				finish("cancel")
				v4 = nil
			end
			if v4 ~= nil and (v4.start ~= nil or IsUserInputTypeMatch or v4.touch ~= nil) then return end
			local Press = p1.onScrub ~= nil and p1.onScrub("press", if IsUserInputTypeMatch then "touch" else "pointer")
			
			if v4 == nil then
				local PolicyResult = p1.policy()
				
				if not Press and (not IsUserInputTypeMatch or PolicyResult ~= "all" and PolicyResult ~= "end") then return end
				v4 = follow(if IsUserInputTypeMatch then Input else nil)
			end
			local v5 = assert(v4)
			local IsPress = Press == true
			v5.start = Input.Position
			v5.scrub = IsPress
			v5.gate = if IsUserInputTypeMatch then 14 else 6
		end),
		Box.Focused:Connect(function()
			-- upvalues: p1 (copy), v1 (ref), Input (copy), _Enum (copy), v2 (ref), follow (copy), Box (copy)
			local PolicyResult = p1.policy()
			v1 = nil
			
			if PolicyResult ~= "all" and PolicyResult ~= "end" then return end
			local IsMouseButtonPressed = Input.IsMouseButtonPressed ~= nil and Input:IsMouseButtonPressed(_Enum.UserInputType.MouseButton1)
			
			if v2 ~= nil or IsMouseButtonPressed then
				v1 = PolicyResult
				
				if v2 == nil then
					follow(nil)
					
					return
				end
			elseif not p1.disabled() then
				if not Box:IsFocused() then return end
				Box.CursorPosition = #Box.Text + 1
				Box.SelectionStart = if PolicyResult == "all" then 1 else -1
			end
		end),
		Box.FocusLost:Connect(function()
			-- upvalues: v1 (ref)
			v1 = nil
		end)
	}
	
	return function()
		-- upvalues: v1 (ref), finish (copy), Connections (copy)
		v1 = nil
		finish("cancel")
		
		for _, connection in Connections do
			connection:Disconnect()
		end
	end
end