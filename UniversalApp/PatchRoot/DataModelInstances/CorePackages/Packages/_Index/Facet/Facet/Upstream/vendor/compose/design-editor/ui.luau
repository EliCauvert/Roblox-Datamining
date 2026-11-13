local CoreModule = require("../core")
local _ = require("./environment")
local config = {
	Shift = { "LeftShift", "RightShift" },
	Ctrl = { "LeftControl", "RightControl" },
	Meta = { "LeftMeta", "RightMeta", "LeftSuper", "RightSuper" },
	Alt = { "LeftAlt", "RightAlt" }
}

local function node(p1)
	assert(type(p1) == "table" or type(p1) == "userdata", "Design editor expected a host reference, got " .. type(p1))
	
	return p1
end

local function optionalNode(p1)
	if p1 == nil then
		return nil
	else
		assert(type(p1) == "table" or type(p1) == "userdata", "Design editor expected a host reference, got " .. type(p1))
		
		return p1
	end
end

return {
	create = function(Runtime, p1, p2)
		-- upvalues: CoreModule (copy), node (copy), optionalNode (copy), config (copy)
		local Owner = CoreModule.createOwner(Runtime.reactor)
		local Children = {}
		local Tbl = {}
		local Parents = {}
		local ClampedValue = 15
		local DesignEditorRequiresHostObservation = assert(Runtime.host.observation, "Design editor requires host observation")
		local Render = Runtime.host.render
		local Flag = false
		
		local function get(p3, p4)
			-- upvalues: p1 (copy)
			return p1.read(p3, p4)
		end
		
		local function number(p3, p4)
			-- upvalues: p1 (copy)
			local ReadResult = p1.read(p3, p4)
			
			return if type(ReadResult) == "number" then ReadResult else 0
		end
		
		local function text(p3, p4)
			-- upvalues: p1 (copy)
			local ReadResult = p1.read(p3, p4)
			
			return if type(ReadResult) == "string" then ReadResult else ""
		end
		
		local function call(UserInputService, p3, ...)
			-- upvalues: p1 (copy)
			local InvokeFunction = p1.invoke
			assert(type(UserInputService) == "table" or type(UserInputService) == "userdata", "Design editor expected a host reference, got " .. type(UserInputService))
			
			return InvokeFunction(UserInputService, p3, ...)
		end
		
		local function destroy(Key)
			-- upvalues: Children (copy), Tbl (copy), destroy (copy), Parents (copy), CoreModule (upval)
			local Child = Children[Key]
			
			if Child == nil then return end
			for i, value in table.clone(Tbl) do
				if value == Key then
					destroy(i)
				end
			end
			Tbl[Key] = nil
			Parents[Key] = nil
			Children[Key] = nil
			CoreModule.owner.dispose(Child)
		end
		
		local function set(Key, p3, Parent)
			-- upvalues: p2 (copy), p1 (copy), Tbl (copy), Render (copy), Parents (copy), ClampedValue (ref)
			assert(type(Key) == "table" or type(Key) == "userdata", "Design editor expected a host reference, got " .. type(Key))
			
			if p3 == "Parent" then
				local Parent1 = if p2 then p1.read(Key, "Parent") else Tbl[Key]
				
				if Parent1 == Parent then return end
				if Parent1 ~= nil then
					local RemoveChildFunction: (any, any) -> () = Render.removeChild
					assert(type(Parent1) == "table" or type(Parent1) == "userdata", "Design editor expected a host reference, got " .. type(Parent1))
					RemoveChildFunction(Parent1, Key)
				end
				if not p2 then
					local v1 = nil
					if Parent == nil then
						v1 = nil
					else
						assert(type(Parent) == "table" or type(Parent) == "userdata", "Design editor expected a host reference, got " .. type(Parent))
						v1 = Parent
					end
					Tbl[Key] = v1
				end
				if Parent ~= nil then
					local InsertChildFunction: (any, any) -> () = Render.insertChild
					assert(type(Parent) == "table" or type(Parent) == "userdata", "Design editor expected a host reference, got " .. type(Parent))
					InsertChildFunction(Parent, Key)
					
					return
				end
			elseif p2 or p3 ~= "TextSize" or type(Parent) ~= "number" then
				Render.setProperty(Key, p3, Parent)
			else
				Parents[Key] = Parent
				Render.setProperty(Key, p3, Parent * ClampedValue / 15)
				
				return
			end
		end
		
		local function new(p3)
			-- upvalues: p2 (copy), Runtime (copy), CoreModule (upval), Owner (copy), Children (copy)
			if p2 then
				return Runtime.constructors[p3]({})
			else
				local Child = CoreModule.owner.createChild(Owner)
				local WithOwnerResult = CoreModule.withOwner(Child, function()
					-- upvalues: Runtime (upval), p3 (copy)
					return Runtime.constructors[p3]({})
				end)
				Children[WithOwnerResult] = Child
				
				return WithOwnerResult
			end
		end
		
		local function connect(p3, p4, p5)
			-- upvalues: Runtime (copy), p2 (copy), CoreModule (upval), Owner (copy)
			assert(type(p3) == "table" or type(p3) == "userdata", "Design editor expected a host reference, got " .. type(p3))
			
			local function subscribe()
				-- upvalues: Runtime (upval), p3 (copy), p4 (copy), p5 (copy)
				return Runtime.connect(p3, p4, p5)
			end
			
			local ConnectResult = if p2 then Runtime.connect(p3, p4, p5) else CoreModule.withOwner(Owner, subscribe)
			
			return {
				Disconnect = function(_)
					-- upvalues: ConnectResult (copy)
					ConnectResult()
				end
			}
		end
		
		local Values = p1.values
		
		local function point(p3)
			-- upvalues: p1 (copy)
			local X = p1.read(p3, "X")
			local X1 = if type(X) == "number" then X else 0
			local Y = p1.read(p3, "Y")
			
			return { X = X1, Y = if type(Y) == "number" then Y else 0 }
		end
		
		local function _vector(p3)
			-- upvalues: p1 (copy)
			local X = p1.read(p3, "X")
			local X1 = if type(X) == "number" then X else 0
			local Y = p1.read(p3, "Y")
			local Y1 = if type(Y) == "number" then Y else 0
			local Z = p1.read(p3, "Z")
			
			return { X = X1, Y = Y1, Z = if type(Z) == "number" then Z else 0 }
		end
		
		local function isA(p3, p4): boolean
			-- upvalues: call (copy)
			return if type(p3) == "table" then call(p3, "IsA", p4) == true else type(p3) == "userdata" and call(p3, "IsA", p4) == true
		end
		
		local function changed(p3, p4, p5)
			-- upvalues: DesignEditorRequiresHostObservation (copy)
			local ObservePropertyFunction = DesignEditorRequiresHostObservation.observeProperty
			assert(type(p3) == "table" or type(p3) == "userdata", "Design editor expected a host reference, got " .. type(p3))
			local ObservePropertyResult = ObservePropertyFunction(p3, p4, p5)
			
			return {
				Disconnect = function(_)
					-- upvalues: ObservePropertyResult (copy)
					ObservePropertyResult()
				end
			}
		end
		
		if p2 then
			CoreModule.owner.dispose(Owner)
		end
		return {
			runtime = Runtime,
			owner = Owner,
			values = Values,
			rgb = function(p3: number, p4: number, p5: number)
				-- upvalues: Values (copy)
				return Values.color(p3 / 255, p4 / 255, p5 / 255)
			end,
			hex = function(Text: string)
				-- upvalues: Values (copy)
				return Values.color((tonumber(string.sub(Text, 2, 3), 16) or 0) / 255, (tonumber(string.sub(Text, 4, 5), 16) or 0) / 255, (tonumber(string.sub(Text, 6, 7), 16) or 0) / 255)
			end,
			node = node,
			optionalNode = optionalNode,
			service = function(p3)
				-- upvalues: p1 (copy)
				local ServiceResult = p1.service(p3)
				assert(type(ServiceResult) == "table" or type(ServiceResult) == "userdata", "Design editor expected a host reference, got " .. type(ServiceResult))
				
				return ServiceResult
			end,
			modified = function(p3, List): boolean
				-- upvalues: call (copy), Values (copy), config (upval), p1 (copy)
				for _, value in List do
					if p3 ~= nil then
						if call(p3, "IsModifierKeyDown", Values.enum("ModifierKey", value)) == true then
							return true
						end
						continue
					end
					local Entry = config[value] or {}
					for _, value1 in Entry do
						if call(p1.service("UserInputService"), "IsKeyDown", Values.enum("KeyCode", value1)) == true then
							return true
						end
					end
				end
				return false
			end,
			keyDown = function(List): boolean
				-- upvalues: call (copy), p1 (copy), Values (copy)
				for _, value in List do
					if call(p1.service("UserInputService"), "IsKeyDown", Values.enum("KeyCode", value)) == true then
						return true
					end
				end
				return false
			end,
			descendants = function(p4)
				-- upvalues: p1 (copy)
				local List = {}
				local DescendantsFunction = p1.descendants
				assert(type(p4) == "table" or type(p4) == "userdata", "Design editor expected a host reference, got " .. type(p4))
				
				for _, value in DescendantsFunction(p4) do
					assert(type(value) == "table" or type(value) == "userdata", "Design editor expected a host reference, got " .. type(value))
					table.insert(List, value)
				end
				return List
			end,
			new = new,
			get = get,
			set = set,
			setTextSize = function(Value: number)
				-- upvalues: ClampedValue (ref), Parents (copy), Render (copy)
				ClampedValue = math.clamp(Value, 15, 19)
				
				for i, parent in Parents do
					Render.setProperty(i, "TextSize", parent * ClampedValue / 15)
				end
			end,
			number = number,
			text = text,
			call = call,
			components = function(p5)
				-- upvalues: call (copy)
				local List = {}
				
				for _, value in { call(p5, "GetComponents") } do
					assert(type(value) == "number", "CFrame component must be a number")
					table.insert(List, value)
				end
				return List
			end,
			isA = isA,
			destroy = destroy,
			connect = connect,
			changed = changed,
			point = point,
			vector = _vector,
			xy = function(p6, p7)
				-- upvalues: p1 (copy)
				local ReadResult = p1.read(p6, p7)
				local X = p1.read(ReadResult, "X")
				local X1 = if type(X) == "number" then X else 0
				local Y = p1.read(ReadResult, "Y")
				
				return { X = X1, Y = if type(Y) == "number" then Y else 0 }
			end,
			xyz = function(p6, p7)
				-- upvalues: _vector (copy), get (copy)
				return (_vector(get(p6, p7)))
			end,
			dispose = function()
				-- upvalues: Flag (ref), Children (copy), destroy (copy), CoreModule (upval), Owner (copy)
				if Flag then return end
				Flag = true
				local List = {}
				
				for i in table.clone(Children) do
					local Success, Result = pcall(destroy, i)
					
					if not Success then
						table.insert(List, (tostring(Result)))
					end
				end
				local Success1, Result1 = pcall(function()
					-- upvalues: CoreModule (upval), Owner (upval)
					CoreModule.owner.dispose(Owner)
				end)
				
				if not Success1 then
					table.insert(List, (tostring(Result1)))
				end
				if #List > 0 then
					error(table.concat(List, "\n"), 0)
				end
			end
		}
	end,
	node = node
}