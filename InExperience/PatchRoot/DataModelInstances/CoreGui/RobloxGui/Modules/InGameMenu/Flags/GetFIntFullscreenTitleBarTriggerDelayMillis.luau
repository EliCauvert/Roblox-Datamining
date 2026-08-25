game:DefineFastInt("FullscreenTitleBarTriggerDelayMillis", 0)

return function()
	local fullscreenTitleBarTriggerDelayMillisFastInt = game:GetFastInt("FullscreenTitleBarTriggerDelayMillis")
	
	if fullscreenTitleBarTriggerDelayMillisFastInt < 0 then
		fullscreenTitleBarTriggerDelayMillisFastInt = 0
	end
	return fullscreenTitleBarTriggerDelayMillisFastInt
end