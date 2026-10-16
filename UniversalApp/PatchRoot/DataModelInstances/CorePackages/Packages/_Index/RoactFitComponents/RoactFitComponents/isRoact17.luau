local RoactModule = require(script.Parent.Parent.Roact)

return function(): boolean --[[ Line: 7 ]]
	-- upvalues: RoactModule (copy)
	return RoactModule.Ref == "ref"
end