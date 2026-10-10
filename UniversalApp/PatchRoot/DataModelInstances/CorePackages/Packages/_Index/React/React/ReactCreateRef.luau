local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local enableAllocationTrims = require(parent.Shared).ReactFeatureFlags.enableAllocationTrims
local unknownModule = require(script.Parent["ReactBinding.roblox"])
local t = {
	createRef = function()
		-- upvalues: unknownModule (ref), reactGlobalsModule (ref)
		local var1, _ = unknownModule.create(nil)
		local t = {}
		
		if reactGlobalsModule.__DEV__ then
			var1._source = debug.traceback("Ref created at:", 1)
		end
		setmetatable(t, {
			__index = function(_, p1)
				-- upvalues: var1 (ref)
				return if p1 == "current" then var1:getValue() else var1[p1]
			end,
			__newindex = function(_, p1, p2)
				-- upvalues: unknownModule (copy), var1 (ref)
				if p1 == "current" then
					unknownModule.update(var1, p2)
				end
				var1[p1] = p2
			end,
			__tostring = function(_)
				-- upvalues: var1 (ref)
				return string.format("Ref(%s)", tostring(var1:getValue()))
			end
		})
		
		return t
	end
}

local function refNewIndex(p1, p2, p3)
	-- upvalues: unknownModule (ref)
	local index = getmetatable(p1).__index
	index[p2] = p3
	
	if p2 == "current" then
		unknownModule.update(index, p3)
	end
end

local function refToString(p1)
	return string.format("Ref(%s)", tostring(getmetatable(p1).__index:getValue()))
end

local function createRefWithoutClosures()
	-- upvalues: reactGlobalsModule (ref), unknownModule (ref), refNewIndex (ref), refToString (ref)
	return setmetatable({}, {
		__index = unknownModule.createWithoutUpdater(nil, if reactGlobalsModule.__DEV__ then debug.traceback("Ref created at:", 1) else nil),
		__newindex = refNewIndex,
		__tostring = refToString
	})
end

if enableAllocationTrims then
	t.createRef = createRefWithoutClosures
end
return t