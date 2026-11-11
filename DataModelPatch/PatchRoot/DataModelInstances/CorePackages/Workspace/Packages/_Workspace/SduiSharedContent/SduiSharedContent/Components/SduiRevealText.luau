local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local SduiTextModule = require(script.Parent.SduiText)
local UseRevealTextModule = require(script.Parent.useRevealText)

return function(p1)
	-- upvalues: UseRevealTextModule (copy), ReactModule (copy), CryoModule (copy), SduiTextModule (copy)
	local UseRevealTextModuleResult = UseRevealTextModule({
		delimiter = p1.delimiter,
		removeDelimiter = p1.removeDelimiter,
		revealInterval = p1.revealInterval,
		richText = p1.richText,
		text = p1.text
	})
	
	return ReactModule.createElement(SduiTextModule, (ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy), UseRevealTextModuleResult (copy)
		return CryoModule.Dictionary.join(p1, {
			delimiter = CryoModule.None,
			removeDelimiter = CryoModule.None,
			revealInterval = CryoModule.None,
			text = UseRevealTextModuleResult
		})
	end, { p1, UseRevealTextModuleResult })))
end