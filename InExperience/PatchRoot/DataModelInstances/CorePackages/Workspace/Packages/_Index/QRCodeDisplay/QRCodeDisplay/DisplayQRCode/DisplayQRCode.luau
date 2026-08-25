local QRCodeDisplay = script:FindFirstAncestor("QRCodeDisplay")
local parent = QRCodeDisplay.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local displayQRCodeFromMatrixModule = require(script.Parent.Parent.DisplayQRCodeFromMatrix.DisplayQRCodeFromMatrix)
local _ = require(QRCodeDisplay.Common.ECLevels)
local useQRCodeModule = require(script.Parent.useQRCode)

return function(p0)
	-- upvalues: useQRCodeModule (ref), reactModule (ref), displayQRCodeFromMatrixModule (ref), dashModule (ref)
	return reactModule.createElement(displayQRCodeFromMatrixModule, dashModule.join(p0, { qrCodeMatrix = useQRCodeModule(p0) }))
end