local ControlStateModule = require(script.Parent.Parent.Control.Enum.ControlState)

return function(p1, Disabled, p2) --[[ Line: 6 ]]
	-- upvalues: ControlStateModule (copy)
	local v1 = p1[Disabled] or p1[ControlStateModule.Default]
	local config = {
		Color = p2.Theme[v1].Color,
		Transparency = p2.Theme[v1].Transparency
	}
	
	if Disabled == ControlStateModule.Disabled or Disabled == ControlStateModule.Pressed then
		config.Transparency = 0.5 * config.Transparency + 0.5
	end
	return config
end