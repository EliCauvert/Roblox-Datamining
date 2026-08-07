return {
	["jest.config"] = script["jest.config"],
	BacktraceReporter = require(script.Backtrace.BacktraceReporter),
	SentryReporter = require(script.Sentry.SentryReporter),
	ErrorReport = require(script.Sentry.ErrorReport),
	ErrorQueue = require(script.ErrorQueue),
	TokenBucketRateLimiter = require(script.TokenBucketRateLimiter),
	FFlagLuaAppEnableBacktraceSessionInfo = require(script.Backtrace.Flags.FFlagLuaAppEnableBacktraceSessionInfo)
}