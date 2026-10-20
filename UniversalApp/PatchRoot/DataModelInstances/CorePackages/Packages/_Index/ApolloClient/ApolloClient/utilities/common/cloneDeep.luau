local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Map = LuauPolyfillModule.Map
local ObjectModule = require(Parent.luaUtils.Object)
local InstanceofFunction = LuauPolyfillModule.instanceof
local NULL = require(script.Parent.Parent.globals.null).NULL
local Callback = nil
local CloneDeepModule = {
	cloneDeep = function(p1)
		-- upvalues: Callback (ref)
		return Callback(p1)
	end
}
local list = {
	LuauPolyfillModule.Error,
	LuauPolyfillModule.Map,
	LuauPolyfillModule.WeakMap,
	LuauPolyfillModule.Set
}

Callback = function(NULL1, p1)
	-- upvalues: Array (copy), Map (copy), Callback (ref), NULL (copy), list (copy), InstanceofFunction (copy), ObjectModule (copy)
	if Array.isArray(NULL1) then
		p1 = p1 or Map.new(nil)
		
		if p1:has(NULL1) then
			return p1:get(NULL1)
		else
			local SliceResult = Array.slice(NULL1, 1)
			p1:set(NULL1, SliceResult)
			Array.forEach(SliceResult, function(p2, Key)
				-- upvalues: SliceResult (copy), Callback (upval), p1 (ref)
				SliceResult[Key] = Callback(p2, p1)
			end)
			
			return SliceResult
		end
	elseif typeof(NULL1) ~= "table" or NULL1 == NULL or not Array.every(list, function(p2): boolean
		-- upvalues: InstanceofFunction (upval), NULL1 (copy)
		return not InstanceofFunction(NULL1, p2)
	end) then
		return NULL1
	else
		p1 = p1 or Map.new(nil)
		
		if p1:has(NULL1) then
			return p1:get(NULL1)
		else
			local NewObject = ObjectModule.create(ObjectModule.getPrototypeOf(NULL1))
			p1:set(NULL1, NewObject)
			Array.forEach(ObjectModule.keys(NULL1), function(Key)
				-- upvalues: NewObject (copy), Callback (upval), NULL1 (copy), p1 (ref)
				NewObject[Key] = Callback(NULL1[Key], p1)
			end)
			
			return NewObject
		end
	end
end

return CloneDeepModule