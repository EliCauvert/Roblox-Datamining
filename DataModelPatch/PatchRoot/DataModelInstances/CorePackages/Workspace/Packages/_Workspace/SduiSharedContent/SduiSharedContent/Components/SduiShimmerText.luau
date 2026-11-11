local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.SduiCompat)
local SduiTextModule = require(script.Parent.SduiText)
local UseShimmerTextModule = require(script.Parent.useShimmerText)

return function(p1)
	-- upvalues: UseShimmerTextModule (copy), ReactModule (copy), CryoModule (copy), SduiTextModule (copy)
	local UseShimmerTextModuleResult = UseShimmerTextModule({
		animationSpeed = p1.animationSpeed,
		children = p1.children,
		gradientOffset = p1.gradientOffset,
		isShimmerEnabled = p1.isShimmerEnabled,
		textStyle = p1.textStyle
	})
	
	return ReactModule.createElement(SduiTextModule, ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy), UseShimmerTextModuleResult (copy)
		return CryoModule.Dictionary.join(p1, {
			animationSpeed = CryoModule.None,
			children = CryoModule.None,
			gradientOffset = CryoModule.None,
			isShimmerEnabled = CryoModule.None,
			textStyle = UseShimmerTextModuleResult.textStyle
		})
	end, { p1, UseShimmerTextModuleResult.textStyle }), UseShimmerTextModuleResult.children)
end