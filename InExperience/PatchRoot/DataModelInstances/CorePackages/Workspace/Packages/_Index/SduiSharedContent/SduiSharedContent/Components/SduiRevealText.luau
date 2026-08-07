local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local sduiTextModule = require(script.Parent.SduiText)
local useRevealTextModule = require(script.Parent.useRevealText)

return function(p0) --[[ line: 16 | named "SduiRevealText" ]]
	-- upvalues: useRevealTextModule (ref), reactModule (ref), cryoModule (ref), sduiTextModule (ref)
	local var4 = useRevealTextModule({
		delimiter = p0.delimiter,
		removeDelimiter = p0.removeDelimiter,
		revealInterval = p0.revealInterval,
		richText = p0.richText,
		text = p0.text
	})
	
	return reactModule.createElement(sduiTextModule, reactModule.useMemo(function() --[[ line: 24 ]]
		-- upvalues: cryoModule (copy), p0 (ref), var4 (ref)
		return cryoModule.Dictionary.join(p0, {
			delimiter = cryoModule.None,
			removeDelimiter = cryoModule.None,
			revealInterval = cryoModule.None,
			text = var4
		})
	end, { p0, var4 }))
end