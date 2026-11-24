local _ = require(script.Parent.LibraryTypes)

return function(p1)
	return if p1.kind == "Sound" and p1.soundId ~= nil and p1.soundId ~= "" then p1.soundId else nil
end