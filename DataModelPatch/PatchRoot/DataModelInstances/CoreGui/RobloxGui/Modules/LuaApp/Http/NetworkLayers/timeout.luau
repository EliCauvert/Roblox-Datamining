local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local HttpErrorModule = require(Modules.LuaApp.Http.HttpError)

return function(Callback, p1: number)
	-- upvalues: PromiseModule (copy), HttpErrorModule (copy)
	assert(type(Callback) == "function", "Expected requestFunc to be a function")
	local v1 = 30
	
	if p1 then
		assert(type(p1) == "number", "Expected timout to be a number")
		assert(p1 > 0, "Expected timeout to be greater than or equal to 0")
		v1 = p1
	end
	return function(p2, p3, p4)
		-- upvalues: Callback (copy), PromiseModule (upval), v1 (ref), HttpErrorModule (upval)
		local CallbackResult = Callback(p2, p3, p4)
		
		return (PromiseModule.new(function(p5, Callback)
			-- upvalues: CallbackResult (copy), v1 (upval), HttpErrorModule (upval), p2 (copy)
			CallbackResult:andThen(p5, Callback)
			delay(v1, function()
				-- upvalues: v1 (upval), Callback (copy), HttpErrorModule (upval), p2 (upval)
				Callback(HttpErrorModule.new(p2, HttpErrorModule.Kind.LuaTimeout, (string.format("Lua Timeout of %s seconds reached.", (tostring(v1))))))
			end)
		end))
	end
end