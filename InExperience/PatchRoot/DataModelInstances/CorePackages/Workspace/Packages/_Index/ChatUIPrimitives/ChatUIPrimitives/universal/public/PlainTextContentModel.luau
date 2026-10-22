local PlainTextContentModelModule = require(script.Parent.Parent.ContentKinds.PlainText.PlainTextContentModel)

return {
	fromText = function(p1)
		-- upvalues: PlainTextContentModelModule (copy)
		return PlainTextContentModelModule.fromText(p1)
	end
}