return function(p0) --[[ line: 1 ]]
	local var0 = nil
	local _ = nil
	local var1 = nil
	
	local function _(p1) --[[ line: 6 | named "fireCallback" ]]
		-- upvalues: var0 (write), p0 (ref)
		if p1 ~= var0 then
			var0 = p1
			p0(p1)
		end
	end
	
	local function onViewportSizeChanged() --[[ line: 13 ]]
		-- upvalues: var0 (write), p0 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			local viewportSize = currentCamera.ViewportSize
			
			if viewportSize ~= var0 then
				var0 = viewportSize
				p0(viewportSize)
			end
		end
	end
	
	local var3 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 20 | named "onCurrentCameraChanged" ]]
		-- upvalues: var1 (write), onViewportSizeChanged (ref), var0 (write), p0 (ref)
		if var1 then
			var1:Disconnect()
			var1 = nil
		end
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			var1 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(onViewportSizeChanged)
			local currentCamera_1 = workspace.CurrentCamera
			
			if currentCamera_1 then
				local viewportSize = currentCamera_1.ViewportSize
				
				if viewportSize ~= var0 then
					var0 = viewportSize
					p0(viewportSize)
				end
			end
		end
	end)
	local currentCamera = workspace.CurrentCamera
	
	if currentCamera then
		var1 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(onViewportSizeChanged)
		local currentCamera_1 = workspace.CurrentCamera
		
		if currentCamera_1 then
			local viewportSize = currentCamera_1.ViewportSize
			
			if viewportSize ~= var0 then
				var0 = viewportSize
				p0(viewportSize)
			end
		end
	end
	return function() --[[ line: 37 ]]
		-- upvalues: var3 (write), var1 (write)
		if var3 then
			var3:Disconnect()
			var3 = nil
		end
		if var1 then
			var1:Disconnect()
			var1 = nil
		end
	end
end