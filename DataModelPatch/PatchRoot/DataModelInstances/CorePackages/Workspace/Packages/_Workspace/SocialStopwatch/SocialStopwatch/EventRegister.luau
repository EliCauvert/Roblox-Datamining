local EventsModule = require(script.Parent.Events)
local EventModesModule = require(script.Parent.EventModes)

return {
	[EventsModule.TestEvent] = { mode = EventModesModule.Default },
	[EventsModule.TestStrictEvent] = { mode = EventModesModule.Strict },
	[EventsModule.CaptureShared] = { mode = EventModesModule.Default },
	[EventsModule.CaptureTaken] = { mode = EventModesModule.Default },
	[EventsModule.EditProfileOpened] = { mode = EventModesModule.Default },
	[EventsModule.ProfileOpened] = { mode = EventModesModule.Default },
	[EventsModule.JoinGameCardOpened] = { mode = EventModesModule.Default },
	[EventsModule.PYMKCarouselLoaded] = { mode = EventModesModule.Default },
	[EventsModule.AFPUserTileLoadFromHomeCarousel] = { mode = EventModesModule.Default },
	[EventsModule.CustomizeNameOpened] = { mode = EventModesModule.Default },
	[EventsModule.StaticShareLinkOpened] = { mode = EventModesModule.Default },
	[EventsModule.ShareLinkOpened] = { mode = EventModesModule.Default }
}