local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Set = LuauPolyfillModule.Set
local Array = LuauPolyfillModule.Array
local _ = require(script.Parent.anyEntryTypes)
local _ = require(script.Parent.initTypes)
local ParentEntrySlot = require(script.Parent.context).parentEntrySlot
local HelpersModule = require(script.Parent.helpers)
local HasOwnPropertyFunction = HelpersModule.hasOwnProperty
local MaybeUnsubscribeFunction = HelpersModule.maybeUnsubscribe
local ToArrayFunction = HelpersModule.toArray
local config = { setDirty = true, dispose = true, forget = true }
local _ = require(script.Parent.depTypes)

return {
	dep = function(p1)
		-- upvalues: ParentEntrySlot (copy), Set (copy), MaybeUnsubscribeFunction (copy), HasOwnPropertyFunction (copy), config (copy), Array (copy), ToArrayFunction (copy)
		local NewResults = {}
		local Subscribe = if p1 == nil then p1 else p1.subscribe
		local self = setmetatable({}, {
			__call = function(_, Key)
				-- upvalues: ParentEntrySlot (upval), NewResults (copy), Set (upval), Subscribe (copy), MaybeUnsubscribeFunction (upval)
				local Value = ParentEntrySlot:getValue()
				
				if Value ~= nil then
					local NewResult = NewResults[Key]
					
					if not NewResult then
						NewResult = Set.new()
						NewResults[Key] = NewResult
					end
					Value:dependOn(NewResult)
					
					if type(Subscribe) == "function" then
						MaybeUnsubscribeFunction(NewResult)
						NewResult.unsubscribe = Subscribe(Key)
					end
				end
			end
		})
		
		function self:dirty(Key, p2)
			-- upvalues: NewResults (copy), HasOwnPropertyFunction (upval), config (upval), Array (upval), ToArrayFunction (upval), MaybeUnsubscribeFunction (upval)
			local NewResult = NewResults[Key]
			
			if NewResult then
				local SetDirty = if p2 and HasOwnPropertyFunction(config, p2) then p2 else "setDirty"
				Array.forEach(ToArrayFunction(NewResult), function(p3)
					-- upvalues: SetDirty (copy)
					p3[SetDirty](p3)
				end)
				NewResults[Key] = nil
				MaybeUnsubscribeFunction(NewResult)
			end
		end
		
		return self
	end
}