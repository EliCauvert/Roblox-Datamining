local parent = script.Parent.Parent
local _ = require(parent.Types.ContactTypes)

return require(parent.Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(p0)
	return { payload = p0 }
end)