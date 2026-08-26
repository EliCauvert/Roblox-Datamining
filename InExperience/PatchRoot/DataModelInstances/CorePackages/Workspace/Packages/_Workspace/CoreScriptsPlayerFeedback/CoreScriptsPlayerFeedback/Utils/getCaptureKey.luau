local _ = require(script:FindFirstAncestor("CoreScriptsPlayerFeedback").CaptureTypes)

return function(p1)
	return if p1.CaptureTime == nil then if p1.LocalId == nil then tostring(p1) else tostring(p1.LocalId) else `{p1.LocalId}_{p1.CaptureTime.UnixTimestampMillis}`
end