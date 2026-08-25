local parent = script.Parent.Parent
local updateSelectedCapturesModule = require(parent.Actions.UpdateSelectedCaptures)
local getUpdatedSelectedCapturesArrayModule = require(parent.Utils.getUpdatedSelectedCapturesArray)
local constantsModule = require(parent.Constants)
local _ = require(parent.Types)

return function(p0)
	-- upvalues: constantsModule (ref), updateSelectedCapturesModule (ref), getUpdatedSelectedCapturesArrayModule (ref)
	return function(p1)
		-- upvalues: constantsModule (copy), updateSelectedCapturesModule (copy), getUpdatedSelectedCapturesArrayModule (copy), p0 (ref)
		p1:dispatch(updateSelectedCapturesModule(getUpdatedSelectedCapturesArrayModule(p1:getState()[constantsModule.RoduxKey].CaptureManager.SelectedCaptures, p0)))
	end
end