local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Packages.LuauPolyfill)
local ReactModule = require(CorePackages.Packages.React)
local RequestStatusEnumModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Enum.RequestStatusEnum)
local PromiseModule = require(CorePackages.Packages.Promise)

return function(Callback)
	-- upvalues: ReactModule (copy), RequestStatusEnumModule (copy), PromiseModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({ status = RequestStatusEnumModule.None })
	local Ref = ReactModule.createRef()
	
	return UseStateResult, (ReactModule.useCallback(function()
		-- upvalues: Ref (copy), PromiseModule (upval), UseStateResult2 (copy), RequestStatusEnumModule (upval), Callback (copy)
		if Ref.current then
			return PromiseModule.resolve()
		else
			UseStateResult2({ status = RequestStatusEnumModule.Pending })
			Ref.current = true
			
			return Callback():andThen(function(Result)
				-- upvalues: UseStateResult2 (upval), RequestStatusEnumModule (upval), Ref (upval)
				UseStateResult2({
					status = RequestStatusEnumModule.Resolved,
					response = Result
				})
				Ref.current = false
			end, function(Response)
				-- upvalues: UseStateResult2 (upval), RequestStatusEnumModule (upval), Ref (upval)
				UseStateResult2({
					status = RequestStatusEnumModule.Rejected,
					response = Response
				})
				Ref.current = false
			end)
		end
	end, { Callback, Ref.current }))
end