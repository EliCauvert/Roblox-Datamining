local _ = require(script:FindFirstAncestor("WhatsNew").Types)

return {
	registerAnchorReady = function(p1, p2)
		p1.registerAnchor(p2, Instance.new("Frame"))
		p1.setAnchorReady(p2, true)
	end,
	registerNestedWhatsNewAnchors = function(p1)
		p1.registerAnchor("gameMenuTilt", Instance.new("Frame"))
		p1.setAnchorReady("gameMenuTilt", true)
		p1.registerAnchor("inGameSideSheetA", Instance.new("Frame"))
		p1.setAnchorReady("inGameSideSheetA", true)
		p1.registerAnchor("inGameSideSheetB", Instance.new("Frame"))
		p1.setAnchorReady("inGameSideSheetB", true)
		p1.registerAnchor("LeaveRespawn", Instance.new("Frame"))
		p1.setAnchorReady("LeaveRespawn", true)
	end,
	registerDoubleNestedAnchors = function(p1)
		p1.registerAnchor("gameMenuTilt", Instance.new("Frame"))
		p1.setAnchorReady("gameMenuTilt", true)
		p1.registerAnchor("settingsGatewayAnchor", Instance.new("Frame"))
		p1.setAnchorReady("settingsGatewayAnchor", true)
		p1.registerAnchor("settingsTipAnchor", Instance.new("Frame"))
		p1.setAnchorReady("settingsTipAnchor", true)
	end
}