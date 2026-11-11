local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local _ = require(Parent.Shared)
local ReactBindingRobloxModule = require(script.Parent["ReactBinding.roblox"])

return {
	createRef = function()
		-- upvalues: ReactBindingRobloxModule (copy), ReactGlobalsModule (copy)
		local NewReactBindingRoblox, _ = ReactBindingRobloxModule.create(nil)
		local t = {}
		
		if ReactGlobalsModule.__DEV__ then
			NewReactBindingRoblox._source = debug.traceback("Ref created at:", 1)
		end
		setmetatable(t, {
			__index = function(_, p1)
				-- upvalues: NewReactBindingRoblox (copy)
				return if p1 == "current" then NewReactBindingRoblox:getValue() else NewReactBindingRoblox[p1]
			end,
			__newindex = function(_, Key, p1)
				-- upvalues: ReactBindingRobloxModule (upval), NewReactBindingRoblox (copy)
				if Key == "current" then
					ReactBindingRobloxModule.update(NewReactBindingRoblox, p1)
				end
				NewReactBindingRoblox[Key] = p1
			end,
			__tostring = function(_): string
				-- upvalues: NewReactBindingRoblox (copy)
				return string.format("Ref(%s)", (tostring(NewReactBindingRoblox:getValue())))
			end
		})
		
		return t
	end
}