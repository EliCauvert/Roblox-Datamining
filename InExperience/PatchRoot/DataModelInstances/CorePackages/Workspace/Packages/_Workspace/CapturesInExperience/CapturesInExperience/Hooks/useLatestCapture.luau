local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsModule = require(Parent1.Signals)
local GetLatestCaptureStoreModule = require(Parent.Stores.GetLatestCaptureStore)
local _ = require(Parent.Types)

return function()
	-- upvalues: ReactModule (copy), GetLatestCaptureStoreModule (copy), SignalsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: GetLatestCaptureStoreModule (upval)
		return GetLatestCaptureStoreModule(false).getLatestCapture(false)
	end)
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseStateResult2 (copy), GetLatestCaptureStoreModule (upval)
		return SignalsModule.createEffect(function(p1)
			-- upvalues: UseStateResult2 (upval), GetLatestCaptureStoreModule (upval)
			UseStateResult2(GetLatestCaptureStoreModule(p1).getLatestCapture(p1))
		end)
	end, {})
	
	return UseStateResult
end