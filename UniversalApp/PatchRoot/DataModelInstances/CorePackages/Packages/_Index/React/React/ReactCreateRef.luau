local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local ReactBindingRobloxModule = require(script.Parent["ReactBinding.roblox"])
local ReactCreateRefModule = {
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

local function refNewIndex(p1, Key, p2)
	-- upvalues: ReactBindingRobloxModule (copy)
	local Index = getmetatable(p1).__index
	Index[Key] = p2
	
	if Key == "current" then
		ReactBindingRobloxModule.update(Index, p2)
	end
end

local function refToString(p1): string
	return string.format("Ref(%s)", (tostring(getmetatable(p1).__index:getValue())))
end

local function createRefWithoutClosures()
	-- upvalues: ReactGlobalsModule (copy), ReactBindingRobloxModule (copy), refNewIndex (copy), refToString (copy)
	return (setmetatable({}, {
		__index = ReactBindingRobloxModule.createWithoutUpdater(nil, if ReactGlobalsModule.__DEV__ then debug.traceback("Ref created at:", 1) else nil),
		__newindex = refNewIndex,
		__tostring = refToString
	}))
end

if require(Parent.Shared).ReactFeatureFlags.enableAllocationTrims then
	ReactCreateRefModule.createRef = createRefWithoutClosures
end
return ReactCreateRefModule