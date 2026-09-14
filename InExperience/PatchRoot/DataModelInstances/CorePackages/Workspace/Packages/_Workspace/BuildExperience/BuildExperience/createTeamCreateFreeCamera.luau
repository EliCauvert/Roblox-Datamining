return function(p1, p2, p3)
	p1.CameraType = Enum.CameraType.Scriptable
	p1.CFrame = CFrame.new(0, 150, 300) * CFrame.Angles(-0.261799387799, 0, 0)
	local var1 = 0
	local var2, var3 = p1.CFrame:ToEulerAnglesYXZ()
	
	return {
		step = function(p4)
			-- upvalues: p3 (ref), var1 (write), p1 (ref), var2 (write), var3 (write), p2 (ref)
			local focusRequest = p3.getFocusRequest()
			
			if focusRequest ~= nil and focusRequest.token ~= var1 then
				var1 = focusRequest.token
				local maxValue = math.max(10, focusRequest.radius * 2.5)
				p1.CFrame = CFrame.lookAt(focusRequest.position + Vector3.new(maxValue * 0.5, maxValue * 0.5, maxValue), focusRequest.position)
				local var4, var5 = p1.CFrame:ToEulerAnglesYXZ()
				var2 = var4
				var3 = var5
			end
			if p2:GetFocusedTextBox() ~= nil then
				p2.MouseBehavior = Enum.MouseBehavior.Default
				
				return
			end
			local mouseButton2 = p2:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
			p2.MouseBehavior = if mouseButton2 then Enum.MouseBehavior.LockCurrentPosition else Enum.MouseBehavior.Default
			
			if mouseButton2 then
				local mouseDelta = p2:GetMouseDelta()
				var3 -= mouseDelta.X * 0.003
				var2 = math.clamp(var2 - mouseDelta.Y * 0.003, -1.567654734141, 1.567654734141)
			end
			local cFrame = CFrame.fromEulerAnglesYXZ(var2, var3, 0)
			local var6 = p4 * 50
			
			if p2:IsKeyDown(Enum.KeyCode.LeftShift) or p2:IsKeyDown(Enum.KeyCode.RightShift) then
				var6 *= 5
			end
			local position = p1.CFrame.Position
			
			if p2:IsKeyDown(Enum.KeyCode.W) then
				position += cFrame.LookVector * var6
			end
			if p2:IsKeyDown(Enum.KeyCode.S) then
				position -= cFrame.LookVector * var6
			end
			if p2:IsKeyDown(Enum.KeyCode.A) then
				position -= cFrame.RightVector * var6
			end
			if p2:IsKeyDown(Enum.KeyCode.D) then
				position += cFrame.RightVector * var6
			end
			if p2:IsKeyDown(Enum.KeyCode.E) then
				position += Vector3.new(0, 1, 0) * var6
			end
			if p2:IsKeyDown(Enum.KeyCode.Q) then
				position -= Vector3.new(0, 1, 0) * var6
			end
			p1.CFrame = CFrame.new(position) * cFrame
		end
	}
end