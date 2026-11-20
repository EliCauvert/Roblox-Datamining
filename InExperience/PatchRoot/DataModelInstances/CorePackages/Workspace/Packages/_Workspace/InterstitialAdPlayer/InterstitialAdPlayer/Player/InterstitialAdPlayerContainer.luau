local InterstitialAdPlayer = script:FindFirstAncestor("InterstitialAdPlayer")
local ReactModule = require(InterstitialAdPlayer.Parent.React)
local InterstitialAdPlayerViewModule = require(InterstitialAdPlayer.Player.InterstitialAdPlayerView)
local UseInterstitialAdPlayerViewModelModule = require(InterstitialAdPlayer.Player.useInterstitialAdPlayerViewModel)

return function(p1)
	-- upvalues: UseInterstitialAdPlayerViewModelModule (copy), ReactModule (copy), InterstitialAdPlayerViewModule (copy)
	return ReactModule.createElement(InterstitialAdPlayerViewModule, (UseInterstitialAdPlayerViewModelModule(p1)))
end