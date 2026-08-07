local signal = require(script.Parent.AppCommonLib).Signal

return {
	ReloadPage = signal.new(),
	ReportMutedError = signal.new()
}