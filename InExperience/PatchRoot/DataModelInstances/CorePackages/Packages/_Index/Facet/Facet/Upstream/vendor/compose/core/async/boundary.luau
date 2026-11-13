local _ = require("../runtime/children")
local DiagnosticsModule = require("../diagnostics")
local _ = require("../host")
local OwnerModule = require("../ownership/owner")
local SupportModule = require("../structure/support")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")

return function(Callback1, Callback)
	-- upvalues: DiagnosticsModule (copy), SupportModule (copy), CellModule (copy), OwnerModule (copy)
	return if type(Callback1) == "function" and type(Callback) == "function" then function(p1)
		-- upvalues: SupportModule (upval), CellModule (upval), OwnerModule (upval), Callback1 (copy), Callback (copy)
		local Boundary = SupportModule.ownerFor("boundary")
		local CellResult = CellModule.cell(nil)
		local CellResult1 = CellModule.cell(1)
		local DisposerResult = nil
		local Flag = false
		
		local function report(p2)
			-- upvalues: Flag (ref), CellResult (copy)
			if not Flag then
				Flag = true
				CellResult:set(if p2 == nil then "unknown failure" else p2)
				
				return
			end
		end
		
		local function retry()
			-- upvalues: Flag (ref), CellResult (copy), CellResult1 (copy)
			Flag = false
			CellResult:set(nil)
			CellResult1:update(function(p2: number): number
				return p2 + 1
			end)
		end
		
		OwnerModule.watch(Boundary, function(Callback2)
			-- upvalues: CellResult (copy), CellResult1 (copy), DisposerResult (ref), Flag (ref), OwnerModule (upval), Boundary (copy), report (copy), SupportModule (upval), p1 (copy), Callback1 (upval), Callback (upval), retry (copy)
			local CallbackResult = Callback2(CellResult)
			Callback2(CellResult1)
			local Callback3: () -> () = DisposerResult
			DisposerResult = nil
			
			if Callback3 ~= nil then
				Callback3()
			end
			if CallbackResult ~= nil then
				DisposerResult = SupportModule.mountBuilder(p1, Boundary, function()
					-- upvalues: Callback (upval), CallbackResult (copy), retry (upval)
					return Callback(CallbackResult, retry)
				end, "boundary")
				
				return
			end
			Flag = false
			local Child = OwnerModule.createChild(Boundary)
			OwnerModule.guardWith(Child, { report = report })
			local Success, Result = pcall(SupportModule.mountBuilder, p1, Child, Callback1, "boundary")
			
			if Success and not Flag then
				DisposerResult = OwnerModule.disposer(Child)
				
				return
			end
			OwnerModule.dispose(Child)
			
			if not Flag then
				Flag = true
				CellResult:set(if Result == nil then "unknown failure" else Result)
				
				return
			end
		end)
	end else DiagnosticsModule.raise("async/boundary-needs-builders", "boundary expects a builder and a fallback", {
		expected = "boundary(function() ... end, function(failure, retry) ... end)"
	})
end