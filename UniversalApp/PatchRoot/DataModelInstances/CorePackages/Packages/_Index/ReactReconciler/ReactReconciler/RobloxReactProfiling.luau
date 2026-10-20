local GetComponentNameFunction = require(script.Parent.Parent.Shared).getComponentName
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local _ = require(script.Parent.ReactInternalTypes)
local Success, Result = pcall(function()
	return game:DefineFastInt("ReactMicroprofilerLevel5", 0)
end)

if not Success then
	Result = 0
end
function noop(...) end

local Flag = false
local Callback = nil
local Count = 0

if Result >= 5 then
	game:GetService("RunService").Heartbeat:Connect(function()
		-- upvalues: Count (ref)
		Count = 0
	end)
end
local Config = if Result >= 5 then {
	profilebegin = function(...)
		-- upvalues: Count (ref)
		debug.profilebegin(...)
		Count += 1
	end,
	profileend = function()
		-- upvalues: Count (ref)
		if Count > 0 then
			debug.profileend()
			Count -= 1
		end
	end
} else { profilebegin = noop, profileend = noop }

function startTimerSampling(p1)
	-- upvalues: Flag (ref), Callback (ref)
	if Flag then
		warn("RobloxReactProfiling Timer Sampling already running.")
	end
	Flag = true
	Callback = p1
end

function endTimerSampling()
	-- upvalues: Flag (ref), Callback (ref)
	Flag = false
	Callback = nil
end

function getFirstStringKey(List)
	for i, _ in List do
		if type(i) == "string" then
			return i
		end
	end
	return nil
end

function startTimer(p1)
	-- upvalues: Flag (ref)
	if Flag then
		p1.startTime = os.clock()
	end
end

function endTimer(p1)
	-- upvalues: Flag (ref), Callback (ref)
	if Flag then
		p1.endTime = os.clock()
		
		if Callback then
			Callback(p1)
		end
	end
end

function profileRootBeforeUnitOfWork(p1)
	-- upvalues: Config (copy)
	local Current = p1.current
	local FirstStringKey = nil
	
	if Current then
		if Current.memoizedProps then
			FirstStringKey = getFirstStringKey(Current.memoizedProps)
		end
		if FirstStringKey == nil and Current.stateNode and Current.stateNode.containerInfo then
			FirstStringKey = Current.stateNode.containerInfo.Name
		end
	end
	if FirstStringKey == "Folder" and Current.child then
		local Child = Current.child
		local FirstStringKey1 = if Child.memoizedProps then getFirstStringKey(Child.memoizedProps) else nil
		
		if FirstStringKey1 == nil and Child.stateNode and Child.stateNode.containerInfo then
			FirstStringKey1 = Child.stateNode.containerInfo.Name
		end
		if FirstStringKey1 ~= nil then
			FirstStringKey = FirstStringKey1
		end
	end
	if FirstStringKey == nil then
		return nil
	else
		local config = { startTime = 0, endTime = 0, id = FirstStringKey }
		startTimer(config)
		Config.profilebegin(FirstStringKey)
		
		return config
	end
end

function profileRootAfterYielding(p1)
	-- upvalues: Config (copy)
	if p1 then
		endTimer(p1)
		Config.profileend()
	end
end

function profileUnitOfWorkBefore(p1): boolean
	-- upvalues: GetComponentNameFunction (copy), ReactWorkTagsModule (copy), Config (copy)
	local ComponentName = GetComponentNameFunction(p1.type)
	
	if p1.key then
		ComponentName = tostring(p1.key) .. "=" .. (ComponentName or "?")
	end
	local v1: string? = nil
	
	if p1.stateNode and (p1.tag == ReactWorkTagsModule.HostComponent or p1.tag == ReactWorkTagsModule.HostText) then
		local LayerCollector = p1.stateNode:FindFirstAncestorWhichIsA("LayerCollector")
		
		if LayerCollector then
			v1 = "[" .. LayerCollector:GetFullName() .. "] "
		end
	end
	if v1 then
		ComponentName = v1 .. " : " .. (ComponentName or "?")
	end
	if ComponentName == nil then
		return false
	else
		Config.profilebegin(ComponentName)
		
		return true
	end
end

function profileUnitOfWorkAfter(p1)
	-- upvalues: Config (copy)
	if p1 then
		Config.profileend()
	end
end

function profileCommitBefore()
	-- upvalues: Config (copy)
	Config.profilebegin("Commit")
end

function profileCommitAfter()
	-- upvalues: Config (copy)
	Config.profileend()
end

return {
	startTimerSampling = startTimerSampling,
	endTimerSampling = endTimerSampling,
	profileRootBeforeUnitOfWork = if Result >= 1 then profileRootBeforeUnitOfWork else noop,
	profileRootAfterYielding = if Result >= 1 then profileRootAfterYielding else noop,
	enableUnitOfWorkProfiling = Result >= 10,
	profileUnitOfWorkBefore = if Result >= 10 then profileUnitOfWorkBefore else noop,
	profileUnitOfWorkAfter = if Result >= 10 then profileUnitOfWorkAfter else noop,
	profileCommitBefore = if Result >= 5 then profileCommitBefore else noop,
	profileCommitAfter = if Result >= 5 then profileCommitAfter else noop
}