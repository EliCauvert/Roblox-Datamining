local getComponentName = require(script.Parent.Parent.Shared).getComponentName
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local _ = require(script.Parent.ReactInternalTypes)
local ok, status = pcall(function()
	return game:DefineFastInt("ReactMicroprofilerLevel5", 0)
end)

if not ok then
	status = 0
end
function noop(...) end

local var1 = false
local var2 = nil
local var3 = 0

if status >= 5 then
	game:GetService("RunService").Heartbeat:Connect(function()
		-- upvalues: var3 (write)
		var3 = 0
	end)
end
local var4 = if status >= 5 then {
	profilebegin = function(...)
		-- upvalues: var3 (write)
		debug.profilebegin(...)
		var3 += 1
	end,
	profileend = function()
		-- upvalues: var3 (write)
		if var3 > 0 then
			debug.profileend()
			var3 -= 1
		end
	end
} else { profilebegin = noop, profileend = noop }

function startTimerSampling(p1)
	-- upvalues: var1 (write), var2 (write)
	if var1 then
		warn("RobloxReactProfiling Timer Sampling already running.")
	end
	var1 = true
	var2 = p1
end

function endTimerSampling()
	-- upvalues: var1 (write), var2 (write)
	var1 = false
	var2 = nil
end

function getFirstStringKey(p1)
	for i, v in p1 do
		if type(i) == "string" then
			return i
		end
	end
	return nil
end

function startTimer(p2)
	-- upvalues: var1 (write)
	if var1 then
		p2.startTime = os.clock()
	end
end

function endTimer(p2)
	-- upvalues: var1 (write), var2 (write)
	if var1 then
		p2.endTime = os.clock()
		
		if var2 then
			var2(p2)
		end
	end
end

function profileRootBeforeUnitOfWork(p2)
	-- upvalues: var4 (ref)
	local current = p2.current
	local var5 = nil
	
	if current then
		if current.memoizedProps then
			var5 = getFirstStringKey(current.memoizedProps)
		end
		if var5 == nil and current.stateNode and current.stateNode.containerInfo then
			var5 = current.stateNode.containerInfo.Name
		end
	end
	if var5 == "Folder" and current.child then
		local child = current.child
		local var6 = if child.memoizedProps then getFirstStringKey(child.memoizedProps) else nil
		
		if var6 == nil and child.stateNode and child.stateNode.containerInfo then
			var6 = child.stateNode.containerInfo.Name
		end
		if var6 ~= nil then
			var5 = var6
		end
	end
	if var5 == nil then
		return nil
	end
	local t = { startTime = 0, endTime = 0, id = var5 }
	startTimer(t)
	var4.profilebegin(var5)
	
	return t
end

function profileRootAfterYielding(p2)
	-- upvalues: var4 (ref)
	if p2 then
		endTimer(p2)
		var4.profileend()
	end
end

function profileUnitOfWorkBefore(p2)
	-- upvalues: getComponentName (ref), reactWorkTagsModule (ref), var4 (ref)
	local var5 = getComponentName(p2.type)
	
	if p2.key then
		var5 = tostring(p2.key) .. "=" .. (var5 or "?")
	end
	local text = nil
	
	if p2.stateNode and (p2.tag == reactWorkTagsModule.HostComponent or p2.tag == reactWorkTagsModule.HostText) then
		local layerCollector = p2.stateNode:FindFirstAncestorWhichIsA("LayerCollector")
		
		if layerCollector then
			text = "[" .. layerCollector:GetFullName() .. "] "
		end
	end
	if text then
		var5 = text .. " : " .. (var5 or "?")
	end
	if var5 == nil then
		return false
	end
	var4.profilebegin(var5)
	
	return true
end

function profileUnitOfWorkAfter(p2)
	-- upvalues: var4 (ref)
	if p2 then
		var4.profileend()
	end
end

function profileCommitBefore()
	-- upvalues: var4 (ref)
	var4.profilebegin("Commit")
end

function profileCommitAfter()
	-- upvalues: var4 (ref)
	var4.profileend()
end

return {
	startTimerSampling = startTimerSampling,
	endTimerSampling = endTimerSampling,
	profileRootBeforeUnitOfWork = if status >= 1 then profileRootBeforeUnitOfWork else noop,
	profileRootAfterYielding = if status >= 1 then profileRootAfterYielding else noop,
	profileUnitOfWorkBefore = if status >= 10 then profileUnitOfWorkBefore else noop,
	profileUnitOfWorkAfter = if status >= 10 then profileUnitOfWorkAfter else noop,
	profileCommitBefore = if status >= 5 then profileCommitBefore else noop,
	profileCommitAfter = if status >= 5 then profileCommitAfter else noop
}