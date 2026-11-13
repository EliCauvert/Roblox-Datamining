local AmbientModule = require("./ambient")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local PreferredInputModule = require("./preferred_input")
local HostSelectionModule = require("./host_selection")
local config = { styled = true }
local config1 = {
	AbsoluteSize = { frame = true, poll = true },
	AbsolutePosition = { frame = true },
	AbsoluteContentSize = { frame = true },
	AbsoluteWindowSize = { frame = true, poll = true },
	AbsoluteCanvasSize = { frame = true },
	AbsoluteCellSize = { frame = true },
	AbsoluteCellCount = { frame = true },
	AbsoluteRotation = { frame = true },
	TextBounds = { frame = true, poll = true },
	TextFits = { frame = true }
}
local config2 = {
	PreferredInput = {
		key = "preferredInput",
		enum = "PreferredInput",
		read = function(p1)
			return p1.preferredInput
		end
	},
	TouchEnabled = {
		key = "touchEnabled",
		read = function(p1)
			return p1.touchEnabled
		end
	},
	MouseEnabled = {
		key = "mouseEnabled",
		read = function(p1)
			return p1.mouseEnabled
		end
	},
	GamepadEnabled = {
		key = "gamepadEnabled",
		read = function(p1)
			return p1.gamepadEnabled
		end
	},
	KeyboardEnabled = {
		key = "keyboardEnabled",
		read = function(p1)
			return p1.keyboardEnabled
		end
	},
	PreferredTextSize = {
		key = "preferredTextSize",
		enum = "PreferredTextSize",
		read = function(p1)
			return p1.preferredTextSize
		end
	},
	ViewportDisplaySize = {
		key = "displaySize",
		enum = "DisplaySize",
		read = function(p1)
			return p1.displaySize
		end
	}
}
local config3 = {
	viewportSize = true,
	viewingDistance = true,
	overscanInsets = true
}

for _, value in config2 do
	config3[value.key] = true
end
local function validatePreview(Enabled)
	-- upvalues: config3 (copy)
	if Enabled == nil or Enabled == false then return end
	assert(type(Enabled) == "table", "Facet.controls: environment must be a table")
	
	for i in Enabled do
		assert(type(i) == "string" and config3[i], `Facet.controls: unknown environment option '{tostring(i)}'`)
	end
end

return function(p1, p2, p3)
	-- upvalues: AmbientModule (copy), validatePreview (copy), config2 (copy), config1 (copy), PreferredInputModule (copy), HostSelectionModule (copy), config (copy)
	local Compose = p1.Compose
	local Runtime = p1.runtime
	local TypesEnum = p1.types.Enum
	local HasAmbientModuleResult: boolean = p3.RunService ~= nil and AmbientModule() ~= nil
	local t = {}
	local Environment = p2.environment or {}
	validatePreview(p2.environment)
	
	local function previewed(Key, ObserveResult)
		-- upvalues: config2 (upval), Environment (copy), Compose (copy), p1 (copy), TypesEnum (copy)
		local Entry = config2[Key]
		local ReadResult = if Entry then Entry.read(Environment) else nil
		
		if ReadResult == nil then
			return ObserveResult
		else
			local EntryEnum = Entry.enum
			
			return Compose.formula(function(Callback)
				-- upvalues: p1 (upval), ReadResult (copy), ObserveResult (copy), EntryEnum (copy), TypesEnum (upval), Entry (copy)
				local ReadResult1 = p1.read(ReadResult, Callback)
				
				return if ReadResult1 == nil then Callback(ObserveResult) elseif EntryEnum and type(ReadResult1) == "string" then assert(if EntryEnum == "PreferredInput" then TypesEnum.PreferredInput:FromName(ReadResult1) elseif EntryEnum == "PreferredTextSize" then TypesEnum.PreferredTextSize:FromName(ReadResult1) else TypesEnum.DisplaySize:FromName(ReadResult1), `Facet.controls: environment {Entry.key} '{ReadResult1}' is not a {EntryEnum}`) else ReadResult1
			end)
		end
	end
	
	local function observe(GuiService, Key)
		-- upvalues: p2 (copy), previewed (copy), Runtime (copy), HasAmbientModuleResult (copy), config1 (upval), t (copy), Compose (copy), p1 (copy), TypesEnum (copy), PreferredInputModule (upval)
		local IsSelectedObject = Key == "SelectedObject"
		local IsGuiServiceMatch: boolean = IsSelectedObject and GuiService == p2.guiService
		local IsGuiServiceMatch1: boolean = Key == "PreferredInput" and GuiService == p2.userInputService
		
		if not IsSelectedObject and not IsGuiServiceMatch1 then
			return previewed(Key, Runtime.observe(GuiService, Key, if HasAmbientModuleResult then config1[Key] else nil))
		end
		local UserInputService = if IsGuiServiceMatch1 then p2.userInputService else nil
		local Entry = t[GuiService]
		
		if Entry == nil then
			Entry = {}
			t[GuiService] = Entry
		end
		local Entry1 = Entry[Key]
		
		if not Entry1 then
			Entry1 = Compose.createSharedResource(function()
				-- upvalues: Compose (upval), Runtime (upval), IsSelectedObject (copy), GuiService (copy), Key (copy), IsGuiServiceMatch (copy), p1 (upval), p2 (upval), TypesEnum (upval), IsGuiServiceMatch1 (copy), UserInputService (copy), PreferredInputModule (upval), Entry (ref), t (upval)
				local v1 = nil
				
				return assert(v1), Compose.createRootOwner(function()
					-- upvalues: Runtime (upval), IsSelectedObject (upval), GuiService (upval), Key (upval), IsGuiServiceMatch (upval), p1 (upval), Compose (upval), p2 (upval), TypesEnum (upval), IsGuiServiceMatch1 (upval), UserInputService (upval), PreferredInputModule (upval), Entry (upval), t (upval), v1 (ref)
					local v2 = assert(Runtime.host.observation)
					local ObserveResult = if IsSelectedObject then nil else Runtime.observe(GuiService, Key)
					
					local function _()
						-- upvalues: IsGuiServiceMatch (upval), p1 (upval), v2 (copy), GuiService (upval), Key (upval)
						return if IsGuiServiceMatch then p1.selection.get() else v2.readProperty(GuiService, Key)
					end
					
					local PeekResult = if ObserveResult then ObserveResult:peek() elseif IsGuiServiceMatch then p1.selection.get() else v2.readProperty(GuiService, Key)
					local CellResult = Compose.cell(PeekResult)
					local Callback: (() -> ())? = nil
					
					local function clearNudges()
						-- upvalues: Callback (ref)
						if Callback then
							Callback()
							Callback = nil
						end
					end
					
					local _ = nil
					
					local function v41(PeekResult, Enabled)
						-- upvalues: p2 (upval), IsSelectedObject (upval), TypesEnum (upval), p1 (upval), IsGuiServiceMatch1 (upval), UserInputService (upval), PreferredInputModule (upval), Callback (ref), v41 (ref), ObserveResult (copy), CellResult (copy)
						local UserInputService1 = p2.userInputService
						local GuiService = p2.guiService
						
						if IsSelectedObject and GuiService and UserInputService1 and UserInputService1.PreferredInput == TypesEnum.PreferredInput.Touch and PeekResult ~= nil then
							p1.selection.set(nil)
							PeekResult = nil
						elseif IsGuiServiceMatch1 and GuiService and PeekResult == TypesEnum.PreferredInput.Touch and p1.selection.get() ~= nil then
							p1.selection.set(nil)
						end
						if UserInputService and PreferredInputModule.withheld(UserInputService, PeekResult, TypesEnum.PreferredInput.KeyboardAndMouse) then
							Callback = Callback or PreferredInputModule.nudges(UserInputService, TypesEnum, function()
								-- upvalues: v41 (upval), ObserveResult (upval)
								v41(assert(ObserveResult):peek())
							end)
							
							return
						end
						if Callback then
							Callback()
							Callback = nil
						end
						CellResult:set(PeekResult)
						
						if IsSelectedObject and Enabled ~= false then
							for _, selectionHook in p1.selectionHooks do
								selectionHook(PeekResult)
							end
						end
					end
					
					if IsSelectedObject then
						local function refresh()
							-- upvalues: v41 (ref), IsGuiServiceMatch (upval), p1 (upval), v2 (copy), GuiService (upval), Key (upval)
							v41(if IsGuiServiceMatch then p1.selection.get() else v2.readProperty(GuiService, Key))
						end
						
						Compose.cleanup(if IsGuiServiceMatch then p1.selection.changed(refresh) else v2.observeProperty(GuiService, Key, refresh))
						v41(PeekResult, false)
					else
						Compose.watch(function(Callback)
							-- upvalues: v41 (ref), ObserveResult (copy)
							v41(Callback(assert(ObserveResult)))
						end)
					end
					Compose.cleanup(clearNudges)
					Compose.cleanup(function()
						-- upvalues: Entry (upval), Key (upval), t (upval), GuiService (upval)
						Entry[Key] = nil
						
						if next(Entry) == nil then
							t[GuiService] = nil
						end
					end)
					v1 = CellResult
				end, Runtime.reactor).dispose
			end)
			Entry[Key] = Entry1
		end
		return previewed(Key, assert(Entry1)())
	end
	
	local function observers(Callback)
		local t = {}
		setmetatable(t, {
			__index = function(_, Key)
				-- upvalues: Callback (copy), t (copy)
				local function v46(p4)
					-- upvalues: Callback (upval), Key (copy)
					return Callback(p4, Key)
				end
				
				t[Key] = v46
				
				return v46
			end
		})
		
		return t
	end
	
	p1.selectionHooks = {}
	p1.observe = observers(observe)
	local t1 = {}
	local OnFrameResult = nil
	
	local function flush()
		-- upvalues: t1 (ref), OnFrameResult (ref)
		local t = t1
		t1 = {}
		local Callback: () -> () = OnFrameResult
		OnFrameResult = nil
		
		if Callback then
			Callback()
		end
		for i in t do
			i()
		end
	end
	
	function p1.afterLayout(Callback)
		-- upvalues: Runtime (copy), HasAmbientModuleResult (copy), Compose (copy), t1 (ref), OnFrameResult (ref), flush (copy)
		local Frames = Runtime.host.frames
		
		if HasAmbientModuleResult and Frames ~= nil then
			local Flag = true
			
			local function run()
				-- upvalues: Flag (ref), Callback (copy)
				if Flag then
					Callback()
				end
			end
			
			Compose.cleanup(function()
				-- upvalues: Flag (ref), t1 (upval), run (copy)
				Flag = false
				t1[run] = nil
			end)
			
			return function()
				-- upvalues: Flag (ref), t1 (upval), run (copy), OnFrameResult (upval), Frames (copy), flush (upval)
				if not Flag or t1[run] then return end
				t1[run] = true
				
				if OnFrameResult == nil then
					OnFrameResult = Frames.onFrame(flush)
				end
			end
		else
			return Callback
		end
	end
	
	p1.selection = HostSelectionModule(p1, function(p4)
		-- upvalues: p1 (copy)
		return p1.observe.SelectedObject(p4)
	end)
	
	local function observeStyled(p4, p5)
		-- upvalues: Runtime (copy), config (upval)
		return Runtime.observe(p4, p5, config)
	end
	
	p1.observeStyled = observers(observeStyled)
	
	return { preview = Environment, observeStyled = observeStyled }
end