local parent = script:FindFirstAncestor("QRCodeDisplay").Parent
local displayQRCodeFromMatrixModule = require(script.Parent.DisplayQRCodeFromMatrix)
local reactModule = require(parent.React)
local QRCodeModule = require(parent.QRCode)

return {
	SimpleMatrix = function()
		-- upvalues: reactModule (ref), displayQRCodeFromMatrixModule (ref)
		return reactModule.createElement(displayQRCodeFromMatrixModule, { sideLength = 100, qrCodeMatrix = { { 1, 0 }, { 1, 0 } } })
	end,
	ComplexMatrix = function()
		-- upvalues: QRCodeModule (ref), reactModule (ref), displayQRCodeFromMatrixModule (ref)
		local _, var1 = QRCodeModule.qrcode("https://www.bbc.com/news", 4)
		
		return reactModule.createElement(displayQRCodeFromMatrixModule, { sideLength = 200, qrCodeMatrix = var1 })
	end,
	SuperComplexMatrix = function()
		-- upvalues: QRCodeModule (ref), reactModule (ref), displayQRCodeFromMatrixModule (ref)
		local _, var1 = QRCodeModule.qrcode("https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite", 2)
		
		return reactModule.createElement(displayQRCodeFromMatrixModule, { sideLength = 400, qrCodeMatrix = var1 })
	end,
	CustomisedMatrix = function()
		-- upvalues: QRCodeModule (ref), reactModule (ref), displayQRCodeFromMatrixModule (ref)
		local _, var1 = QRCodeModule.qrcode("https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite", 4)
		
		return reactModule.createElement(displayQRCodeFromMatrixModule, {
			sideLength = 200,
			qrCodeMatrix = var1,
			pixelColor3 = Color3.new(1, 0, 1),
			backgroundColor3 = Color3.new(0, 1, 0)
		})
	end,
	ReallySmallSideLength = function()
		-- upvalues: QRCodeModule (ref), reactModule (ref), displayQRCodeFromMatrixModule (ref)
		local _, var1 = QRCodeModule.qrcode("https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite", 4)
		
		return reactModule.createElement(displayQRCodeFromMatrixModule, { sideLength = 1, qrCodeMatrix = var1 })
	end
}