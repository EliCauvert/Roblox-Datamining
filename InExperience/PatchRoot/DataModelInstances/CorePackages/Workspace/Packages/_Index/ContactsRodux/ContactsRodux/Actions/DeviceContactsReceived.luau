local Parent = script.Parent.Parent
local _ = require(Parent.Types.ContactTypes)

return require(Parent.Parent.Rodux).makeActionCreator(require(script.Parent.ActionDomain) .. script.Name, function(Payload) --[[ Line: 7 ]]
	return { payload = Payload }
end)