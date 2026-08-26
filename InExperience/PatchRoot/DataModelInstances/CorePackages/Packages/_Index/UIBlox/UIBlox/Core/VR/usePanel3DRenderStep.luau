local parent = script.Parent
local reactModule = require(parent.Parent.Parent.Parent.React)
local constantsModule = require(parent.Constants)

local function GetUserCFrameWorldSpace(p1, p2)
	local var1 = p2:GetUserCFrame(p1)
	local currentCamera = workspace.CurrentCamera
	
	if not currentCamera.HeadLocked then
		var1 = p2:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * var1
	end
	return currentCamera.CFrame * (CFrame.new(var1.p * currentCamera.HeadScale) * (var1 - var1.p))
end

return function(p1, p2)
	-- upvalues: constantsModule (ref), reactModule (ref), GetUserCFrameWorldSpace (ref)
	if p1.anchoring == constantsModule.AnchoringTypes.PanelManaged and p1.connectPanelManagerFunction then
		return
	end
	local var1 = reactModule.useRef(p1.offset)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(false)
	local vrService = p1.vrService
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		var1.current = p1.offset
	end, {})
	local var4 = reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref), constantsModule (copy), vrService (ref), GetUserCFrameWorldSpace (copy), var2 (ref), var3 (ref), var1 (ref), p2 (ref)
		local currentCamera = workspace.CurrentCamera
		local var5 = nil
		local cFrame = currentCamera.CFrame
		local headScale = currentCamera.HeadScale
		local headUserCFrame = nil
		
		if p1.anchoring == constantsModule.AnchoringTypes.Head then
			headUserCFrame = vrService:GetUserCFrame(Enum.UserCFrame.Head)
			local var6 = GetUserCFrameWorldSpace(Enum.UserCFrame.Head, vrService)
			
			if var2.current == nil then
				var2.current = var6
			end
			assert(var2.current ~= nil, "lastLookCFrame should not be nil.")
			
			if var2.current.LookVector:Dot(var6.LookVector) < 0.85 then
				var3.current = true
			elseif var2.current.LookVector:Dot(var6.LookVector) > 0.99 then
				var3.current = false
			end
			if var3.current then
				var2.current = var2.current:Lerp(var6, 7.2 * p3)
			end
			var5 = var6.Position + var2.current.LookVector * headScale * 2
			var5 = Vector3.new(var5.X, var6.Position.Y, var5.Z)
			local alignedPanel = p1.alignedPanel
			
			if alignedPanel then
				local part = alignedPanel:GetPart()
				
				if part and (alignedPanel:IsPositionLockedType() and (alignedPanel:IsVisible() or alignedPanel.alwaysUpdatePosition)) then
					var5 = Vector3.new(part.Position.X, var6.Position.Y - 0.4 * headScale, part.Position.Z)
				end
			end
		elseif p1.anchoring ~= constantsModule.AnchoringTypes.Wrist then return end
		if vrService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and vrService.GuiInputUserCFrame == Enum.UserCFrame.LeftHand then
			headUserCFrame = vrService:GetUserCFrame(Enum.UserCFrame.RightHand)
		elseif vrService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
			headUserCFrame = vrService:GetUserCFrame(Enum.UserCFrame.LeftHand)
		end
		if not headUserCFrame then
			headUserCFrame = vrService:GetUserCFrame(Enum.UserCFrame.Head)
		end
		var5 = (cFrame * CFrame.new(headUserCFrame.Position * headScale)).Position
		if p1.offsetCallback then
			var5 = p1.offsetCallback({ finalPosition = var5, cameraHeadScale = headScale })
		end
		if p1.lerp and var1.current ~= nil then
			var1.current = var1.current:Lerp(p1.offset, 7.2 * p3)
		else
			var1.current = p1.offset
		end
		local var7 = nil
		
		if var1.current ~= nil then
			if p1.faceCamera then
				var7 = CFrame.new(var5 + var1.current.Position * headScale, GetUserCFrameWorldSpace(Enum.UserCFrame.Head, vrService).Position)
			else
				local var8, var9, var10 = headUserCFrame:ToOrientation()
				var7 = CFrame.new(var5) * CFrame.Angles(-var8, var9, -var10) * CFrame.new(var1.current.Position * headScale)
			end
		end
		if p1.tiltCallback then
			var7 = p1.tiltCallback({ panelCFrame = var7, cameraHeadScale = headScale })
		end
		if p2.current ~= nil then
			p2.current.CFrame = var7
			p2.current.Size = Vector3.new(p1.partSize.X * headScale, p1.partSize.Y * headScale, 0.05)
		end
	end, {
		p1.anchoring, p1.faceCamera, p1.lerp, p1.offset, p1.partSize, p1.alignedPanel,
		p1.offsetCallback, p1.tiltCallback
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), constantsModule (copy), var4 (ref)
		if p1.anchoring == constantsModule.AnchoringTypes.World then
			return function() end
		end
		local var5 = nil
		local var6 = nil
		local _ = nil
		
		local function onCurrentCameraChanged()
			-- upvalues: var5 (write), var4 (copy)
			if var5 then
				var5:Disconnect()
			end
			if workspace.CurrentCamera then
				var5 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function()
					-- upvalues: var4 (copy)
					var4(0)
				end)
			end
		end
		
		local var7 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(onCurrentCameraChanged)
		onCurrentCameraChanged()
		
		if p1.alignedPanel then
			local part = p1.alignedPanel:GetPart()
			
			if part then
				var6 = part:GetPropertyChangedSignal("CFrame"):Connect(function()
					-- upvalues: var4 (copy)
					var4(0)
				end)
			end
		end
		local movementUpdateEventConnection = p1.movementUpdateEvent:Connect(var4)
		
		return function()
			-- upvalues: movementUpdateEventConnection (ref), var7 (write), var5 (write), var6 (write)
			movementUpdateEventConnection:Disconnect()
			var7:Disconnect()
			
			if var5 then
				var5:Disconnect()
			end
			if var6 then
				var6:Disconnect()
			end
		end
	end, { p1.anchoring, var4 })
end