local _ = require(script.Parent.createMarqueeSessionStore)

return {
	MarqueeSessionContext = require(script:FindFirstAncestor("SocialCarousel").Parent.React).createContext(nil)
}