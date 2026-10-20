local CrossPlay = script:FindFirstAncestor("CrossPlay")
local PlatformServiceOrStubModule = require(CrossPlay.ServiceWrappers.PlatformServiceOrStub)
local Parent = CrossPlay.Parent
local CryoModule = require(Parent.Cryo)
local PromiseModule = require(Parent.Promise)
local CrossPlayCapabilities = require(Parent.UniversalAppPolicy).Enum.CrossPlayCapabilities
local PrivilegeCodes = require(script.Parent.Constants).PrivilegeCodes

return function(p1)
	-- upvalues: CryoModule (copy), CrossPlayCapabilities (copy), PromiseModule (copy), PlatformServiceOrStubModule (copy), PrivilegeCodes (copy)
	local JoinResult = CryoModule.List.join({ CrossPlayCapabilities.CrossPlatform }, p1 or {})
	
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
		-- upvalues: CryoModule (upval), JoinResult (copy), PlatformServiceOrStubModule (upval), PrivilegeCodes (upval)
		local Success, Result = pcall(function()
			-- upvalues: CryoModule (upval), JoinResult (upval), PlatformServiceOrStubModule (upval), PrivilegeCodes (upval)
			return CryoModule.List.foldLeft(JoinResult, function(p2, p3)
				-- upvalues: CryoModule (upval), PlatformServiceOrStubModule (upval), PrivilegeCodes (upval)
				return CryoModule.Dictionary.join(p2, {
					[p3] = PlatformServiceOrStubModule:BeginCheckXboxPrivilege(PrivilegeCodes[p3])
				})
			end, {})
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1(Result)
		end
	end)
end