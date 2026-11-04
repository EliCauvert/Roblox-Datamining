local DictationInputMode = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.DictationCore.Constants).DictationInputMode

return function(p1)
	-- upvalues: DictationInputMode (copy)
	return if p1 then DictationInputMode.Hybrid else nil
end