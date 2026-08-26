local parent = script.Parent.Parent
local setWindowStateModule = require(parent.Actions.SetWindowState)
local windowStateModule = require(parent.Enums.WindowState)
local thunkModule = require(parent.Thunk)

return function()
	-- upvalues: thunkModule (ref), setWindowStateModule (ref), windowStateModule (ref)
	return thunkModule.new(script.Name, {}, function(p1, _)
		-- upvalues: setWindowStateModule (copy), windowStateModule (copy)
		return p1:dispatch(setWindowStateModule(windowStateModule.Hidden))
	end)
end