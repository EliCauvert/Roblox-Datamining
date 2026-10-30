local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local CreateSessionScopedSignalFunction = require(Parent.SignalsUtils).createSessionScopedSignal

local function createEmptyOrderedList()
	return {}
end

local function createEmptyRemovedList()
	return {}
end

local function alwaysNotifyEquals(_, _): boolean
	return false
end

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy), createEmptyOrderedList (copy), alwaysNotifyEquals (copy), createEmptyRemovedList (copy), SignalsExperimentalModule (copy), CryoModule (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction(createEmptyOrderedList, alwaysNotifyEquals)
	local SessionScopedSignal1, SessionScopedSignal2_1 = CreateSessionScopedSignalFunction(createEmptyRemovedList)
	
	return {
		getOrderedList = SessionScopedSignal,
		getRemovedList = SessionScopedSignal1,
		setCurrentSort = function(p1)
			-- upvalues: SessionScopedSignal2 (copy)
			if p1 ~= nil then
				SessionScopedSignal2(p1)
				
				return
			end
		end,
		clearCurrentSort = function()
			-- upvalues: SignalsExperimentalModule (upval), SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy)
			SignalsExperimentalModule.batch(function()
				-- upvalues: SessionScopedSignal2 (upval), SessionScopedSignal2_1 (upval)
				SessionScopedSignal2({})
				SessionScopedSignal2_1({})
			end)
		end,
		addRemovedItem = function(p1, p2)
			-- upvalues: SessionScopedSignal1 (copy), SessionScopedSignal2_1 (copy), CryoModule (upval)
			SessionScopedSignal2_1(CryoModule.Dictionary.join(SessionScopedSignal1(false) or {}, { [p1] = p2 }))
		end,
		clearRemovedItems = function()
			-- upvalues: SessionScopedSignal2_1 (copy)
			SessionScopedSignal2_1({})
		end,
		reset = function()
			-- upvalues: SignalsExperimentalModule (upval), SessionScopedSignal2 (copy), SessionScopedSignal2_1 (copy)
			SignalsExperimentalModule.batch(function()
				-- upvalues: SessionScopedSignal2 (upval), SessionScopedSignal2_1 (upval)
				SessionScopedSignal2({})
				SessionScopedSignal2_1({})
			end)
		end
	}
end