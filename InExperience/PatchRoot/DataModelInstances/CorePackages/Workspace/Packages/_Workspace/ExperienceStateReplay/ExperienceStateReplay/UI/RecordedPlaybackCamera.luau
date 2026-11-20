local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local CreateTemporaryOverlayModule = require(script.Parent.CreateTemporaryOverlay)
local AimAlignmentProbeModule = require(script.Parent.AimAlignmentProbe)
local RecordedReticleAlignmentModule = require(script.Parent.RecordedReticleAlignment)
local RecordedScreenContextModule = require(script.Parent.RecordedScreenContext)
local ExperienceStateReplayAimAlignmentProbe = game:DefineFastFlag("ExperienceStateReplayAimAlignmentProbe", false)
local ExperienceStateReplayCenterRecordedReticle = game:DefineFastFlag("ExperienceStateReplayCenterRecordedReticle", false)
local FFlagExperienceStateReplayRestoreRecordedClothingModule = require(script.Parent.Parent.Flags.FFlagExperienceStateReplayRestoreRecordedClothing)
local FFlagExperienceStateReplayUseRecordedCurrentCameraModule = require(script.Parent.Parent.Flags.FFlagExperienceStateReplayUseRecordedCurrentCamera)
local FFlagExperienceStateReplayRecordedViewportEventModule = require(script.Parent.Parent.Flags.FFlagExperienceStateReplayRecordedViewportEvent)

return {
	create = function()
		-- upvalues: RecordedReticleAlignmentModule (copy), FFlagExperienceStateReplayRecordedViewportEventModule (copy), ExperienceStateReplayCenterRecordedReticle (copy), ExperienceStateReplayAimAlignmentProbe (copy), RecordedScreenContextModule (copy), Workspace (copy), Players (copy), FFlagExperienceStateReplayRestoreRecordedClothingModule (copy), AimAlignmentProbeModule (copy), FFlagExperienceStateReplayUseRecordedCurrentCameraModule (copy), CreateTemporaryOverlayModule (copy)
		local t = {}
		local Model = nil
		local Flag = false
		local DescendantAddedConnection = nil
		local DescendantRemovingConnection = nil
		local T = {}
		local Config = nil
		local Object = nil
		local Flag1 = false
		local v1 = nil
		local Count = 0
		local v2 = nil
		local Flag2 = false
		local IsRECORDEDPOVVIEWMODEL = false
		local Count1 = 0
		local NewRecordedReticleAlignment = RecordedReticleAlignmentModule.create()
		local StartResult = if FFlagExperienceStateReplayRecordedViewportEventModule and (ExperienceStateReplayCenterRecordedReticle or ExperienceStateReplayAimAlignmentProbe) then RecordedScreenContextModule.start() else nil
		local Flag3 = false
		local Ancestor = nil
		local LocalTransparencyModifiers = {}
		local ClassNames = {
			"BasePart",
			"Decal",
			"Beam",
			"ParticleEmitter",
			"Trail"
		}
		
		local function _()
			-- upvalues: Config (ref), Object (ref)
			if Config ~= nil then
				local Camera = Config.camera
				
				if Camera.Parent ~= nil then
					Camera.CameraType = Config.cameraType
					Camera.CameraSubject = Config.cameraSubject
					Camera.Focus = Config.focus
					Camera.FieldOfView = Config.fieldOfView
				end
				Config = nil
			end
			Object = nil
		end
		
		local function captureRecordedPovCameraState(Camera: Camera)
			-- upvalues: Config (ref), Object (ref), v1 (ref), Count (ref), v2 (ref)
			if Config ~= nil and Config.camera == Camera then return end
			if Config ~= nil then
				local Camera1 = Config.camera
				
				if Camera1.Parent ~= nil then
					Camera1.CameraType = Config.cameraType
					Camera1.CameraSubject = Config.cameraSubject
					Camera1.Focus = Config.focus
					Camera1.FieldOfView = Config.fieldOfView
				end
				Config = nil
			end
			Object = nil
			v1 = nil
			Count = 0
			
			if v2 ~= nil and v2.camera ~= Camera then
				v2 = nil
			end
			Config = {
				camera = Camera,
				cameraType = Camera.CameraType,
				cameraSubject = Camera.CameraSubject,
				focus = Camera.Focus,
				fieldOfView = Camera.FieldOfView
			}
		end
		
		local _ = function(p1, Part: Part)
			local OriginalProperty = p1.originalProperties[Part]
			
			if OriginalProperty ~= nil then
				if OriginalProperty.anchored ~= nil and Part:IsA("BasePart") then
					Part.Anchored = OriginalProperty.anchored
				end
				Part.LocalTransparencyModifier = OriginalProperty.localTransparencyModifier
			end
		end
		
		local _ = function(Object): boolean
			-- upvalues: ClassNames (copy)
			for _, className in ClassNames do
				if Object:IsA(className) then
					return true
				end
			end
			return false
		end
		
		local _ = function(p1, Part)
			local PartIndice = p1.partIndices[Part]
			
			if PartIndice == nil then return end
			local Part1 = p1.parts[#p1.parts]
			p1.parts[PartIndice] = Part1
			p1.parts[#p1.parts] = nil
			p1.partIndices[Part] = nil
			
			if Part1 ~= Part then
				p1.partIndices[Part1] = PartIndice
			end
			p1.originalProperties[Part] = nil
		end
		
		local function getViewmodelParts(Key)
			-- upvalues: t (ref), ClassNames (copy)
			local Entry = t[Key]
			
			if Entry ~= nil then
				return Entry.parts
			end
			local config = { parts = {}, partIndices = {}, originalProperties = {} }
			
			local function addPart(Descendant: Part)
				-- upvalues: ClassNames (upval), config (ref)
				local Flag = false
				
				for _, className in ClassNames do
					if Descendant:IsA(className) then
						Flag = true
						break
					end
				end
				if Flag and config.partIndices[Descendant] == nil then
					table.insert(config.parts, Descendant)
					config.partIndices[Descendant] = #config.parts
					config.originalProperties[Descendant] = {
						anchored = if Descendant:IsA("BasePart") then Descendant.Anchored else nil,
						localTransparencyModifier = Descendant.LocalTransparencyModifier
					}
				end
			end
			
			for _, descendant in Key:GetDescendants() do
				addPart(descendant)
			end
			config.descendantAdded = Key.DescendantAdded:Connect(addPart)
			config.descendantRemoving = Key.DescendantRemoving:Connect(function(Descendant: Part)
				-- upvalues: config (ref)
				local OriginalProperty = config.originalProperties[Descendant]
				
				if OriginalProperty ~= nil then
					if OriginalProperty.anchored ~= nil and Descendant:IsA("BasePart") then
						Descendant.Anchored = OriginalProperty.anchored
					end
					Descendant.LocalTransparencyModifier = OriginalProperty.localTransparencyModifier
				end
				local config1 = config
				local PartIndice = config1.partIndices[Descendant]
				
				if PartIndice == nil then return end
				local Part = config1.parts[#config1.parts]
				config1.parts[PartIndice] = Part
				config1.parts[#config1.parts] = nil
				config1.partIndices[Descendant] = nil
				
				if Part ~= Descendant then
					config1.partIndices[Part] = PartIndice
				end
				config1.originalProperties[Descendant] = nil
			end)
			t[Key] = config
			
			return config.parts
		end
		
		local function clearViewmodelPartState(Key)
			-- upvalues: t (ref)
			local Entry = t[Key]
			
			if Entry == nil then return end
			Entry.descendantAdded:Disconnect()
			Entry.descendantRemoving:Disconnect()
			
			for originalProperty in Entry.originalProperties do
				local OriginalProperty = Entry.originalProperties[originalProperty]
				
				if OriginalProperty ~= nil then
					if OriginalProperty.anchored ~= nil and originalProperty:IsA("BasePart") then
						originalProperty.Anchored = OriginalProperty.anchored
					end
					originalProperty.LocalTransparencyModifier = OriginalProperty.localTransparencyModifier
				end
			end
			t[Key] = nil
		end
		
		local function clearViewmodelPartStates()
			-- upvalues: t (ref), Model (ref), Flag (ref), T (ref), DescendantAddedConnection (ref), DescendantRemovingConnection (ref)
			local t1 = t
			t = {}
			
			for _, value in t1 do
				value.descendantAdded:Disconnect()
				value.descendantRemoving:Disconnect()
				
				for originalProperty in value.originalProperties do
					local OriginalProperty = value.originalProperties[originalProperty]
					
					if OriginalProperty ~= nil then
						if OriginalProperty.anchored ~= nil and originalProperty:IsA("BasePart") then
							originalProperty.Anchored = OriginalProperty.anchored
						end
						originalProperty.LocalTransparencyModifier = OriginalProperty.localTransparencyModifier
					end
				end
			end
			Model = nil
			Flag = false
			T = {}
			
			if DescendantAddedConnection ~= nil then
				DescendantAddedConnection:Disconnect()
				DescendantAddedConnection = nil
			end
			if DescendantRemovingConnection ~= nil then
				DescendantRemovingConnection:Disconnect()
				DescendantRemovingConnection = nil
			end
		end
		
		local _ = function()
			-- upvalues: LocalTransparencyModifiers (ref), Ancestor (ref)
			for i, localTransparencyModifier in LocalTransparencyModifiers do
				i.LocalTransparencyModifier = localTransparencyModifier
			end
			LocalTransparencyModifiers = {}
			Ancestor = nil
		end
		
		local function considerFirstPersonViewmodel(Descendant: Model)
			-- upvalues: Model (ref), clearViewmodelPartState (copy), Workspace (upval), T (ref)
			if not Descendant:IsA("Model") or Descendant.Name ~= "FirstPerson" then return end
			if Model ~= nil and Model ~= Descendant then
				local Object = Model
				clearViewmodelPartState(Object)
				
				if Object:IsDescendantOf(Workspace) then
					T[Object] = true
				end
			end
			Model = Descendant
			T[Descendant] = nil
		end
		
		local function reconsiderPendingFirstPersonModels(Key)
			-- upvalues: T (ref), Workspace (upval), Model (ref), clearViewmodelPartState (copy)
			local Models = T
			T = {}
			
			for model in Models do
				if model:IsDescendantOf(Workspace) and (Key == nil or not model:IsDescendantOf(Key)) and model:IsA("Model") and model.Name == "FirstPerson" then
					if Model ~= nil and Model ~= model then
						local Object = Model
						clearViewmodelPartState(Object)
						
						if Object:IsDescendantOf(Workspace) then
							T[Object] = true
						end
					end
					Model = model
					T[model] = nil
				end
			end
		end
		
		local function findFirstPersonViewmodel()
			-- upvalues: Model (ref), Workspace (upval), clearViewmodelPartState (copy), reconsiderPendingFirstPersonModels (copy), DescendantAddedConnection (ref), considerFirstPersonViewmodel (copy), DescendantRemovingConnection (ref), T (ref), Flag (ref)
			if Model ~= nil then
				if Model:IsDescendantOf(Workspace) then
					return Model
				end
				local Model1 = Model
				clearViewmodelPartState(Model1)
				Model = nil
				reconsiderPendingFirstPersonModels(Model1)
			end
			if DescendantAddedConnection == nil then
				DescendantAddedConnection = Workspace.DescendantAdded:Connect(considerFirstPersonViewmodel)
				DescendantRemovingConnection = Workspace.DescendantRemoving:Connect(function(Descendant)
					-- upvalues: T (upval), Model (upval), clearViewmodelPartState (upval), reconsiderPendingFirstPersonModels (upval)
					T[Descendant] = nil
					
					if Descendant == Model then
						clearViewmodelPartState(Descendant)
						Model = nil
						reconsiderPendingFirstPersonModels(Descendant)
					end
				end)
			end
			local ViewModels = Workspace:FindFirstChild("ViewModels")
			local FirstPerson = ViewModels and ViewModels:FindFirstChild("FirstPerson")
			
			if FirstPerson ~= nil and FirstPerson:IsA("Model") then
				Model = FirstPerson
				T[FirstPerson] = nil
				
				return Model
			end
			if not Flag then
				Flag = true
				
				for _, Model2 in Workspace:GetDescendants() do
					if Model2:IsA("Model") and Model2.Name == "FirstPerson" then
						if Model ~= nil and Model ~= Model2 then
							local Object = Model
							clearViewmodelPartState(Object)
							
							if Object:IsDescendantOf(Workspace) then
								T[Object] = true
							end
						end
						Model = Model2
						T[Model2] = nil
					end
				end
			end
			return Model
		end
		
		local function findRecordedCamera(CurrentCamera)
			-- upvalues: Flag2 (ref), Workspace (upval), Object (ref)
			if Flag2 and CurrentCamera.Name == "Camera" and CurrentCamera.Parent == Workspace then
				Object = CurrentCamera
				
				return CurrentCamera
			end
			if Object ~= nil and (Object ~= CurrentCamera and Object:IsDescendantOf(Workspace)) and Object.Name == "Camera" then
				return Object
			end
			Object = nil
			
			for _, Camera in Workspace:GetChildren() do
				if Camera:IsA("Camera") and Camera ~= CurrentCamera and Camera.Name == "Camera" then
					Object = Camera
					
					return Object
				end
			end
			return nil
		end
		
		local function findRecordedViewport(CurrentCamera)
			-- upvalues: findRecordedCamera (copy), StartResult (copy)
			if CurrentCamera == nil then
				return nil, nil
			end
			local RecordedCamera = findRecordedCamera(CurrentCamera)
			
			if StartResult == nil then
				return RecordedCamera, nil
			else
				return RecordedCamera, StartResult.getViewportSize()
			end
		end
		
		local _ = function(p1): boolean
			return p1 == CFrame.new() or p1 == CFrame.new(0, 0, -5)
		end
		
		local function stepAvatarVisibility(CurrentCamera)
			-- upvalues: Players (upval), Ancestor (ref), LocalTransparencyModifiers (ref)
			if CurrentCamera == nil then return end
			local Position = CurrentCamera.CFrame.Position
			local Ancestor1 = nil
			local v3 = 1.8
			
			for _, player in Players:GetPlayers() do
				local Character = player.Character
				local IsLocalPlayerMatch: boolean = player == Players.LocalPlayer or Character == nil
				local Head = nil
				
				if not IsLocalPlayerMatch then
					Head = Character:FindFirstChild("Head")
					IsLocalPlayerMatch = Head == nil or not Head:IsA("BasePart")
				end
				if not IsLocalPlayerMatch then
					local Distance = (Head.Position - Position).Magnitude
					
					if Distance < v3 then
						Ancestor1 = Character
						v3 = Distance
					end
				end
			end
			if Ancestor1 ~= Ancestor then
				for i, localTransparencyModifier in LocalTransparencyModifiers do
					i.LocalTransparencyModifier = localTransparencyModifier
				end
				LocalTransparencyModifiers = {}
				Ancestor = nil
				
				if Ancestor1 ~= nil then
					print("[CAMVIS] hiding camera-occupying avatar distance=" .. tostring(v3))
				end
				Ancestor = Ancestor1
			end
			if Ancestor == nil then return end
			for i1, localTransparencyModifier1 in LocalTransparencyModifiers do
				if not i1:IsDescendantOf(Ancestor) then
					i1.LocalTransparencyModifier = localTransparencyModifier1
					LocalTransparencyModifiers[i1] = nil
				end
			end
			for _, descendant in Ancestor:GetDescendants() do
				if (descendant:IsA("BasePart") or descendant:IsA("Decal")) and descendant:FindFirstAncestorOfClass("Tool") == nil then
					if LocalTransparencyModifiers[descendant] == nil then
						LocalTransparencyModifiers[descendant] = descendant.LocalTransparencyModifier
					end
					descendant.LocalTransparencyModifier = 1
				end
			end
		end
		
		local function syncRecordedCamera()
			-- upvalues: Workspace (upval), findRecordedCamera (copy), captureRecordedPovCameraState (copy), v2 (ref), Flag1 (ref)
			local CurrentCamera = Workspace.CurrentCamera
			
			if CurrentCamera == nil then return end
			local RecordedCamera = findRecordedCamera(CurrentCamera)
			
			if RecordedCamera ~= nil then
				captureRecordedPovCameraState(CurrentCamera)
				CurrentCamera.CameraType = Enum.CameraType.Scriptable
				CurrentCamera.CameraSubject = nil
				
				if RecordedCamera == CurrentCamera then
					if v2 ~= nil and v2.camera == CurrentCamera then
						if CurrentCamera.CFrame ~= v2.cframe then
							CurrentCamera.CFrame = v2.cframe
						end
						if CurrentCamera.Focus ~= v2.focus then
							CurrentCamera.Focus = v2.focus
						end
						if CurrentCamera.FieldOfView ~= v2.fieldOfView then
							CurrentCamera.FieldOfView = v2.fieldOfView
						end
					end
					return
				else
					Flag1 = true
					CurrentCamera.CFrame = RecordedCamera.CFrame
					local Focus = RecordedCamera.Focus
					local IsFocusMatch: boolean = Focus == CFrame.new() or Focus == CFrame.new(0, 0, -5)
					CurrentCamera.Focus = if IsFocusMatch then RecordedCamera.CFrame else Focus
					CurrentCamera.FieldOfView = RecordedCamera.FieldOfView
				end
			end
		end
		
		local function stepRecordedPov()
			-- upvalues: syncRecordedCamera (copy), Workspace (upval), FFlagExperienceStateReplayRestoreRecordedClothingModule (upval), stepAvatarVisibility (copy), Object (ref), v1 (ref), Count (ref), Flag1 (ref), ExperienceStateReplayCenterRecordedReticle (upval), Flag3 (ref), FFlagExperienceStateReplayRecordedViewportEventModule (upval), NewRecordedReticleAlignment (copy), findRecordedViewport (copy), findRecordedCamera (copy), ExperienceStateReplayAimAlignmentProbe (upval), Count1 (ref), AimAlignmentProbeModule (upval), IsRECORDEDPOVVIEWMODEL (ref), findFirstPersonViewmodel (copy), getViewmodelParts (copy)
			syncRecordedCamera()
			local CurrentCamera = Workspace.CurrentCamera
			
			if FFlagExperienceStateReplayRestoreRecordedClothingModule then
				stepAvatarVisibility(CurrentCamera)
			end
			if CurrentCamera ~= nil and Object == nil then
				local CurrentCameraCFrame = CurrentCamera.CFrame
				
				if v1 ~= nil and CurrentCameraCFrame ~= v1 then
					Count += 1
					
					if Count >= 3 and not Flag1 then
						Flag1 = true
						print("[CAMDRV] synchronized moving in-place playback camera")
					end
				end
				v1 = CurrentCameraCFrame
			end
			if ExperienceStateReplayCenterRecordedReticle and not Flag3 then
				local Success = nil
				local Result = nil
				if FFlagExperienceStateReplayRecordedViewportEventModule then
					Success, Result = pcall(NewRecordedReticleAlignment.step, CurrentCamera, findRecordedViewport(CurrentCamera))
				else
					Success, Result = pcall(NewRecordedReticleAlignment.step, CurrentCamera, CurrentCamera and findRecordedCamera(CurrentCamera))
				end
				if not Success then
					Flag3 = true
					warn("[AIMALIGN] reticle correction failed: " .. tostring(Result))
				end
			end
			if ExperienceStateReplayAimAlignmentProbe then
				Count1 += 1
				
				if Count1 % 300 == 1 then
					local Success1 = nil
					local Result1 = nil
					if FFlagExperienceStateReplayRecordedViewportEventModule then
						Success1, Result1 = pcall(AimAlignmentProbeModule.sample, CurrentCamera, findRecordedViewport(CurrentCamera))
					else
						Success1, Result1 = pcall(AimAlignmentProbeModule.sample, CurrentCamera, CurrentCamera and findRecordedCamera(CurrentCamera))
					end
					if not Success1 then
						warn("[AIMALIGN] probe failed: " .. tostring(Result1))
					end
				end
			end
			if not IsRECORDEDPOVVIEWMODEL then return end
			local FirstPersonViewmodel = findFirstPersonViewmodel()
			
			if CurrentCamera == nil then return end
			local T = if FirstPersonViewmodel == nil then {} else getViewmodelParts(FirstPersonViewmodel)
			for _, Part in T do
				if Part:IsA("BasePart") then
					Part.Anchored = true
				end
				Part.LocalTransparencyModifier = 0
			end
		end
		
		return {
			activate = function(p1, Callback: (any, any, any) -> (), Enabled)
				-- upvalues: LocalTransparencyModifiers (ref), Ancestor (ref), clearViewmodelPartStates (copy), Config (ref), Object (ref), Flag1 (ref), v1 (ref), v2 (ref), Flag2 (ref), Count (ref), IsRECORDEDPOVVIEWMODEL (ref), Count1 (ref), NewRecordedReticleAlignment (copy), Flag3 (ref), FFlagExperienceStateReplayUseRecordedCurrentCameraModule (upval), CreateTemporaryOverlayModule (upval), stepRecordedPov (copy), Workspace (upval), findRecordedCamera (copy), syncRecordedCamera (copy)
				for i, localTransparencyModifier in LocalTransparencyModifiers do
					i.LocalTransparencyModifier = localTransparencyModifier
				end
				LocalTransparencyModifiers = {}
				Ancestor = nil
				clearViewmodelPartStates()
				
				if Config ~= nil then
					local Camera = Config.camera
					
					if Camera.Parent ~= nil then
						Camera.CameraType = Config.cameraType
						Camera.CameraSubject = Config.cameraSubject
						Camera.Focus = Config.focus
						Camera.FieldOfView = Config.fieldOfView
					end
					Config = nil
				end
				Object = nil
				Flag1 = false
				v1 = nil
				v2 = nil
				Flag2 = false
				Count = 0
				IsRECORDEDPOVVIEWMODEL = false
				Count1 = 0
				NewRecordedReticleAlignment.clear()
				Flag3 = false
				Flag2 = FFlagExperienceStateReplayUseRecordedCurrentCameraModule and Enabled == true
				local Replaced = string.gsub(string.gsub(p1 or "RECORDED_POV_VIEWMODEL", "^%s+", ""), "%s+$", "")
				
				if Replaced == "" then
					Replaced = "RECORDED_POV_VIEWMODEL"
				end
				if Replaced ~= "RECORDED_POV" and Replaced ~= "RECORDED_POV_VIEWMODEL" then
					warn("Unsupported headless replay camera mode: " .. Replaced .. "; using RECORDED_POV_VIEWMODEL")
					Replaced = "RECORDED_POV_VIEWMODEL"
				end
				IsRECORDEDPOVVIEWMODEL = Replaced == "RECORDED_POV_VIEWMODEL"
				CreateTemporaryOverlayModule.hideOverlay()
				Callback("ReplayCam", Enum.RenderPriority.Last.Value, stepRecordedPov)
				
				if Flag2 then
					local CurrentCamera = Workspace.CurrentCamera
					
					if CurrentCamera ~= nil and findRecordedCamera(CurrentCamera) == CurrentCamera then
						syncRecordedCamera()
					end
				end
			end,
			clear = function()
				-- upvalues: LocalTransparencyModifiers (ref), Ancestor (ref), clearViewmodelPartStates (copy), Config (ref), Object (ref), Flag1 (ref), v1 (ref), v2 (ref), Flag2 (ref), Count (ref), IsRECORDEDPOVVIEWMODEL (ref), Count1 (ref), NewRecordedReticleAlignment (copy), Flag3 (ref)
				for i, localTransparencyModifier in LocalTransparencyModifiers do
					i.LocalTransparencyModifier = localTransparencyModifier
				end
				LocalTransparencyModifiers = {}
				Ancestor = nil
				clearViewmodelPartStates()
				
				if Config ~= nil then
					local Camera = Config.camera
					
					if Camera.Parent ~= nil then
						Camera.CameraType = Config.cameraType
						Camera.CameraSubject = Config.cameraSubject
						Camera.Focus = Config.focus
						Camera.FieldOfView = Config.fieldOfView
					end
					Config = nil
				end
				Object = nil
				Flag1 = false
				v1 = nil
				v2 = nil
				Flag2 = false
				Count = 0
				IsRECORDEDPOVVIEWMODEL = false
				Count1 = 0
				NewRecordedReticleAlignment.clear()
				Flag3 = false
			end,
			destroy = function()
				-- upvalues: StartResult (copy)
				if StartResult ~= nil then
					StartResult.stop()
				end
			end,
			resetRecordedScreenContext = if StartResult == nil then nil else StartResult.reset,
			hasSyncedRecordedCamera = function()
				-- upvalues: Flag1 (ref)
				return Flag1
			end,
			noteAppliedProjection = function()
				-- upvalues: Flag2 (ref), Workspace (upval), findRecordedCamera (copy), v2 (ref), Flag1 (ref)
				if not Flag2 then return end
				local CurrentCamera = Workspace.CurrentCamera
				
				if CurrentCamera == nil or findRecordedCamera(CurrentCamera) ~= CurrentCamera then return end
				local Focus = CurrentCamera.Focus
				local config = {
					camera = CurrentCamera,
					cframe = CurrentCamera.CFrame,
					focus = if IsFocusMatch then CurrentCamera.CFrame else Focus,
					fieldOfView = CurrentCamera.FieldOfView
				}
				local IsFocusMatch: boolean = Focus == CFrame.new() or Focus == CFrame.new(0, 0, -5)
				v2 = config
				
				if not Flag1 then
					Flag1 = true
					print("[CAMDRV] synchronized recorded CurrentCamera from the source clock")
				end
			end
		}
	end
}