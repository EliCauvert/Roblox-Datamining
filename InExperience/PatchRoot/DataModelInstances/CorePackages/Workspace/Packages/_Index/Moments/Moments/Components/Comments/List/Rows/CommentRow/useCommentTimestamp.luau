local parent = script:FindFirstAncestor("Moments").Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local commentTimestampModule = require(script.Parent.commentTimestamp)
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
	minutes = "Feature.Moments.Label.CommentTimestampMinutes",
	hours = "Feature.Moments.Label.CommentTimestampHours",
	days = "Feature.Moments.Label.CommentTimestampDays",
	weeks = "Feature.Moments.Label.CommentTimestampWeeks",
	months = "Feature.Moments.Label.CommentTimestampMonths",
	years = "Feature.Moments.Label.CommentTimestampYears"
}

return function(p1)
	-- upvalues: reactModule (ref), commentTimestampModule (ref), useLocalization (ref), t (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: commentTimestampModule (copy), p1 (ref)
		return commentTimestampModule.parseTimestamp(p1)
	end, { p1 })
	local var2, var3 = reactModule.useState(function()
		return DateTime.now().UnixTimestampMillis
	end)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref), commentTimestampModule (copy)
		var3(DateTime.now().UnixTimestampMillis)
		
		if var1 == nil then
			return
		end
		local var4 = false
		local var5 = nil
		
		local function scheduleUpdate()
			-- upvalues: commentTimestampModule (copy), var1 (copy), var5 (write), var4 (write), var3 (copy), scheduleUpdate (ref)
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			local nextChangeTimestamp = commentTimestampModule.getNextChangeTimestamp(var1, unixTimestampMillis)
			
			if nextChangeTimestamp == nil then
				var5 = nil
				
				return
			end
			var5 = task.delay(math.max(0, nextChangeTimestamp - unixTimestampMillis) / 1000, function()
				-- upvalues: var5 (copy), var4 (copy), var3 (copy), scheduleUpdate (copy)
				var5 = nil
				
				if var4 then
					return
				end
				var3(DateTime.now().UnixTimestampMillis)
				scheduleUpdate()
			end)
		end
		
		scheduleUpdate()
		
		return function()
			-- upvalues: var4 (write), var5 (write)
			var4 = true
			
			if var5 ~= nil then
				task.cancel(var5)
				var5 = nil
			end
		end
	end, { var1 })
	local relativeAge = commentTimestampModule.getRelativeAge(var1, var2)
	
	return if relativeAge == nil then nil else useLocalization({
		timestamp = if relativeAge == nil then nil elseif relativeAge.unit == "now" then "Feature.Moments.Label.CommentTimestampNow" else { t[relativeAge.unit], count = relativeAge.count }
	}).timestamp
end