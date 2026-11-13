local DynamicModule = require("../core/dynamic")
local _ = require("./types")
local ReadFunction = DynamicModule.read

local function invoke(Callback, Connect, p1, ...)
	-- upvalues: DynamicModule (copy)
	return DynamicModule.invoke(Callback(Connect, p1), Connect, ...)
end

local function descendants(p1)
	-- upvalues: invoke (copy), ReadFunction (copy)
	local GetDescendants = invoke(ReadFunction, p1, "GetDescendants")
	assert(type(GetDescendants) == "table", "GetDescendants did not return an array")
	local List = {}
	
	for _, getDescendant in GetDescendants do
		table.insert(List, getDescendant)
	end
	return List
end

local function propertyChanged(p2, p3)
	-- upvalues: invoke (copy), ReadFunction (copy)
	local GetPropertyChangedSignal = invoke(ReadFunction, p2, "GetPropertyChangedSignal", p3)
	
	return {
		Connect = function(_, p4)
			-- upvalues: invoke (upval), ReadFunction (upval), GetPropertyChangedSignal (copy)
			local Connect = invoke(ReadFunction, GetPropertyChangedSignal, "Connect", p4)
			
			return {
				Disconnect = function(_)
					-- upvalues: invoke (upval), ReadFunction (upval), Connect (copy)
					invoke(ReadFunction, Connect, "Disconnect")
				end
			}
		end
	}
end

local function _(p2)
	-- upvalues: invoke (copy), ReadFunction (copy)
	return {
		Connect = function(_, Callback)
			-- upvalues: invoke (upval), ReadFunction (upval), p2 (copy)
			local Connect = invoke(ReadFunction, p2, "Connect", function(p3)
				-- upvalues: Callback (copy)
				assert(type(p3) == "number", "frame signal did not supply a numeric delta")
				Callback(p3)
			end)
			
			return {
				Disconnect = function(_)
					-- upvalues: invoke (upval), ReadFunction (upval), Connect (copy)
					invoke(ReadFunction, Connect, "Disconnect")
				end
			}
		end
	}
end

return {
	ambient = function()
		-- upvalues: invoke (copy), ReadFunction (copy), propertyChanged (copy)
		local v1 = Instance
		local v2 = game
		
		if v1 == nil or v2 == nil then
			error("ComposeRoblox: the Roblox engine is not present. This adapter only runs inside Roblox; pass an engine explicitly to ComposeRoblox.createHost(engine) to run it anywhere else.", 0)
		end
		local RunService = v2:GetService("RunService")
		local IsClient = invoke(ReadFunction, RunService, "IsClient")
		assert(type(IsClient) == "boolean", "RunService.IsClient did not return a boolean")
		local v3 = Vector2
		local v4 = Vector3
		local v5 = Color3
		local v6 = UDim
		local v7 = UDim2
		local v8 = CFrame
		local ReadResult = ReadFunction(RunService, if IsClient then "PreRender" else "Heartbeat")
		
		return {
			new = function(X)
				-- upvalues: v1 (copy)
				return v1.new(X)
			end,
			heartbeat = {
				Connect = function(_, Callback)
					-- upvalues: invoke (upval), ReadFunction (upval), ReadResult (copy)
					local Connect = invoke(ReadFunction, ReadResult, "Connect", function(p2)
						-- upvalues: Callback (copy)
						assert(type(p2) == "number", "frame signal did not supply a numeric delta")
						Callback(p2)
					end)
					
					return {
						Disconnect = function(_)
							-- upvalues: invoke (upval), ReadFunction (upval), Connect (copy)
							invoke(ReadFunction, Connect, "Disconnect")
						end
					}
				end
			},
			clock = os.clock,
			typeName = typeof,
			destroy = function(p2)
				-- upvalues: invoke (upval), ReadFunction (upval)
				invoke(ReadFunction, p2, "Destroy")
			end,
			propertyChanged = propertyChanged,
			datatypes = {
				Vector2 = if v3 == nil then nil else v3.new,
				Vector3 = if v4 == nil then nil else v4.new,
				Color3 = if v5 == nil then nil else v5.new,
				UDim = if v6 == nil then nil else v6.new,
				UDim2 = if v7 == nil then nil else v7.new,
				CFrame = if v8 == nil then nil else function(Vector, p2)
					-- upvalues: v8 (copy)
					return v8.new(Vector.X, Vector.Y, Vector.Z, table.unpack(p2))
				end
			},
			readCFrame = if v8 == nil then nil else function(CF)
				local list = { CF:GetComponents() }
				
				return list[1], list[2], list[3], {
					list[4], list[5], list[6], list[7], list[8], list[9], list[10], list[11],
					list[12]
				}
			end
		}
	end,
	designEnvironment = function(Read)
		-- upvalues: descendants (copy), invoke (copy)
		local RobloxIsAbsentInjectADesignEnvironment = assert(game, "Roblox is absent; inject a design environment")
		local v1 = Vector2
		local v2 = Vector3
		local v3 = Color3
		local v4 = UDim
		local v5 = UDim2
		local v6 = CFrame
		local v7 = Font
		local v8 = Enum
		local v9 = RaycastParams
		
		return {
			read = Read,
			descendants = descendants,
			invoke = function(p2, p3, ...)
				-- upvalues: invoke (upval), Read (copy)
				return invoke(Read, p2, p3, ...)
			end,
			service = function(ServiceName)
				-- upvalues: RobloxIsAbsentInjectADesignEnvironment (copy)
				return RobloxIsAbsentInjectADesignEnvironment:GetService(ServiceName)
			end,
			values = {
				vector2 = function(p2, p3)
					-- upvalues: v1 (copy)
					return assert(v1).new(p2, p3)
				end,
				vector3 = function(p2, p3, p4)
					-- upvalues: v2 (copy)
					return assert(v2).new(p2, p3, p4)
				end,
				udim = function(p2, p3)
					-- upvalues: v4 (copy)
					return assert(v4).new(p2, p3)
				end,
				udim2 = function(p2, p3, p4, p5)
					-- upvalues: v5 (copy)
					return assert(v5).new(p2, p3, p4, p5)
				end,
				color = function(p2, p3, p4)
					-- upvalues: v3 (copy)
					return assert(v3).new(p2, p3, p4)
				end,
				font = function(p2, p3)
					-- upvalues: v7 (copy), v8 (copy)
					return v7.new(p2, v8.FontWeight[p3])
				end,
				enum = function(p2, p3)
					-- upvalues: v8 (copy)
					return v8[p2][p3]
				end,
				cframe = function(p2)
					-- upvalues: v6 (copy)
					return assert(v6).new(table.unpack(p2))
				end,
				raycastParams = function(p2, FilterDescendantsInstances)
					-- upvalues: v9 (copy), v8 (copy)
					local NewResult = v9.new()
					NewResult.FilterType = v8.RaycastFilterType[if p2 then "Include" else "Exclude"]
					NewResult.FilterDescendantsInstances = FilterDescendantsInstances
					
					return NewResult
				end
			}
		}
	end,
	descendants = descendants,
	invoke = invoke,
	readMember = ReadFunction,
	writeMember = DynamicModule.write,
	service = function(ServiceName)
		return assert(game, "Roblox is absent; inject the requested service"):GetService(ServiceName)
	end,
	cancelThread = function(p2)
		local v10 = task
		
		return v10 ~= nil and type(v10.cancel) == "function" and pcall(v10.cancel, p2)
	end
}