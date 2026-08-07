local parent = script.Parent.Parent
local setWindowStateModule = require(parent.Actions.SetWindowState)
local windowStateModule = require(parent.Enums.WindowState)
local thunkModule = require(parent.Thunk)

return function() --[[ line: 7 | named "hideWindow" ]]
	-- upvalues: thunkModule (ref), setWindowStateModule (ref), windowStateModule (ref)
	return thunkModule.new(script.Name, {}, function(p0, _) --[[ line: 8 ]]
		-- upvalues: setWindowStateModule (copy), windowStateModule (copy)
		return p0:dispatch(setWindowStateModule(windowStateModule.Hidden))
	end)
end