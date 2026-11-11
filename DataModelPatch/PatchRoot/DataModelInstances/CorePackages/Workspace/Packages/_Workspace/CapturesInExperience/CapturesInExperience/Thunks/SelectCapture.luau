local Parent = script.Parent.Parent
local UpdateSelectedCapturesModule = require(Parent.Actions.UpdateSelectedCaptures)
local GetUpdatedSelectedCapturesArrayModule = require(Parent.Utils.getUpdatedSelectedCapturesArray)
local ConstantsModule = require(Parent.Constants)
local _ = require(Parent.Types)

return function(p1)
	-- upvalues: ConstantsModule (copy), UpdateSelectedCapturesModule (copy), GetUpdatedSelectedCapturesArrayModule (copy)
	return function(p2)
		-- upvalues: ConstantsModule (upval), UpdateSelectedCapturesModule (upval), GetUpdatedSelectedCapturesArrayModule (upval), p1 (copy)
		p2:dispatch(UpdateSelectedCapturesModule(GetUpdatedSelectedCapturesArrayModule(p2:getState()[ConstantsModule.RoduxKey].CaptureManager.SelectedCaptures, p1)))
	end
end