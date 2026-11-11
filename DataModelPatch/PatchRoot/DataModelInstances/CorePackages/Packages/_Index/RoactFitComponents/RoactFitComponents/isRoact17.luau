local RoactModule = require(script.Parent.Parent.Roact)

return function(): boolean
	-- upvalues: RoactModule (copy)
	return RoactModule.Ref == "ref"
end