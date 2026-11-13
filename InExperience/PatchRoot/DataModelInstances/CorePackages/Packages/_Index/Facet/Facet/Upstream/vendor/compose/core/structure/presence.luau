local _ = require("../types")
local OwnerModule = require("../ownership/owner")
local ActiveModule = require("../ownership/active")
local Block = require("../runtime/children").block
local DiagnosticsModule = require("../diagnostics")
local DynamicModule = require("../dynamic")
local _ = require("../host")
local SupportModule = require("./support")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")
local config = { exit = true }

return function(p1, p2, p3)
	-- upvalues: SupportModule (copy), config (copy), CellModule (copy), OwnerModule (copy), Block (copy), DynamicModule (copy), ActiveModule (copy), DiagnosticsModule (copy)
	local Presence = nil
	
	if p3 ~= nil then
		local Presence1 = SupportModule.optionsOf(p3, "presence", "exit = ...")
		SupportModule.noUnknownFields(Presence1, "presence", config)
		
		if Presence1.exit ~= nil then
			Presence = SupportModule.builderOf(Presence1.exit, "presence", "exit")
		end
	end
	local Presence2 = SupportModule.sourceOf(p1, "presence", "condition")
	local Presence3 = SupportModule.builderOf(p2, "presence", "builder")
	
	return function(p4)
		-- upvalues: SupportModule (upval), CellModule (upval), OwnerModule (upval), Presence2 (copy), Block (upval), Presence3 (copy), DynamicModule (upval), Presence (ref), ActiveModule (upval), DiagnosticsModule (upval)
		local Presence1 = SupportModule.ownerFor("presence")
		SupportModule.mountPointOf(p4, "presence")
		local CellResult = CellModule.cell(false)
		local config = { exiting = CellResult }
		local MountBlockResult = nil
		local v1 = nil
		local v2 = nil
		local v3 = nil
		
		local function _()
			-- upvalues: v3 (ref)
			local Callback: () -> () = v3
			
			if Callback ~= nil then
				v3 = nil
				Callback()
			end
		end
		
		OwnerModule.own(Presence1, function()
			-- upvalues: v3 (ref), v2 (ref), OwnerModule (upval)
			local Callback: () -> () = v3
			
			if Callback ~= nil then
				v3 = nil
				Callback()
			end
			local v4 = v2
			v2 = nil
			
			if v4 ~= nil then
				OwnerModule.dispose(v4.owner)
			end
		end)
		OwnerModule.watch(Presence1, function(p5)
			-- upvalues: Presence2 (upval), v1 (ref), v3 (ref), CellResult (copy), v2 (ref), MountBlockResult (ref), Block (upval), p4 (copy), Presence1 (copy), Presence3 (upval), config (copy), DynamicModule (upval), Presence (upval), OwnerModule (upval), ActiveModule (upval), DiagnosticsModule (upval)
			local Inverted = not not Presence2(p5)
			
			if Inverted == v1 then return end
			v1 = Inverted
			
			if Inverted then
				local Callback: () -> () = v3
				
				if Callback ~= nil then
					v3 = nil
					Callback()
				end
				CellResult:set(false)
				local v4 = v2
				
				if v4 == nil then
					MountBlockResult = Block.mountBlock(p4, Presence1, function()
						-- upvalues: Presence3 (upval), config (upval), DynamicModule (upval), Block (upval)
						local PresenceResult = Presence3(config)
						
						return if type(PresenceResult) == "table" and DynamicModule.raw(PresenceResult, 1) ~= nil then Block.requireNodes(PresenceResult, "presence") else { PresenceResult }
					end, Block.nameOf(Presence3), 1)
					
					return
				else
					v2 = nil
					MountBlockResult = v4
					
					return
				end
			else
				local MountBlockResult1 = MountBlockResult
				MountBlockResult = nil
				
				if MountBlockResult1 == nil then return end
				local Callback1 = Presence
				
				if Callback1 == nil then
					OwnerModule.dispose(MountBlockResult1.owner)
					
					return
				end
				v2 = MountBlockResult1
				CellResult:set(true)
				local Success, Result = pcall(ActiveModule.withOwner, Presence1, function()
					-- upvalues: Callback1 (copy), MountBlockResult1 (copy)
					return Callback1(MountBlockResult1.nodes)
				end)
				
				if not Success then
					v2 = nil
					OwnerModule.dispose(MountBlockResult1.owner)
					error(DiagnosticsModule.format("structure/exit-failed", "a presence exit raised instead of returning", {
						contract = "exit starts the departure and returns something with a completed readable",
						fix = "return a timeline, or omit exit to dispose immediately",
						detail = tostring(Result)
					}), 0)
					
					return
				end
				if type(Result) ~= "table" or Result.completed == nil then
					v2 = nil
					OwnerModule.dispose(MountBlockResult1.owner)
					error(DiagnosticsModule.format("structure/exit-not-completable", "a presence exit returned nothing that completes", {
						expected = "a table with a `completed` readable, such as a timeline",
						actual = DiagnosticsModule.describe(Result)
					}), 0)
					
					return
				end
				local Flag = false
				local WatchResult: () -> () = OwnerModule.watch(Presence1, function(Callback)
					-- upvalues: Result (copy), v2 (upval), Flag (ref), v3 (upval), OwnerModule (upval)
					if not Callback(Result.completed) then return end
					local v5 = v2
					
					if v5 == nil then return end
					v2 = nil
					Flag = true
					local Callback1: () -> () = v3
					
					if Callback1 ~= nil then
						v3 = nil
						Callback1()
					end
					OwnerModule.dispose(v5.owner)
				end)
				
				if Flag then
					WatchResult()
				else
					v3 = WatchResult
				end
			end
		end)
	end
end