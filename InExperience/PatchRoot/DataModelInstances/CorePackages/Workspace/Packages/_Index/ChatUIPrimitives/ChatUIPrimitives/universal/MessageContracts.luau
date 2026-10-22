local TypesModule = require(script.Parent.Types)

return {
	isValidMessage = function(p1): boolean
		-- upvalues: TypesModule (copy)
		return TypesModule.isValidMessage(p1) == true
	end,
	isValidMessageDraft = function(p1): boolean
		-- upvalues: TypesModule (copy)
		return TypesModule.isValidMessageDraft(p1) == true
	end
}