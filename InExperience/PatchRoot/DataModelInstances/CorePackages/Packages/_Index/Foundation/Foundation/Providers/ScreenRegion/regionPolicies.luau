local Foundation = script:FindFirstAncestor("Foundation")

return {
	[require(Foundation.Providers.ScreenRegion.ScreenRegion).Bottom] = {
		capacity = 1,
		sequential = true,
		order = require(Foundation.Providers.ScreenRegion.RegionOrder).Newest,
		displaced = {
			[require(Foundation.Providers.ScreenRegion.ScreenRegionKind).FloatingBanner] = require(Foundation.Providers.ScreenRegion.DisplacedBehavior).Suspend
		}
	}
}