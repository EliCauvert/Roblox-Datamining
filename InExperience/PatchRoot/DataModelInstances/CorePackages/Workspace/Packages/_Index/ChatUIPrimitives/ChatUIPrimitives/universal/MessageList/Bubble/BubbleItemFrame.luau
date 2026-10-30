local Parent = script:FindFirstAncestor("ChatUIPrimitives").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SizingModule = require(script.Parent.Parent.Sizing)

return function(p1)
	-- upvalues: SizingModule (copy), FoundationModule (copy), ReactModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = FoundationModule.Hooks.useDefaultTags(SizingModule.useSizing().row.tag, "col size-full-0 auto-y")
	}, p1.children)
end