local SignalsModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.Signals)
local self = setmetatable({}, { __mode = "v" })

local function _(p1, Key) --[[ Line: 17 | Named "ensureFieldSignal" ]]
	-- upvalues: SignalsModule (copy)
	local v1 = p1[Key]
	
	if v1 then
		return v1
	else
		local Signal, Signal2 = SignalsModule.createSignal(nil)
		local config = { get = Signal, set = Signal2 }
		p1[Key] = config
		
		return config
	end
end

return function(Key) --[[ Line: 40 | Named "getSduiClientPageScope" ]]
	-- upvalues: self (copy), SignalsModule (copy)
	local SelfEntry = self[Key]
	
	if SelfEntry then
		return SelfEntry
	else
		local t = {}
		local config = {
			get = function(Key) --[[ Line: 49 ]]
				-- upvalues: t (copy), SignalsModule (upval)
				local Entry = t[Key]
				local Entry1 = nil
				
				if Entry then
					Entry1 = Entry
				else
					local Signal, Signal2 = SignalsModule.createSignal(nil)
					local config = { get = Signal, set = Signal2 }
					t[Key] = config
					Entry1 = config
				end
				return Entry1.get(false)
			end,
			set = function(Key, p1) --[[ Line: 52 ]]
				-- upvalues: t (copy), SignalsModule (upval)
				local Entry = t[Key]
				local Entry1 = nil
				
				if Entry then
					Entry1 = Entry
				else
					local Signal, Signal2 = SignalsModule.createSignal(nil)
					local config = { get = Signal, set = Signal2 }
					t[Key] = config
					Entry1 = config
				end
				Entry1.set(p1)
			end,
			getSignal = function(Key) --[[ Line: 55 ]]
				-- upvalues: t (copy), SignalsModule (upval)
				local Entry = t[Key]
				local Entry1 = nil
				
				if Entry then
					Entry1 = Entry
				else
					local Signal, Signal2 = SignalsModule.createSignal(nil)
					local config = { get = Signal, set = Signal2 }
					t[Key] = config
					Entry1 = config
				end
				return Entry1.get
			end
		}
		self[Key] = config
		
		return config
	end
end