local Signal = require(script.Parent.AppCommonLib).Signal

return {
	ReloadPage = Signal.new(),
	ReportMutedError = Signal.new()
}