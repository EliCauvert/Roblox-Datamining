local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.PlainTextTypes)
local PlainTextContentModelModule = {
	detailFromText = function(FallbackText)
		return {
			wasRewritten = false,
			fallbackText = FallbackText,
			displayText = { text = FallbackText }
		}
	end
}

function PlainTextContentModelModule.fromText(FallbackText)
	-- upvalues: PlainTextContentModelModule (copy)
	return {
		plainText = PlainTextContentModelModule.detailFromText(FallbackText)
	}
end

function PlainTextContentModelModule.draftFromText(Text)
	return { plainText = { text = Text } }
end

function PlainTextContentModelModule.getDetail(p1)
	return p1.plainText
end

function PlainTextContentModelModule.getDraft(p1)
	return p1.plainText
end

function PlainTextContentModelModule.fromDraft(p1)
	-- upvalues: PlainTextContentModelModule (copy)
	local Draft = PlainTextContentModelModule.getDraft(p1)
	
	return if Draft == nil then nil else PlainTextContentModelModule.fromText(Draft.text)
end

return PlainTextContentModelModule