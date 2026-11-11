local Parent = script.Parent
local ReactModule = require(Parent.Parent.Parent.Parent.React)
local ConstantsModule = require(Parent.Constants)

local function GetUserCFrameWorldSpace(Head, VrService): CFrame
	local UserCFrame = VrService:GetUserCFrame(Head)
	local CurrentCamera = workspace.CurrentCamera
	
	if not CurrentCamera.HeadLocked then
		UserCFrame = VrService:GetUserCFrame(Enum.UserCFrame.Head):Inverse() * UserCFrame
	end
	return CurrentCamera.CFrame * (CFrame.new(UserCFrame.p * CurrentCamera.HeadScale) * (UserCFrame - UserCFrame.p))
end

return function(p1, p2)
	-- upvalues: ConstantsModule (copy), ReactModule (copy), GetUserCFrameWorldSpace (copy)
	if p1.anchoring ~= ConstantsModule.AnchoringTypes.PanelManaged or not p1.connectPanelManagerFunction then
		local UseRefResult = ReactModule.useRef(p1.offset)
		local UseRefResult1 = ReactModule.useRef(nil)
		local UseRefResult2 = ReactModule.useRef(false)
		local VrService = p1.vrService
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), p1 (copy)
			UseRefResult.current = p1.offset
		end, {})
		local UseResult = ReactModule.useCallback(function(p3: number)
			-- upvalues: p1 (copy), ConstantsModule (upval), VrService (copy), GetUserCFrameWorldSpace (upval), UseRefResult1 (copy), UseRefResult2 (copy), UseRefResult (copy), p2 (copy)
			local CurrentCamera = workspace.CurrentCamera
			local X = nil
			local CurrentCameraCFrame = CurrentCamera.CFrame
			local HeadScale: number = CurrentCamera.HeadScale
			local UserCFrame = nil
			
			if p1.anchoring == ConstantsModule.AnchoringTypes.Head then
				UserCFrame = VrService:GetUserCFrame(Enum.UserCFrame.Head)
				local UserCFrameWorldSpace = GetUserCFrameWorldSpace(Enum.UserCFrame.Head, VrService)
				
				if UseRefResult1.current == nil then
					UseRefResult1.current = UserCFrameWorldSpace
				end
				assert(UseRefResult1.current ~= nil, "lastLookCFrame should not be nil.")
				
				if UseRefResult1.current.LookVector:Dot(UserCFrameWorldSpace.LookVector) < 0.85 then
					UseRefResult2.current = true
				elseif UseRefResult1.current.LookVector:Dot(UserCFrameWorldSpace.LookVector) > 0.99 then
					UseRefResult2.current = false
				end
				if UseRefResult2.current then
					UseRefResult1.current = UseRefResult1.current:Lerp(UserCFrameWorldSpace, 7.2 * p3)
				end
				local NewPosition = UserCFrameWorldSpace.Position + UseRefResult1.current.LookVector * HeadScale * 2
				X = Vector3.new(NewPosition.X, UserCFrameWorldSpace.Position.Y, NewPosition.Z)
				local AlignedPanel = p1.alignedPanel
				
				if AlignedPanel then
					local Part = AlignedPanel:GetPart()
					
					if Part and (AlignedPanel:IsPositionLockedType() and (AlignedPanel:IsVisible() or AlignedPanel.alwaysUpdatePosition)) then
						X = Vector3.new(Part.Position.X, UserCFrameWorldSpace.Position.Y - 0.4 * HeadScale, Part.Position.Z)
					end
				end
			else
				if p1.anchoring ~= ConstantsModule.AnchoringTypes.Wrist then return end
				if VrService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) and VrService.GuiInputUserCFrame == Enum.UserCFrame.LeftHand then
					UserCFrame = VrService:GetUserCFrame(Enum.UserCFrame.RightHand)
				elseif VrService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
					UserCFrame = VrService:GetUserCFrame(Enum.UserCFrame.LeftHand)
				end
				if not UserCFrame then
					UserCFrame = VrService:GetUserCFrame(Enum.UserCFrame.Head)
				end
				X = (CurrentCameraCFrame * CFrame.new(UserCFrame.Position * HeadScale)).Position
			end
			if p1.offsetCallback then
				X = p1.offsetCallback({ finalPosition = X, cameraHeadScale = HeadScale })
			end
			if p1.lerp and UseRefResult.current ~= nil then
				UseRefResult.current = UseRefResult.current:Lerp(p1.offset, 7.2 * p3)
			else
				UseRefResult.current = p1.offset
			end
			local TiltResult = nil
			
			if UseRefResult.current ~= nil then
				if p1.faceCamera then
					TiltResult = CFrame.new(X + UseRefResult.current.Position * HeadScale, GetUserCFrameWorldSpace(Enum.UserCFrame.Head, VrService).Position)
				else
					local Rx, Ry, Rz = UserCFrame:ToOrientation()
					TiltResult = CFrame.new(X) * CFrame.Angles(-Rx, Ry, -Rz) * CFrame.new(UseRefResult.current.Position * HeadScale)
				end
			end
			if p1.tiltCallback then
				TiltResult = p1.tiltCallback({ panelCFrame = TiltResult, cameraHeadScale = HeadScale })
			end
			if p2.current ~= nil then
				p2.current.CFrame = TiltResult
				p2.current.Size = Vector3.new(p1.partSize.X * HeadScale, p1.partSize.Y * HeadScale, 0.05)
			end
		end, {
			p1.anchoring, p1.faceCamera, p1.lerp, p1.offset, p1.partSize, p1.alignedPanel,
			p1.offsetCallback, p1.tiltCallback
		})
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), ConstantsModule (upval), UseResult (copy)
			if p1.anchoring == ConstantsModule.AnchoringTypes.World then
				local function Connection() end
				
				return Connection
			end
			local Connection = nil
			local Connection1 = nil
			local Connection2 = nil
			
			local function onCurrentCameraChanged()
				-- upvalues: Connection (ref), UseResult (upval)
				if Connection then
					Connection:Disconnect()
				end
				if workspace.CurrentCamera then
					Connection = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function()
						-- upvalues: UseResult (upval)
						UseResult(0)
					end)
				end
			end
			
			Connection2 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(onCurrentCameraChanged)
			onCurrentCameraChanged()
			
			if p1.alignedPanel then
				local Part = p1.alignedPanel:GetPart()
				
				if Part then
					Connection1 = Part:GetPropertyChangedSignal("CFrame"):Connect(function()
						-- upvalues: UseResult (upval)
						UseResult(0)
					end)
				end
			end
			local MovementUpdateEventConnection = p1.movementUpdateEvent:Connect(UseResult)
			
			return function()
				-- upvalues: MovementUpdateEventConnection (copy), Connection2 (ref), Connection (ref), Connection1 (ref)
				MovementUpdateEventConnection:Disconnect()
				Connection2:Disconnect()
				
				if Connection then
					Connection:Disconnect()
				end
				if Connection1 then
					Connection1:Disconnect()
				end
			end
		end, { p1.anchoring, UseResult })
		
		return
	end
end