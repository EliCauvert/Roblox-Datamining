game:DefineFastInt("FullscreenTitleBarTriggerDelayMillis", 0)

return function() --[[ line: 5 ]]
	local fullscreenTitleBarTriggerDelayMillisFastInt = game:GetFastInt("FullscreenTitleBarTriggerDelayMillis")
	
	if fullscreenTitleBarTriggerDelayMillisFastInt < 0 then
		fullscreenTitleBarTriggerDelayMillisFastInt = 0
	end
	return fullscreenTitleBarTriggerDelayMillisFastInt
end