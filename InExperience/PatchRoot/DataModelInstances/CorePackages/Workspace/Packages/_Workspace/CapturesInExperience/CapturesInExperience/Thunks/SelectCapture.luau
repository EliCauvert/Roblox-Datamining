local parent = script.Parent.Parent
local updateSelectedCapturesModule = require(parent.Actions.UpdateSelectedCaptures)
local getUpdatedSelectedCapturesArrayModule = require(parent.Utils.getUpdatedSelectedCapturesArray)
local constantsModule = require(parent.Constants)
local _ = require(parent.Types)

return function(p1)
	-- upvalues: constantsModule (ref), updateSelectedCapturesModule (ref), getUpdatedSelectedCapturesArrayModule (ref)
	return function(p2)
		-- upvalues: constantsModule (copy), updateSelectedCapturesModule (copy), getUpdatedSelectedCapturesArrayModule (copy), p1 (ref)
		p2:dispatch(updateSelectedCapturesModule(getUpdatedSelectedCapturesArrayModule(p2:getState()[constantsModule.RoduxKey].CaptureManager.SelectedCaptures, p1)))
	end
end