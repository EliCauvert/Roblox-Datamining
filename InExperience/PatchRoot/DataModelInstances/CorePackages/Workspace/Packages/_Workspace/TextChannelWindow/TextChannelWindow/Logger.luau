local textChannelWindow = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "TextChannelWindow")
textChannelWindow:addSink({
	maxLevel = textChannelWindow.Levels.Warning,
	log = function(_, p0, _)
		print(p0)
	end
})

return textChannelWindow