local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ObserveGuiOnScreenModule = require(script.Parent.observeGuiOnScreen)
local _CFrame = CFrame.new(0, 2000, 0)

local function _(Camera: Camera)
	return {
		instance = Camera,
		cframe = Camera.CFrame,
		focus = Camera.Focus,
		fieldOfView = Camera.FieldOfView,
		fieldOfViewMode = Camera.FieldOfViewMode,
		cameraType = Camera.CameraType
	}
end

local _ = function(p1)
	-- upvalues: GuiService (copy)
	return p1 + GuiService:GetGuiInset().Y
end

local _ = function(Camera, p1)
	return 2 * (Camera.Focus.Position - Camera.CFrame.Position).Magnitude * math.tan(math.rad(Camera.FieldOfView) / 2) / p1
end

local _ = function(p1): number
	local Y: number = p1.pager.AbsolutePosition.Y
	local Y1: number = p1.pager.AbsoluteSize.Y
	
	if Y1 <= 0 then
		return 0
	else
		local Y2: number = p1.page.AbsolutePosition.Y
		
		return (math.clamp((math.min(Y2 + p1.page.AbsoluteSize.Y, Y + Y1) - math.max(Y2, Y)) / Y1, 0, 1))
	end
end

return function()
	-- upvalues: Workspace (copy), _CFrame (copy), GuiService (copy), RunService (copy), ObserveGuiOnScreenModule (copy)
	local List = {}
	local t = {}
	local t1 = {}
	local Count = 0
	local Owner = nil
	local v1 = nil
	local v2 = nil
	local Config = nil
	local _CFrame1 = nil
	local Flag = false
	local RenderSteppedConnection = nil
	local Tbl = {}
	
	local function _()
		-- upvalues: Workspace (upval), v2 (ref), v1 (ref), Config (ref), _CFrame1 (ref)
		local CurrentCamera = Workspace.CurrentCamera
		
		if CurrentCamera == nil then
			local AvatarMomentCamera = Instance.new("Camera")
			AvatarMomentCamera.Name = "AvatarMomentCamera"
			AvatarMomentCamera.Parent = Workspace
			Workspace.CurrentCamera = AvatarMomentCamera
			v2 = AvatarMomentCamera
			CurrentCamera = AvatarMomentCamera
		end
		v1 = CurrentCamera
		Config = {
			instance = CurrentCamera,
			cframe = CurrentCamera.CFrame,
			focus = CurrentCamera.Focus,
			fieldOfView = CurrentCamera.FieldOfView,
			fieldOfViewMode = CurrentCamera.FieldOfViewMode,
			cameraType = CurrentCamera.CameraType
		}
		_CFrame1 = nil
	end
	
	local function releaseCamera()
		-- upvalues: Config (ref), v1 (ref), Workspace (upval), _CFrame1 (ref), v2 (ref)
		local Config1 = Config
		local Camera = v1
		Config = nil
		v1 = nil
		
		if Config1 ~= nil and Camera ~= nil and Config1.instance.Parent ~= nil and Workspace.CurrentCamera == Config1.instance and (_CFrame1 == nil or Camera.CFrame == _CFrame1) then
			Camera.CFrame = Config1.cframe
			Camera.Focus = Config1.focus
			Camera.FieldOfView = Config1.fieldOfView
			Camera.FieldOfViewMode = Config1.fieldOfViewMode
			Camera.CameraType = Config1.cameraType
		end
		_CFrame1 = nil
		local CurrentCamera = v2
		v2 = nil
		
		if CurrentCamera ~= nil then
			if Workspace.CurrentCamera == CurrentCamera then
				Workspace.CurrentCamera = nil
			end
			CurrentCamera:Destroy()
		end
	end
	
	local _ = function(p1)
		if p1.worldModel.Parent ~= nil then
			local Root = p1.scene.root
			Root:PivotTo(CFrame.identity)
			Root.Parent = p1.worldModel
			
			return
		end
	end
	
	local _ = function(p1)
		-- upvalues: Workspace (upval), _CFrame (upval)
		local Root = p1.scene.root
		Root.Parent = Workspace
		Root:PivotTo(_CFrame)
	end
	
	local _ = function(Value)
		-- upvalues: Owner (ref), releaseCamera (copy), Workspace (upval), v2 (ref), v1 (ref), Config (ref), _CFrame1 (ref), _CFrame (upval)
		if Value == Owner then return end
		local Owner1 = Owner
		Owner = Value
		
		if Value == nil then
			releaseCamera()
		end
		if Owner1 ~= nil and Owner1.worldModel.Parent ~= nil then
			local Root = Owner1.scene.root
			Root:PivotTo(CFrame.identity)
			Root.Parent = Owner1.worldModel
		end
		if Value ~= nil then
			if Owner1 == nil then
				local CurrentCamera = Workspace.CurrentCamera
				
				if CurrentCamera == nil then
					local AvatarMomentCamera = Instance.new("Camera")
					AvatarMomentCamera.Name = "AvatarMomentCamera"
					AvatarMomentCamera.Parent = Workspace
					Workspace.CurrentCamera = AvatarMomentCamera
					v2 = AvatarMomentCamera
					CurrentCamera = AvatarMomentCamera
				end
				v1 = CurrentCamera
				Config = {
					instance = CurrentCamera,
					cframe = CurrentCamera.CFrame,
					focus = CurrentCamera.Focus,
					fieldOfView = CurrentCamera.FieldOfView,
					fieldOfViewMode = CurrentCamera.FieldOfViewMode,
					cameraType = CurrentCamera.CameraType
				}
				_CFrame1 = nil
			end
			local Root = Value.scene.root
			Root.Parent = Workspace
			Root:PivotTo(_CFrame)
		end
	end
	
	local function updateWorkspaceCamera(Owner, Y: number)
		-- upvalues: v1 (ref), Workspace (upval), _CFrame (upval), _CFrame1 (ref)
		local Camera = v1
		
		if Camera ~= nil and Workspace.CurrentCamera == Camera then
			local Camera1 = Owner.scene.camera
			local ScaledY = if Y > 0 then (Owner.page.AbsolutePosition.Y - Owner.pager.AbsolutePosition.Y) * (2 * (Camera1.Focus.Position - Camera1.CFrame.Position).Magnitude * math.tan(math.rad(Camera1.FieldOfView) / 2) / Y) else 0
			Camera.CameraType = Enum.CameraType.Scriptable
			Camera.FieldOfViewMode = Enum.FieldOfViewMode.Vertical
			Camera.FieldOfView = Camera1.FieldOfView
			Camera.CFrame = _CFrame * Camera1.CFrame * CFrame.new(0, ScaledY, 0)
			Camera.Focus = _CFrame * Camera1.Focus
			_CFrame1 = Camera.CFrame
			
			return
		end
	end
	
	local function updateViewportCamera(Owner, Y: number)
		-- upvalues: GuiService (upval)
		local Camera = Owner.scene.camera
		local ViewportCamera = Owner.viewportCamera
		local Y1: number = Owner.viewportFrame.AbsoluteSize.Y
		ViewportCamera.FieldOfViewMode = Enum.FieldOfViewMode.Vertical
		
		if Y <= 0 or Y1 <= 0 then
			ViewportCamera.FieldOfView = Camera.FieldOfView
			ViewportCamera.CFrame = Camera.CFrame
			
			return
		else
			ViewportCamera.FieldOfView = math.deg(math.atan(math.tan(math.rad(Camera.FieldOfView) / 2) * Y1 / Y) * 2)
			ViewportCamera.CFrame = Camera.CFrame * CFrame.new(0, -(Owner.pager.AbsolutePosition.Y + GuiService:GetGuiInset().Y + (Owner.viewportFrame.AbsolutePosition.Y - Owner.page.AbsolutePosition.Y) + Y1 / 2 - Y / 2) * (2 * (Camera.Focus.Position - Camera.CFrame.Position).Magnitude * math.tan(math.rad(Camera.FieldOfView) / 2) / Y), 0)
		end
	end
	
	local _ = function(p1, ViewportFrameVisible)
		if p1.viewportFrameVisible ~= ViewportFrameVisible then
			p1.viewportFrameVisible = ViewportFrameVisible
			p1.viewportFrame.Visible = ViewportFrameVisible
		end
	end
	
	local _ = function(): boolean
		-- upvalues: v1 (ref), _CFrame1 (ref), Workspace (upval)
		local CurrentCamera = v1
		
		return CurrentCamera ~= nil and (_CFrame1 ~= nil and (Workspace.CurrentCamera ~= CurrentCamera or CurrentCamera.CFrame ~= _CFrame1))
	end
	
	local function step(): boolean
		-- upvalues: v1 (ref), _CFrame1 (ref), Workspace (upval), Flag (ref), Config (ref), t (copy), t1 (copy), List (copy), Owner (ref), releaseCamera (copy), v2 (ref), _CFrame (upval), updateViewportCamera (copy), updateWorkspaceCamera (copy)
		local CurrentCamera = v1
		
		if CurrentCamera ~= nil and (_CFrame1 ~= nil and (Workspace.CurrentCamera ~= CurrentCamera or CurrentCamera.CFrame ~= _CFrame1)) then
			Flag = true
			Config = nil
		end
		local Pager = nil
		local v3 = -1
		
		for _, value in t do
			local Entry = if value.isOnScreen then t1[value.pager] else nil
			
			if Entry ~= nil and v3 < Entry then
				Pager = value.pager
				v3 = Entry
			end
		end
		local v4 = nil
		local Coverage = 0
		local Coverage1 = 0
		
		for _, value1 in List do
			local ClampedValue = nil
			if value1.presence.isOnScreen and value1.pager == Pager then
				local Y: number = value1.pager.AbsolutePosition.Y
				local Y1: number = value1.pager.AbsoluteSize.Y
				
				if Y1 <= 0 then
					ClampedValue = 0
				else
					local Y2: number = value1.page.AbsolutePosition.Y
					ClampedValue = math.clamp((math.min(Y2 + value1.page.AbsoluteSize.Y, Y + Y1) - math.max(Y2, Y)) / Y1, 0, 1)
				end
			else
				ClampedValue = 0
			end
			value1.coverage = ClampedValue
			
			if value1 == Owner then
				Coverage1 = value1.coverage
			end
			if Coverage < value1.coverage then
				v4 = value1
				Coverage = value1.coverage
			end
		end
		local Owner1 = Owner
		
		if Owner1 == nil or Coverage1 <= 0 or Coverage1 + 0.1 < Coverage then
			Owner1 = v4
		end
		if Flag then
			Owner1 = nil
		end
		if Owner1 ~= Owner then
			local Owner2 = Owner
			Owner = Owner1
			
			if Owner1 == nil then
				releaseCamera()
			end
			if Owner2 ~= nil and Owner2.worldModel.Parent ~= nil then
				local Root = Owner2.scene.root
				Root:PivotTo(CFrame.identity)
				Root.Parent = Owner2.worldModel
			end
			if Owner1 ~= nil then
				if Owner2 == nil then
					local CurrentCamera1 = Workspace.CurrentCamera
					
					if CurrentCamera1 == nil then
						local AvatarMomentCamera = Instance.new("Camera")
						AvatarMomentCamera.Name = "AvatarMomentCamera"
						AvatarMomentCamera.Parent = Workspace
						Workspace.CurrentCamera = AvatarMomentCamera
						v2 = AvatarMomentCamera
						CurrentCamera1 = AvatarMomentCamera
					end
					v1 = CurrentCamera1
					Config = {
						instance = CurrentCamera1,
						cframe = CurrentCamera1.CFrame,
						focus = CurrentCamera1.Focus,
						fieldOfView = CurrentCamera1.FieldOfView,
						fieldOfViewMode = CurrentCamera1.FieldOfViewMode,
						cameraType = CurrentCamera1.CameraType
					}
					_CFrame1 = nil
				end
				local Root = Owner1.scene.root
				Root.Parent = Workspace
				Root:PivotTo(_CFrame)
			end
		end
		if Coverage <= 0 then
			Flag = false
		end
		local CurrentCamera2 = Workspace.CurrentCamera
		local Y = if CurrentCamera2 == nil then 0 else CurrentCamera2.ViewportSize.Y
		for _, value2 in List do
			local IsCoverageAbove = value2.coverage > 0
			
			if value2.viewportFrameVisible ~= IsCoverageAbove then
				value2.viewportFrameVisible = IsCoverageAbove
				value2.viewportFrame.Visible = IsCoverageAbove
			end
			if value2 ~= Owner and value2.coverage > 0 then
				updateViewportCamera(value2, Y)
			end
		end
		if Owner ~= nil then
			updateWorkspaceCamera(Owner, Y)
		end
		return Coverage > 0
	end
	
	local _ = function()
		-- upvalues: RenderSteppedConnection (ref)
		if RenderSteppedConnection ~= nil then
			RenderSteppedConnection:Disconnect()
			RenderSteppedConnection = nil
		end
	end
	
	local _ = function()
		-- upvalues: Tbl (copy)
		for _, Connection in Tbl do
			Connection:Disconnect()
		end
		table.clear(Tbl)
	end
	
	local Callback = nil
	
	local function watchForMovement()
		-- upvalues: RenderSteppedConnection (ref), Tbl (copy), List (copy), Callback (ref)
		if RenderSteppedConnection ~= nil then
			RenderSteppedConnection:Disconnect()
			RenderSteppedConnection = nil
		end
		for _, Connection in Tbl do
			Connection:Disconnect()
		end
		table.clear(Tbl)
		
		for _, value in List do
			if value.presence.isOnScreen then
				table.insert(Tbl, value.page:GetPropertyChangedSignal("AbsolutePosition"):Connect(Callback))
				table.insert(Tbl, value.page:GetPropertyChangedSignal("AbsoluteSize"):Connect(Callback))
				table.insert(Tbl, value.pager:GetPropertyChangedSignal("AbsoluteSize"):Connect(Callback))
			end
		end
	end
	
	local function onRenderStepped()
		-- upvalues: step (copy), watchForMovement (copy)
		if not step() then
			watchForMovement()
		end
	end
	
	Callback = function()
		-- upvalues: List (copy), step (copy), Tbl (copy), RenderSteppedConnection (ref), RunService (upval), onRenderStepped (copy), watchForMovement (copy), Flag (ref), Owner (ref), releaseCamera (copy)
		local Flag1 = false
		
		for _, value in List do
			if value.presence.isOnScreen then
				Flag1 = true
				break
			end
		end
		if Flag1 then
			if not step() then
				watchForMovement()
				
				return
			end
			for _, Connection in Tbl do
				Connection:Disconnect()
			end
			table.clear(Tbl)
			
			if RenderSteppedConnection == nil then
				RenderSteppedConnection = RunService.RenderStepped:Connect(onRenderStepped)
				
				return
			end
		else
			if RenderSteppedConnection ~= nil then
				RenderSteppedConnection:Disconnect()
				RenderSteppedConnection = nil
			end
			for _, Connection1 in Tbl do
				Connection1:Disconnect()
			end
			table.clear(Tbl)
			Flag = false
			
			if Owner ~= nil then
				local Owner1 = Owner
				Owner = nil
				releaseCamera()
				
				if Owner1 ~= nil and Owner1.worldModel.Parent ~= nil then
					local Root = Owner1.scene.root
					Root:PivotTo(CFrame.identity)
					Root.Parent = Owner1.worldModel
				end
			end
			for _, value1 in List do
				if value1.viewportFrameVisible ~= false then
					value1.viewportFrameVisible = false
					value1.viewportFrame.Visible = false
				end
			end
		end
	end
	
	local function updatePagerOrder(Pager)
		-- upvalues: t (copy), t1 (copy), Count (ref)
		local Count1 = 0
		
		for _, value in t do
			if value.pager == Pager and value.isOnScreen then
				Count1 += 1
			end
		end
		if Count1 == 0 then
			t1[Pager] = nil
			
			return
		end
		if t1[Pager] == nil then
			Count += 1
			t1[Pager] = Count
		end
	end
	
	local function retainPage(Page)
		-- upvalues: t (copy), ObserveGuiOnScreenModule (upval), updatePagerOrder (copy), Callback (ref)
		local Entry = t[Page]
		
		if Entry == nil then
			local ScrollingFrame = Page:FindFirstAncestorWhichIsA("ScrollingFrame")
			local config = {
				isOnScreen = false,
				refCount = 1,
				page = Page,
				pager = if ScrollingFrame == nil then Page else ScrollingFrame,
				disconnectOnScreen = function() end
			}
			t[Page] = config
			config.disconnectOnScreen = ObserveGuiOnScreenModule(Page, function(IsOnScreen)
				-- upvalues: config (copy), updatePagerOrder (upval), Callback (upval)
				config.isOnScreen = IsOnScreen
				updatePagerOrder(config.pager)
				Callback()
			end)
			
			return config
		else
			Entry.refCount += 1
			
			return Entry
		end
	end
	
	local _ = function(p1)
		-- upvalues: t (copy), updatePagerOrder (copy), Callback (ref)
		p1.refCount -= 1
		
		if p1.refCount <= 0 then
			p1.disconnectOnScreen()
			t[p1.page] = nil
			updatePagerOrder(p1.pager)
			Callback()
			
			return
		end
	end
	
	return {
		trackPage = function(Page)
			-- upvalues: retainPage (copy), t (copy), updatePagerOrder (copy), Callback (ref)
			local RetainPageResult = retainPage(Page)
			local Flag = true
			
			return function()
				-- upvalues: Flag (ref), RetainPageResult (copy), t (upval), updatePagerOrder (upval), Callback (upval)
				if Flag then
					Flag = false
					RetainPageResult.refCount -= 1
					
					if RetainPageResult.refCount > 0 then return end
					RetainPageResult.disconnectOnScreen()
					t[RetainPageResult.page] = nil
					updatePagerOrder(RetainPageResult.pager)
					Callback()
				end
			end
		end,
		register = function(p1)
			-- upvalues: retainPage (copy), List (copy), Callback (ref), Owner (ref), releaseCamera (copy), t (copy), updatePagerOrder (copy)
			local AvatarMomentViewportCamera = Instance.new("Camera")
			AvatarMomentViewportCamera.Name = "AvatarMomentViewportCamera"
			AvatarMomentViewportCamera.Parent = p1.viewportFrame
			p1.viewportFrame.CurrentCamera = AvatarMomentViewportCamera
			AvatarMomentViewportCamera.CFrame = p1.scene.camera.CFrame
			AvatarMomentViewportCamera.FieldOfView = p1.scene.camera.FieldOfView
			p1.scene.root.Parent = p1.worldModel
			local RetainPageResult = retainPage(p1.page)
			local config = {
				coverage = 0,
				viewportFrameVisible = nil,
				scene = p1.scene,
				page = p1.page,
				viewportFrame = p1.viewportFrame,
				worldModel = p1.worldModel,
				pager = RetainPageResult.pager,
				presence = RetainPageResult,
				viewportCamera = AvatarMomentViewportCamera
			}
			table.insert(List, config)
			Callback()
			local Flag = true
			
			return function()
				-- upvalues: Flag (ref), Owner (upval), config (copy), releaseCamera (upval), List (upval), AvatarMomentViewportCamera (copy), RetainPageResult (copy), t (upval), updatePagerOrder (upval), Callback (upval)
				if not Flag then return end
				Flag = false
				
				if Owner == config then
					Owner = nil
					releaseCamera()
				end
				local FoundIndex: number? = table.find(List, config)
				
				if FoundIndex ~= nil then
					table.remove(List, FoundIndex)
				end
				if config.viewportFrame.CurrentCamera == AvatarMomentViewportCamera then
					config.viewportFrame.CurrentCamera = nil
				end
				AvatarMomentViewportCamera:Destroy()
				RetainPageResult.refCount -= 1
				
				if RetainPageResult.refCount <= 0 then
					RetainPageResult.disconnectOnScreen()
					t[RetainPageResult.page] = nil
					updatePagerOrder(RetainPageResult.pager)
					Callback()
				end
				Callback()
			end
		end,
		getOwnerScene = function()
			-- upvalues: Owner (ref)
			return if Owner == nil then nil else Owner.scene
		end
	}
end