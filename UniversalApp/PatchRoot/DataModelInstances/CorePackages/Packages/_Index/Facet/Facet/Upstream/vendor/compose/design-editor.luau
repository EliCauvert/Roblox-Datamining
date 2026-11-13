local CoreModule = require("./core")
local DesignModule = require("./design")
local _ = require("./design/types")
local _ = require("@self/environment")
local EditorModule = require("@self/editor")
local UiModule = require("@self/ui")
local Roblox3dLibraryModule = require("@self/roblox-3d-library")
local DevicesModule = require("@self/devices")
local _ = require("@self/canvas")
local _ = require("@self/prompt")
local _ = require("@self/theme-panel")
local _ = require("@self/stage3d")
local _ = require("@self/render-preview")

local function create(p1, p2, p3, Tbl)
	-- upvalues: UiModule (copy), CoreModule (copy), EditorModule (copy), create (copy)
	local NewUi = UiModule.create(Tbl.runtime, Tbl.environment)
	
	local function Dispose() end
	
	local Copy = table.clone(Tbl)
	
	function Copy.onClose()
		-- upvalues: Dispose (ref), Tbl (copy)
		Dispose()
		
		if Tbl.onClose then
			Tbl.onClose()
		end
	end
	
	local Success, Result = pcall(function()
		-- upvalues: CoreModule (upval), NewUi (copy), EditorModule (upval), create (upval), Tbl (copy), p1 (copy), p2 (copy), p3 (copy), Copy (copy)
		return CoreModule.withOwner(NewUi.owner, function()
			-- upvalues: EditorModule (upval), NewUi (upval), create (upval), Tbl (upval), p1 (upval), p2 (upval), p3 (upval), Copy (upval)
			return EditorModule(NewUi, function(p4, p5, p6, p7)
				-- upvalues: create (upval), Tbl (upval)
				return create(p4, p5, p6, {
					runtime = p7.runtime,
					environment = Tbl.environment,
					link = p7.link,
					token = p7.token,
					resolveToken = p7.resolveToken,
					tokens = p7.tokens,
					stageSize = p7.stageSize
				})
			end)(p1, p2, p3, Copy)
		end)
	end)
	
	if not Success then
		local Success1, Result1 = pcall(NewUi.dispose)
		
		if not Success1 then
			error(`{tostring(Result)}\n{tostring(Result1)}`, 0)
		end
		error(Result, 0)
	end
	local Flag = false
	
	Dispose = function()
		-- upvalues: Flag (ref), Result (copy), NewUi (copy)
		if Flag then return end
		Flag = true
		local Success, Result1 = pcall(Result.dispose)
		local Success1, Result2 = pcall(NewUi.dispose)
		
		if not Success then
			error(if Success1 then Result1 else `{tostring(Result1)}\n{tostring(Result2)}`, 0)
			
			return
		end
		if not Success1 then
			error(Result2, 0)
		end
	end
	
	local config = {
		root = Result.root,
		session = Result.session,
		canvas = Result.canvas,
		execute = Result.execute,
		nested = Result.nested,
		dispose = Dispose
	}
	setmetatable(config, {
		__index = function(_, p4)
			-- upvalues: Result (copy)
			return if p4 == "stage" then Result.canvas.current().stage elseif p4 == "scene" then Result.canvas.current().scene else nil
		end
	})
	
	return config
end

return {
	devices = DevicesModule,
	create = create,
	kit = function(Name, Callback)
		-- upvalues: UiModule (copy), DesignModule (copy), DevicesModule (copy), create (copy)
		return {
			name = Name,
			edit = function(p1, p2, Link)
				-- upvalues: UiModule (upval), Callback (copy), DesignModule (upval), DevicesModule (upval), create (upval)
				local NodeResult = UiModule.node(p1)
				local CallbackResult = Callback()
				local Library = CallbackResult.library
				local NewResult = DesignModule.document.new(p2, Library, CallbackResult.root)
				
				if Link ~= nil then
					local ReadResult: string = Link.read()
					
					if string.match(ReadResult, "^%s*$") then
						Link.write(ReadResult, DesignModule.emit(NewResult, Library))
					end
				end
				local Flag = false
				local Success, Result = pcall(create, Library, NewResult, NodeResult, {
					renderPreview = CallbackResult.renderPreview,
					runtime = CallbackResult.runtime,
					environment = CallbackResult.environment,
					scene = CallbackResult.scene,
					identity = CallbackResult.identity,
					devices = CallbackResult.devices or DevicesModule.all,
					device = CallbackResult.device,
					frame = CallbackResult.frame,
					prompt = CallbackResult.prompt,
					theme = CallbackResult.theme,
					bindings = CallbackResult.bindings,
					outputs = CallbackResult.outputs,
					backdrop = CallbackResult.backdrop,
					previews = CallbackResult.previews,
					token = CallbackResult.token,
					resolveToken = CallbackResult.resolveToken,
					tokens = CallbackResult.tokens,
					slots = CallbackResult.slots,
					slotSamples = CallbackResult.slotSamples,
					capture = CallbackResult.capture,
					onClose = function()
						-- upvalues: Flag (ref), CallbackResult (copy)
						if not Flag then
							Flag = true
							
							if CallbackResult.dispose then
								CallbackResult.dispose()
							end
						end
					end,
					link = Link
				})
				
				if not Success then
					if not Flag then
						Flag = true
						
						if CallbackResult.dispose then
							CallbackResult.dispose()
						end
					end
					error(Result, 0)
				end
				return {
					dispose = function()
						-- upvalues: Result (copy), Flag (ref), CallbackResult (copy)
						Result.dispose()
						
						if not Flag then
							Flag = true
							
							if CallbackResult.dispose then
								CallbackResult.dispose()
							end
						end
					end
				}
			end
		}
	end,
	robloxLibrary = require("@self/roblox-library"),
	roblox3DLibrary = Roblox3dLibraryModule.create,
	roblox3DSchema = Roblox3dLibraryModule.schema
}