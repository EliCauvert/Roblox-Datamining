local textChannelWindow = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "TextChannelWindow")
textChannelWindow:addSink({
	maxLevel = textChannelWindow.Levels.Warning,
	log = function(_, p1, _)
		print(p1)
	end
})

return textChannelWindow