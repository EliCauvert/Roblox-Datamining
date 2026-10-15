local _ = require(script.Parent.Types)
local plainTextContentModelModule = require(script.Parent.ContentKinds.PlainText.PlainTextContentModel)
local presetContentModelModule = require(script.Parent.ContentKinds.Preset.PresetContentModel)

return {
	fromPlainText = function(p1)
		-- upvalues: plainTextContentModelModule (ref)
		return {
			contents = { plainTextContentModelModule.draftFromText(p1) }
		}
	end,
	fromPreset = function(value, p1)
		-- upvalues: presetContentModelModule (ref)
		return {
			contents = { presetContentModelModule.draftFromPreset(value, p1) }
		}
	end
}