local _ = require(script:FindFirstAncestor("CoreScriptsPlayerFeedback").CaptureTypes)

return function(p0) --[[ line: 8 ]]
	return if p0.CaptureTime == nil then if p0.LocalId == nil then tostring(p0) else tostring(p0.LocalId) else `{p0.LocalId}_{p0.CaptureTime.UnixTimestampMillis}`
end