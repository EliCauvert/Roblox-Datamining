local _ = require(script.Parent.Types)
local plainTextContentModelModule = require(script.Parent.ContentKinds.PlainText.PlainTextContentModel)

return {
	fromPlainText = function(p1)
		-- upvalues: plainTextContentModelModule (ref)
		return {
			contents = { plainTextContentModelModule.draftFromText(p1) }
		}
	end
}