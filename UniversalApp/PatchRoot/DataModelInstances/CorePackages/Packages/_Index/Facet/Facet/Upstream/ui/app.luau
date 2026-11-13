local AmbientModule = require("./ambient")
local _ = require("../vendor/compose/core")
local _ = require("./types")
local _ = require("./control_types")
local _ = require("./theme_types")
local _ = require("./engine_types")
local _ = require("./overlay_types")
local FreezeModule = require("./freeze")
local _ = require("./overlay_props")
local SpecimenModule = require("./specimen")

local function _(): boolean
	-- upvalues: AmbientModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: AmbientModule (upval)
		local RunService = assert(AmbientModule()):GetService("RunService")
		
		return RunService:IsRunning() and RunService:IsClient()
	end)
	
	return Success and Result == true
end

local _ = function()
	-- upvalues: AmbientModule (copy)
	local AmbientModuleResult = AmbientModule()
	local Players = AmbientModuleResult and AmbientModuleResult:GetService("Players")
	local LocalPlayer = Players and Players.LocalPlayer
	
	if LocalPlayer == nil then
		error("Facet app.mount: there is no PlayerGui here. Give a parent to Facet.app or to app.mount.", 3)
	end
	return LocalPlayer:WaitForChild("PlayerGui")
end

return function(p1, p2, Callback, p3, p4)
	-- upvalues: AmbientModule (copy), FreezeModule (copy), SpecimenModule (copy)
	local Tbl = p4 or {}
	local NoRuntime = Tbl.runtime == nil
	local Runtime = Tbl.runtime or p2.createRuntime()
	local BuildMode = {}
	local StrictBuild = nil
	
	if Tbl.strictBuild == nil then
		local Success, Result = pcall(function()
			-- upvalues: AmbientModule (upval)
			local RunService = assert(AmbientModule()):GetService("RunService")
			
			return RunService:IsRunning() and RunService:IsClient()
		end)
		
		if Success then
			Success = Result == true
		end
		StrictBuild = not Success
	else
		StrictBuild = Tbl.strictBuild
	end
	BuildMode.strict = StrictBuild
	local Copy = table.clone(Tbl)
	Copy.buildMode = BuildMode
	local CallbackResult = Callback(p1, Runtime, Copy)
	local Constructors = Runtime.constructors
	local Constructors1 = Runtime.constructors
	local List = {}
	local Flag = false
	
	local function mount(Callback, Parent)
		-- upvalues: Flag (ref), Tbl (copy), AmbientModule (upval), Runtime (copy), CallbackResult (copy), p3 (copy), Constructors1 (copy), p1 (copy), Constructors (copy), List (copy)
		assert(not Flag, "Facet app.mount: the app is disposed")
		assert(type(Callback) == "function", "Facet app.mount: expected a component function")
		local Parent1 = Parent
		
		if not Parent1 then
			Parent1 = Tbl.parent
			
			if not Parent1 then
				local AmbientModuleResult = AmbientModule()
				local Players = AmbientModuleResult and AmbientModuleResult:GetService("Players")
				local LocalPlayer = Players and Players.LocalPlayer
				
				if LocalPlayer == nil then
					error("Facet app.mount: there is no PlayerGui here. Give a parent to Facet.app or to app.mount.", 3)
				end
				Parent1 = LocalPlayer:WaitForChild("PlayerGui")
			end
		end
		local v1 = nil
		local MountResult = Runtime.mount(function()
			-- upvalues: Tbl (upval), CallbackResult (upval), p3 (upval), Runtime (upval), Constructors1 (upval), p1 (upval), Callback (copy), Parent1 (copy), Constructors (upval), v1 (ref)
			local Copy = table.clone(Tbl.sheet or {})
			
			if Copy.types == nil then
				Copy.types = Tbl.types
			end
			if Copy.motionLevel == nil then
				Copy.motionLevel = Tbl.motionLevel
			end
			if Copy.tenFoot == nil then
				Copy.tenFoot = CallbackResult.environment().isTenFoot
			end
			local StyleSheet = p3.createStyleSheet(Runtime, Tbl.theme, Copy)
			local ScreenGui = {}
			local Screen = Tbl.screen or {}
			for i, value in Screen do
				assert(type(i) == "string", "Facet app: screen takes native ScreenGui properties only")
				ScreenGui[i] = value
			end
			ScreenGui.Name = ScreenGui.Name or (Tbl.name or "Facet")
			local TypesEnum = if Tbl.types then Tbl.types.Enum else Enum
			
			if ScreenGui.ScreenInsets == nil and ScreenGui.IgnoreGuiInset == nil then
				ScreenGui.ScreenInsets = TypesEnum.ScreenInsets.CoreUISafeInsets
			end
			if ScreenGui.SafeAreaCompatibility == nil then
				ScreenGui.SafeAreaCompatibility = TypesEnum.SafeAreaCompatibility.None
			end
			if ScreenGui.ResetOnSpawn == nil then
				ScreenGui.ResetOnSpawn = false
			end
			if ScreenGui.ZIndexBehavior == nil then
				ScreenGui.ZIndexBehavior = (if Tbl.types then Tbl.types.Enum else Enum).ZIndexBehavior.Sibling
			end
			ScreenGui[1] = StyleSheet
			ScreenGui[2] = Constructors1.StyleLink({ StyleSheet = p1.static(StyleSheet) })
			ScreenGui[3] = CallbackResult.provide(Callback)
			
			if Parent1:IsA("PlayerGui") and Tbl.focusRing ~= false then
				ScreenGui[4] = CallbackResult.focusRing(Parent1)
			end
			local ScreenGuiResult = Constructors.ScreenGui(ScreenGui)
			v1 = ScreenGuiResult
			
			return ScreenGuiResult
		end, Parent1)
		local Flag1 = false
		
		local function release()
			-- upvalues: Flag1 (ref), List (upval), release (copy), MountResult (copy)
			if not Flag1 then
				Flag1 = true
				local FoundIndex: number? = table.find(List, release)
				
				if FoundIndex then
					table.remove(List, FoundIndex)
				end
				MountResult()
			end
		end
		
		table.insert(List, release)
		
		return release, assert(v1)
	end
	
	local Count = 0
	local v2 = nil
	
	return FreezeModule({
		runtime = Runtime,
		UI = CallbackResult,
		mount = mount,
		specimen = function(p5)
			-- upvalues: mount (copy), SpecimenModule (upval), CallbackResult (copy), p1 (copy)
			return mount(function()
				-- upvalues: SpecimenModule (upval), CallbackResult (upval), p1 (upval)
				return SpecimenModule(CallbackResult, p1)
			end, p5)
		end,
		refusal = function(p5, p6): string?
			-- upvalues: Flag (ref), CallbackResult (copy), BuildMode (copy), p1 (copy), Constructors (copy)
			assert(not Flag, "Facet app.refusal: the app is disposed")
			local CallbackResultEntry = CallbackResult[p5]
			
			if CallbackResultEntry == nil then
				error(`Facet app.refusal: there is no control named '{tostring(p5)}'`, 2)
			end
			local Strict = BuildMode.strict
			BuildMode.strict = true
			local Success, Result = pcall(function()
				-- upvalues: p1 (upval), Constructors (upval), CallbackResultEntry (copy), p6 (copy)
				p1.withRootOwner(function()
					-- upvalues: Constructors (upval), CallbackResultEntry (upval), p6 (upval)
					Constructors.ScreenGui({ CallbackResultEntry(p6) })
				end)
			end)
			BuildMode.strict = Strict
			
			if Success then
				return nil
			else
				local Text = tostring(Result)
				
				return string.match(Text, "^[^\n]-:%d+: (.*)$") or Text
			end
		end,
		construct = function(Text: string, p5)
			-- upvalues: Flag (ref), CallbackResult (copy)
			assert(not Flag, "Facet app.construct: the app is disposed")
			local CallbackResultEntry = if type(Text) == "string" and string.match(Text, "^%u") ~= nil then CallbackResult[Text] else nil
			
			if type(CallbackResultEntry) ~= "function" then
				error(`Facet app.construct: there is no control named '{tostring(Text)}'`, 2)
			end
			return CallbackResultEntry(p5)
		end,
		controlNames = function()
			-- upvalues: CallbackResult (copy)
			local List = {}
			
			for i in CallbackResult do
				table.insert(List, i)
			end
			table.sort(List)
			
			return List
		end,
		prewarm = function(Tbl)
			-- upvalues: Flag (ref), CallbackResult (copy), Runtime (copy), List (copy)
			assert(not Flag, "Facet app.prewarm: the app is disposed")
			assert(type(Tbl) == "table", "Facet app.prewarm: expected a list of control names")
			local Copy = table.clone(Tbl)
			local Count = 0
			local OnFrameResult = nil
			
			local function cancel()
				-- upvalues: OnFrameResult (ref)
				local Callback: () -> () = OnFrameResult
				OnFrameResult = nil
				
				if Callback then
					Callback()
				end
			end
			
			local function step()
				-- upvalues: Count (ref), Copy (copy), Flag (upval), OnFrameResult (ref), CallbackResult (upval)
				Count += 1
				local Entry = Copy[Count]
				
				if Entry ~= nil and not Flag then
					local _ = CallbackResult[Entry]
					
					return
				end
				local Callback: () -> () = OnFrameResult
				OnFrameResult = nil
				
				if Callback then
					Callback()
				end
			end
			
			local Frames = Runtime.host.frames
			
			if Frames then
				OnFrameResult = Frames.onFrame(step)
				table.insert(List, cancel)
			else
				for _ in Copy do
					Count += 1
					local Entry = Copy[Count]
					
					if Entry == nil or Flag then
						local Callback: () -> () = OnFrameResult
						OnFrameResult = nil
						
						if Callback then
							Callback()
						end
					else
						local _ = CallbackResult[Entry]
					end
				end
			end
			return cancel
		end,
		presentAnchored = function(Callback, List)
			-- upvalues: p1 (copy), CallbackResult (copy), mount (copy)
			assert(type(Callback) == "function", "Facet app.presentAnchored: expected a component function")
			local v3: boolean = type(List) == "table" and List.source ~= nil
			assert(v3, "Facet app.presentAnchored: options.source is required")
			local CellResult = p1.cell(true)
			
			v3 = function() end
			
			local Flag = false
			local Anchored = {}
			
			for i, value in List do
				Anchored[i] = value
			end
			Anchored.compact = "popover"
			Anchored.isPresented = CellResult
			
			function Anchored.onPresentedChange(p5)
				-- upvalues: CellResult (copy)
				CellResult:set(p5)
			end
			
			function Anchored.onDismiss(p5)
				-- upvalues: List (copy), Flag (ref), v3 (ref)
				if List.onDismiss then
					List.onDismiss(p5)
				end
				if not Flag then
					Flag = true
					v3()
				end
			end
			
			function Anchored.content()
				-- upvalues: Callback (copy), CallbackResult (upval)
				return Callback(CallbackResult)
			end
			
			Anchored.Name = "Anchored"
			local MountResult, MountResult2 = mount(function()
				-- upvalues: CallbackResult (upval), Anchored (copy)
				return CallbackResult.Popover(Anchored)
			end)
			v3 = MountResult
			
			return function()
				-- upvalues: Flag (ref), MountResult (copy)
				if not Flag then
					Flag = true
					MountResult()
				end
			end, MountResult2
		end,
		presentToast = function(Callback, p5)
			-- upvalues: CallbackResult (copy), Count (ref), v2 (ref), mount (copy), Constructors (copy), Tbl (copy), Runtime (copy), FreezeModule (upval)
			assert(type(Callback) == "function", "Facet app.presentToast: expected a component function")
			local t = {}
			local P11 = p5 or {}
			for i, value in P11 do
				t[i] = value
			end
			local function MountFragmentResult() end
			
			local Flag = true
			
			local function _()
				-- upvalues: Flag (ref), MountFragmentResult (ref)
				if Flag then
					Flag = false
					MountFragmentResult()
				end
			end
			
			function t.onDismiss(p6)
				-- upvalues: p5 (copy), Flag (ref), MountFragmentResult (ref)
				if p5 and p5.onDismiss then
					p5.onDismiss(p6)
				end
				if Flag then
					Flag = false
					MountFragmentResult()
				end
			end
			
			function t.content()
				-- upvalues: Callback (copy), CallbackResult (upval)
				return Callback(CallbackResult)
			end
			
			Count += 1
			local Id: number = Count
			
			if v2 == nil or v2.Parent == nil then
				local _, MountResult2 = mount(function()
					-- upvalues: Constructors (upval)
					return Constructors.Folder({ Name = "Toasts" })
				end)
				MountResult2.Name = (Tbl.name or "Facet") .. "Toasts"
				v2 = MountResult2
			end
			MountFragmentResult = Runtime.mountFragment(function()
				-- upvalues: t (copy), Id (copy), CallbackResult (upval)
				t.Name = `Toast{Id}`
				
				return CallbackResult.provide(function()
					-- upvalues: CallbackResult (upval), t (upval)
					return { CallbackResult.Toast(t) }
				end)
			end, assert(v2))
			
			if not Flag then
				MountFragmentResult()
			end
			return FreezeModule({
				id = Id,
				dismiss = function(): boolean
					-- upvalues: Flag (ref), MountFragmentResult (ref)
					local Flag1: boolean = Flag
					
					if Flag then
						Flag = false
						MountFragmentResult()
					end
					return Flag1
				end
			})
		end,
		dispose = function()
			-- upvalues: Flag (ref), List (copy), NoRuntime (copy), Runtime (copy)
			if Flag then return end
			Flag = true
			
			for i = #List, 1, -1 do
				List[i]()
			end
			if NoRuntime then
				Runtime:dispose()
			end
		end
	})
end