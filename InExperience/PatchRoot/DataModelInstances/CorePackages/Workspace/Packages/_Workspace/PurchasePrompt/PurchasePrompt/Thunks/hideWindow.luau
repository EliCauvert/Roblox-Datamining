local Parent = script.Parent.Parent
local SetWindowStateModule = require(Parent.Actions.SetWindowState)
local WindowStateModule = require(Parent.Enums.WindowState)
local ThunkModule = require(Parent.Thunk)

return function() --[[ Line: 7 | Named "hideWindow" ]]
	-- upvalues: ThunkModule (copy), SetWindowStateModule (copy), WindowStateModule (copy)
	return ThunkModule.new(script.Name, {}, function(p1, _) --[[ Line: 8 ]]
		-- upvalues: SetWindowStateModule (upval), WindowStateModule (upval)
		return p1:dispatch(SetWindowStateModule(WindowStateModule.Hidden))
	end)
end