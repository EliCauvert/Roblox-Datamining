local parent = script.Parent
local reactModule = require(parent.Parent.Parent.Parent.React)
local constantsModule = require(parent.Constants)

local function GetUserCFrameWorldSpace(p0, p1) --[[ line: 12 ]]
	local var3 = p1:GetUserCFrame(p0)
	local currentCamera = workspace.CurrentCamera
	
	if not currentCamera.HeadLocked then
		var3 = p1:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * var3
	end
	return currentCamera.CFrame * (CFrame.new(var3.p * currentCamera.HeadScale) * (var3 - var3.p))
end

return function(p2, p3) --[[ line: 24 | named "usePanel3DRenderStep" ]]
	-- upvalues: constantsModule (ref), reactModule (ref), GetUserCFrameWorldSpace (ref)
	if p2.anchoring == constantsModule.AnchoringTypes.PanelManaged and p2.connectPanelManagerFunction then
		return
	end
	local var4 = reactModule.useRef(p2.offset)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(false)
	local vrService = p2.vrService
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: var4 (ref), p2 (ref)
		var4.current = p2.offset
	end, {})
	local var7 = reactModule.useCallback(function(p4) --[[ line: 39 ]]
		-- upvalues: p2 (ref), constantsModule (copy), vrService (ref), GetUserCFrameWorldSpace (copy), var5 (ref), var6 (ref), var4 (ref), p3 (ref)
		local currentCamera = workspace.CurrentCamera
		local var8 = nil
		local cFrame = currentCamera.CFrame
		local headScale = currentCamera.HeadScale
		local headUserCFrame = nil
		
		if p2.anchoring == constantsModule.AnchoringTypes.Head then
			headUserCFrame = vrService:GetUserCFrame(Enum.UserCFrame.Head)
			local var10 = GetUserCFrameWorldSpace(Enum.UserCFrame.Head, vrService)
			
			if var5.current == nil then
				var5.current = var10
			end
			assert(var5.current ~= nil, "lastLookCFrame should not be nil.")
			
			if var5.current.LookVector:Dot(var10.LookVector) < 0.85 then
				var6.current = true
			elseif var5.current.LookVector:Dot(var10.LookVector) > 0.99 then
				var6.current = false
			end
			if var6.current then
				var5.current = var5.current:Lerp(var10, 7.2 * p4)
			end
			var8 = var10.Position + var5.current.LookVector * headScale * 2
			var8 = Vector3.new(var8.X, var10.Position.Y, var8.Z)
			local alignedPanel = p2.alignedPanel
			
			if alignedPanel then
				local part = alignedPanel:GetPart()
				
				if part and (alignedPanel:IsPositionLockedType() and (alignedPanel:IsVisible() or alignedPanel.alwaysUpdatePosition)) then
					var8 = Vector3.new(part.Position.X, var10.Position.Y - 0.4 * headScale, part.Position.Z)
				end
			end
		elseif p2.anchoring ~= constantsModule.AnchoringTypes.Wrist then return end
		if vrService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and vrService.GuiInputUserCFrame == Enum.UserCFrame.LeftHand then
			headUserCFrame = vrService:GetUserCFrame(Enum.UserCFrame.RightHand)
		elseif vrService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
			headUserCFrame = vrService:GetUserCFrame(Enum.UserCFrame.LeftHand)
		end
		if not headUserCFrame then
			headUserCFrame = vrService:GetUserCFrame(Enum.UserCFrame.Head)
		end
		var8 = (cFrame * CFrame.new(headUserCFrame.Position * headScale)).Position
		if p2.offsetCallback then
			var8 = p2.offsetCallback({ finalPosition = var8, cameraHeadScale = headScale })
		end
		if p2.lerp and var4.current ~= nil then
			var4.current = var4.current:Lerp(p2.offset, 7.2 * p4)
		else
			var4.current = p2.offset
		end
		local var12 = nil
		
		if var4.current ~= nil then
			if p2.faceCamera then
				var12 = CFrame.new(var8 + var4.current.Position * headScale, GetUserCFrameWorldSpace(Enum.UserCFrame.Head, vrService).Position)
			else
				local var13, var14, var15 = headUserCFrame:ToOrientation()
				var12 = CFrame.new(var8) * CFrame.Angles(-var13, var14, -var15) * CFrame.new(var4.current.Position * headScale)
			end
		end
		if p2.tiltCallback then
			var12 = p2.tiltCallback({ panelCFrame = var12, cameraHeadScale = headScale })
		end
		if p3.current ~= nil then
			p3.current.CFrame = var12
			p3.current.Size = Vector3.new(p2.partSize.X * headScale, p2.partSize.Y * headScale, 0.05)
		end
	end, {
		p2.anchoring, p2.faceCamera, p2.lerp, p2.offset, p2.partSize, p2.alignedPanel,
		p2.offsetCallback, p2.tiltCallback
	})
	reactModule.useEffect(function() --[[ line: 161 ]]
		-- upvalues: p2 (ref), constantsModule (copy), var7 (ref)
		if p2.anchoring == constantsModule.AnchoringTypes.World then
			return function() --[[ line: 205 ]] end
		end
		local var16 = nil
		local var17 = nil
		local _ = nil
		
		local function onCurrentCameraChanged() --[[ line: 166 ]]
			-- upvalues: var16 (write), var7 (copy)
			if var16 then
				var16:Disconnect()
			end
			if workspace.CurrentCamera then
				var16 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ line: 173 ]]
					-- upvalues: var7 (copy)
					var7(0)
				end)
			end
		end
		
		local var19 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(onCurrentCameraChanged)
		onCurrentCameraChanged()
		
		if p2.alignedPanel then
			local part = p2.alignedPanel:GetPart()
			
			if part then
				var17 = part:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ line: 186 ]]
					-- upvalues: var7 (copy)
					var7(0)
				end)
			end
		end
		local movementUpdateEventConnection = p2.movementUpdateEvent:Connect(var7)
		
		return function() --[[ line: 194 ]]
			-- upvalues: movementUpdateEventConnection (ref), var19 (write), var16 (write), var17 (write)
			movementUpdateEventConnection:Disconnect()
			var19:Disconnect()
			
			if var16 then
				var16:Disconnect()
			end
			if var17 then
				var17:Disconnect()
			end
		end
	end, { p2.anchoring, var7 })
end