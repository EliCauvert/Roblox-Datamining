local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local QrCodePresenterModule = require(Parent.QrCodePresenter)

return function(_)
	-- upvalues: ReactModule (copy), QrCodePresenterModule (copy), Parent (copy), FoundationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: QrCodePresenterModule (upval), UseStateResult2 (copy)
		return QrCodePresenterModule.attachHost(UseStateResult2)
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult (copy), QrCodePresenterModule (upval)
		local Current = UseRefResult.current
		UseRefResult.current = UseStateResult
		
		if Current and UseStateResult == nil then
			QrCodePresenterModule.restoreSelection(Current.previousSelection)
		end
	end, { UseStateResult })
	
	return if UseStateResult == nil then nil else ReactModule.createElement("Folder", { Name = "AccountSettingsQrCode" }, {
		FoundationProvider = ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
			QrDialog = ReactModule.createElement(require(Parent.AccountSettingsQrDialog), {
				page = UseStateResult.page,
				onClose = UseStateResult.onClose
			})
		})
	})
end