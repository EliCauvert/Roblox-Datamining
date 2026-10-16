local _ = require(script:FindFirstAncestor("CoreScriptsPlayerFeedback").CaptureTypes)

return function(Capture): string --[[ Line: 8 ]]
	return if Capture.CaptureTime == nil then if Capture.LocalId == nil then tostring(Capture) else tostring(Capture.LocalId) else `{Capture.LocalId}_{Capture.CaptureTime.UnixTimestampMillis}`
end