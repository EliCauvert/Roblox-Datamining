local _ = require(script.Parent.Parent.Parent.Types)
local _ = require(script.Parent.PlainTextTypes)
local PlainTextContentModelModule = {
	detailFromText = function(FallbackText) --[[ Line: 14 ]]
		return {
			wasRewritten = false,
			fallbackText = FallbackText,
			displayText = { text = FallbackText }
		}
	end
}

function PlainTextContentModelModule.fromText(FallbackText) --[[ Line: 23 ]]
	-- upvalues: PlainTextContentModelModule (copy)
	return {
		plainText = PlainTextContentModelModule.detailFromText(FallbackText)
	}
end

function PlainTextContentModelModule.draftFromText(Text) --[[ Line: 31 ]]
	return { plainText = { text = Text } }
end

function PlainTextContentModelModule.getDetail(p1) --[[ Line: 39 ]]
	return p1.plainText
end

function PlainTextContentModelModule.getDraft(p1) --[[ Line: 43 ]]
	return p1.plainText
end

function PlainTextContentModelModule.fromDraft(p1) --[[ Line: 49 ]]
	-- upvalues: PlainTextContentModelModule (copy)
	local Draft = PlainTextContentModelModule.getDraft(p1)
	
	return if Draft == nil then nil else PlainTextContentModelModule.fromText(Draft.text)
end

return PlainTextContentModelModule