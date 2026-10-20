local Parent = script:FindFirstAncestor("CameraOptIn").Parent
local Url = require(Parent.Http).Url
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.LuauPolyfill)
local v1 = nil

return function(Callback, p1)
	-- upvalues: Url (copy), v1 (ref), PromiseModule (copy)
	assert(type(p1) == "boolean", "GetCameraOptIn request expects invalidateCache to be a boolean")
	local Formatted = string.format("%s/v1/settings/avatar", Url.VOICE_URL)
	local Status = if v1 == nil then nil else v1:getStatus()
	
	if p1 then
		if Status == PromiseModule.Status.Started then
			return v1
		end
	elseif v1 and Status ~= PromiseModule.Status.Cancelled then
		return v1
	end
	v1 = Callback(Formatted, "GET"):andThen(function(Result)
		-- upvalues: PromiseModule (upval)
		local ResponseBody = Result.responseBody
		
		return if ResponseBody then PromiseModule.resolve(ResponseBody.isAvatarVideoOptIn) else PromiseModule.reject("Unexpected response fetching cameraOptIn settings")
	end, function(p2)
		-- upvalues: PromiseModule (upval)
		return PromiseModule.reject(p2)
	end)
	
	return v1
end