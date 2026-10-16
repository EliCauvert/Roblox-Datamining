local QRCodeDisplay = script:FindFirstAncestor("QRCodeDisplay")
local Parent = QRCodeDisplay.Parent
local ReactModule = require(Parent.React)
local QRCodeModule = require(Parent.QRCode)
local EcToNumberModule = require(script.Parent.ecToNumber)
local _ = require(QRCodeDisplay.Common.ECLevels)

return function(p1) --[[ Line: 8 ]]
	-- upvalues: ReactModule (copy), QRCodeModule (copy), EcToNumberModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 9 ]]
		-- upvalues: QRCodeModule (upval), p1 (copy), EcToNumberModule (upval)
		local _, QrcodeResult2 = QRCodeModule.qrcode(p1.toEncode, EcToNumberModule(p1.ecLevel))
		
		return QrcodeResult2
	end, { p1.toEncode, p1.ecLevel })
end