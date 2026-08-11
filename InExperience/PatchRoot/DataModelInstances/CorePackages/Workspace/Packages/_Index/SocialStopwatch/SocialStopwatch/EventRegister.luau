local eventsModule = require(script.Parent.Events)
local eventModesModule = require(script.Parent.EventModes)

return {
	[eventsModule.TestEvent] = { mode = eventModesModule.Default },
	[eventsModule.TestStrictEvent] = { mode = eventModesModule.Strict },
	[eventsModule.CaptureShared] = { mode = eventModesModule.Default },
	[eventsModule.CaptureTaken] = { mode = eventModesModule.Default },
	[eventsModule.ProfileOpened] = { mode = eventModesModule.Default },
	[eventsModule.JoinGameCardOpened] = { mode = eventModesModule.Default },
	[eventsModule.PYMKCarouselLoaded] = { mode = eventModesModule.Default },
	[eventsModule.AFPUserTileLoadFromHomeCarousel] = { mode = eventModesModule.Default },
	[eventsModule.CustomizeNameOpened] = { mode = eventModesModule.Default },
	[eventsModule.StaticShareLinkOpened] = { mode = eventModesModule.Default },
	[eventsModule.ShareLinkOpened] = { mode = eventModesModule.Default }
}