local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local _ = require(parent.SduiCompat)
local sduiTextModule = require(script.Parent.SduiText)
local useShimmerTextModule = require(script.Parent.useShimmerText)

return function(p0)
	-- upvalues: useShimmerTextModule (ref), reactModule (ref), cryoModule (ref), sduiTextModule (ref)
	local var4 = useShimmerTextModule({
		animationSpeed = p0.animationSpeed,
		children = p0.children,
		gradientOffset = p0.gradientOffset,
		isShimmerEnabled = p0.isShimmerEnabled,
		textStyle = p0.textStyle
	})
	
	return reactModule.createElement(sduiTextModule, reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), p0 (ref), var4 (ref)
		return cryoModule.Dictionary.join(p0, {
			animationSpeed = cryoModule.None,
			children = cryoModule.None,
			gradientOffset = cryoModule.None,
			isShimmerEnabled = cryoModule.None,
			textStyle = var4.textStyle
		})
	end, { p0, var4.textStyle }), var4.children)
end