--!native

local ActiveModule = require("../ownership/active")
local _ = require("../runtime/children")
local DiagnosticsModule = require("../diagnostics")
local _ = require("../host")
local OwnerModule = require("../ownership/owner")
local _ = require("../reactive/types")
local CellModule = require("../reactive/cell")

return {
	ownerFor = function(p1)
		-- upvalues: ActiveModule (copy), DiagnosticsModule (copy)
		local CurrentResult = ActiveModule.current()
		
		return if CurrentResult == nil then DiagnosticsModule.raise("structure/no-active-owner", ("%s ran outside a mount"):format(p1), {
			contract = "structural primitives belong to the subtree that contains them",
			fix = "use it as a child inside a constructor call, or inside runtime.mount(component, target)"
		}) else CurrentResult
	end,
	mountPointOf = function(p1, p2)
		-- upvalues: DiagnosticsModule (copy)
		return if type(p1) == "table" and p1.insert ~= nil then p1 else DiagnosticsModule.raise("structure/directive-needs-a-mount-point", ("%s was called without a mount point"):format(p2), {
			expected = "a mount point, which the parent holding the directive supplies",
			contract = "a structural directive is a child, not a component: it is placed in a parent's children and handed a window on that parent's slot",
			actual = DiagnosticsModule.describe(p1),
			fix = ("use %s as a child inside a constructor call -- Frame { ... } -- and pass the "):format(p2) .. "component that returns that node to runtime.mount(component, target)"
		})
	end,
	writableOf = function(p1, p2, Key)
		-- upvalues: DiagnosticsModule (copy)
		return if type(p1) == "table" and type(p1.set) == "function" then p1 else DiagnosticsModule.raise("structure/status-not-a-cell", ("%s was given a %s it cannot write to"):format(p2, Key), {
			expected = "a cell, created with Compose.cell(...)",
			key = Key,
			actual = DiagnosticsModule.describe(p1),
			contract = ("%s writes its report into the cell the caller names, so the caller can read it"):format(p2),
			fix = ("create it once -- local %s = Compose.cell(nil) -- and pass that cell"):format(Key)
		})
	end,
	mountBuilder = function(p1, p2, p3, p4)
		-- upvalues: OwnerModule (copy), ActiveModule (copy), DiagnosticsModule (copy)
		local Child = OwnerModule.createChild(p2)
		local Success, Result = pcall(ActiveModule.withOwner, Child, p3)
		
		if not Success then
			OwnerModule.dispose(Child)
			error(Result, 0)
		end
		if type(Result) == "function" then
			local Success1, Result1 = pcall(ActiveModule.runWith, Child, Result, p1)
			
			if not Success1 then
				OwnerModule.dispose(Child)
				error(Result1, 0)
			end
			return OwnerModule.disposer(Child)
		else
			local ValueType = type(Result)
			
			if ValueType ~= "table" and ValueType ~= "userdata" then
				OwnerModule.dispose(Child)
				
				return DiagnosticsModule.raise("mount/not-a-child", ("a %s branch returned neither a node nor a directive"):format(p4), {
					expected = "a node, or a directive such as fragment(...) or keyed(...)",
					actual = DiagnosticsModule.describe(Result)
				})
			end
			local Success2, Result2 = pcall(p1.insert, Result, 1)
			
			if not Success2 then
				OwnerModule.dispose(Child)
				error(Result2, 0)
			end
			OwnerModule.own(Child, function()
				-- upvalues: p1 (copy), Result (copy)
				p1.remove(Result)
			end)
			
			return OwnerModule.disposer(Child)
		end
	end,
	sourceOf = function(Callback, Primitive, Field)
		-- upvalues: CellModule (copy), DiagnosticsModule (copy)
		return if type(Callback) == "function" then Callback elseif CellModule.isValue(Callback) then function(Callback1)
			-- upvalues: Callback (copy)
			return Callback1(Callback)
		end else DiagnosticsModule.raise("structure/source-not-readable", ("%s was given a %s it cannot read"):format(Primitive, Field), {
			expected = "a cell, a formula, or a function taking `use`",
			primitive = Primitive,
			field = Field,
			actual = DiagnosticsModule.describe(Callback),
			fix = ("pass the cell itself -- %s = items -- or a body that reads one"):format(Field)
		})
	end,
	builderOf = function(Callback, Primitive, Field)
		-- upvalues: DiagnosticsModule (copy)
		return if type(Callback) == "function" then Callback else DiagnosticsModule.raise("structure/builder-not-a-function", ("%s was given a %s it cannot call"):format(Primitive, Field), {
			expected = "a function returning a node, or a list of nodes",
			primitive = Primitive,
			field = Field,
			actual = DiagnosticsModule.describe(Callback)
		})
	end,
	optionsOf = function(p1, Primitive, p2)
		-- upvalues: CellModule (copy), DiagnosticsModule (copy)
		return if CellModule.isValue(p1) then DiagnosticsModule.raise("structure/options-not-a-table", ("%s takes one table of named options, and was given a source"):format(Primitive), {
			actual = "a cell or formula, passed positionally",
			primitive = Primitive,
			expected = ("{ %s }"):format(p2),
			fix = ("write %s { %s } -- the arguments are named because they are not distinguishable"):format(Primitive, p2)
		}) elseif type(p1) == "table" then p1 else DiagnosticsModule.raise("structure/options-not-a-table", ("%s takes one table of named options"):format(Primitive), {
			primitive = Primitive,
			actual = DiagnosticsModule.describe(p1),
			expected = ("{ %s }"):format(p2),
			fix = ("write %s { %s }"):format(Primitive, p2)
		})
	end,
	noUnknownFields = function(List, Primitive, List1)
		-- upvalues: DiagnosticsModule (copy)
		assert(type(List) == "table")
		
		for i in List do
			if type(i) ~= "string" or List1[i] == nil then
				local List2 = {}
				
				for i1 in List1 do
					table.insert(List2, i1)
				end
				table.sort(List2)
				
				return DiagnosticsModule.raise("structure/unknown-option", ("%s was given an option it does not have"):format(Primitive), {
					primitive = Primitive,
					option = tostring(i),
					expected = table.concat(List2, ", ")
				})
			end
		end
	end
}