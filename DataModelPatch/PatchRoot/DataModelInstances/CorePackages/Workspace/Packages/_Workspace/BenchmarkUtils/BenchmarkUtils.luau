local BenchmarkUtilsModule = require(script.benchmarkUtils)

return {
	benchFile = BenchmarkUtilsModule.benchFile,
	measureFPS = BenchmarkUtilsModule.measureFPS,
	mountComponentTimes = BenchmarkUtilsModule.mountComponentTimes,
	scrollComponentTimes = BenchmarkUtilsModule.scrollComponentTimes,
	benchmarkRender = BenchmarkUtilsModule.benchmarkRender,
	benchmarkRerender = BenchmarkUtilsModule.benchmarkRerender,
	AutoScrollingFrame = BenchmarkUtilsModule.AutoScrollingFrame,
	DEFAULT_MOUNT_TIMES = BenchmarkUtilsModule.DEFAULT_MOUNT_TIMES,
	DEFAULT_SCROLL_TIMES = BenchmarkUtilsModule.DEFAULT_SCROLL_TIMES,
	DEFAULT_FPS_DURATION = BenchmarkUtilsModule.DEFAULT_FPS_DURATION
}