local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local CommentTimestampModule = require(script.Parent.commentTimestamp)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	minutes = "Feature.Moments.Label.CommentTimestampMinutes",
	hours = "Feature.Moments.Label.CommentTimestampHours",
	days = "Feature.Moments.Label.CommentTimestampDays",
	weeks = "Feature.Moments.Label.CommentTimestampWeeks",
	months = "Feature.Moments.Label.CommentTimestampMonths",
	years = "Feature.Moments.Label.CommentTimestampYears"
}

return function(p1) --[[ Line: 25 | Named "useCommentTimestamp" ]]
	-- upvalues: ReactModule (copy), CommentTimestampModule (copy), UseLocalizationFunction (copy), config (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 26 ]]
		-- upvalues: CommentTimestampModule (upval), p1 (copy)
		return CommentTimestampModule.parseTimestamp(p1)
	end, { p1 })
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 29 ]]
		return DateTime.now().UnixTimestampMillis
	end)
	ReactModule.useEffect(function() --[[ Line: 33 ]]
		-- upvalues: UseStateResult2 (copy), UseMemoResult (copy), CommentTimestampModule (upval)
		UseStateResult2(DateTime.now().UnixTimestampMillis)
		
		if UseMemoResult == nil then return end
		local Flag = false
		local DelayedThread = nil
		
		local function scheduleUpdate() --[[ Line: 42 ]]
			-- upvalues: CommentTimestampModule (upval), UseMemoResult (upval), DelayedThread (ref), Flag (ref), UseStateResult2 (upval), scheduleUpdate (copy)
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			local NextChangeTimestamp = CommentTimestampModule.getNextChangeTimestamp(UseMemoResult, UnixTimestampMillis)
			
			if NextChangeTimestamp == nil then
				DelayedThread = nil
				
				return
			else
				DelayedThread = task.delay(math.max(0, NextChangeTimestamp - UnixTimestampMillis) / 1000, function() --[[ Line: 50 ]]
					-- upvalues: DelayedThread (upval), Flag (upval), UseStateResult2 (upval), scheduleUpdate (upval)
					DelayedThread = nil
					
					if not Flag then
						UseStateResult2(DateTime.now().UnixTimestampMillis)
						scheduleUpdate()
						
						return
					end
				end)
			end
		end
		
		scheduleUpdate()
		
		return function() --[[ Line: 61 ]]
			-- upvalues: Flag (ref), DelayedThread (ref)
			Flag = true
			
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
		end
	end, { UseMemoResult })
	local RelativeAge = CommentTimestampModule.getRelativeAge(UseMemoResult, UseStateResult)
	local UseLocalizationResult = UseLocalizationFunction({
		timestamp = if RelativeAge == nil then nil elseif RelativeAge.unit == "now" then "Feature.Moments.Label.CommentTimestampNow" else { config[RelativeAge.unit], count = RelativeAge.count }
	})
	
	return if RelativeAge == nil then nil else UseLocalizationResult.timestamp
end