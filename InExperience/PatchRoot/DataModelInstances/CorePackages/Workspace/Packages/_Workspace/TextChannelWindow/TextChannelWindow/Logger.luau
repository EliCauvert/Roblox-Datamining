local TextChannelWindow = require(script.Parent.Parent.Lumberyak).Logger.new(nil, "TextChannelWindow")
TextChannelWindow:addSink({
	maxLevel = TextChannelWindow.Levels.Warning,
	log = function(_, p1, _) --[[ Line: 8 ]]
		print(p1)
	end
})

return TextChannelWindow