local t = {}
local var1 = nil
local var2 = nil
local var3 = false
local var4 = nil

local function defaultClock()
	return os.clock()
end

function t._setClockForTesting(value)
	-- upvalues: defaultClock (write)
	defaultClock = value
end

function t.markClosed()
	-- upvalues: var3 (write), var1 (write), defaultClock (write), var4 (write)
	if var3 or var1 == nil then
		var1 = defaultClock()
	end
	var3 = false
	var4 = nil
end

function t.updateMetadata(p1, p2, p3, p4)
	-- upvalues: var4 (write)
	var4 = { url = p1, title = p2, isVisible = p3, hasBackButton = p4 }
end

function t.markOpen(p1, p2, p3, p4)
	-- upvalues: var3 (write), var2 (write), defaultClock (write), t (ref)
	if not var3 or var2 == nil then
		var2 = defaultClock()
	end
	var3 = true
	t.updateMetadata(p1, p2, p3, p4)
end

function t.isOpen()
	-- upvalues: var3 (write)
	return var3
end

function t.wasLastClosed()
	-- upvalues: var1 (write), defaultClock (write)
	return if var1 == nil then -1 else defaultClock() - var1
end

function t.getOpenDuration()
	-- upvalues: var2 (write), defaultClock (write)
	return if var2 == nil then -1 else defaultClock() - var2
end

function t.wasClosedWithin(p1)
	-- upvalues: var1 (write), defaultClock (write)
	return if var1 == nil then false else defaultClock() - var1 <= p1
end

function t.isOpenNoLongerThan(p1, p2)
	-- upvalues: var3 (write), var2 (write), defaultClock (write)
	return if p1 then if var2 == nil or var3 and p2 <= defaultClock() - var2 then false else var3 else var3
end

function t.getWebViewMetadata()
	-- upvalues: var4 (write)
	return var4
end

return t