local CoreModule = require("../core")
local _ = require("./session")
local SourceModule = require("./source")
local _ = require("./types")
local DocumentModule = require("./document")

return function(p1, p2)
	-- upvalues: CoreModule (copy), SourceModule (copy), DocumentModule (copy)
	local Library = p1.library
	local Custom = CoreModule.cell("custom")
	local v1 = ""
	local EmitResult = ""
	local Name = nil
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	
	local function _(p3)
		-- upvalues: SourceModule (upval), Library (copy), Name (ref)
		return SourceModule.emit(p3, Library, if Name then { name = Name } else nil)
	end
	
	local _ = function(p3)
		-- upvalues: SourceModule (upval), Library (copy)
		local Success, Result = pcall(SourceModule.parse, p3, Library)
		
		return if Success then Result else nil
	end
	
	local function import(): boolean
		-- upvalues: p2 (copy), SourceModule (upval), Library (copy), v1 (ref), Custom (copy), p1 (copy), Name (ref), EmitResult (ref), DocumentModule (upval), Flag (ref)
		local ReadResult = p2.read()
		local Success, Result = pcall(SourceModule.parse, ReadResult, Library)
		local Result1 = if Success then Result else nil
		v1 = ReadResult
		
		if Result1 == nil then
			Custom:set("custom")
			p1.problem:set("The linked source is custom code. Import a generated design before editing visually")
			
			return false
		end
		Name = nil
		
		if SourceModule.emit(Result1, Library) ~= ReadResult then
			local Success1, Result2 = pcall(function()
				-- upvalues: SourceModule (upval), Result1 (copy), Library (upval)
				return SourceModule.emit(Result1, Library, { name = Result1.name })
			end)
			
			if Success1 and Result2 == ReadResult then
				Name = Result1.name
			end
		end
		EmitResult = SourceModule.emit(Result1, Library, if Name then { name = Name } else nil)
		
		if SourceModule.emit(p1.document:peek(), Library, if Name then { name = Name } else nil) ~= EmitResult then
			local t = {}
			local t1 = {}
			
			local function index(Root, Key, Ids, p3)
				-- upvalues: index (copy)
				if p3 then
					Ids[Key] = Root.id
				else
					Ids[Root.id] = Key
				end
				local t = {}
				
				for _, child in Root.children do
					local Text = child.kind .. "\0" .. child.name
					t[Text] = (t[Text] or 0) + 1
					index(child, Key .. "\1" .. Text .. "\0" .. tostring(t[Text]), Ids, p3)
				end
			end
			
			index(p1.document:peek().root, "", t, false)
			index(Result1.root, "", t1, true)
			local List = {}
			
			for _, value in p1.selection:peek() do
				local Entry = t1[t[value]]
				
				if Entry ~= nil and DocumentModule.find(Result1.root, Entry) then
					table.insert(List, Entry)
				end
			end
			Flag = true
			p1.replace(Result1)
			
			if #List > 0 then
				p1.selectMany(List)
			end
			Flag = false
		end
		Custom:set("synchronized")
		p1.problem:set(nil)
		
		return true
	end
	
	local _ = nil
	
	local function v17()
		-- upvalues: Flag1 (ref), Flag (ref), Flag2 (ref), Custom (copy), p1 (copy), SourceModule (upval), Library (copy), Name (ref), EmitResult (ref), v1 (ref), p2 (copy), v17 (ref)
		if Flag1 or Flag or Flag2 or Custom:peek() ~= "synchronized" then return end
		local function flush()
			-- upvalues: Flag2 (upval), Flag (upval), Custom (upval), Flag1 (upval), p1 (upval), SourceModule (upval), Library (upval), Name (upval), EmitResult (upval), v1 (upval), p2 (upval), v17 (upval)
			if Flag2 or Flag or Custom:peek() ~= "synchronized" then
				Flag1 = false
				
				return
			end
			local EmitResult1 = SourceModule.emit(p1.document:peek(), Library, if Name then { name = Name } else nil)
			
			if EmitResult1 == EmitResult then
				Flag1 = false
				
				return
			end
			if v1 ~= EmitResult then
				Custom:set("custom")
				p1.problem:set("Source formatting is custom. Visual edits would change unrelated bytes")
				Flag1 = false
				
				return
			end
			if p2.write(v1, EmitResult1) then
				v1 = EmitResult1
				EmitResult = EmitResult1
			else
				Custom:set("conflict")
				p1.problem:set("Conflict: source kept its changes; visual edits remain on stage. Import source to resolve")
			end
			Flag1 = false
			
			if Custom:peek() == "synchronized" and SourceModule.emit(p1.document:peek(), Library, if Name then { name = Name } else nil) ~= EmitResult then
				v17()
			end
		end
		
		Flag1 = true
		local DeferFunction: (any) -> () = p2.defer
		
		if DeferFunction then
			DeferFunction(flush)
			
			return
		else
			flush()
		end
	end
	
	local RootOwner = CoreModule.createRootOwner(function()
		-- upvalues: CoreModule (upval), p1 (copy), v17 (ref)
		CoreModule.watch(function(Callback: (any) -> ())
			-- upvalues: p1 (upval), v17 (upval)
			Callback(p1.document)
			v17()
		end)
	end)
	local WatchResult = p2.watch(function()
		-- upvalues: p2 (copy), v1 (ref), Custom (copy), import (copy)
		local ReadResult = p2.read()
		
		if ReadResult == v1 then return end
		if Custom:peek() == "conflict" then
			v1 = ReadResult
			
			return
		else
			import()
		end
	end)
	import()
	
	return {
		status = Custom,
		import = import,
		dispose = function()
			-- upvalues: Flag2 (ref), WatchResult (copy), RootOwner (copy)
			Flag2 = true
			WatchResult()
			RootOwner.dispose()
		end
	}
end