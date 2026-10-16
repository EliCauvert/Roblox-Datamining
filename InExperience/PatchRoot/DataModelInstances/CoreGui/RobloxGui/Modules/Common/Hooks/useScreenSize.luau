local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function() --[[ Line: 4 ]]
	-- upvalues: ReactModule (copy)
	local Connection = nil
	local Connection1 = nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	
	local function Callback() --[[ Line: 9 ]]
		-- upvalues: UseStateResult2 (copy)
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera then
			UseStateResult2(Vector2.new(CurrentCamera.ViewportSize.X, CurrentCamera.ViewportSize.Y))
		end
	end
	
	local function Callback1() --[[ Line: 16 ]]
		-- upvalues: Connection1 (ref), Callback (copy)
		local CurrentCamera = workspace.CurrentCamera
		
		if Connection1 then
			pcall(function() --[[ Line: 20 ]]
				-- upvalues: Connection1 (upval)
				Connection1:Disconnect()
			end)
			Connection1 = nil
		end
		if CurrentCamera then
			Connection1 = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(Callback)
		end
	end
	
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: Connection (ref), Callback1 (copy), UseStateResult2 (copy), Connection1 (ref)
		Connection = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(Callback1)
		Callback1()
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera then
			UseStateResult2(Vector2.new(CurrentCamera.ViewportSize.X, CurrentCamera.ViewportSize.Y))
		end
		return function() --[[ Line: 36 ]]
			-- upvalues: Connection (upval), Connection1 (upval)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
		end
	end, {})
	
	return UseStateResult
end