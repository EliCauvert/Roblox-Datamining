local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local _ = require(Parent.Signals)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal
local _ = require(Parent.React)
local _ = require(Parent.EditProfileBackground)

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction({})
	local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignalFunction({})
	
	return {
		getScenes = SessionScopedSignal,
		setScene = function(Key, p1)
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
			local SessionScopedSignalResult = SessionScopedSignal(false)
			
			if SessionScopedSignalResult[Key] ~= p1 then
				local Copy = table.clone(SessionScopedSignalResult)
				Copy[Key] = p1
				SessionScopedSignal2(Copy)
				
				return
			end
		end,
		clearScene = function(Key, p1)
			-- upvalues: SessionScopedSignal (copy), SessionScopedSignal2 (copy)
			local SessionScopedSignalResult = SessionScopedSignal(false)
			
			if SessionScopedSignalResult[Key] == p1 then
				local Copy = table.clone(SessionScopedSignalResult)
				Copy[Key] = nil
				SessionScopedSignal2(Copy)
				
				return
			end
		end,
		getChromeFades = SessionScopedSignal1,
		setChromeFade = function(Key, p1)
			-- upvalues: SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy)
			local SessionScopedSignalResult = SessionScopedSignal1(false)
			
			if SessionScopedSignalResult[Key] ~= p1 then
				local Copy = table.clone(SessionScopedSignalResult)
				Copy[Key] = p1
				SessionScopedSignal2_1(Copy)
				
				return
			end
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy)
			SessionScopedSignal2({})
			SessionScopedSignal2_1({})
		end
	}
end