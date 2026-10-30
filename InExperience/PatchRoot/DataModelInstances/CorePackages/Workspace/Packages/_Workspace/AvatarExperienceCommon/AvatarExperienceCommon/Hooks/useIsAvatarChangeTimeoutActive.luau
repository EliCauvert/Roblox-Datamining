local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetTimeoutStatusStoreModule = require(AvatarExperienceCommon.Stores.TimeoutStatusStore.getTimeoutStatusStore)
local GetTimeoutEndTimeModule = require(AvatarExperienceCommon.Utils.getTimeoutEndTime)

local function _(p1)
	if p1 then
		local Success, Result = pcall(function()
			-- upvalues: p1 (copy)
			return DateTime.fromIsoDate(p1)
		end)
		
		return if Success and Result then Result.UnixTimestampMillis else nil
	else
		return nil
	end
end

return function(): boolean
	-- upvalues: GetTimeoutStatusStoreModule (copy), UseSignalStateFunction (copy), GetTimeoutEndTimeModule (copy), ReactModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetTimeoutStatusStoreModule().getStatus)
	local TimeoutEndTimeModule = GetTimeoutEndTimeModule(if UseSignalStateResult.details then UseSignalStateResult.details.endDate else nil, if UseSignalStateResult.timeoutAction then UseSignalStateResult.timeoutAction.endTime else nil)
	local UnixTimestampMillis = nil
	
	if TimeoutEndTimeModule then
		local Success, Result = pcall(function()
			-- upvalues: TimeoutEndTimeModule (copy)
			return DateTime.fromIsoDate(TimeoutEndTimeModule)
		end)
		UnixTimestampMillis = if Success and Result then Result.UnixTimestampMillis else nil
	else
		UnixTimestampMillis = nil
	end
	local NoUnixTimestampMillis: boolean = UnixTimestampMillis == nil or DateTime.now().UnixTimestampMillis < UnixTimestampMillis
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	ReactModule.useEffect(function()
		-- upvalues: NoUnixTimestampMillis (copy), UnixTimestampMillis (copy), UseStateResult2 (copy)
		if NoUnixTimestampMillis and UnixTimestampMillis ~= nil then
			local DelayedThread = task.delay((UnixTimestampMillis - DateTime.now().UnixTimestampMillis) / 1000, function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(function(p1: number): number
					return p1 + 1
				end)
			end)
			
			return function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		else
			return nil
		end
	end, {
		UnixTimestampMillis,
		NoUnixTimestampMillis,
		UseStateResult
	})
	
	return NoUnixTimestampMillis
end