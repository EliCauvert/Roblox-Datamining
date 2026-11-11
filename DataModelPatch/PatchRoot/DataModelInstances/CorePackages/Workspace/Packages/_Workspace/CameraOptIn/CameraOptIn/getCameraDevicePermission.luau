local Parent = script:FindFirstAncestor("CameraOptIn").Parent
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)
local Default = require(Parent.PermissionsProtocol).PermissionsProtocol.default
local v1 = nil

return function()
	-- upvalues: v1 (ref), PromiseModule (copy), Default (copy)
	local Status = if v1 == nil then nil else v1:getStatus()
	
	if v1 and Status ~= PromiseModule.Status.Cancelled then
		return v1
	else
		v1 = Default:hasPermissions({ Default.Permissions.CAMERA_ACCESS }):andThen(function(Result)
			-- upvalues: Default (upval), PromiseModule (upval)
			return if Result.status == Default.Status.AUTHORIZED then PromiseModule.resolve(true) else Default:requestPermissions({ Default.Permissions.CAMERA_ACCESS }):andThen(function(Result)
				-- upvalues: PromiseModule (upval), Default (upval)
				return PromiseModule.resolve(Result.status == Default.Status.AUTHORIZED)
			end, function(p1)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.reject(p1)
			end)
		end)
		
		return v1
	end
end