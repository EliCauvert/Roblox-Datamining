return function(p1)
	local var1 = nil
	local _ = nil
	local var2 = nil
	
	local function _(p2)
		-- upvalues: var1 (write), p1 (ref)
		if p2 ~= var1 then
			var1 = p2
			p1(p2)
		end
	end
	
	local function onViewportSizeChanged()
		-- upvalues: var1 (write), p1 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			local viewportSize = currentCamera.ViewportSize
			
			if viewportSize ~= var1 then
				var1 = viewportSize
				p1(viewportSize)
			end
		end
	end
	
	local var3 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: var2 (write), onViewportSizeChanged (ref), var1 (write), p1 (ref)
		if var2 then
			var2:Disconnect()
			var2 = nil
		end
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			var2 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(onViewportSizeChanged)
			local currentCamera_1 = workspace.CurrentCamera
			
			if currentCamera_1 then
				local viewportSize = currentCamera_1.ViewportSize
				
				if viewportSize ~= var1 then
					var1 = viewportSize
					p1(viewportSize)
				end
			end
		end
	end)
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera then
		var2 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(onViewportSizeChanged)
		local currentCamera_1 = workspace.CurrentCamera
		
		if currentCamera_1 then
			local viewportSize = currentCamera_1.ViewportSize
			
			if viewportSize ~= var1 then
				var1 = viewportSize
				p1(viewportSize)
			end
		end
	end
	return function()
		-- upvalues: var3 (write), var2 (write)
		if var3 then
			var3:Disconnect()
			var3 = nil
		end
		if var2 then
			var2:Disconnect()
			var2 = nil
		end
	end
end