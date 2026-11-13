local v1 = nil
local v2 = nil
local v3 = nil
local v4 = nil
local CoreModule = require("./core")
local EngineModule = require("@self/engine")
local HostModule = require("@self/host")
local v5 = nil

return {
	createHost = function(AmbientResult)
		-- upvalues: HostModule (copy), v5 (ref), EngineModule (copy)
		if AmbientResult ~= nil then
			return (HostModule.createHost(AmbientResult))
		end
		local v6 = v5
		
		if v6 == nil then
			local Host = HostModule.createHost((EngineModule.ambient()))
			v5 = Host
			
			return Host
		else
			return v6
		end
	end,
	createRuntime = function(p1)
		-- upvalues: CoreModule (copy), HostModule (copy), v5 (ref), EngineModule (copy)
		local CreateRuntimeFunction = CoreModule.createRuntime
		local Host = nil
		
		if p1 == nil then
			local v6 = v5
			
			if v6 == nil then
				local Host1 = HostModule.createHost((EngineModule.ambient()))
				v5 = Host1
				Host = Host1
			else
				Host = v6
			end
		else
			Host = HostModule.createHost(p1)
		end
		return CreateRuntimeFunction(Host)
	end,
	designEnvironment = function(ReadMember)
		-- upvalues: HostModule (copy), EngineModule (copy)
		if ReadMember then
			local Read = ReadMember.read or HostModule.readMember
			
			return {
				read = Read,
				values = ReadMember.values,
				service = ReadMember.service,
				descendants = EngineModule.descendants,
				invoke = function(Read1, p1, ...)
					-- upvalues: EngineModule (upval), Read (copy)
					return EngineModule.invoke(Read, Read1, p1, ...)
				end
			}
		else
			return EngineModule.designEnvironment(HostModule.readMember)
		end
	end,
	codecs = function(p1)
		-- upvalues: v1 (ref), EngineModule (copy)
		local V0 = v1 or require("@self/codecs")
		v1 = V0
		
		return V0.create(if p1 == nil then EngineModule.ambient() else p1)
	end,
	animatableTypes = function(p1)
		-- upvalues: v1 (ref), EngineModule (copy)
		local V0 = v1 or require("@self/codecs")
		v1 = V0
		local NewV = V0.create(if p1 == nil then EngineModule.ambient() else p1)
		local List = {}
		
		if NewV.CFrame ~= nil then
			table.insert(List, "CFrame")
		end
		if NewV.Color3 ~= nil then
			table.insert(List, "Color3")
		end
		if NewV.UDim ~= nil then
			table.insert(List, "UDim")
		end
		if NewV.UDim2 ~= nil then
			table.insert(List, "UDim2")
		end
		if NewV.Vector2 ~= nil then
			table.insert(List, "Vector2")
		end
		if NewV.Vector3 ~= nil then
			table.insert(List, "Vector3")
		end
		table.sort(List)
		
		return List
	end,
	cleanup = function(p1)
		-- upvalues: v2 (ref)
		local V1 = v2 or require("@self/cleanup")
		v2 = V1
		
		return V1.cleanup(p1)
	end,
	createCleanup = function(p1)
		-- upvalues: v2 (ref)
		local V1 = v2 or require("@self/cleanup")
		v2 = V1
		
		return V1.createCleanup(p1)
	end,
	createViewport = function(p1, p2, p3)
		-- upvalues: v3 (ref)
		local V2 = v3 or require("@self/viewport")
		v3 = V2
		
		return V2.createViewport(p1, p2, p3)
	end,
	usableViewportSize = function(p1, p2)
		-- upvalues: v3 (ref)
		local V2 = v3 or require("@self/viewport")
		v3 = V2
		
		return V2.usableViewportSize(p1, p2)
	end,
	preferredInput = function(p1, p2)
		-- upvalues: v4 (ref)
		local V3 = v4 or require("@self/input")
		v4 = V3
		
		return V3.preferredInput(p1, p2)
	end,
	preferredInputSpec = function(p1)
		-- upvalues: v4 (ref)
		local V3 = v4 or require("@self/input")
		v4 = V3
		
		return V3.preferredInputSpec(p1)
	end,
	__resetForTests = function()
		-- upvalues: v5 (ref)
		v5 = nil
	end
}