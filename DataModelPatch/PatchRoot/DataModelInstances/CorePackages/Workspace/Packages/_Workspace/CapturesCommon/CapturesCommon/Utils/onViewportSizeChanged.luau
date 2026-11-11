return function(Callback: (any) -> ())
	local ViewportSize = nil
	local Connection1 = nil
	local Connection = nil
	
	local function _(ViewportSize1)
		-- upvalues: ViewportSize (ref), Callback (copy)
		if ViewportSize1 ~= ViewportSize then
			ViewportSize = ViewportSize1
			Callback(ViewportSize1)
		end
	end
	
	local function onViewportSizeChanged()
		-- upvalues: ViewportSize (ref), Callback (copy)
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera then
			local ViewportSize1 = CurrentCamera.ViewportSize
			
			if ViewportSize1 ~= ViewportSize then
				ViewportSize = ViewportSize1
				Callback(ViewportSize1)
			end
		end
	end
	
	Connection1 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: Connection (ref), onViewportSizeChanged (copy), ViewportSize (ref), Callback (copy)
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera then
			Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(onViewportSizeChanged)
			local CurrentCamera1 = workspace.CurrentCamera
			
			if CurrentCamera1 then
				local ViewportSize1 = CurrentCamera1.ViewportSize
				
				if ViewportSize1 ~= ViewportSize then
					ViewportSize = ViewportSize1
					Callback(ViewportSize1)
				end
			end
		end
	end)
	
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end
	local CurrentCamera = workspace.CurrentCamera
	
	if CurrentCamera then
		Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(onViewportSizeChanged)
		local CurrentCamera1 = workspace.CurrentCamera
		
		if CurrentCamera1 then
			local ViewportSize1 = CurrentCamera1.ViewportSize
			
			if ViewportSize1 ~= ViewportSize then
				ViewportSize = ViewportSize1
				Callback(ViewportSize1)
			end
		end
	end
	return function()
		-- upvalues: Connection1 (ref), Connection (ref)
		if Connection1 then
			Connection1:Disconnect()
			Connection1 = nil
		end
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
	end
end