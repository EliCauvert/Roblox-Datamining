local QRCodeDisplay = script:FindFirstAncestor("QRCodeDisplay")
local displayQRCodeModule = require(script.Parent.DisplayQRCode)
local reactModule = require(QRCodeDisplay.Parent.React)
local ECLevelsModule = require(QRCodeDisplay.Common.ECLevels)

return {
	SimpleMatrix = function()
		-- upvalues: reactModule (ref), displayQRCodeModule (ref), ECLevelsModule (ref)
		return reactModule.createElement(displayQRCodeModule, {
			sideLength = 100,
			toEncode = "https://www.bbc.com/news",
			ecLevel = ECLevelsModule.EC_LEVEL_1
		})
	end,
	LoadingMatrix = function()
		-- upvalues: reactModule (ref), displayQRCodeModule (ref), ECLevelsModule (ref)
		return reactModule.createElement(displayQRCodeModule, {
			isLoading = true,
			sideLength = 200,
			toEncode = "",
			ecLevel = ECLevelsModule.EC_LEVEL_1
		})
	end,
	SuperComplexMatrix = function()
		-- upvalues: reactModule (ref), displayQRCodeModule (ref), ECLevelsModule (ref)
		return reactModule.createElement(displayQRCodeModule, {
			sideLength = 400,
			toEncode = "https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite",
			ecLevel = ECLevelsModule.EC_LEVEL_4
		})
	end
}