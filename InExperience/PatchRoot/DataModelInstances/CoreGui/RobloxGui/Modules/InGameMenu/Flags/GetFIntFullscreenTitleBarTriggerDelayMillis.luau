game:DefineFastInt("FullscreenTitleBarTriggerDelayMillis", 0)

return function() --[[ Line: 5 ]]
	local FullscreenTitleBarTriggerDelayMillisFastInt = game:GetFastInt("FullscreenTitleBarTriggerDelayMillis")
	
	if FullscreenTitleBarTriggerDelayMillisFastInt < 0 then
		FullscreenTitleBarTriggerDelayMillisFastInt = 0
	end
	return FullscreenTitleBarTriggerDelayMillisFastInt
end