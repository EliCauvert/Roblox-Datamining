local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local sduiTextModule = require(script.Parent.SduiText)
local useRevealTextModule = require(script.Parent.useRevealText)

return function(p1)
	-- upvalues: useRevealTextModule (ref), reactModule (ref), cryoModule (ref), sduiTextModule (ref)
	local var1 = useRevealTextModule({
		delimiter = p1.delimiter,
		removeDelimiter = p1.removeDelimiter,
		revealInterval = p1.revealInterval,
		richText = p1.richText,
		text = p1.text
	})
	
	return reactModule.createElement(sduiTextModule, reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref), var1 (ref)
		return cryoModule.Dictionary.join(p1, {
			delimiter = cryoModule.None,
			removeDelimiter = cryoModule.None,
			revealInterval = cryoModule.None,
			text = var1
		})
	end, { p1, var1 }))
end