local Parent = script:FindFirstAncestor("QRCodeDisplay").Parent
local DisplayQRCodeFromMatrixModule = require(script.Parent.DisplayQRCodeFromMatrix)
local ReactModule = require(Parent.React)
local QRCodeModule = require(Parent.QRCode)

return {
	SimpleMatrix = function() --[[ Line: 9 ]]
		-- upvalues: ReactModule (copy), DisplayQRCodeFromMatrixModule (copy)
		return ReactModule.createElement(DisplayQRCodeFromMatrixModule, { sideLength = 100, qrCodeMatrix = { { 1, 0 }, { 1, 0 } } })
	end,
	ComplexMatrix = function() --[[ Line: 16 ]]
		-- upvalues: QRCodeModule (copy), ReactModule (copy), DisplayQRCodeFromMatrixModule (copy)
		local _, News2 = QRCodeModule.qrcode("https://www.bbc.com/news", 4)
		
		return ReactModule.createElement(DisplayQRCodeFromMatrixModule, { sideLength = 200, qrCodeMatrix = News2 })
	end,
	SuperComplexMatrix = function() --[[ Line: 24 ]]
		-- upvalues: QRCodeModule (copy), ReactModule (copy), DisplayQRCodeFromMatrixModule (copy)
		local _, Ebh5PidShareIsRetargetingTrueAfDpRoblox3A2F2Fnavigation2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInviteAfWebDpHttps3A2F2FwwwRobloxCom2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInvite2 = QRCodeModule.qrcode("https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite", 2)
		
		return ReactModule.createElement(DisplayQRCodeFromMatrixModule, {
			sideLength = 400,
			qrCodeMatrix = Ebh5PidShareIsRetargetingTrueAfDpRoblox3A2F2Fnavigation2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInviteAfWebDpHttps3A2F2FwwwRobloxCom2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInvite2
		})
	end,
	CustomisedMatrix = function() --[[ Line: 35 ]]
		-- upvalues: QRCodeModule (copy), ReactModule (copy), DisplayQRCodeFromMatrixModule (copy)
		local _, Ebh5PidShareIsRetargetingTrueAfDpRoblox3A2F2Fnavigation2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInviteAfWebDpHttps3A2F2FwwwRobloxCom2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInvite2 = QRCodeModule.qrcode("https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite", 4)
		
		return ReactModule.createElement(DisplayQRCodeFromMatrixModule, {
			sideLength = 200,
			qrCodeMatrix = Ebh5PidShareIsRetargetingTrueAfDpRoblox3A2F2Fnavigation2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInviteAfWebDpHttps3A2F2FwwwRobloxCom2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInvite2,
			pixelColor3 = Color3.new(1, 0, 1),
			backgroundColor3 = Color3.new(0, 1, 0)
		})
	end,
	ReallySmallSideLength = function() --[[ Line: 48 ]]
		-- upvalues: QRCodeModule (copy), ReactModule (copy), DisplayQRCodeFromMatrixModule (copy)
		local _, Ebh5PidShareIsRetargetingTrueAfDpRoblox3A2F2Fnavigation2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInviteAfWebDpHttps3A2F2FwwwRobloxCom2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInvite2 = QRCodeModule.qrcode("https://ro.blox.com/Ebh5?pid=share&is_retargeting=true&af_dp=roblox%3A%2F%2Fnavigation%2Fshare_links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite&af_web_dp=https%3A%2F%2Fwww.roblox.com%2Fshare-links%3Fcode%3D6e5de960f12ec44797d1d974c76605ff%26type%3DFriendInvite", 4)
		
		return ReactModule.createElement(DisplayQRCodeFromMatrixModule, {
			sideLength = 1,
			qrCodeMatrix = Ebh5PidShareIsRetargetingTrueAfDpRoblox3A2F2Fnavigation2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInviteAfWebDpHttps3A2F2FwwwRobloxCom2FshareLinks3Fcode3D6e5de960f12ec44797d1d974c76605ff26type3DFriendInvite2
		})
	end
}