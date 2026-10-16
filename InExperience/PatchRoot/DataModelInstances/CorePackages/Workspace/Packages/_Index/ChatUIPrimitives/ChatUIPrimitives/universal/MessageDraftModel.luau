local _ = require(script.Parent.Types)
local PlainTextContentModelModule = require(script.Parent.ContentKinds.PlainText.PlainTextContentModel)
local PresetContentModelModule = require(script.Parent.ContentKinds.Preset.PresetContentModel)

return {
	fromPlainText = function(p1) --[[ Line: 8 ]]
		-- upvalues: PlainTextContentModelModule (copy)
		return {
			contents = { PlainTextContentModelModule.draftFromText(p1) }
		}
	end,
	fromPreset = function(p1, p2) --[[ Line: 16 ]]
		-- upvalues: PresetContentModelModule (copy)
		return {
			contents = { PresetContentModelModule.draftFromPreset(p1, p2) }
		}
	end
}