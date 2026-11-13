local CoreModule = require("../core")
local _ = require("../design")
local _ = require("./devices")
local _ = require("./ui")
local StageModule = require("./stage")
local Stage3dModule = require("./stage3d")
local ProjectionModule = require("./projection")
local _ = require("./render-preview")

return function(p1, p2, p3, p4)
	-- upvalues: CoreModule (copy), ProjectionModule (copy), Stage3dModule (copy), StageModule (copy)
	local v1 = require("./theme")(p1)
	local DesignDevices = v1.scroller("DesignDevices")
	p1.set(DesignDevices, "BackgroundTransparency", if p4.scene then 1 else 0)
	p1.set(DesignDevices, "BackgroundColor3", v1.color.canvas)
	v1.place(DesignDevices, p3, p1.values.udim2(1, 0, 1, 0))
	local UIGridLayout = p1.new("UIGridLayout")
	p1.set(UIGridLayout, "CellPadding", p1.values.udim2(0, 16, 0, 16))
	p1.set(UIGridLayout, "SortOrder", p1.values.enum("SortOrder", "LayoutOrder"))
	local DesignCanvasHasNoFrames = {}
	local List = {}
	local List1 = {}
	local CellResult = CoreModule.cell(1)
	local FormulaResult = CoreModule.formula(function(Callback)
		-- upvalues: p4 (copy), CellResult (copy)
		return assert(p4.devices[Callback(CellResult)])
	end)
	local CellResult1 = CoreModule.cell(0)
	local CellResult2 = CoreModule.cell(false)
	local CellResult3 = CoreModule.cell(1)
	
	local function AfterResult(): boolean
		return false
	end
	
	local function current()
		-- upvalues: DesignCanvasHasNoFrames (copy), CellResult (copy)
		return assert(DesignCanvasHasNoFrames[CellResult:peek()], "Design canvas has no frame")
	end
	
	local function fit()
		-- upvalues: DesignCanvasHasNoFrames (copy), CellResult2 (copy), CellResult (copy)
		for _, designCanvasHasNoFrame in DesignCanvasHasNoFrames do
			if CellResult2:peek() or designCanvasHasNoFrame == assert(DesignCanvasHasNoFrames[CellResult:peek()], "Design canvas has no frame") then
				local Stage = designCanvasHasNoFrame.stage or designCanvasHasNoFrame.scene
				designCanvasHasNoFrame.actualSize:set(false)
				assert(Stage).fit()
			end
		end
	end
	
	local function layout()
		-- upvalues: p1 (copy), DesignDevices (copy), p4 (copy), UIGridLayout (copy), CellResult2 (copy), DesignCanvasHasNoFrames (copy), CellResult (copy), AfterResult (ref)
		local AbsoluteSize = p1.xy(DesignDevices, "AbsoluteSize")
		local ClampedValue = math.clamp(math.floor(AbsoluteSize.X / 280), 1, 4)
		local Largest = math.max(240, (AbsoluteSize.X - (ClampedValue - 1) * 16 - 8) / ClampedValue)
		local Ceiled = math.ceil(#p4.devices / ClampedValue)
		local NewLargest: number = if ClampedValue == 1 then Largest * 0.8 + 56 else math.max(160, (math.min(Largest * 0.8 + 56, (AbsoluteSize.Y - (Ceiled - 1) * 16) / Ceiled)))
		p1.set(UIGridLayout, "FillDirectionMaxCells", ClampedValue)
		p1.set(UIGridLayout, "CellSize", p1.values.udim2(0, Largest, 0, NewLargest))
		p1.set(UIGridLayout, "Parent", if CellResult2:peek() then DesignDevices else nil)
		p1.set(DesignDevices, "AutomaticCanvasSize", p1.values.enum("AutomaticSize", if CellResult2:peek() then "Y" else "None"))
		
		for i, designCanvasHasNoFrame in DesignCanvasHasNoFrames do
			p1.set(designCanvasHasNoFrame.root, "Visible", CellResult2:peek() or i == CellResult:peek())
			p1.set(designCanvasHasNoFrame.root, "Size", p1.values.udim2(1, 0, 1, 0))
			p1.set(designCanvasHasNoFrame.root, "Position", p1.values.udim2(0, 0, 0, 0))
		end
		AfterResult()
		AfterResult = p1.runtime.scheduler(p1.owner).after(0, function()
			-- upvalues: DesignCanvasHasNoFrames (upval), CellResult2 (upval), CellResult (upval)
			for _, designCanvasHasNoFrame in DesignCanvasHasNoFrames do
				if designCanvasHasNoFrame.scene then
					designCanvasHasNoFrame.scene.reframe()
				elseif CellResult2:peek() or designCanvasHasNoFrame == assert(DesignCanvasHasNoFrames[CellResult:peek()], "Design canvas has no frame") then
					local v2 = assert(designCanvasHasNoFrame.stage)
					
					if designCanvasHasNoFrame.actualSize:peek() then
						v2.zoomTo(1)
					else
						v2.fit()
					end
				end
			end
		end)
	end
	
	local function ensure(Key)
		-- upvalues: DesignCanvasHasNoFrames (copy), p4 (copy), CoreModule (upval), List (copy), p1 (copy), v1 (copy), DesignDevices (copy), ProjectionModule (upval), p2 (copy), Stage3dModule (upval), StageModule (upval), CellResult1 (copy), List1 (copy), CellResult (copy)
		local DesignCanvasHasNoFrame = DesignCanvasHasNoFrames[Key]
		
		if DesignCanvasHasNoFrame then
			return DesignCanvasHasNoFrame
		end
		local MissingDesignDevice = assert(p4.devices[Key], "Missing Design device")
		local v2: number = if MissingDesignDevice.id == "Canvas" or MissingDesignDevice.id == "Scene" then 0 else 56
		local CellResult2 = CoreModule.cell(1)
		local FrameResult = if p4.frame then p4.frame(MissingDesignDevice, CellResult2) else p4
		
		if p4.frame and FrameResult.dispose then
			table.insert(List, CoreModule.owner.own(p1.owner, FrameResult.dispose))
		end
		local FrameResult1 = v1.frame(MissingDesignDevice.id, v1.color.canvas)
		
		if p4.scene then
			p1.set(FrameResult1, "BackgroundTransparency", 1)
		end
		p1.set(FrameResult1, "LayoutOrder", Key)
		p1.set(FrameResult1, "ClipsDescendants", true)
		p1.set(FrameResult1, "Parent", DesignDevices)
		local LabelResult = v1.label(MissingDesignDevice.name, v1.color.text, v1.size.text, v1.font.bold)
		p1.set(LabelResult, "Name", "DeviceName")
		p1.set(LabelResult, "Visible", v2 > 0)
		v1.place(LabelResult, FrameResult1, p1.values.udim2(1, -24, 0, 24), p1.values.udim2(0, 12, 0, 4))
		local LabelResult1 = v1.label(`{MissingDesignDevice.size.X} × {MissingDesignDevice.size.Y} · {MissingDesignDevice.inputMode} · Text {MissingDesignDevice.textScale}`, v1.color.secondary, v1.size.small)
		p1.set(LabelResult1, "Name", "DeviceFacts")
		p1.set(LabelResult1, "Visible", v2 > 0)
		v1.place(LabelResult1, FrameResult1, p1.values.udim2(1, -24, 0, 24), p1.values.udim2(0, 12, 0, 28))
		local DeviceCanvas = v1.frame("DeviceCanvas")
		v1.place(DeviceCanvas, FrameResult1, p1.values.udim2(1, 0, 1, -v2), p1.values.udim2(0, 0, 0, v2))
		local ProjectionModuleResult = ProjectionModule(p1, FrameResult.library or p2.library, MissingDesignDevice)
		local Copy = table.clone(FrameResult.slots or (p4.slots or {}))
		local SlotSamples = FrameResult.slotSamples or (p4.slotSamples or {})
		for i, slotSample in SlotSamples do
			if Copy[i] == nil then
				Copy[i] = function()
					-- upvalues: slotSample (copy), ProjectionModuleResult (copy), MissingDesignDevice (copy)
					return slotSample(ProjectionModuleResult, MissingDesignDevice)
				end
			end
		end
		local config = {
			device = MissingDesignDevice,
			root = FrameResult1,
			scale = CellResult2,
			actualSize = CoreModule.cell(false)
		}
		
		if ProjectionModuleResult.space == "3d" then
			config.scene = Stage3dModule(p1)(p2, DeviceCanvas, {
				renderPreview = FrameResult.renderPreview or p4.renderPreview,
				target = p4.scene,
				readOnly = p4.readOnly,
				library = ProjectionModuleResult,
				bindings = FrameResult.bindings or p4.bindings,
				outputs = FrameResult.outputs or p4.outputs,
				token = FrameResult.token or p4.token,
				resolveToken = FrameResult.resolveToken or p4.resolveToken,
				slots = Copy
			})
		else
			config.stage = StageModule(p1)(p2, DeviceCanvas, {
				renderPreview = FrameResult.renderPreview or p4.renderPreview,
				readOnly = p4.readOnly,
				library = ProjectionModuleResult,
				size = {
					X = MissingDesignDevice.size.X,
					Y = MissingDesignDevice.size.Y
				},
				backdrop = FrameResult.backdrop or p4.backdrop,
				compact = #p4.devices > 1,
				bindings = FrameResult.bindings or p4.bindings,
				outputs = FrameResult.outputs or p4.outputs,
				token = FrameResult.token or p4.token,
				resolveToken = FrameResult.resolveToken or p4.resolveToken,
				slots = Copy
			})
		end
		DesignCanvasHasNoFrames[Key] = config
		CellResult1:update(function(p5: number): number
			return p5 + 1
		end)
		table.insert(List1, p1.connect(if config.stage then config.stage.overlay else assert(config.scene).viewport, "InputBegan", function()
			-- upvalues: CellResult (upval), Key (copy)
			CellResult:set(Key)
		end))
		
		return config
	end
	
	local v3 = 1
	
	for i, device in p4.devices do
		if device.id == p4.device or device.name == p4.device then
			v3 = i
		end
	end
	ensure(v3)
	CellResult:set(v3)
	local OwnResult = CoreModule.owner.own(p1.owner, CoreModule.createRootOwner(function()
		-- upvalues: CoreModule (upval), CellResult1 (copy), CellResult (copy), DesignCanvasHasNoFrames (copy), CellResult3 (copy)
		CoreModule.watch(function(Callback)
			-- upvalues: CellResult1 (upval), CellResult (upval), DesignCanvasHasNoFrames (upval), CellResult3 (upval)
			Callback(CellResult1)
			local CallbackResult = Callback(CellResult)
			
			for i, designCanvasHasNoFrame in DesignCanvasHasNoFrames do
				local CallbackResult1 = Callback(assert(designCanvasHasNoFrame.stage or designCanvasHasNoFrame.scene).zoom)
				
				if CallbackResult1 ~= 1 then
					designCanvasHasNoFrame.actualSize:set(false)
				end
				if designCanvasHasNoFrame.stage then
					designCanvasHasNoFrame.scale:set(CallbackResult1)
				end
				if i == CallbackResult then
					CellResult3:set(CallbackResult1)
				end
			end
		end)
	end, p1.runtime.reactor).dispose)
	table.insert(List1, p1.changed(DesignDevices, "AbsoluteSize", layout))
	layout()
	
	return {
		root = DesignDevices,
		zoom = CellResult3,
		all = CellResult2,
		device = FormulaResult,
		current = current,
		frames = function()
			-- upvalues: p4 (copy), DesignCanvasHasNoFrames (copy)
			local List = {}
			
			for device in p4.devices do
				if DesignCanvasHasNoFrames[device] then
					table.insert(List, DesignCanvasHasNoFrames[device])
				end
			end
			return List
		end,
		select = function(Id)
			-- upvalues: p4 (copy), ensure (copy), CellResult (copy), layout (copy)
			local Flag = false
			
			for i, device in p4.devices do
				if device.id == Id or device.name == Id then
					ensure(i)
					CellResult:set(i)
					Flag = true
					break
				end
			end
			assert(Flag, "Unknown Design frame: " .. Id)
			layout()
		end,
		showAll = function(p5)
			-- upvalues: CellResult2 (copy), p2 (copy), p4 (copy), ensure (copy), layout (copy)
			CellResult2:set(p5 and p2.library.space ~= "3d")
			
			if CellResult2:peek() then
				for device in p4.devices do
					ensure(device)
				end
			end
			layout()
		end,
		fit = fit,
		zoomTo = function(p6, p7)
			-- upvalues: DesignCanvasHasNoFrames (copy), CellResult (copy)
			assert(assert(DesignCanvasHasNoFrames[CellResult:peek()], "Design canvas has no frame").stage or assert(DesignCanvasHasNoFrames[CellResult:peek()], "Design canvas has no frame").scene).zoomTo(p6, p7)
			assert(DesignCanvasHasNoFrames[CellResult:peek()], "Design canvas has no frame").actualSize:set(false)
		end,
		actualSize = function(p6)
			-- upvalues: DesignCanvasHasNoFrames (copy), CellResult (copy)
			local DesignCanvasHasNoFrame = assert(DesignCanvasHasNoFrames[CellResult:peek()], "Design canvas has no frame")
			local ActualSizeRequiresAUIDesign = assert(DesignCanvasHasNoFrame.stage, "ActualSize requires a UI Design")
			
			if p6 then
				ActualSizeRequiresAUIDesign.zoomTo(1)
			else
				ActualSizeRequiresAUIDesign.fit()
			end
			DesignCanvasHasNoFrame.actualSize:set(p6)
		end,
		dispose = function()
			-- upvalues: AfterResult (ref), OwnResult (copy), List1 (copy), DesignCanvasHasNoFrames (copy), List (copy), p1 (copy), DesignDevices (copy), UIGridLayout (copy)
			AfterResult()
			OwnResult()
			
			for _, Connection in List1 do
				Connection:Disconnect()
			end
			for _, designCanvasHasNoFrame in DesignCanvasHasNoFrames do
				assert(designCanvasHasNoFrame.stage or designCanvasHasNoFrame.scene).dispose()
			end
			for _, value in List do
				value()
			end
			p1.destroy(DesignDevices)
			p1.destroy(UIGridLayout)
		end
	}
end