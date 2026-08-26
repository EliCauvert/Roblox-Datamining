local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.SduiCompat)
local sduiTextModule = require(script.Parent.SduiText)
local useShimmerTextModule = require(script.Parent.useShimmerText)

return function(p1)
	-- upvalues: useShimmerTextModule (ref), reactModule (ref), cryoModule (ref), sduiTextModule (ref)
	local var1 = useShimmerTextModule({
		animationSpeed = p1.animationSpeed,
		children = p1.children,
		gradientOffset = p1.gradientOffset,
		isShimmerEnabled = p1.isShimmerEnabled,
		textStyle = p1.textStyle
	})
	
	return reactModule.createElement(sduiTextModule, reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p1 (ref), var1 (ref)
		return cryoModule.Dictionary.join(p1, {
			animationSpeed = cryoModule.None,
			children = cryoModule.None,
			gradientOffset = cryoModule.None,
			isShimmerEnabled = cryoModule.None,
			textStyle = var1.textStyle
		})
	end, { p1, var1.textStyle }), var1.children)
end